import 'package:flutter/material.dart';

class CustomerEmail extends StatefulWidget {
  @override
  State<CustomerEmail> createState() => _CustomerEmailPage();
}

class _CustomerEmailPage extends State<CustomerEmail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF2F2F2),
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text("Email"),
        leading: GestureDetector(
          onTap: () {
            // print("Email 返回");
            // Navigator.pushNamed(context, "/CustomerPage");
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
              margin: EdgeInsets.only(top: 21.6, right: 12.0),
              child: Text(
                "Done",
                style: TextStyle(
                    fontSize: 22.0,
                    color: Color(0xff43A1FE),
                    fontWeight: FontWeight.bold),
              ),
            ),
            onTap: () {
              print("Done");
            },
          )
        ],
      ),
      body: EmailContent(),
    );
  }
}

class EmailContent extends StatefulWidget {
  @override
  State<EmailContent> createState() => _EmailContentPage();
}

class _EmailContentPage extends State<EmailContent> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(
            top: 15.0,
            right: 26.0,
            bottom: 15.0,
            left: 26.0,
          ),
          child: Text(
            "Your mailbox will receive the veriflcation code. please enter it.",
          ),
        ),
        Container(
          color: Colors.white,
          padding: EdgeInsets.only(left: 30.0, right: 30.0),
          height: 50.0,
          child: Row(
            children: [
              SizedBox(
                child: Text("Email"),
                width: 100.0,
              ),
              SizedBox(
                width: 200.0,
                child: TextField(
                  style: TextStyle(),
                  autofocus: false,
                  decoration: InputDecoration(
                    hintText: "Alice987@mail.com",
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
        Container(
          color: Colors.white,
          padding: EdgeInsets.only(left: 30.0, right: 30.0),
          margin: EdgeInsets.only(top: 15.0),
          height: 50.0,
          child: Row(
            children: [
              SizedBox(
                child: Text("Veriflcation"),
                width: 100.0,
              ),
              SizedBox(
                width: 160.0,
                child: TextField(
                  style: TextStyle(),
                  autofocus: false,
                  decoration: InputDecoration(
                    hintText: "****",
                    border: InputBorder.none,
                  ),
                  onChanged: (value) {
                    print(value);
                  },
                ),
              ),
              Container(
                child: GestureDetector(
                  child: Text(
                    "Send",
                    style: TextStyle(
                        color: Color(0xff028AFE),
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold),
                  ),
                  onTap: () {
                    print("Send");
                  },
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
