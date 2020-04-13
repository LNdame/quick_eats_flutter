import 'package:flutter/material.dart';
import 'package:quick_eats/res/colors.dart';
import 'package:quick_eats/src/views/ordertracking/custom_progressbar.dart';
import 'package:quick_eats/src/views/ordertracking/timer.dart';

import 'avatarandtext.dart';

class OrderTracking extends StatefulWidget {
  @override
  _OrderTrackingState createState() => _OrderTrackingState();
}

class _OrderTrackingState extends State<OrderTracking> {

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        automaticallyImplyLeading: true,
        leading: IconButton(
          icon: Icon(
            Icons.chevron_left,
            color: Colors.black,
            size: 40,
          ),
          onPressed: () {},
        ),
        actions: <Widget>[
          Center(
            child: Padding(
              padding: const EdgeInsets.only(right: 16.0),
              child: Text(
                'CANCEL',
                style: TextStyle(color: Colors.black, fontSize: 12),
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(top: 50),
              child: Text(
                'Order#568',
                style:
                TextStyle(color: Color.fromRGBO(0, 0, 0, 0.2), fontSize: 12),
              ),
            ),
            Timer(),
            CustomProgressbar(),
            SizedBox(height: 50),
            AvatarAndText(),
            SizedBox(height: 50),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 40),
              child: OutlineButton(
                borderSide: BorderSide(width: 1.0, color: qeTrackerGrey),
                color: qeTrackerBlue,
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(width: 50),
                      Text(
                        'GO TO TRUCK',
                        style: TextStyle(fontSize: 15, color: qeTrackerBlue),
                      ),
                      SizedBox(width: 50),
                      Image.asset(
                        'assets/images/icon_direction.png',
                        scale: 2,
                      )
                    ],
                  ),
                ),
                onPressed: () {},
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
