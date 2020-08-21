import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quick_eats/blocs/restaurant_bloc/bloc.dart';
import 'package:quick_eats/blocs/restaurant_bloc/restaurant_bloc.dart';
import 'package:quick_eats/res/colors.dart';
import 'package:quick_eats/src/models/models.dart';
import 'package:built_collection/built_collection.dart';
import 'package:quick_eats/src/ui_reusable/alt_top_widget.dart';
import 'package:quick_eats/src/ui_reusable/bottom_cart_widget.dart';
import 'package:quick_eats/src/ui_reusable/restaurant_card.dart';
import 'package:quick_eats/src/views/restaurant/restaurant_list_widget.dart';


class RestaurantWidget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    BlocProvider.of<RestaurantBloc>(context).add(FetchRestaurants());

    return Scaffold(
        backgroundColor: qeBackgroundWhite,
        
        body: Column(
          children: <Widget>[
           //AltTopInfoWidget(),
          Center(
            child: BlocBuilder<RestaurantBloc, RestaurantState>(
              builder: (context, state){
                if(state is RestaurantEmpty){
                  return Center(child: CircularProgressIndicator(),);
                }
                if(state is RestaurantLoading){
                  return Center(child: CircularProgressIndicator(),);
                }
                if(state is RestaurantLoaded){
                  final BuiltList<Restaurant> restaurants = state.restaurants;

                  return buildRestaurantList(context, restaurants);
                }
                if(state is RestaurantError){
                  return Text("Something went wrong!");
                }
                else{
                  return Text("Something went wrong!");
                }
              },


            ),
          ),
          ],
        ),
    );
  }


  // ListView _buildRestaurantList(BuildContext context, BuiltList<Restaurant> restaurants){
  //   return ListView.builder(shrinkWrap: true,
  //       itemCount: restaurants.length,
  //       itemBuilder: (context, index){
  //           return Container(
  //             margin: EdgeInsets.only(bottom: 20.0),
  //             child: RestaurantCard(restaurant: restaurants[index],),
  //           );
  //       });
  // }


  /*ListView _buildVendors(BuildContext context, List<Vendor> vendorList) {
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
  }*/
}
