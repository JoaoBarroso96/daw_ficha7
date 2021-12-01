import 'package:ficha1/models/question.dart';
import 'package:flutter/material.dart';
import 'package:group_radio_button/group_radio_button.dart';

class CameraRoute extends StatefulWidget {
  @override
  _CameraRoute createState() => new _CameraRoute();
}

class _CameraRoute extends State<CameraRoute> {
  @override
  void initState() {}

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/Background.png"),
          fit: BoxFit.cover,
        ),
      ),
      child: Text("a"),
    );
  }
}
