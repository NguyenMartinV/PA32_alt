// Copyright 2017, Paul DeMarco.
// All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_blue/flutter_blue.dart';
import 'package:pa32/bluetooth/widgets.dart';
//import 'devicescreen.dart';

// var devinf = List.filled(100000,'0');  //value 1000 determines size of the results list to keep. 300~ is good enough for one scan without restarting app
// var sig = List.filled(devinf.length,-100);
// var name = List.filled(devinf.length,'0');
// var i=0;
// var ind=1;




class FlutterBlueApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      color: Colors.lightBlue,
      home: StreamBuilder<BluetoothState>(
          stream: FlutterBlue.instance.state,
          initialData: BluetoothState.unknown,
          builder: (c, snapshot) {
            final state = snapshot.data;
            if (state == BluetoothState.on) {
              return FindDevicesScreen();
            }
            return BluetoothOffScreen(state: state);
          }),
    );
  }
}

class BluetoothOffScreen extends StatelessWidget {
  const BluetoothOffScreen({Key? key, this.state}) : super(key: key);

  final BluetoothState? state;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue,
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Icon(
              Icons.bluetooth_disabled,
              size: 200.0,
              color: Colors.white54,
            ),
            Text(
              'Bluetooth Adapter is ${state != null ? state.toString().substring(15) : 'not available'}.',
              style: Theme.of(context)
                  .primaryTextTheme
                  .subtitle1
                  ?.copyWith(color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}

class FindDevicesScreen extends StatefulWidget {
  @override
  State<FindDevicesScreen> createState() => _FindDevicesScreenState();
}

class _FindDevicesScreenState extends State<FindDevicesScreen> {
  @override
  var msg = 'To connect pendant, hold the pendant against the back of the phone and hold down the button. Once connected, the pendant will automatically receive signals as long as it remains in range and the search button is active.'
      '\n'
      'Note: if an action is detected, the app will stop searching automatically';

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Find Devices'),
      ),
      body: RefreshIndicator(
        onRefresh: () =>
            FlutterBlue.instance.startScan(),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              AlertDialog(
                content: Text(msg),),
              StreamBuilder<List<BluetoothDevice>>(
                stream: Stream.periodic(Duration(seconds: 5))
                    .asyncMap((_) => FlutterBlue.instance.connectedDevices),
                initialData: [],
                builder: (c, snapshot) => Column(
                  children: snapshot.data!
                      .map((d) => ListTile(
                    title: Text(d.name),
                    subtitle: Text(d.id.toString()),
                  ))
                      .toList(),
                ),
              ),
              StreamBuilder<List<ScanResult>>(
                stream: FlutterBlue.instance.scanResults,
                initialData: [],
                builder: (c, snapshot) => Column(
                  children: snapshot.data!
                      .map(
                        (r) => ScanResultTile(
                      result: r,
                    ),
                  )
                      .toList(),
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: StreamBuilder<bool>(
        stream: FlutterBlue.instance.isScanning,
        initialData: false,
        builder: (c, snapshot) {
          if (snapshot.data!) {
            return FloatingActionButton(
                child: Icon(Icons.stop),
                onPressed: () { FlutterBlue.instance.stopScan();
                setState(() {
                  msg = 'No Longer Scanning';
                });}

            );
          } else {
            return FloatingActionButton(
                child: Icon(Icons.search),
                onPressed: () async {
                  FlutterBlue.instance
                      .startScan();
                  setState(() {
                    msg = 'Scanning for Devices';
                  });
                  var subscription = FlutterBlue.instance.scanResults.listen((results) {
                    for (ScanResult r in results) {
                      if(r.device.name.contains("PD001")) {
                        var key=r.advertisementData.manufacturerData.keys.single;
                        var adat=r.advertisementData.manufacturerData[key];
                        var outp=String.fromCharCode(adat![17])+String.fromCharCode(adat[18]);
                        if(outp.contains('2')){
                          if(r.rssi<-40){
                            FlutterBlue.instance.stopScan();
                            setState(() {
                              msg = 'Pendent Key Event Detected. RSSI '+r.rssi.toString();
                            });}
                          if(r.rssi>-40) {
                            r.device.connect();
                            FlutterBlue.instance.stopScan();
                            setState(() {
                              msg = 'Pairing Request Detected (RSSI '+r.rssi.toString()+')'+'\n'+'Device Autoconnect Successful.';});
                          }
                        }
                        print(outp);
                        break;
                      }
                    }
                  });
                }
            );

          }
        },
      ),
    );
  }
}
