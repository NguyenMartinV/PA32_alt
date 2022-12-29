// ignore_for_file: prefer_const_constructors, must_be_immutable, use_key_in_widget_constructors
import 'dart:async';

import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blue/flutter_blue.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_sms/flutter_sms.dart';
import 'package:geolocator/geolocator.dart';
import 'package:pa32/utils/SPUtil.dart';
import 'package:vibration/vibration.dart';

import '../component/common_toast.dart';
import '../http/bean/my_emergency_call_entity.dart';





class DevicesPage extends StatefulWidget {
  //const DevicesPage({Key? key}) : super(key: key);
  bool flag = false;
  @override
  State<DevicesPage> createState() => _DevicesPageState();
}

class _DevicesPageState extends State<DevicesPage> {
  @override

  Widget build(BuildContext context) {
    return MaterialApp(

      color: Color(0xFFA2C8FC),
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
      backgroundColor: Color(0xFFA2C8FC),
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

class FindDevicesScreen extends StatelessWidget {

  //final user = FirebaseAuth.instance.currentUser!;

  String _device = '';

  List<String> recipents = [];
  List<String> whitelist = ['0'];
  var templist="0";
  bool ss=false;
  var emnum="1";

  void didChangeAppLifecycleState(AppLifecycleState state){
    didChangeAppLifecycleState(state);

    if(state==AppLifecycleState.inactive||state==AppLifecycleState.detached) return;

    final isBackground = state ==AppLifecycleState.paused;

    if(isBackground/*&&flag*/){
      //String number = recipents[0];
      print('hello' + recipents[0].toString());
      //FlutterPhoneDirectCaller.callNumber(number);
    }
  }

  // Future getDevices() async{
  //   await FirebaseFirestore.instance.collection('users').where('email', isEqualTo: user.email).get().then(
  //         (snapshot) => snapshot.docs.forEach((document){
  //       //print(document.reference);
  //       _device = document.reference.id;
  //       //GetUserInfo(documentID: _device,);
  //     }),
  //   );
  // }

  Future<Position> _determinePosition() async {

    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();

    if(!serviceEnabled){
      return Future.error('Location services are disabled');
    }

    permission = await Geolocator.checkPermission();

    if(permission == LocationPermission.denied){
      permission = await Geolocator.requestPermission();

      if(permission == LocationPermission.denied){
        return Future.error('Location services denied');
      }
    }


    Position position = await Geolocator.getCurrentPosition();

    return position;
  }
  int counter = 0;
  bool firstCheck = false;
  List<BluetoothDevice> connectedDevices = [];
  Future connectDevice(BluetoothDevice d) async{




    connectedDevices = await FlutterBlue.instance.connectedDevices;

  }


  //List<BluetoothDevice> connectedDevices = await FlutterBlue.instance.connectedDevices;

  FlutterBlue flutterBlue = FlutterBlue.instance;
  static const intro =
      'Press the search button, then hold the button on the pendant until the red light appears. The phone will connect, before going into scanning mode. Your device is ready to use.';


  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        backgroundColor: Color(0xFFA2C8FC),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: (){
            Navigator.of(context).pop();
            //Navigator.of(context).pop();
          },
        ),
        title: Text('Find Devices'),
      ),
      body: RefreshIndicator(
        backgroundColor: Color(0xFFA2C8FC),
        color: Color(0xFFA2C8FC),
        onRefresh: () =>
            FlutterBlue.instance.startScan(/*timeout: Duration(seconds: 30)*/),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                child:
                ExpandablePanel(
                  header: Text('Intructions',style: TextStyle(fontSize: 20), textAlign: TextAlign.center,),
                  collapsed: Text(intro, softWrap: true, maxLines: 1, overflow: TextOverflow.ellipsis),
                  expanded: Text(intro, softWrap: true, ),
                ),
              ),
              //   AlertDialog(
              //   content: Text(
              //       'To connect pendant, please press search button and then press and hold the button on the pendant until the red light appears. Find the pendant in the list and press \"CONNECT\". Once connected, press the search button and leave on. Your device is ready to use.'
              //           '\n'
              //           'Note: if an action is detected, the app will stop searching automatically'
              //   ),
              // ),
              StreamBuilder<List<BluetoothDevice>>(
                stream: Stream.periodic(Duration(seconds: 5))
                    .asyncMap((_) => FlutterBlue.instance.connectedDevices),
                initialData: [],
                builder: (c, snapshot) => Column(
                  children: snapshot.data!
                      .map((d) => ListTile(
                    title: Text(d.name),
                    subtitle: Text(d.id.toString()),
                    trailing: StreamBuilder<BluetoothDeviceState>(
                      stream: d.state,
                      initialData: BluetoothDeviceState.disconnected,
                      builder: (c, snapshot) {
                        if (snapshot.data ==
                            BluetoothDeviceState.connected) {
                          //CommonToast.showToast("Connected!");
                          return ElevatedButton(
                              child: Text('DISCONNECT'),
                              onPressed: () {
                                d.state.listen((state) {
                                  //print('connection state: $state');
                                });
                                d.disconnect();
                                FlutterBlue.instance.stopScan();
                                //remove from list here
                              }
                          );
                        }
                        return Text('Disconnected');
                      },
                    ),
                  ))
                      .toList(),
                ),
              ),
              StreamBuilder<List<ScanResult>>(
                  stream: FlutterBlue.instance.scanResults,
                  initialData: [],
                  builder: (c, snapshot) {
                    if(snapshot.data == BluetoothDeviceState.connecting){
                      return AlertDialog(
                        content: Text('Connecting'),
                      );
                    }
                    else {
                      return Column();
                    }
                  }
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
                onPressed: () {
                  SPUtil.remove("whitelist");
                  List<String> whitelist = [];
                  templist='';
                  FlutterBlue.instance.stopScan();
                } ,
                backgroundColor: Colors.red,
              );
            } else {
              return FloatingActionButton(
                backgroundColor: Color(0xFFA2C8FC),
                child: Icon(Icons.search, color: Colors.white,),
                onPressed: () async{
                  SPUtil.get("myPhoneText").then((value) => {
                    if (value != null){
                      emnum = value
                    }
                  });
                  //print("emnum is"+emnum);
                  scan_initial(whitelist,ss,templist);
                  Timer.periodic(Duration(milliseconds: 9000), (Timer t) => scan(whitelist,t,ss,templist));
                  Vibration.vibrate(duration: 50);
                },

              );
            }


          }

      ),

    );
  }
}
void _sendSMS(String message, List<String> recipents) async {
  String _result = await sendSMS(message: message, recipients: recipents, sendDirect: true)
      .catchError((onError) {
    print(onError);
  });
  print(_result);
}

//do not use this one
scan(whitelist,timer,ss,templist){

  FlutterBlue.instance.startScan(/*timeout: Duration(milliseconds: 5500)*/);
  var subscription = FlutterBlue.instance.scanResults.listen((results) async {
    for (ScanResult r in results) {
      SPUtil.get("whitelist").then((value) => {
        if (value != null){
          templist = value
        }
      });
      //print(templist+"mmmTL");
      if(whitelist.contains(templist)){}
      else{
        //whitelist.insert(0,templist);
        whitelist[0]=templist.toString();
      }
      //print(whitelist.toString()+"---WL");
      if(r.device.name == "PD001"){
        //print(r.device.id.id+"IDDDDDDDDDD");
        if(whitelist.contains(r.device.id.id)){
          Vibration.vibrate(duration: 300);
          CommonToast.showToast(
              "Call/Text placeholder");
          String message = "This is a test message!";
          List<String> recipents = ["4692353164", "8178186318"];
          _sendSMS(message, recipents);
          FlutterBlue.instance.stopScan();
          results.clear();
        }
        else{
          if (r.device.name == "PD001" && r.rssi < -45) {
            //add conditional to check if device is connected then call
            CommonToast.showToast(
                "Please bring pendant closer. Try again."+whitelist.toString());
            Vibration.vibrate(duration: 10);
            FlutterBlue.instance.stopScan();
            results.clear();
          }
          if (r.device.name == "PD001" && r.rssi > -45) {
            //conditional to check if device has been connected then say device already connect else do below
            CommonToast.showToast(
                "${r.device.name} found! rssi: ${r.rssi}");
            Vibration.vibrate(duration: 100);
            r.device.connect();
            Vibration.vibrate(duration: 100);
            //whitelist.insert(0,r.device.id.id.toString());
            whitelist[0]=r.device.id.id;
            SPUtil.save("whitelist", whitelist[0]);
            CommonToast.showToast("Connected!");
            FlutterBlue.instance.stopScan();
            results.clear();
          }
        }}/*results.clear();*/}results.clear();
  });
}

//for some reason, only this look runs
scan_initial(whitelist,ss,templist){
  FlutterBlue.instance.startScan(/*timeout: Duration(milliseconds: 5500)*/);
  var subscription = FlutterBlue.instance.scanResults.listen((results) async {
    for (ScanResult r in results) {
      SPUtil.get("whitelist").then((value) => {
        if (value != null){
          templist = value
        }
      });
      //print(templist+"mmmTL");
      if(whitelist.contains(templist)){}
      else{
        //whitelist.insert(0,templist);
        whitelist[0]=templist.toString();
      }
      //print(whitelist.toString()+"---WL");
      if(r.device.name == "PD001"){
        //print(r.device.id.id+"IDDDDDDDDDD");
        if(whitelist.contains(r.device.id.id)){
          Vibration.vibrate(duration: 300);
          CommonToast.showToast(
              "Call/Text placeholder");
          String message = "This is a test message!";
          List<String> recipents = ["4692353164", "8178186318"];
          _sendSMS(message, recipents);
          FlutterBlue.instance.stopScan();
          results.clear();
        }
        else{
          if (r.device.name == "PD001" && r.rssi < -45) {
            //add conditional to check if device is connected then call
            CommonToast.showToast(
                "Please bring pendant closer. Try again."+whitelist.toString());
            Vibration.vibrate(duration: 10);
            FlutterBlue.instance.stopScan();
            results.clear();
          }
          if (r.device.name == "PD001" && r.rssi > -45) {
            //conditional to check if device has been connected then say device already connect else do below
            CommonToast.showToast(
                "${r.device.name} found! rssi: ${r.rssi}");
            Vibration.vibrate(duration: 100);
            r.device.connect();
            Vibration.vibrate(duration: 100);
            //whitelist.insert(0,r.device.id.id.toString());
            whitelist[0]=r.device.id.id;
            SPUtil.save("whitelist", whitelist[0]);
            CommonToast.showToast("Connected!");
            FlutterBlue.instance.stopScan();
            results.clear();
          }
        }}/*results.clear()*/;}results.clear();
  });
}

bool checkConnect(String deviceID,whitelist){
  // for(int i = 0;i<whiteList.length;i++){
  //   if(deviceID==whiteList[i])
  // }
  if(whitelist.contains(deviceID)){
    return true;
  }
  return false;
}