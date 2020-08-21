import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:provider/provider.dart';
import 'package:quick_eats/src/data/user_account_api_service.dart';
import 'package:quick_eats/src/models/create_account_user.dart';
import 'package:quick_eats/src/models/responses/single_response.dart';
import 'package:quick_eats/src/utils/validation.dart';

class ProfilePage extends StatefulWidget{
  @override
  _ProfilePageState createState() => new _ProfilePageState();

}

class _ProfilePageState extends State<ProfilePage> with SingleTickerProviderStateMixin {
  bool _status = true;
  final FocusNode myFocusNode = FocusNode();
  TextEditingController nameController,emailController,phoneNumberController,surnameController;

  bool isUpdating;
  CreateAccountUser user;
  final _formKey = GlobalKey<FormState>();

  Validation validation = new Validation();

  final storage = FlutterSecureStorage();

  getUser() async{
    return await storage.read(key:"user");
  }

  setUser(user) async{
    return await storage.write(key:"user", value: user);
  }

  @override
  void initState() {
    isUpdating = false;
    super.initState();
  }

  void initialise(){
    nameController = TextEditingController(text: user.name);
    emailController = TextEditingController(text:user.emailAddress);
    phoneNumberController = TextEditingController(text:user.phoneNumber);
    surnameController = TextEditingController(text:user.surname);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<dynamic>(
      future: getUser(),
      builder:(context,AsyncSnapshot<dynamic> snapshot){
        if(snapshot.hasData){
          user = CreateAccountUser.fromJson(jsonDecode(snapshot.data));
          initialise();
          return getScaffold();
        }
        else{
          return CircularProgressIndicator();
        }
      }
    );
  }

  getScaffold(){
    return new Scaffold(
        body: new Container(
            color: Colors.white,
            child: new Form(
              key: _formKey,
              child:new ListView(
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      new Container(
                        height: 250.0,
                        color: Colors.white,
                        child: new Column(
                          children: <Widget>[
                            Padding(
                                padding: EdgeInsets.only(left: 20.0, top: 20.0),
                                child: new Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Padding(
                                      padding: EdgeInsets.only(left: 25.0),
                                      child: new Text('Profile',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 20.0,
                                              fontFamily: 'sans-serif-light',
                                              color: Colors.black)),
                                    )
                                  ],
                                )),
                            Padding(
                              padding: EdgeInsets.only(top: 20.0),
                              child: new Stack(
                                  fit: StackFit.loose, children: <Widget>[
                                new Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    new Container(
                                        width: 140.0,
                                        height: 140.0,
                                        decoration: new BoxDecoration(
                                          shape: BoxShape.circle,
                                          image: new DecorationImage(
                                            image: AssetImage(
                                                'assets/images/as.png'),
                                            fit: BoxFit.cover,
                                          ),
                                        )),
                                  ],
                                ),
                                Padding(
                                    padding: EdgeInsets.only(
                                        top: 90.0, right: 100.0),
                                    child: new Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: <Widget>[
                                        new CircleAvatar(
                                          backgroundColor: Theme
                                              .of(context)
                                              .primaryColor,
                                          radius: 25.0,
                                          child: new Icon(
                                            Icons.camera_alt,
                                            color: Colors.white,
                                          ),
                                        )
                                      ],
                                    )),
                              ]),
                            )
                          ],
                        ),
                      ),
                      new Container(
                        color: Color(0xffFFFFFF),
                        child: Padding(
                          padding: EdgeInsets.only(bottom: 25.0),
                          child: new Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              Padding(
                                  padding: EdgeInsets.only(
                                      left: 25.0, right: 25.0, top: 25.0, bottom:15.0),
                                  child: new Row(
                                    mainAxisAlignment: MainAxisAlignment
                                        .spaceBetween,
                                    mainAxisSize: MainAxisSize.max,
                                    children: <Widget>[
                                      new Column(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        mainAxisSize: MainAxisSize.min,
                                        children: <Widget>[
                                          new Text(
                                            'Personal Information',
                                            style: TextStyle(
                                                fontSize: 18.0,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ],
                                      ),
                                      new Column(
                                        mainAxisAlignment: MainAxisAlignment.end,
                                        mainAxisSize: MainAxisSize.min,
                                        children: <Widget>[
                                          _status
                                              ? _getEditIcon()
                                              : new Container(),
                                        ],
                                      )
                                    ],
                                  )),
                              Padding(
                                  padding: EdgeInsets.only(
                                      left: 25.0, right: 25.0, bottom:5.0),
                                  child: TextFormField(
                                    controller: nameController,
                                    decoration: InputDecoration(
                                        labelText: 'Name',
                                        contentPadding: EdgeInsets.all(13.0)
                                    ),
                                    textCapitalization: TextCapitalization.words,
                                    keyboardType: TextInputType.text,
                                    enabled: !_status,
                                    autofocus: !_status,
                                    validator: (value) {
                                      if (value.length < 2) {
                                        return "Please enter name more than 2 chars";
                                      } else
                                        return null;
                                    },
                                  )),
                              Padding(
                                  padding: EdgeInsets.only(
                                      left: 25.0, right: 25.0, bottom:5.0),
                                  child: TextFormField(
                                    controller: surnameController,
                                    decoration: InputDecoration(
                                        labelText: 'Surname', contentPadding: EdgeInsets.all(13.0)),
                                    textCapitalization: TextCapitalization.words,
                                    enabled: !_status,
                                    autofocus: !_status,
                                    validator: (value) {
                                      if (value.length < 2) {
                                        return "Please enter name more than 2 chars";
                                      } else
                                        return null;
                                    },

                                  )),
                              Padding(
                                  padding: EdgeInsets.only(
                                      left: 25.0, right: 25.0, bottom:5.0),
                                  child: TextFormField(
                                    controller: emailController,
                                    decoration: InputDecoration(
                                        labelText: 'Email Address',
                                        contentPadding: EdgeInsets.all(13.0)),
                                    keyboardType: TextInputType.emailAddress,
                                    enabled: !_status,
                                    autofocus: !_status,
                                    validator: validation.validateEmail,
                                  )),
                              Padding(
                                  padding: EdgeInsets.only(
                                      left: 25.0, right: 25.0),
                                  child: TextFormField(
                                    controller: phoneNumberController,
                                    decoration: InputDecoration(
                                        labelText: "Phone Number",
                                        contentPadding: EdgeInsets.all(11.0)),
                                    keyboardType: TextInputType.number,
                                    enabled: !_status,
                                    autofocus: !_status,
                                    validator: validation.validatePhoneNumber,
                                  )),

                              !_status ? _getActionButtons() : new Container(),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            )));
  }

  @override
  void dispose() {
    // Clean up the controller when the Widget is disposed
    nameController.dispose();
    surnameController.dispose();
    emailController.dispose();
    phoneNumberController.dispose();
    myFocusNode.dispose();
    super.dispose();
  }

  void submit(GlobalKey<FormState> key) async{
    await Future.delayed(Duration.zero);
    setState(() {
      isUpdating = true;
    });
    user = new CreateAccountUser(
        nameController.text.trim(),
        surnameController.text.trim(),
        emailController.text.trim(),
        null,
        phoneNumberController.text.trim(),user.id);
    debugPrint(user.toString());
    Map<String, dynamic> userMap = new Map<String, dynamic>();
    //var userMap = user.toJson();
    userMap.addAll(user.toJson());
    userMap.remove('password');
    final response = Provider.of<UserAccountService>(context,listen: false).updateProfile(user.id, userMap);

    response.then((onValue) {
      debugPrint(onValue.bodyString);
      debugPrint(onValue.statusCode.toString());
      SingleResponse response1 = new SingleResponse().fromJson(
          jsonDecode(onValue.bodyString));

      if (response1.error == null) {
        setUser(jsonEncode(response1.user.toJson()));
        final snackBar = SnackBar(content: Text(response1.message));
        Scaffold.of(context).showSnackBar(snackBar);
      }
      else {
        debugPrint(response1.error);
      }
    }).catchError((error) {
      print(error);
      SingleResponse errorResponse = new SingleResponse().fromJson(
          jsonDecode(error.bodyString));
      debugPrint(errorResponse.message);
      if (error.statusCode == 404) {
        debugPrint("Not found");
        /*FormState form = key.currentState;
        if (form != null)
          form.validate();
        else
          debugPrint('form is null');*/
      }
    })
    .whenComplete((){
        setState(() {
        isUpdating = false;
        _status = true;
        FocusScope.of(context).requestFocus(new FocusNode());
        });
    });
  }

  Widget _getActionButtons() {
    return Padding(
      padding: EdgeInsets.only(left: 25.0, right: 25.0, top: 45.0),
      child: new Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(right: 10.0),
              child: Container(
                  child: new RaisedButton(
                    child: isUpdating ? CircularProgressIndicator(
                        backgroundColor: Theme
                        .of(context)
                        .primaryColor)
                        : Text(
                      "Save", style: TextStyle(fontSize: 18.0),),
                    textColor: Colors.white,
                    color: Theme.of(context).primaryColor,
                    onPressed: () => isUpdating ? null :
                    _formKey.currentState.validate()
                      ? submit(_formKey)
                      : debugPrint('validation error'),
                    shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(20.0)),
                  )),
            ),
            flex: 2,
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(left: 10.0),
              child: Container(
                  child: new RaisedButton(
                    child: new Text("Cancel"),
                    textColor: Colors.white,
                    color: Colors.red,
                    onPressed: () {
                      setState(() {
                        _status = true;
                        FocusScope.of(context).requestFocus(new FocusNode());
                      });
                    },
                    shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(20.0)),
                  )),
            ),
            flex: 2,
          ),
        ],
      ),
    );
  }

  Widget _getEditIcon() {
    return new GestureDetector(
      child: new CircleAvatar(
        backgroundColor: Theme
            .of(context)
            .primaryColor,
        radius: 14.0,
        child: new Icon(
          Icons.edit,
          color: Colors.white,
          size: 16.0,
        ),
      ),
      onTap: () {
        setState(() {
          _status = false;
        });
      },
    );
  }
}
