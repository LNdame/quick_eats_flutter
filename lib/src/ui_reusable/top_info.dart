import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quick_eats/src/data/vendor_api_service.dart';

class TopInfo extends StatefulWidget{

  final String header;

  TopInfo(this.header):assert(header!=null);

  @override
  _TopInfoState createState() => _TopInfoState();
}

class _TopInfoState extends State<TopInfo> {
//  final textStyle = TextStyle(fontSize: 22.0, color: Colors.white, shadows:[Shadow(
//    color: Theme.of(context).accentColor
//  )]  , fontWeight:  FontWeight.bold);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
   // setState(() => this.context = context);
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      margin: EdgeInsets.only(bottom: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(widget.header, style:
                TextStyle(fontSize: 22.0, color: Colors.white, shadows:[Shadow(
                    color: Theme.of(context).accentColor,
                  blurRadius: 10.0,
                  offset: Offset(5.0, 5.0),
                )]  , fontWeight:  FontWeight.bold),
                ),
              ],
            ),
          ),
          GestureDetector(
              onTap: ()async{
                final response = await Provider.of<VendorApiService>(context).getAllVendors();
                print(response);

              } ,
              child: Icon(Icons.notifications_none, size: 30.0, color: Theme.of(context).primaryColor,)),
        ],
      ),
    );
  }

  Future loadVendors(BuildContext context) async {
    final response = await Provider.of<VendorApiService>(context).getAllVendors();
    if(response.statusCode == 200){
      print(response);
    }
    return null;
  }
}