import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quick_eats/src/data/vendor_api_service.dart';
import 'package:quick_eats/src/models/vendor_model.dart';

class VendorDataManager{
  final BuildContext context;
  VendorDataManager(this.context);

  static Future<List<Vendor>> requestAllVendors(BuildContext context) async{
    List<Vendor>vendorList = new List<Vendor>();
    final response = await Provider.of<VendorApiService>(context).getAllVendors();
    if(response.statusCode == 200){
      print(response);
      List<dynamic> bodyList = response.body['model'];
      for(var model in bodyList){
        vendorList.add(Vendor.fromJson(model));
      }

      return vendorList;
    }

    return vendorList;
  }


}