import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class CommonToast {
  static showToast(String msg) {
    Fluttertoast.showToast(
      msg: msg,
      gravity: ToastGravity.CENTER,
      backgroundColor: Colors.black,
    );
  }

  /// 底部弹出2个选项框

  static showBottomAlert(BuildContext context, confirmCallback, String title,
      String option1, String option2) {
    showCupertinoModalPopup(
        context: context,
        builder: (context) {
          return ShowCustomAlterWidget(
              confirmCallback, title, option1, option2);
        });
  }

  /// 中间弹出提示框

  static showCenterTipsAlter(
      BuildContext context, confirmCallback, String title, String desText) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return ShowTipsAlterWidget(confirmCallback, title, desText);
        });
  }

  /// 中间弹出输入框
  showCenterInputAlert(
      BuildContext context, confirmCallback, String title, String placeholder) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return ShowInputAlertWidget(confirmCallback, title, placeholder);
        });
  }
}

class ShowInputAlertWidget extends StatefulWidget {
  final confirmCallback;
  final title;
  final placeholder;
  const ShowInputAlertWidget(
      this.confirmCallback, this.title, this.placeholder);
  @override
  _ShowInputAlertWidgetState createState() => _ShowInputAlertWidgetState();
}

class _ShowInputAlertWidgetState extends State<ShowInputAlertWidget> {
  String inputValue = '';

  @override
  Widget build(BuildContext context) {
    return CupertinoAlertDialog(
      title: Text(widget.title),
      content: Column(
        children: <Widget>[
          CupertinoTextField(
              placeholder: widget.placeholder,
              onChanged: (value) {
                inputValue = value;
              })
        ],
      ),
      actions: <Widget>[
        CupertinoDialogAction(
          child: Text("Cancel"),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        CupertinoDialogAction(
          child: Text("Confirm"),
          onPressed: () {
            widget.confirmCallback(inputValue);
            Navigator.pop(context);
          },
        ),
      ],
    );
  }
}

class ShowTipsAlterWidget extends StatefulWidget {
  final confirmCallback;
  final title;
  final desText;
  const ShowTipsAlterWidget(this.confirmCallback, this.title, this.desText);
  @override
  _ShowTipsAlterWidgetState createState() => _ShowTipsAlterWidgetState();
}

class _ShowTipsAlterWidgetState extends State<ShowTipsAlterWidget> {
  @override
  Widget build(BuildContext context) {
    return CupertinoAlertDialog(
      title: Text(widget.title),
      content: Column(
        children: <Widget>[
          SizedBox(
            height: 10,
          ),
          Align(
            child: Text(widget.desText),
            alignment: Alignment(0, 0),
          ),
        ],
      ),
      actions: <Widget>[
        CupertinoDialogAction(
          child: Text("Cancel"),
          onPressed: () {
            // Navigator.pushNamed(context, "/MyHomeMap");
            Navigator.pop(context);
          },
        ),
        CupertinoDialogAction(
          child: Text("Activate"),
          onPressed: () {
            widget.confirmCallback();
            Navigator.pushNamed(
              context,
              "/ServicePage",
              arguments: {"page": "MyHomeMap"},
            );
          },
        ),
      ],
    );
  }
}

class ShowCustomAlterWidget extends StatefulWidget {
  final confirmCallback;
  final title;
  final option1;
  final option2;
  const ShowCustomAlterWidget(
    this.confirmCallback,
    this.title,
    this.option1,
    this.option2,
  );

  @override
  _ShowCustomAlterWidgetState createState() => _ShowCustomAlterWidgetState();
}

class _ShowCustomAlterWidgetState extends State<ShowCustomAlterWidget> {
  final controller = TextEditingController();
  String inputValuue = "";
  @override
  Widget build(BuildContext context) {
    return CupertinoActionSheet(
      title: Text(
        widget.title,
        style: TextStyle(fontSize: 22),
      ),
      actions: <Widget>[
        CupertinoActionSheetAction(
          onPressed: () {
            Navigator.pop(context);
            widget.confirmCallback(widget.option1);
          },
          child: Text(widget.option1),
        ),
        CupertinoActionSheetAction(
          onPressed: () {
            Navigator.pop(context);
            widget.confirmCallback(widget.option2);
          },
          child: Text(widget.option2),
        ),
      ],
      cancelButton: CupertinoActionSheetAction(
        onPressed: () {
          Navigator.pop(context);
        },
        child: Text('Cancel'),
      ),
    );
  }
}
