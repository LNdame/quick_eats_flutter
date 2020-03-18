import 'package:flutter/material.dart';
import 'package:quick_eats/res/colors.dart';
import 'package:quick_eats/src/models/vendor_model.dart';
import 'package:quick_eats/src/ui_reusable/home_arrow.dart';
import 'package:quick_eats/src/ui_reusable/search_widget.dart';
import 'package:quick_eats/src/ui_reusable/vendor_widget.dart';

class VendorAll extends StatefulWidget {
  @override
  _VendorAllState createState() => _VendorAllState();
}

class _VendorAllState extends State<VendorAll> {
  final options = ["Burger", "Pizza", "Chicken"];
  String _value = "Pizza";

  final vendors =[
    Vendor(name: "Restaurant 1", profilePictureUri:"https://picsum.photos/id/163/200/300" ),
    Vendor(name: "Restaurant 2", profilePictureUri:"https://picsum.photos/id/1080/200/300" ),
    Vendor(name: "Restaurant 3", profilePictureUri:"https://picsum.photos/id/225/200/300" ),
    Vendor(name: "Restaurant 4", profilePictureUri:"https://picsum.photos/id/292/200/300" ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: qeBackgroundWhite,
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(

            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              HomeArrow(),
              SizedBox(height: 8.0,),
              SearchField(),

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
                padding: const EdgeInsets.all(8.0),
                child: Divider(
                  color: Colors.grey.withOpacity(0.8),
                ),
              ),

              Flexible(
                flex:1,
                fit: FlexFit.loose,

                child: ListView.builder(
                    itemCount: vendors.length,
                    itemBuilder: (context, index){
                      return new VendorFrontCard(vendors[index]);
                    }),
              )

            ],
          ),
        )
    );

  }
}
