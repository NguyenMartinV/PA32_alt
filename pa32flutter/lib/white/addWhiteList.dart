import 'package:flutter/material.dart';

class AddWhiteList extends StatefulWidget {
  @override
  State<AddWhiteList> createState() => _AddWhiteListPage();
}

class _AddWhiteListPage extends State<AddWhiteList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF2F2F2),
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text("Add White List"),
        leading: GestureDetector(
          onTap: () {
            // print("Add White List 返回");
            // Navigator.pushNamed(context, "/WhiteList");
            Navigator.pop(context);
          },
          child: const Icon(
            Icons.arrow_back_ios,
          ),
        ),
        elevation: 0,
        actions: [
          GestureDetector(
            child: Container(
              margin: EdgeInsets.only(right: 15.0, top: 16.0),
              child: Text(
                "Done",
                style: TextStyle(
                    fontSize: 22.0,
                    color: Color(0xff43A1FE),
                    fontWeight: FontWeight.bold),
              ),
            ),
            onTap: () {
              print("Add White List Done");
            },
          )
        ],
      ),
      body: Container(
        margin: EdgeInsets.only(top: 20.0),
        color: Colors.white,
        padding: EdgeInsets.only(
          top: 10.0,
          bottom: 10.0,
          left: 30.0,
        ),
        child: Row(
          children: [
            Text(
              "Phone Number",
              style: TextStyle(fontSize: 16.0),
            ),
            SizedBox(
              width: 15.0,
            ),
            SizedBox(
              width: 130.0,
              child: TextField(
                style: TextStyle(),
                autofocus: false,
                decoration: InputDecoration(
                  hintText: "Enter your phone",
                  border: InputBorder.none,
                ),
                onChanged: (value) {
                  print(value);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
