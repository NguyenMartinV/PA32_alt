import 'package:flutter/material.dart';

class CommonAppBar extends StatelessWidget {
  final Widget body;
  final Color bgColor;
  final Color titleColor;
  final String title;
  final List<Widget>? actions;
  final bool showLeading;
  final bool avoidBottomInset;
  final Function()? onLeadingPressed;
  final double elevation;
  const CommonAppBar(
      {Key? key,
      required this.body,
      this.bgColor = const Color(0xffF2F2F2),
      required this.title,
      this.actions,
      this.titleColor = Colors.white,
      this.showLeading = true,
      this.avoidBottomInset = false,
      this.onLeadingPressed,
      this.elevation = 0})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: avoidBottomInset,
      backgroundColor: bgColor,
      appBar: AppBar(
        backgroundColor: titleColor,
        elevation: elevation,
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
        centerTitle: true,
        leading: showLeading
            ? IconButton(
                onPressed: () {
                  if (null != onLeadingPressed) {
                    onLeadingPressed!();
                  } else {
                    Navigator.pop(context);
                  }
                },
                icon: Icon(
                  Icons.arrow_back_ios_new,
                  size: 20,
                ),
              )
            : Text(""),
        title: Text(
          title,
          style: TextStyle(color: Colors.black),
        ),
        actions: actions,
      ),
      body: body,
    );
  }
}
