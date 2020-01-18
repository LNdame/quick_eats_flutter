import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quick_eats/src/post_api_service.dart';
import 'package:quick_eats/src/validation.dart';
import 'package:quick_eats/src/views/sign_in_view.dart';

import 'models/responses/single_response.dart';


class RecoverPassword extends StatefulWidget {
  RecoverPassword({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<RecoverPassword> {
  final emailTextController = TextEditingController();
  final otpTextController = TextEditingController();
  final passwordTextController = TextEditingController();
  Validation validation = new Validation();
  bool enableEmail, enableOtp, enablePasswords, loadingEmail,
      loadingOtp, emailExists, incorrectOtp, isResettingPassword;
  ForgotPasswordModel model;
  final _formKey = GlobalKey<FormState>();

  void dispose() {
    emailTextController.dispose();
    otpTextController.dispose();
    passwordTextController.dispose();
    super.dispose();
  }

  void initState() {
    super.initState();
    enableEmail = true;
    enableOtp = true;
    enablePasswords = true;
    loadingEmail = false;
    emailExists = true;
    loadingOtp = false;
    isResettingPassword = false;
    incorrectOtp = false;
  }

  @override
  Widget build(BuildContext context) {
    Form form = new Form(
      key: _formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          TextFormField(
            controller: emailTextController,
            enabled: enableEmail,
            decoration: InputDecoration(
                labelText: 'Email', contentPadding: EdgeInsets.all(13.0),
                suffixIcon: loadingEmail == false ? Visibility(
                    child: Icon(Icons.done, color: Colors.green),
                    visible: !enableEmail)
                    : new Container(padding: EdgeInsets.all(10.0),
                  child: CircularProgressIndicator(),),
                disabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.green)
                )
            ),

            keyboardType: TextInputType.emailAddress,
            validator: emailValidation,
          ),
          Container(padding: new EdgeInsets.all(5.0)),
          Visibility(
            child: TextFormField(
              controller: otpTextController,
              enabled: enableOtp,
              decoration: InputDecoration(
                  labelText: 'OTP Code', contentPadding: EdgeInsets.all(15.0),
                  suffixIcon: loadingOtp == false ? Visibility(
                      child: Icon(Icons.done, color: Colors.green),
                      visible: !enableOtp)
                      : new Container(padding: EdgeInsets.all(10.0),
                    child: CircularProgressIndicator(),),
                  disabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.green)
                  )),
              keyboardType: TextInputType.number,
              validator: (value)=> validation.otpValidation(value, incorrectOtp),
            ),
            visible: !enableEmail,
          ),
          Container(padding: new EdgeInsets.all(5.0)),
          Visibility(child: TextFormField(
            controller: passwordTextController,

            decoration: InputDecoration(
                labelText: 'Password',
                contentPadding: EdgeInsets.all(15.0),
                disabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.green)
                )),
            keyboardType: TextInputType.text,
            validator: validation.checkPasswordValidity,
          ), visible: !enableOtp,
          ),
          Container(padding: new EdgeInsets.all(5.0)),
          Visibility(child:
          TextFormField(
            decoration: InputDecoration(
              labelText: 'Confirm Password',
              contentPadding: EdgeInsets.all(15.0),),
            keyboardType: TextInputType.text,
            validator: (value) =>
            value != passwordTextController.text.trim()
                ? "Passwords do not match"
                : null,
          ), visible: !enableOtp,
          ),
          RaisedButton(
            onPressed: loadingEmail || isResettingPassword
                ? null
                : () => _formKey.currentState.validate()
                ? submit(_formKey)
                : debugPrint('validation error'),
            disabledColor: Colors.grey,
            textColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),),
            color: Theme
                .of(context)
                .primaryColor,
            child: isResettingPassword ? CircularProgressIndicator() : Text(
              "Submit", style: TextStyle(fontSize: 18.0),),
          )
        ],
      ),
    );
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),

      body: Container(
          padding: const EdgeInsets.all(20.0),
          child: form
      ),
    );
  }



  void submit(GlobalKey<FormState> key) {
    enableEmail
        ? initiateForgotPassword(emailTextController.text, key)
        : enableOtp
        ? getOTP(otpTextController.text, key)
        : resetPassword(passwordTextController.text);
  }

  String emailValidation(String value) {
    if (!emailExists) {
      emailExists = true;
      return "Email address does not exist";
    } else {
      return validation.validateEmail(value);
    }
  }

  void initiateForgotPassword(String email, GlobalKey<FormState> key) async {
    //setBoolValues(loadingEmail,true);
    setState(() {
      loadingEmail = true;
    });
    await Future.delayed(Duration.zero);
    final response = Provider.of<UserAccountService>(context)
        .initiateForgotPassword(email);
    response.then((onValue) {
      SingleResponse response1 = new SingleResponse().fromJson(
          jsonDecode(onValue.bodyString));
      if (!response1.isDidError()) {
        //enableEmail = false;
        setState(() {
          enableEmail = false;
        });
        emailTextController.text = email;
        model = new ForgotPasswordModel(
            response1.model['userID'], response1.model['appLogID'], null);
      }
      else {
        debugPrint(response1.message);
      }
    }, onError: (error) {
      if (error.statusCode == 404) {
        //email address does not exist
        debugPrint(error.bodyString);
        emailExists = false;
        FormState form = key.currentState;
        if (form != null)
          form.validate();
        else
          debugPrint('form is null');
      } else {
        debugPrint(error.statusCode.toString());
        debugPrint(error.bodyString);
      }
    }).whenComplete(() =>
        setState(() {
          loadingEmail = false;
        }));
  }

  void getOTP(String code, GlobalKey<FormState> key) async {
    setState(() {
      loadingOtp = true;
    });
    await Future.delayed(Duration.zero);

    final response = Provider.of<UserAccountService>(context).confirmCode({
      'userID': model.userID,
      'appLogID': model.appLogID,
      'code': code
    });
    response.then((onValue) {
      SingleResponse response = new SingleResponse().fromJson(
          jsonDecode(onValue.bodyString));
      if (!response.isDidError()) {
        setState(() {
          enableOtp = false;
        });
        otpTextController.text = code;
        model = new ForgotPasswordModel(
            response.model['userID'], response.model['appLogID'],
            response.model['resetPasswordToken']);
      }
      else {
        debugPrint(response.message);
      }
    }, onError: (error) {
      //debugPrint(error.toString());
      if (error.statusCode == 400) {
        //otp expired after 5 minutes, resend otp
        //or incorrect OTP code
        SingleResponse errorResponse = new SingleResponse().fromJson(
            jsonDecode(error.bodyString));
        if (errorResponse.isDidError() != null)
          incorrectOtp = errorResponse.isDidError();

        FormState form = key.currentState;
        if (form != null)
          form.validate();
        else
          debugPrint('form is null');
      }

      debugPrint(error.bodyString);
      //print(error.toString());
    }).whenComplete(() =>
        setState(() {
          loadingOtp = false;
        }));
  }

  void resetPassword(String password) async {
    await Future.delayed(Duration.zero);
    setState(() {
      isResettingPassword = true;
    });
    final response = Provider.of<UserAccountService>(context).changePassword({
      'userID': model.userID,
      'appLogID': model.appLogID,
      'resetPasswordToken': model.resetPasswordToken,
      'password': password
    });
    response.then((onValue) {
      SingleResponse response = new SingleResponse().fromJson(
          jsonDecode(onValue.bodyString));
      if (!response.isDidError()) {
        //enableEmail = false;
        setState(() {
          isResettingPassword = false;
        });
        Navigator.push(context,
            new MaterialPageRoute(builder: (context) => new SignInPage()));
        //model= new ForgotPasswordModel(response.model['userID'], response.model['appLogID'], response.model['resetPasswordToken']);
      }
      else {
        debugPrint(response.message);
      }
    }, onError: (error) {
      //debugPrint(error.toString());
      debugPrint(error.bodyString);
      //print(error.toString());
    });
  }
}


class ForgotPasswordModel{
  int userID;
  int appLogID;
  String resetPasswordToken;

  ForgotPasswordModel(int userID, int appLogID, String token){
    this.userID = userID;this.appLogID=appLogID;resetPasswordToken = token;
  }

}

