import 'package:flutter/material.dart';
import 'package:quick_eats/res/colors.dart';
import 'package:quick_eats/src/ui_reusable/home_arrow.dart';

class MenuItemPage extends StatefulWidget {
  @override
  _MenuItemPageState createState() => _MenuItemPageState();
}

class _MenuItemPageState extends State<MenuItemPage> {
  final options = ["Small", "Medium", "Large"];
  String _value = "Medium";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: qeBackgroundWhite,
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 250,
              child: Stack(
                fit: StackFit.loose,
                overflow: Overflow.visible,
                children: <Widget>[
                  Container(
                    height: 200,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(30.0),
                      bottomRight: Radius.circular(30.0),
                    )),
                    child: FittedBox(
                      child: Image.asset("assets/images/waffle.jpg"),
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                  HomeArrow(),
                  Container(
                      height: 200,
                      width: MediaQuery.of(context).size.width,
                      //TODO replace the style with the uniform theme style
                      child: Center(
                          child: Text(
                        "<<Restauran name>>",
                        style: TextStyle(fontSize: 20.0, color: Colors.black),
                      ))),
                  Positioned(
                    left: 0.0,
                    right: 0.0,
                    top: 150.0,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius:
                                BorderRadius.all(Radius.circular(3.0))),
                        child: Row(
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.all(10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.all(5.0),
                                    child: Text(
                                      "<<Menu Item Title>>",
                                      style: TextStyle(
                                        fontSize: 20.0,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(5.0),
                                    //TODO replace the style with the uniform theme style
                                    child: Text(
                                      "<<Menu Item Subtitle>>",
                                      style: TextStyle(
                                        fontSize: 12.0,
                                        color: Colors.grey,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Spacer(),
                            Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Container(
                                width: 80,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10.0)),
                                    border: Border.all(color: Colors.black)),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 3.0, vertical: 8.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Icon(
                                        Icons.remove,
                                        color: Colors.green,
                                        size: 20.0,
                                      ),
                                      Text("2",
                                          style: TextStyle(
                                              fontSize: 12.0,
                                              color: Colors.grey)),
                                      Icon(
                                        Icons.add,
                                        color: Colors.green,
                                        size: 20.0,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            Text(
              "Size",
              style: Theme.of(context).textTheme.title,
            ),
            Center(
              child: Wrap(
                alignment: WrapAlignment.spaceEvenly,
                children: options
                    .map((op) => Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ChoiceChip(
                            selectedColor: Theme.of(context).accentColor,
                            label: Text(
                              op,
                              style: Theme.of(context).textTheme.caption,
                            ),
                            selected: _value == op,
                            onSelected: (selected) {
                              setState(() {
                                _value = selected ? op : null;
                              });
                            },
                          ),
                        ))
                    .toList(),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 15.0, right: 15.0, top: 5.0, bottom: 5.0),
              child: Divider(
                color: Colors.grey.withOpacity(0.8),
              ),
            ),
            Text(
              "Add Ons",
              style: Theme.of(context).textTheme.title,
            ),
            buildAddOns("Bacon"),
            buildAddOns("Jalapeno"),
            buildAddOns("Cheese"),
          ],
        ),
      ),
      bottomNavigationBar: buildAddToCartInfo(),
    );
  }

  Widget buildAddOns(String item) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.grey,
            borderRadius: BorderRadius.all(Radius.circular(10))),
        child: Padding(
          padding: const EdgeInsets.only(right: 10.0),
          child: Row(
            children: <Widget>[
              Checkbox(value: false, onChanged: null),
              Text("$item"),
              Spacer(),
              Text("R 2.50"),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildAddToCartInfo() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 50,
        child: Row(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Total",
                style: Theme.of(context).textTheme.title,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "R 32.99",
                style: TextStyle(
                    fontSize: 20, fontWeight: FontWeight.bold, letterSpacing: 4),
              ),
            ),
            Spacer(),
            ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: RaisedButton(
                color: Theme.of(context).accentColor,
                textColor: Colors.white,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 12.0, horizontal: 10.0),
                  child: Text("Add to Cart"),
                ),
                onPressed: () {},
              ),
            )
          ],
        ),
      ),
    );
  }
}
