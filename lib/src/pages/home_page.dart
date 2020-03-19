import 'package:flutter/material.dart';
import 'package:quick_eats/src/datarepo/vendor_data_manager.dart';
import 'package:quick_eats/src/models/vendor_model.bak.dart';
import 'package:quick_eats/src/ui_reusable/bought_food_widget.dart';
import 'package:quick_eats/src/ui_reusable/home_top_widget.dart';
import 'package:quick_eats/src/ui_reusable/search_widget.dart';
import 'package:quick_eats/src/ui_reusable/food_category_widget.dart';
import 'package:quick_eats/res/colors.dart';


import 'package:quick_eats/src/models/food_model.dart';
//import the data from fake(for now) repo
import 'package:quick_eats/src/datarepo/food_data.dart';
import 'package:quick_eats/src/ui_reusable/vendor_widget.dart';



class HomePage extends StatefulWidget{
  @override
  _HomePageState createState() => new _HomePageState();

}

class _HomePageState extends State<HomePage> {

  List<Vendor> _vendors;

  @override
  void initState() {

  }

  List<Food> _foods = foods;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.only(top: 50.0, left: 20.0, right: 20.0),
        children: <Widget>[
          HomeTopInfo(),
          FoodCategory(),
          SizedBox(height: 20.0,),
          SearchField(),
          SizedBox(height: 20.0,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text("Discover the foods around you",
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ) ,
              ),
              GestureDetector(
                onTap: (){},
                child: Text("View all",
                  style: TextStyle(
                    color: qeAccentDark,
                    fontWeight: FontWeight.bold,
                    fontSize: 16.0
                  ),
                ),
              )

            ],
          ),
          SizedBox(height: 20.0,),
          Column(
           mainAxisSize: MainAxisSize.min,
           //   children: _foods.map(_buildFoodItems).toList(),
            children: <Widget>[
                 Flexible(
                   fit: FlexFit.loose,
                   flex: 1,
                  child: _frontVendorBuilder(context) ,
                ),


            ],
          )

        ],
      ),
    );
  }

  FutureBuilder<List<Vendor>> _frontVendorBuilder(BuildContext context){
    return FutureBuilder<List<Vendor>>(
      future: VendorDataManager.requestAllVendors(context),
      builder: (context, snapshot){
        if(snapshot.connectionState == ConnectionState.done){
          if(snapshot.hasError){
            return Center(
              child: Text(
                snapshot.error.toString(),
                textAlign: TextAlign.center,
                textScaleFactor: 1.3,
              ),
            );
          }
          final List<Vendor> vendorList = snapshot.data;
          return _buildVendors(context, vendorList) ;// vendorList.map(_buildVendorItems).toList();
          return null;
        }else{
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },

    );
  }

  ListView _buildVendors(BuildContext context, List<Vendor> vendorList) {
    return ListView.builder(
      shrinkWrap: true,
        itemCount: vendorList.length,
        itemBuilder: (context, index) {
          return  Container(
            margin: EdgeInsets.only(bottom: 20.0),
            child: VendorFrontCard(vendorList[index]
            ),
          );
        }
    );
  }

  Widget _buildFoodItems(Food food){
    return Container(
      margin: EdgeInsets.only(bottom: 20.0),
      child: BoughtFood(
        id: food.id,
        name: food.name,
        imagePath: food.imagepath,
        category: food.category,
        discount: food.discount,
        price: food.price,
        ratings: food.ratings,
      ),
    );
  }

//  Container(
//  margin: EdgeInsets.only(bottom: 20.0),
//  child: Card(
//return  Card(
//            child: ListTile(
//              title: Text( vendorList[index].name),
//              subtitle: Text(vendorList[index].description),
//            ),
//          );
//      )    ,      //VendorFron

}