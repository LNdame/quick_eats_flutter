import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'dart:convert';

import 'package:provider/provider.dart';
import 'package:quick_eats/res/colors.dart';
import 'package:quick_eats/src/models/responses/single_response.dart';
import 'package:quick_eats/src/post_api_service.dart';
import 'package:quick_eats/src/validation.dart';


import 'package:quick_eats/src/models/create_account_user.dart';

import '../recover_password.dart';
import '../registration.dart';
import 'mainview.dart';

class SignInPage extends StatefulWidget{
  SignInPage({Key key}) : super(key: key);

  @override
  _SignInPageState createState() =>new _SignInPageState();

}

class _SignInPageState extends State<SignInPage> {
  final emailController = TextEditingController();
  final phoneNumberController = TextEditingController();
  final passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool showPassword, isLoggingIn,emailExists, incorrectPassword;
  Validation validation = new Validation();
  String errorDescription;

  final storage = FlutterSecureStorage();

  @override
  void initState() {
    // TODO: implement initState
    showPassword = false;
    isLoggingIn = false;
    emailExists = true;
    incorrectPassword=false;
    super.initState();
  }

  void dispose(){
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void submit(GlobalKey<FormState> key,Map<String,dynamic> user) async{
    setState(() {
      isLoggingIn = true;
    });

    /*String readToken = await storage.read(key: 'token');*/
    loginUser(user);
  }


  void loginUser(Map<String,dynamic> user){
    final response = Provider.of<UserAccountService>(context).loginUser({
      'email': user["username"],
      'password': user["password"],
    });
    response.then((onValue) {
      SingleResponse response = new SingleResponse().fromJson(jsonDecode(onValue.bodyString));
      debugPrint(onValue.bodyString);
      if (response.error==null) {
        //enableEmail = false;
        debugPrint('successful');
        storage.write(key: 'token', value: response.accessToken);
        Navigator.push(context,
            new MaterialPageRoute(builder: (context) => new MainView()));
        //model= new ForgotPasswordModel(response.model['userID'], response.model['appLogID'], response.model['resetPasswordToken']);
      }
      else {
        debugPrint(response.error);
      }
    }, onError: (error) async{
      //bad request
      if(error.statusCode ==401)
        {
          incorrectPassword = true;
          errorDescription = "Invalid password";
        }
      if (error.statusCode == 400) {
        SingleResponse response = new SingleResponse().fromJson(jsonDecode(error.bodyString));
        incorrectPassword = true;
        errorDescription = "Invalid password";
      }
      if(error.statusCode ==404){
        SingleResponse response = new SingleResponse().fromJson(jsonDecode(error.bodyString));
        //debugPrint(response.message);
        emailExists = false;
        errorDescription = "No user found that matches the email address";
      }
      FormState form = _formKey.currentState;
      if (form != null)
        form.validate();
      else
        debugPrint('form is null');
      debugPrint(error.statusCode.toString());
    }).whenComplete(() =>
        setState(() {
          isLoggingIn = false;
        }));
  }
  String passwordValidation(String value){
    if(incorrectPassword){
      incorrectPassword = false;
      return errorDescription;
    }
    else return null;
  }
  String emailValidation(String value) {
    if (!emailExists) {
      emailExists = true;
      return errorDescription;
    } else {
      return validation.validateEmail(value);
    }
  }
  @override
  Widget build(BuildContext context) {
    Form form = new Form(
      key: _formKey,
      child: ListView(
        //crossAxisAlignment: CrossAxisAlignment.start,

        children: <Widget>[
          Image(
            image: AssetImage('assets/images/temp_logo.png'),
            height: 200.0,
            width: 120.0,
          ),

          Container(padding: new EdgeInsets.all(5.0)),
          TextFormField(
            controller: emailController,
            decoration: InputDecoration(
                labelText: 'Email Address',
                contentPadding: EdgeInsets.all(13.0)),
            keyboardType: TextInputType.emailAddress,
            //validator: validation.validateEmail,
            validator: emailValidation,
          ),
          Container(padding: new EdgeInsets.all(13.0)),
          TextFormField(
            controller: passwordController,
            decoration: InputDecoration(hintText: 'Enter password',
              labelText: 'Password',
              contentPadding: EdgeInsets.all(13.0),
              suffixIcon: IconButton(
                  icon: Icon(Icons.remove_red_eye, color: qePrimaryText),
                  onPressed: () {
                    showPassword = !showPassword;
                  }
              ),
            ),
            autocorrect: false,
            keyboardType: TextInputType.text,
            obscureText: !showPassword,
            validator: passwordValidation
          ),
          Container(padding: new EdgeInsets.all(8.0)),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              GestureDetector(onTap: () {
                Navigator.push(context,
                    new MaterialPageRoute(
                        builder: (context) => new RecoverPassword(title: 'Recover Password')));
              }, child: new Text('Forgot Password?',style: TextStyle(
                  decoration: TextDecoration.underline,
                  fontWeight: FontWeight.bold
              ))),
            ],
          ),
          Container(padding: new EdgeInsets.all(8.0)),
          RaisedButton(
            onPressed: isLoggingIn
                ? null
                : () =>
            _formKey.currentState.validate()
                ? submit(_formKey, {
              'username': emailController.text.trim(),
              'password': passwordController.text.trim()
            })
                : debugPrint('validation error'),
            disabledColor: Colors.grey,
            textColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),),
            color: Theme
                .of(context)
                .primaryColor,
            child: isLoggingIn ? CircularProgressIndicator() : Text(
              "Submit", style: TextStyle(fontSize: 18.0),),
          ),
          Container(padding: new EdgeInsets.all(10.0)),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text("New to QuickEats? "),
              GestureDetector(onTap: () {
                Navigator.push(context,
                    new MaterialPageRoute(
                        builder: (context) => new RegisterAccount(title: 'Registration')));
              }, child: new Text('Register',style: TextStyle(
                decoration: TextDecoration.underline,
                  fontWeight: FontWeight.bold
              ),)),
            ],
          ),
        ],

      ),
    );
    return Scaffold(
      body: Container(
          padding: const EdgeInsets.all(20.0),
          child: form
      ),
    );
  }
}