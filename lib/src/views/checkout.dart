import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:quick_eats/src/models/models.dart';
import 'package:quick_eats/src/models/scoped_models.dart';
import 'package:scoped_model/scoped_model.dart';

class CheckOutPage extends StatefulWidget {
  @override
  CheckOutPageState createState() => new CheckOutPageState();
}

class CheckOutPageState extends State<CheckOutPage> {
  double progress = 0;
  InAppWebViewController webViewController;
  String postDataString;

  @override
  void initState() {
    postDataString =
        "merchant_id=10018326&merchant_key=os8ef28qmok31&amount=70&item_name=juice";

    super.initState();
  }

  String setPostString(double amount, Restaurant restraurant){
    return "merchant_id=10018326&merchant_key=os8ef28qmok31&amount=${amount.toString()}&item_name=${restraurant.restaurant_name}";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: ScopedModelDescendant<ScopedQEModel>(
        builder: (BuildContext context, Widget child, ScopedQEModel model) {
      return Container(
        child: Column(
          children: <Widget>[
            Container(
                padding: EdgeInsets.all(10.0),
                child: progress < 1.0
                    ? LinearProgressIndicator(value: progress)
                    : Container()),
            Expanded(
              child: Container(
                margin: const EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.orangeAccent)),
                child: InAppWebView(
                  // initialUrl: "https://flutter.dev/",
                  initialOptions: InAppWebViewGroupOptions(
                      crossPlatform: InAppWebViewOptions(
                    debuggingEnabled: true,
                  )),
                  onWebViewCreated: (InAppWebViewController controller) {
                    webViewController = controller;
                    webViewController.postUrl(
                        url: 'https://sandbox.payfast.co.za/eng/process',
                        postData:
                            Uint8List.fromList(utf8.encode(setPostString(model.currentCart.discountedPrice, model.currentRestraurant))));
                  },

                  onProgressChanged:
                      (InAppWebViewController controller, int progress) {
                    setState(() {
                      this.progress = progress / 100;
                    });
                  },
                ),
              ),
            )
          ],
        ),
      );
    }));
  }
}
