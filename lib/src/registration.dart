import 'dart:async';
import 'dart:convert';

import 'package:animator/animator.dart';
import 'package:chopper/chopper.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quick_eats/res/colors.dart';
import 'package:quick_eats/src/post_api_service.dart';
import 'package:quick_eats/src/models/responses/single_response.dart';
import 'package:quick_eats/src/recover_password.dart';
import 'package:quick_eats/src/validation.dart';
import 'package:quick_eats/src/views/sign_in_view.dart';

import 'models/country.dart';
import 'models/create_account_user.dart';
import 'models/dialling_code.dart';
import 'package:quick_eats/src/models/responses/list_response.dart';


class RegisterAccount extends StatefulWidget {
  RegisterAccount({Key key, this.title}) : super(key: key);

  final String title;

  @override
  FirstPage createState() => FirstPage();

}
class RegisterAccount2 extends StatefulWidget {
  RegisterAccount2({Key key, this.title, this.model}) : super(key: key);

  final String title;
  final ForgotPasswordModel model;

  @override
  SecondPage createState() => SecondPage();

}

class SecondPage extends State<RegisterAccount2>{

  final otpController = TextEditingController();
  bool isLoading,incorrectOtp;

  Validation validation = new Validation();

  final _formKey = GlobalKey<FormState>();

  void requestNewOTP(int appLogId, int userId){
    setState(() {
      isLoading = true;
    });
    final response = Provider.of<UserAccountService>(context).requestNewOTP(appLogId,userId);
    response.then((onValue) {
      SingleResponse response1 = new SingleResponse().fromJson(
          jsonDecode(onValue.bodyString));

      if (!response1.isDidError()) {
        setState(() {
          isLoading = false;
        });
      }
      else {

        debugPrint(response1.message);
      }

    });
  }


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    incorrectOtp = false;
    isLoading =false;
  }

  dispose(){
    super.dispose();
    otpController.dispose();
  }
  void sendRegisterOtp(ForgotPasswordModel model,String code) async{
    await Future.delayed(Duration.zero);
    setState(() {
      isLoading = true;
    });
    Map<String,dynamic> toSend ={'userID': model.userID,
      'appLogID':model.appLogID,
      'OneTimePin': code};
    final response = Provider.of<UserAccountService>(context).createUserAccountConfirmCode(toSend);

    response.then((onValue) {
      SingleResponse response1 = new SingleResponse().fromJson(
          jsonDecode(onValue.bodyString));

      if (!response1.isDidError()) {
        Navigator.push(context, new MaterialPageRoute(builder: (context) =>
        new SignInPage()));
      }
      else {
        debugPrint(response1.message);
      }

    }, onError: (error) {
      //debugPrint(error.toString());
      if(error.statusCode==400){
        //otp expired after 5 minutes
        //another call to resend otp after expiration
        SingleResponse errorResponse = new SingleResponse().fromJson(
            jsonDecode(error.bodyString));
        debugPrint(error.bodyString);
        if (errorResponse.isDidError() != null)
          incorrectOtp = errorResponse.isDidError();

        FormState form = _formKey.currentState;
        if (form != null)
          form.validate();
        else
          debugPrint('form is null');
      }

    }).whenComplete((){setState(() {
      isLoading = false;
    });});
  }

  @override
  Widget build(BuildContext context) {
    Form form = new Form(
      key: _formKey,
      child: Column(
        //mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          TextFormField(
            controller: otpController,
            decoration: InputDecoration(
                labelText: 'OTP Code',
                contentPadding: EdgeInsets.all(11.0)),
            keyboardType: TextInputType.number,
            validator: (value)=> validation.otpValidation(value, incorrectOtp),
          ),
          Container(padding: new EdgeInsets.all(8.0)),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text("Did not receive the OTP Code? "),
              GestureDetector(onTap: () {
                requestNewOTP(widget.model.appLogID, widget.model.userID);
              }, child: new Text('Send Again',style: TextStyle(
                  decoration: TextDecoration.underline,
                  fontWeight: FontWeight.bold
              ),)),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: RaisedButton(
              onPressed: isLoading
                  ? null
                  : () => sendRegisterOtp(widget.model,otpController.text),
              disabledColor: Colors.grey,
              textColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),),
              color: Theme
                  .of(context)
                  .primaryColor,
              child: isLoading ? CircularProgressIndicator() : Text(
                "Submit", style: TextStyle(fontSize: 18.0),),
            ),

          ),
        ],
      ),
    );
    return new Scaffold(
    body: Container(
        padding: const EdgeInsets.all(20.0),
        child: form
    ));
  }

}


class FirstPage extends State<RegisterAccount> {
  Validation validation = new Validation();
  final nameController = TextEditingController();
  final surnameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneNumberController = TextEditingController();
  final passwordController = TextEditingController();

  List<Country> _countries;
  Country currentCountry;
  DiallingCode currentCode;
  bool usernameExists,showPassword, duplicateEmail,isRegistering;

  List<DropdownMenuItem<Country>> countryItems;
  List<DropdownMenuItem<DiallingCode>> codeItems;
  CreateAccountUser user;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //_fetchCountries();
    showPassword = false;
    duplicateEmail=false;
    isRegistering = false;
  }

  void requestNewOTP(int appLogId, int userId){
    final response = Provider.of<UserAccountService>(context).requestNewOTP(appLogId,userId);
    response.then((onValue) {
      SingleResponse response1 = new SingleResponse().fromJson(
          jsonDecode(onValue.bodyString));

      if (response1.error==null) {
        /*ForgotPasswordModel model = new ForgotPasswordModel(
            response1.model['userID'], response1.model['appLogID'], null);*/

        //go to second page
        /*Navigator.push(context,
            new MaterialPageRoute(builder: (context) => new RegisterAccount2(model:model)));*/
        Navigator.push(context, new MaterialPageRoute(builder: (context) =>
        new SignInPage()));
      }
      else {
        debugPrint(response1.message);
      }

    });
  }

  _fetchCountries() async {
    await Future.delayed(Duration.zero);
    final response = Provider.of<UserAccountService>(context).getCountries();
    response.then((onValue) {
      ListResponse response = new ListResponse().fromJson(
          jsonDecode(onValue.bodyString));
      if (!response.isDidError()) {
        _countries = response.model;
        populateCountries(_countries);
      }
      else {
        debugPrint(response.message);
      }
    }, onError: (error) {
      debugPrint(error.toString());
      //print(error.toString());
    });
  }

  populateCountries(List<Country> list) {
    List<DropdownMenuItem<Country>> items = new List();
    for (Country country in _countries) {
      items.add(new DropdownMenuItem(
          value: country,
          child: new Text(country.name)));
    }
    countryItems = items;
    currentCountry = countryItems[0].value;
    populateCodes(currentCountry.dialingCodes);
  }

  populateCodes(List<DiallingCode> list) {
    List<DropdownMenuItem<DiallingCode>> items = new List();
    for (DiallingCode code in list) {
      items.add(new DropdownMenuItem(
          value: code,
          child: new Text(code.code)));
    }
    currentCode = items[0].value;
    setState(() {
      codeItems = items;
    });
  }

void dispose(){
  passwordController.dispose();
  nameController.dispose();
  surnameController.dispose();
  emailController.dispose();
  phoneNumberController.dispose();
  super.dispose();
}


  String emailValidation(String value){
    if(duplicateEmail){
      duplicateEmail=false;
      return "Email address already exists";
    }else{
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
          TextFormField(
            controller: nameController,
            decoration: InputDecoration(
                labelText: 'Name',
                contentPadding: EdgeInsets.all(13.0)
            ),
            textCapitalization: TextCapitalization.words,
            keyboardType: TextInputType.text,
            validator: (value) {
              if (value.length < 2) {
                return "Please enter name more than 2 chars";
              } else
                return null;
            },
          ),
          Container(padding: new EdgeInsets.all(5.0)),
          TextFormField(
            controller: surnameController,
            decoration: InputDecoration(
                labelText: 'Surname', contentPadding: EdgeInsets.all(13.0)),
            textCapitalization: TextCapitalization.words,
            validator: (value) {
              if (value.length < 2) {
                return "Please enter name more than 2 chars";
              } else
                return null;
            },

          ),
          Container(padding: new EdgeInsets.all(5.0)),
          TextFormField(
            controller: emailController,
            decoration: InputDecoration(
                labelText: 'Email Address',
                contentPadding: EdgeInsets.all(13.0)),
            keyboardType: TextInputType.emailAddress,
            validator: emailValidation,
          ),
          Container(padding: new EdgeInsets.all(5.0)),
          /*Container(padding: new EdgeInsets.all(13.0)),
          Text("Select country"),
          //Container(padding: new EdgeInsets.all(5.0)),
          DropdownButton(value: currentCountry,
            items: countryItems,
            onChanged: (Country selectedCountry) {
              setState(() {
                currentCountry = selectedCountry;
                populateCodes(currentCountry.dialingCodes);
              });
            },
            isExpanded: true,
          ),*/
          TextFormField(
            controller: phoneNumberController,
            decoration: InputDecoration(
                labelText:"Phone Number",
                contentPadding: EdgeInsets.all(11.0)),
            keyboardType: TextInputType.number,
            validator: validation.validatePhoneNumber,
          )
          /*Container(padding: new EdgeInsets.all(5.0)),
          Text("Phone Number"),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              DropdownButton(value: currentCode,
                items: codeItems,
                iconSize: 32,
                onChanged: (DiallingCode selectedCode) {
                  setState(() {
                    currentCode = selectedCode;
                  });
                },
              ),
              Flexible(
                  child:
                  TextFormField(
                      controller: phoneNumberController,
                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.all(11.0)),
                      keyboardType: TextInputType.number,
                      validator: validation.validatePhoneNumber,
                  )),
            ],
          ),*/
          , Container(padding: new EdgeInsets.all(5.0))
          , TextFormField(
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
            validator: validation.checkPasswordValidity,
          ),
          Container(padding: new EdgeInsets.all(5.0)),
          TextFormField(
            decoration: InputDecoration(hintText: 'Enter password again',
                labelText: 'Confirm Password',
                contentPadding: EdgeInsets.all(13.0),
                suffixIcon: IconButton(
                    icon: Icon(Icons.remove_red_eye, color: qePrimaryText),
                    onPressed: () {
                      showPassword = !showPassword;
                    })
            ),
            keyboardType: TextInputType.text,
            obscureText: !showPassword,
            autocorrect: false,
            validator: (value) =>
            value != passwordController.text.trim()
                ? "Passwords do not match"
                : null,
          ),
          Container(padding: new EdgeInsets.all(5.0)),
          RaisedButton(
            onPressed: isRegistering
                ? null
                : () =>
            _formKey.currentState.validate()
                ? registerUser(_formKey)
                : debugPrint('validation error'),
            disabledColor: Colors.grey,
            textColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),),
            color: Theme
                .of(context)
                .primaryColor,
            child: isRegistering ? CircularProgressIndicator() : Text(
              "Register", style: TextStyle(fontSize: 18.0),),
          )
        ],

      ),
    );
    return Scaffold(
      body: Container(
          padding: const EdgeInsets.all(20.0),
          //child: codeItems!=null? form : Center(child: CircularProgressIndicator())
          /*child: codeItems != null ? form : Center(
            child: Animator(tween: Tween<double>(begin: 0.4, end: 1.2),
              curve: Curves.fastOutSlowIn,
              cycles: 0,
              builder: (anim) =>
                  Transform.scale(
                      scale: anim.value,
                      child: Image(
                        image: AssetImage('assets/images/temp_logo.png'),
                        height: 200.0,
                        width: 120.0,
                      )),
            ),)*/
          child: form,
      ),


    );
  }



  void registerUser(GlobalKey<FormState> key) async{
    await Future.delayed(Duration.zero);
    setState(() {
      isRegistering = true;
    });
    user = new CreateAccountUser(
        nameController.text.trim(),
        surnameController.text.trim(),
        emailController.text.trim(),
        passwordController.text.trim(),
        phoneNumberController.text.trim());
    final response = Provider.of<UserAccountService>(context).createAccount(user.toJson());

    response.then((onValue) {
      SingleResponse response1 = new SingleResponse().fromJson(
          jsonDecode(onValue.bodyString));

/*      if (!response1.isDidError()) {
        ForgotPasswordModel model = new ForgotPasswordModel(
            response1.model['userID'], response1.model['appLogID'], null);

        //go to second page
        Navigator.push(context,
            new MaterialPageRoute(builder: (context) => new RegisterAccount2(model:model)));
      }*/
      if (response1.error==null) {

        Navigator.push(context, new MaterialPageRoute(builder: (context) =>
        new SignInPage()));

      }
      else {
        debugPrint(response1.error);
      }
    }, onError: (error) {
      //debugPrint(error.toString());
      SingleResponse errorResponse = new SingleResponse().fromJson(
          jsonDecode(error.bodyString));
      debugPrint(errorResponse.message);
      if(error.statusCode==400){
        duplicateEmail = true;
        FormState form = key.currentState;
        if(form!=null)
          form.validate();
        else
          debugPrint('form is null');
      }
    });
  }
}

