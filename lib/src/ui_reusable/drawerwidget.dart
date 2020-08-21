import 'package:flutter/material.dart';

class UIDrawer extends StatefulWidget {
  @override
  _UIDrawerState createState() {
    return new _UIDrawerState();
  }
}

class _UIDrawerState extends State<UIDrawer> {
  @override
  Widget build(BuildContext context) {
    
    return Drawer(
        child: ListView(
      children: <Widget>[
        UserAccountsDrawerHeader(
          accountEmail: Text("Loic@email.com"),
          accountName: Text("Loic Dev"),
          currentAccountPicture: CircleAvatar(
            backgroundImage:
                NetworkImage('https://picsum.photos/200/300/?blur=2'),
            backgroundColor: Colors.white,
          ),
          decoration: BoxDecoration(
            color: Colors.blueGrey,
          ),
        ),
        ListTile(
          title: Text("Home"),
          trailing: Icon(Icons.home),
          onTap: () {},
        ),
        ListTile(
          title: Text("Orders"),
          trailing: Icon(Icons.toll),
          onTap: () {},
        )
      ],
    ));
  }
}
