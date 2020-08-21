import 'package:flutter/material.dart';
import 'package:quick_eats/res/colors.dart';
import 'package:quick_eats/src/models/cart_enum.dart';
import 'package:quick_eats/src/models/cart_item.dart';
import 'package:quick_eats/src/models/cart.dart';
import 'package:quick_eats/src/models/menu_item.dart';
import 'package:quick_eats/src/models/menu_item_extras_panel.dart';
import 'package:quick_eats/src/models/scoped_models.dart';
import 'package:quick_eats/src/ui_reusable/bottom_cart_widget.dart';
import 'package:quick_eats/src/ui_reusable/home_arrow.dart';
import 'package:scoped_model/scoped_model.dart';

class MenuItemPage extends StatefulWidget {
  final MenuItem item;
  MenuItemPage(this.item);
  @override
  _MenuItemPageState createState() => _MenuItemPageState();
}

class _MenuItemPageState extends State<MenuItemPage> {
  // final options = ["Small", "Medium", "Large"];

  // String _value = "Medium";
  List<MenuItemExtrasPanelItem> items;
  double totalExtrasPrice;
  int numberOfItems;
  bool checkboxValue;
  


  @override
  void initState() {
    items = generateItems();
      numberOfItems = 1;
      totalExtrasPrice = 0;
    checkboxValue = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<ScopedQEModel>(
        builder: (BuildContext context, Widget child, ScopedQEModel model) {
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
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            // Text(
            //   "Size",
            //   style: Theme.of(context).textTheme.headline6,
            // ),
            // Center(
            //   child: Wrap(
            //     alignment: WrapAlignment.spaceEvenly,
            //     children: options
            //         .map((op) => Padding(
            //               padding: const EdgeInsets.all(8.0),
            //               child: ChoiceChip(
            //                 selectedColor: Theme.of(context).accentColor,
            //                 label: Text(
            //                   op,
            //                   style: Theme.of(context).textTheme.caption,
            //                 ),
            //                 selected: _value == op,
            //                 onSelected: (selected) {
            //                   setState(() {
            //                     _value = selected ? op : null;
            //                   });
            //                 },
            //               ),
            //             ))
            //         .toList(),
            //   ),
            // ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 15.0, right: 15.0, top: 5.0, bottom: 5.0),
              child: Divider(
                color: Colors.grey.withOpacity(0.8),
              ),
            ),
            // Text(
            //   "Add Ons",
            //   style: Theme.of(context).textTheme.headline6,
            // ),
            // buildAddOns("Bacon", 2.50),
            // buildAddOns("Jalapeno",7.50),
            // buildAddOns("Cheese",8.50),
            buildExpansionList(),
          ],
        ),
      ),
      bottomNavigationBar: buildAddToCartInfo(model),
    );
        });
  }

  List<MenuItemExtrasPanelItem> generateItems() {
    var sauceOptions = [
      new MenuExtraItem(name: "Tomato Sauce", price: 0),
      new MenuExtraItem(name: "Sweet Chilli Sauce", price: 0),
      new MenuExtraItem(name: "Mayo", price: 0)
    ];
    var sauces = new MenuItemExtrasPanelItem(
        collapsedValues: sauceOptions,
        headerValue: "Sauces - Pick up to 3",
        isExpanded: true);
    var addOnOptions = [
      new MenuExtraItem(name: "Extra Chips", price: 17),
      new MenuExtraItem(name: "Drink", price: 13),
      new MenuExtraItem(name: "Chocolate", price: 8)
    ];
    var addOns = new MenuItemExtrasPanelItem(
        collapsedValues: addOnOptions, headerValue: "Extras", isExpanded: true);
    return [sauces, addOns];
  }

  Widget buildExpansionList() {
    return ExpansionPanelList(
      expansionCallback: (int index, bool isExpanded) {
        setState(() {
          items[index].isExpanded = !isExpanded;
        });
      },
      children: items.map<ExpansionPanel>((MenuItemExtrasPanelItem item) {
        return ExpansionPanel(
          headerBuilder: (BuildContext context, bool isExpanded) {
            return ListTile(
              title: Text(item.headerValue),
            );
          },
          canTapOnHeader: true,
          body: new Padding(
              padding: new EdgeInsets.all(10.0),
              child: new Column(
                  children: buildAddOnsReturn(item.collapsedValues))),
          isExpanded: item.isExpanded,
        );
      }).toList(),
    );
  }

  List<Widget> buildAddOnsReturn(List<MenuExtraItem> list) {
    var widgets = List<Widget>();
    for (int i = 0; i < list.length; i++) {
      widgets.add(buildAddOns(list[i]));
    }
    return widgets;
  }

  Widget buildAddOns(MenuExtraItem extraItem) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Container(
        decoration: BoxDecoration(
            //color: Colors.grey,
            borderRadius: BorderRadius.all(Radius.circular(10))),
        child: Padding(
          padding: const EdgeInsets.only(right: 10.0),
          child: Row(
            children: <Widget>[
              Checkbox(
                  value: extraItem.isChecked,
                  onChanged: (checked) {
                    setState(() {
                      extraItem.isChecked = checked;
                      //widget.item.menuItems.firstWhere((element) => element.name == extraItem.name).isChecked = true;
                      totalExtrasPrice = checked ? totalExtrasPrice + extraItem.price : totalExtrasPrice - extraItem.price;
                    });
                  }),
              Text("${extraItem.name}"),
              Spacer(),
              Text("R " + extraItem.price.toString().padRight(4, '0')),
            ],
          ),
        ),
      ),
    );
  }


  Widget buildAddToCartInfo(ScopedQEModel model) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
          height: 110,
          child: Column(children: <Widget>[
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Container(
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    border: Border.all(color: Colors.black)),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 3.0, vertical: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      GestureDetector(
                          child: Icon(
                            Icons.remove,
                            color: numberOfItems == 1 ? Colors.grey : Colors.green,
                            size: 25.0,
                          ),
                          onTap: () => setState(() {
                                if(numberOfItems>1){
                                  numberOfItems--;
                                }
                              })),
                      Text(numberOfItems.toString(),
                          style: TextStyle(fontSize: 20.0, color: Colors.grey)),
                      GestureDetector(
                        onTap: () => setState(() {
                          numberOfItems++;
                        }),
                        child: Icon(
                          Icons.add,
                          color: Colors.green,
                          size: 25.0,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            BottomCartToolbar(CartOptions.continueShopping,numberItems: numberOfItems,extrasPrice: totalExtrasPrice, menuItem: widget.item, extraItems: getExtras(),)
            //BottomCartToolbar(widget.cart, CartOptions.continueShopping)
          ])),
    );
  }

  List<MenuExtraItem> getExtras(){
    List<MenuExtraItem> extras = [];
    for (var item in items) {
      //MenuItem currentItem = item.collapsedValues;
      extras.addAll(item.collapsedValues.where((element) => element.isChecked));
    }
    return extras;
  }
}
