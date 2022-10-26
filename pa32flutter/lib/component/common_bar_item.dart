import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class CommonBarItem extends StatelessWidget {
  final String? icon;          //左边图标
  final String title;         //左边title
  final double? height;       //高度，默认42dp
  final Function? handleTap;  //点击事件
  final Widget? suffix;      //右边文字
  final Widget? suffixIcon;  //右边边图标
  final double? marginLR;   //到左右边框的距离，默认12dp
  final double? marginTop;  //顶部边距，默认10dp
  final Widget? inputWidget;
  const CommonBarItem(
      {Key? key,
        this.icon,
        required this.title,
        this.height,
        this.suffix,
        this.handleTap,
        this.suffixIcon,
        this.marginLR,
        this.marginTop,
        this.inputWidget
      })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double _marginLR = marginLR!=null?marginLR!:12.w;
    double _marginTop = marginTop!=null?marginTop!:10.h;
    double _height = height!=null?height!:42.h;
    return GestureDetector(
      onTap: (){
        if (null != handleTap) {
          handleTap!();
        }
      },
      child:Container(
        height: _height,
        // padding: EdgeInsets.only(left:15.w,right: 15.w),
        // margin: EdgeInsets.only(left:_marginLR,right:_marginLR,top:_marginTop),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(5),
        ),
        child: Row(
          children: [
            if(icon != null)
            Image.asset(
              "assets/images/$icon.png",
              width: 15.r,
              height: 15.r,
            ),
            if(icon != null)
            SizedBox(
              width: 11.w,
            ),
            Expanded(
              flex: 3,
              child: Text(
                title,
                style: TextStyle(
                  fontSize: 15.sp,
                  color:Color(0xff222222)
                ),
              )
            ),
            if(inputWidget!=null)
              Expanded(
                flex: 5,
                child: inputWidget!
              ),
            if(suffix!=null)
            suffix!,
            SizedBox(
              width: 5.w,
            ),
            if(suffixIcon==null)
            Icon(
              Icons.chevron_right,
              color: Color(0xFF969696),
              // size: 20.r,
            ),
            if(suffixIcon!=null)
            suffixIcon!
          ],
        ),
      )
    );
  }
}