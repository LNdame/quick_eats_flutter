import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quick_eats/src/data/menu_api_service.dart';
import 'package:quick_eats/src/data/repositories.dart';

class TestZone extends StatefulWidget {
  @override
  _TestZoneState createState() => _TestZoneState();
}

class _TestZoneState extends State<TestZone> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
       Center(
        child: RaisedButton(child: Text("Submit"),  onPressed: ()async{
          final response = await Provider.of<MenuApiService>(context,listen: false).getAllMenus("037855a0-77d9-11ea-a2cc-ef56bfa81bbf");
              print(response.body);
        })
        ,),
    );
  }
}
