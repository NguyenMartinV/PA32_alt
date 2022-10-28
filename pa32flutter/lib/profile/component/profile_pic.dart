import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:dio/dio.dart';
import 'package:http_parser/http_parser.dart';

class ProfilePic extends StatefulWidget {
  const ProfilePic({Key? key}) : super(key: key);

  @override
  State<ProfilePic> createState() => _ProfilePicState();
}

class _ProfilePicState extends State<ProfilePic> {
  final ImagePicker _picker = ImagePicker();

  Future _openModalBottomSheet() async {
    final option = await showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return Container(
            height: 170.0,
            child: Column(
              children: <Widget>[
                ListTile(
                  title: Text('Camera', textAlign: TextAlign.center),
                  onTap: () {
                    _setAvatar("camera");
                  },
                ),
                Container(
                  decoration: BoxDecoration(
                    border: Border(
                      top: BorderSide(color: Color(0xfff2f2f2), width: 0.5),
                      bottom: BorderSide(color: Color(0xfff2f2f2), width: 0.5),
                    ),
                  ),
                  child: ListTile(
                    title: Text('Album', textAlign: TextAlign.center),
                    onTap: () {
                      _setAvatar("album");
                    },
                  ),
                ),
                ListTile(
                  title: Text(
                    'Cancel',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.red),
                  ),
                  onTap: () {
                    _setAvatar();
                  },
                ),
              ],
            ),
          );
        }
    );
  }

  _setAvatar([String? type]) async {
    Navigator.pop(context);
    if (type == "camera") {
      final XFile? photo = await _picker.pickImage(source: ImageSource.camera);
      // if (photo != null) {
      //   _uploadImg(photo);
      // }
    } else if (type == "album") {
      final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
      // if (image != null) {
      //   _uploadImg(image);
      // }
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 115,
      width: 115,
      child: Stack(
        fit: StackFit.expand,
        clipBehavior: Clip.none,
        children: [
          CircleAvatar(
            backgroundImage: AssetImage("assets/images/nice picture.jpg"),
            backgroundColor: Colors.white,
          ),
          Positioned(
            right: -12,
            bottom: 0,
            child: SizedBox(
              height: 40,
              width: 40,
              child: TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: Color(0xFFF5F6F9),
                  padding: EdgeInsets.zero,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                    side: BorderSide(color:Colors.white),
                  ),
                ),
                onPressed: () {
                  _openModalBottomSheet();
                },
                child: Icon(Icons.photo_camera, color: Colors.grey,),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
