import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';

class addDevicePage extends StatefulWidget {
  addDevicePage({
    Key? key,
  }) : super(key: key);

  @override
  State<addDevicePage> createState() => _addDevicePageState();
}

class _addDevicePageState extends State<addDevicePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        // title: Center(child: Text("add device")),
        title: Text("add device"),
        leading: GestureDetector(
          onTap: () {
            // print("add device 返回");
            Navigator.pop(context);
          },
          child: const Icon(
            Icons.arrow_back_ios,
          ),
        ),
        elevation: 0,
      ),
      body: DeviceContent(),
    );
  }
}

class DeviceContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xffF2F2F2),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 40.0, bottom: 30.0),
            child: Center(
              child: Image(
                image: AssetImage("assets/images/avatar.png"),
                width: 60.0,
                height: 140.0,
                fit: BoxFit.fill,
              ),
            ),
          ),
          Container(
            height: 50.0,
            width: MediaQuery.of(context).size.width - 30.0,
            padding: EdgeInsets.only(left: 5.0, right: 5.0),
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(8.0)),
            ),
            child: GestureDetector(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [Text("Device No.: 123456789"), Icon(Icons.flip)],
              ),
              onTap: () {
                print("点击了扫描设备");
              },
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width - 30.0,
            margin: EdgeInsets.only(top: 14.0),
            padding: EdgeInsets.all(10.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(
                Radius.circular(6.0),
              ),
            ),
            child: ListContent(),
          ),
          GestureDetector(
            child: Container(
              width: MediaQuery.of(context).size.width - 30.0,
              height: 50.0,
              margin: EdgeInsets.only(top: 180.0),
              decoration: BoxDecoration(
                  color: Color(0xff028AFE),
                  borderRadius: BorderRadius.all(
                    Radius.circular(6.0),
                  )),
              child: Center(
                child: Text(
                  "Complete",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16.0,
                  ),
                ),
              ),
            ),
            onTap: () {
              print("点击Complete");
            },
          )
        ],
      ),
    );
  }
}

class ListContent extends StatefulWidget {
  bool isRemenber = false;
  @override
  State<ListContent> createState() => _ListContentState();
}

class _ListContentState extends State<ListContent> {
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: 4,
      shrinkWrap: true,
      // physics: new ScrollPhysics(),
      itemBuilder: (context, index) {
        bool IconSHow = true;
        String itemText = "";
        if (index == 0) {
          itemText = "Customer InforMation";
          IconSHow = false;
        }
        if (index == 1) {
          itemText = "SOS Number";
        }
        if (index == 2) {
          itemText = "White List";
        }
        if (index == 3) {
          itemText = "Care Givers";
        }
        return GestureDetector(
          behavior: HitTestBehavior.translucent,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(itemText),
              Row(
                children: [
                  Offstage(
                    offstage: IconSHow,
                    child: Icon(
                      Icons.check_circle,
                      color: Color(0xff15CE31),
                    ),
                  ),
                  Icon(
                    Icons.chevron_right,
                  ),
                ],
              )
            ],
          ),
          onTap: () {
            // print("点击第 $index 项");
            if (index == 0) {
              Navigator.pushNamed(context, "/CustomerPage");
            }
            if (index == 1) {
              //Navigator.pushNamed(context, "/CustomerPage");
            }
            if (index == 2) {
              Navigator.pushNamed(context, "/WhiteList");
            }
            if (index == 3) {
              Navigator.pushNamed(context, "/CareGivers");
            }
          },
        );
      },
      //设置默认底部边框样式
      separatorBuilder: (context, index) {
        return Divider();
      },
    );
  }
}
