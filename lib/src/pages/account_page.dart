import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quick_eats/blocs/authentication/auth_event.dart';
import 'package:quick_eats/blocs/authentication/auth_state.dart';
import 'package:quick_eats/blocs/authentication/bloc.dart';
import 'package:quick_eats/src/datarepo/user_repository.dart';
import 'package:quick_eats/src/models/account_list_item.dart';
import 'package:quick_eats/src/pages/profile_page.dart';
import 'package:quick_eats/src/utils/custom_text_style.dart';
import 'package:quick_eats/src/views/account/about_us_page.dart';
import 'package:quick_eats/src/views/account/invite_friends_page.dart';
import 'package:quick_eats/src/views/account/preferences_page.dart';

class AccountPage extends StatefulWidget {
  @override
  _AccountPageState createState() => new _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  //AuthenticationBloc authenticationBloc;
  List<AccountListItem> accountItemList = new List();

  @override
  void initState() {
    createListItem();
    super.initState();
  }

  void createListItem() {
    accountItemList.add(createSection(
        "Preferences", "images/ic_notification.png", PreferencesPage()));
    accountItemList.add(createSection(
        "Invite Friends", "images/ic_invite_friends.png", InviteFriendsPage()));
    accountItemList.add(
        createSection("About Us", "images/ic_about_us.png", AboutUsPage()));
    accountItemList.add(createSection("Log Out", "images/ic_logout.png", null));
  }

  createSection(String title, String icon, Widget widget) {
    return AccountListItem(title, icon, widget);
  }

 _showDialog(BuildContext context){
    showDialog(context: context,
    builder: (BuildContext context){
      return AlertDialog(title: Text("Clear Cart"),
      content: Text("Are you sure you want to log out"),
      
      actions: [
        FlatButton(child: Text("Yes"),
        onPressed: (){
          Navigator.of(context).pop();
          BlocProvider.of<AuthenticationBloc>(context).add(LoggedOut());
        },),
        FlatButton(child: Text("No"),
        onPressed: (){
          Navigator.of(context).pop();
        },)
      ],);
    });
  }

  @override
  Widget build(BuildContext context) {
    //authenticationBloc = AuthenticationBloc();
    return BlocBuilder<AuthenticationBloc, AuthenticationState>(
        builder: (BuildContext context, AuthenticationState state) {
      return new Scaffold(
        // appBar: AppBar(title: new Text("Profile")),
          body: Column(
        children: <Widget>[
          SizedBox(height: 30,),
          //SizedBox(width: 14),
          Container(
            width: 90,
            margin: EdgeInsets.only(top: 8),
            height: 90,
            decoration: BoxDecoration(
              
                image: DecorationImage(
                    image: AssetImage("assets/images/as.png")),
                borderRadius: BorderRadius.all(Radius.circular(24))),
          ),
          Container(
            margin: EdgeInsets.only(left: 8, top: 8, right: 8, bottom: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                IconButton(
                  icon: Icon(Icons.settings),
                  iconSize: 24,
                  color: Colors.black,
                  onPressed: () {},
                ),
                IconButton(
                  icon: Icon(Icons.edit),
                  color: Colors.black,
                  iconSize: 24,
                  onPressed: () {
                    Navigator.push(
                        context,
                        new MaterialPageRoute(
                            builder: (context) => ProfilePage()));
                  },
                )
              ],
            ),
          ),
          SizedBox(
            height: 8,
          ),
          Text(
            "Siba Jikani",
            style: CustomTextStyle.textFormFieldBlack.copyWith(
                color: Colors.black, fontSize: 16, fontWeight: FontWeight.w900),
          ),
          Text(
            "sibajikani@gmail.com",
            style: CustomTextStyle.textFormFieldMedium
                .copyWith(color: Colors.grey.shade700, fontSize: 14),
          ),
          SizedBox(
            height: 16,
          ),
          Container(
            height: 2,
            width: double.infinity,
            color: Colors.grey.shade200,
          ),
          buildListView()
        ],
      ));
    });
  }

  ListView buildListView() {
    return ListView.builder(
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return createListViewItem(accountItemList[index]);
      },
      itemCount: accountItemList.length,
    );
  }

  createListViewItem(AccountListItem accountItemList) {
    return Builder(builder: (context) {
      return InkWell(
        splashColor: Colors.teal.shade200,
        onTap: () {
          if (accountItemList.widget != null) {
            Navigator.of(context).push(new MaterialPageRoute(
                builder: (context) => accountItemList.widget));
          }
          if (accountItemList.title == "Log Out") {
            //authenticationBloc.add(LoggedOut());
            _showDialog(context);
          }
        },
        child: Container(
          margin: EdgeInsets.only(left: 16, right: 12),
          padding: EdgeInsets.only(top: 12, bottom: 12),
          child: Row(
            children: <Widget>[
              Image(
                image: AssetImage('assets/images/as.png'),
                width: 20,
                height: 20,
                color: Colors.grey.shade500,
              ),
              SizedBox(
                width: 12,
              ),
              Text(
                accountItemList.title,
                style: CustomTextStyle.textFormFieldBold
                    .copyWith(color: Colors.grey.shade500),
              ),
              Spacer(
                flex: 1,
              ),
              Icon(
                Icons.navigate_next,
                color: Colors.grey.shade500,
              )
            ],
          ),
        ),
      );
    });
  }

  @override
  void dispose() {
    // Clean up the controller when the Widget is disposed
    //myFocusNode.dispose();
    super.dispose();
  }
}
