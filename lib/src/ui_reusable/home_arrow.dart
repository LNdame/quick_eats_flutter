import 'package:flutter/material.dart';

class HomeArrow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15.0, top: 40.0),
      child: GestureDetector(
        onTap: () {
          Navigator.pop(context);
        },
        child: CircleAvatar(
          backgroundColor: Colors.white,
          radius: 15.0,
          child: Icon(
            Icons.keyboard_arrow_left,
            color: Colors.black,
            size: 20.0,
          ),
        ),
      ),
    );
  }
}
