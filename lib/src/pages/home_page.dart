import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quick_eats/blocs/restaurant_bloc/bloc.dart';
import 'package:quick_eats/src/models/vendor_model.bak.dart';
import 'package:quick_eats/src/ui_reusable/home_top_widget.dart';
import 'package:quick_eats/src/ui_reusable/search_widget.dart';
import 'package:quick_eats/src/ui_reusable/food_category_widget.dart';
import 'package:quick_eats/res/colors.dart';

import 'package:quick_eats/src/models/food_model.dart';

//import the data from fake(for now) repo
import 'package:quick_eats/src/datarepo/food_data.dart';
import 'package:quick_eats/src/views/restaurant/restaurant_limited_widget.dart';
import 'package:quick_eats/src/views/restaurant/restaurant_widget.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => new _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Vendor> _vendors;

  @override
  void initState() {}

  //List<Food> _foods = foods;
  
String _value = "South Campus";

  final _items = <DropdownMenuItem<String>>[new DropdownMenuItem(child: new Text("South Campus"), value: "South Campus"),
  new DropdownMenuItem(child: new Text("North Campus"),value: "North Campus"),
  new DropdownMenuItem(child: new Text("2nd Ave"),value: "2nd Ave")]; 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: <Widget>[
            Text("Campus: "),
          new DropdownButton<String>(
            value: _value,
            items: _items,
            onChanged: (String value) {
              setState(() => _value = value);
            },
          ),
          ])
      ),
      body: ListView(
        
        padding: EdgeInsets.only(top: 20.0, left: 20.0, right: 20.0),
        children: <Widget>[
          // HomeTopInfo(),
          FoodCategory(),
          SizedBox(
            height: 20.0,
          ),
          SearchField(),
          // SizedBox(
          //   height: 20.0,
          // ),
          //  Row(
          //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //   children: <Widget>[
          //     Text(
          //       "Discover the foods around you",
          //       style: TextStyle(
          //         fontSize: 18.0,
          //         fontWeight: FontWeight.bold,
          //       ),
          //     ),
          //     GestureDetector(
          //       onTap: () {
          //         Navigator.pushNamed(context, '/vendor_all');
          //       },
          //       child: Text(
          //         "View all",
          //         style: TextStyle(
          //             color: qeAccentDark,
          //             fontWeight: FontWeight.bold,
          //             fontSize: 16.0),
          //       ),
          //     )
          //   ],
          // ),
          SizedBox(
            height: 20.0,
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            
            children: <Widget>[
              Flexible(
                  fit: FlexFit.loose,
                  flex: 1,
                  
                  child: BlocProvider(
                    create: (context) => RestaurantBloc(context: context),
                    child: RestaurantLimited(),
                  )),
            ],
          )
        ],
      ),
    );
  }

/*FutureBuilder<List<Vendor>> _frontVendorBuilder(BuildContext context){
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
*/
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
