import 'package:flutter/material.dart';
import 'package:quick_eats/src/models/cart.dart';
import 'package:quick_eats/src/models/menu_item.dart';

import 'menu_item_page.dart';

class MenuItemCard extends StatefulWidget {
  final MenuItem item;
  MenuItemCard(this.item) : assert(item!=null);
  @override
  _MenuItemCardState createState() => _MenuItemCardState();
}

class _MenuItemCardState extends State<MenuItemCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 20.0, top: 15.0, right: 20.0, bottom: 5.0),
      child: Container(
          child: GestureDetector(
        onTap: () => Navigator.push(
            context,
            new MaterialPageRoute(
                builder: (context) => MenuItemPage(widget.item))),
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
          ),
          child: Column(
            children: <Widget>[
              Stack(
                alignment: Alignment.topRight,
                children: <Widget>[
                  ClipRRect(
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(10),
                        topLeft: Radius.circular(10)),
                    child: Image.asset(
                      "assets/images/multifood.jpg",
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CircleAvatar(
                      backgroundColor: Colors.grey.withOpacity(0.7),
                      radius: 20.0,
                      child: Icon(
                        Icons.favorite_border,
                        color: Colors.white,
                        size: 30.0,
                      ),
                    ),
                  )
                ],
              ),
              Row(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Text(
                            widget.item.item_name,
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
                            widget.item.item_description,
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
                    padding: const EdgeInsets.all(15.0),
                    child: Column(
                      children: <Widget>[
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius:
                                BorderRadius.all(Radius.circular(10.0)),
                            border: new Border.all(color: Colors.green),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(widget.item.item_price),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      )),
    );
  }
}
