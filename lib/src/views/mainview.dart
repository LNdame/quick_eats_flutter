import 'package:flutter/material.dart';
import 'package:quick_eats/src//ui_reusable/drawerwidget.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:quick_eats/src/pages/favorite_page.dart';
import 'package:quick_eats/src/pages/home_page.dart';
import 'package:quick_eats/src/pages/order_page.dart';
import 'package:quick_eats/src/pages/profile_page.dart';
import 'package:quick_eats/res/colors.dart';

class MainView extends StatefulWidget {
  @override
  _MainViewState createState() => new _MainViewState();

}

class _MainViewState extends State<MainView> {
  int _currentTab = 0;

  //Pages
  HomePage _homePage;
  OrderPage _orderPage;
  FavoritePage _favoritePage;
  ProfilePage _profilePage;

  List<Widget> _pages;
  Widget _currentPage;

  @override
  void initState() {
    _homePage = new HomePage();
    _orderPage = new OrderPage();
    _favoritePage = new FavoritePage();
    _profilePage = new ProfilePage();
    _pages = [_homePage, _orderPage, _favoritePage, _profilePage];
     _currentPage = _homePage;
     super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // ? TODO: implement build
    return Scaffold(
      backgroundColor: qeBackgroundWhite ,
      resizeToAvoidBottomPadding: false,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentTab,
          onTap: (index){
            setState(() {
              _currentTab = index;
              _currentPage = _pages[index];
            });
          },
          type: BottomNavigationBarType.fixed,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home,),
              title: Text("Home")
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.shopping_basket,),
                title: Text("Orders")
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.favorite,),
                title: Text("Favorite")
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.person,),
                title: Text("Profile")
            ),
          ]
      ),
      body: _currentPage,
    );
  }
}
