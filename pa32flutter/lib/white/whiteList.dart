import 'package:flutter/material.dart';

class WhiteList extends StatefulWidget {
  @override
  State<WhiteList> createState() => _WhiteListPage();
}

class _WhiteListPage extends State<WhiteList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF2F2F2),
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text("White List"),
        leading: GestureDetector(
          onTap: () {
            // print("White List 返回");
            // Navigator.pushNamed(context, "/addDevicePage");
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
              margin: EdgeInsets.only(right: 15.0),
              child: Icon(
                Icons.add_circle_outline,
                size: 30.0,
              ),
            ),
            onTap: () {
              // print("Add List");
              Navigator.pushNamed(context, "/AddWhiteList");
            },
          )
        ],
      ),
      body: WhiteListCon(),
    );
  }
}

class WhiteListCon extends StatefulWidget {
  @override
  State<WhiteListCon> createState() => _WhiteListConPage();
}

class _WhiteListConPage extends State<WhiteListCon> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: Container(
            padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
            width: MediaQuery.of(context).size.width - 60.0,
            child: Center(
                child: Text(
              "The number of the white list will not be filtered.",
              style: TextStyle(fontSize: 16.0, color: Color(0xff9C9C9C)),
            )),
          ),
        ),
        Container(
          width: MediaQuery.of(context).size.width - 30.0,
          child: ListContent(),
        )
      ],
    );
  }
}

class ListContent extends StatefulWidget {
  @override
  State<ListContent> createState() => _ListContentPage();
}

class _ListContentPage extends State<ListContent> {
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return Container(
          margin: EdgeInsets.only(bottom: 15.0),
          padding: EdgeInsets.only(left: 20.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(20.0)),
            color: Colors.white,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
                child: Column(
                  children: [
                    Text(
                      "042-987900",
                      style: TextStyle(
                        fontSize: 18.0,
                        height: 1.5,
                      ),
                    ),
                    Text(
                      "2021-08-19",
                      style: TextStyle(
                        color: Color(0xffD5D5D5),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: 60.0,
                height: 62.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(20.0),
                      bottomRight: Radius.circular(20.0)),
                  color: Color(0xffFACECE),
                ),
                child: Center(
                  child: GestureDetector(
                    child: Icon(
                      Icons.delete,
                      color: Color(0xffF17C7D),
                    ),
                    onTap: () {
                      print("删除第$index项");
                    },
                  ),
                ),
              ),
            ],
          ),
        );
      },
      separatorBuilder: (context, index) {
        return Divider(
          height: 0,
          color: Colors.white,
        );
      },
      itemCount: 2,
    );
  }
}
