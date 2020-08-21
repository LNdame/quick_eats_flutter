class Validation {

  bool isDigit(String s, int idx) => (s.codeUnitAt(idx) ^ 0x30) <= 9;

  String checkPasswordValidity(String pass) {
    if (pass.length < 8)
      return getCase(5);

    String ch;
    bool capFlag = false,
        numberFlag = false,
        lowerCase = false,
        alphaCase=false;
    for (int i = 0; i < pass.length; i++) {
      ch = pass[i];
      if (!numberFlag&&isDigit(pass, i))
        numberFlag = true;
      if (!capFlag&& ch.toUpperCase() == ch)
        capFlag = true;
      if (!lowerCase&&ch == ch.toLowerCase())
        lowerCase = true;
    }
    Pattern special = r'[!@#$%&*()_+=|<>?{}\\~-]';
    RegExp exp = new RegExp(special);
    alphaCase = pass.contains(exp);
    //alphaCase = exp.hasMatch(pass);

    if (!capFlag)
      return getCase(1);
    if (!numberFlag) return getCase(2);
    if (!lowerCase) return getCase(3);
    if (!alphaCase) return getCase(4);

    return null;
  }
  String validatePhoneNumber(String value){
    Pattern special = r'^([0]?[1-9][0-9]{8})$';
    RegExp exp = new RegExp(special);
    return !exp.hasMatch(value) ? "Incorrect phone number format": null ;
  }
  String validateEmail(String value) {
    if (value.isEmpty) {
      return 'Please enter email address';
    }

    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = new RegExp(pattern);
    if (!regex.hasMatch(value))
      return 'Enter Valid Email Address';
    else
      return null;
  }

  String getCase(int cas) {
    switch (cas) {
      case 1:
        return "Has to contain an upper case letter";

      case 2:
        return "Has to contain a number";

      case 3:
        return "Has to contains a lower case number";

      case 4:
        return "Has to contain a special character";

      case 5:
        return "Has to contain 8 chars";

      default:
        return null;
    }
  }

  String otpValidation(value, bool incorrectOtp) {
    if (incorrectOtp) {
      incorrectOtp = false;
      return "Incorrect OTP Code";
    }
    else {
      if (value.length < 6) {
        return "Insufficient length";
      } else
        return null;
    }
  }
}

