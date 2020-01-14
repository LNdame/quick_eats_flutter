import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quick_eats/res/colors.dart';
import 'package:quick_eats/src/data/vendor_api_service.dart';
import 'package:quick_eats/src/models/vendor_model.dart';
import 'package:quick_eats/src/ui_reusable/top_info.dart';
import 'package:quick_eats/src/ui_reusable/vendor_menu_item.dart';


class VendorProfile extends StatefulWidget{
  final Vendor vendor;


  VendorProfile({this.vendor});

  @override
  _VendorProfileState createState() => _VendorProfileState();
}

class _VendorProfileState extends State<VendorProfile> {
  @override
  void initState()  {
    // TODO: implement initState
  //  loadVendors();
    super.initState();

  }
   @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Column(
        children: <Widget>[
         Container(
           decoration: BoxDecoration(
               image: DecorationImage
                 (image: NetworkImage(widget.vendor.profilePictureUri),
                 fit: BoxFit.fill,
               )
           ),

           child: Column(
             children: <Widget>[
               SizedBox(height: 90.0,),
               TopInfo(widget.vendor.name),
               Stack(
                  children: <Widget>[
                    Positioned.fill(
                        child: Column(
                          children: <Widget>[
                            Expanded(
                              child: Container(
                                // color: Colors.cyan,
                              ),
                            ),
                            Expanded(
                              child: Container(
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                    ),
                    keyWord(context),
                  ],
               ),
             ],
           ),
         ),
          Expanded(child:
          ListView.builder(
            itemCount: 20,
              padding: EdgeInsets.symmetric(horizontal: 15.0),
              itemBuilder: ( context, i){
                return VendorMenuItem();
              })
          )
        ],
      ),
    );
  }

  Future loadVendors() async {
    final response = await Provider.of<VendorApiService>(context).getAllVendors();
    if(response.statusCode == 200){
      print(response);
    }
  }

}



Widget keyWord (BuildContext context){

  return Container(
    margin: EdgeInsets.symmetric(vertical: 9.0, horizontal: 15.0),
    padding: EdgeInsets.all(11.0),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(15.0),
      color:  Colors.white,
      boxShadow: [BoxShadow(
        color: Colors.black26,
        blurRadius: 1.0,
        offset: Offset(0, 1)
      )]
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        Text("Burgers", style: Theme.of(context).textTheme.title,),
        Text("Samoosas", style: Theme.of(context).textTheme.title,),
        Text("Fries", style: Theme.of(context).textTheme.title,),
      ],
    ),
  );
}

