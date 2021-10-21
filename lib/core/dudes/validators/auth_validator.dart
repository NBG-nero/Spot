class AuthValidator {
  validateName(String name) {
    if (name.split('').length <= 4) {
      return 'Name must be at least 4 characters';
    }
    return null;
  }

  validateEmail(String email) {
    if (!RegExp(
            r"^([a-zA-Z0-9_\-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([a-zA-Z0-9\-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$")
        .hasMatch(email)) {
      return 'Enter a valid Email Address';
    }
    return null;
  }

  validatePassword(String password) {
    if (password.split('').length <= 5) {
      return 'Password not Strong enough';
    }
    return null;
  }

  // void confirmPassword(String value) {
  //   if (cpassword.value == password.value) {
  //     _cpassword = AuthValidator(value: '', error: null);
  //   } else {
  //     _cpassword = AuthValidator(value: null, error: 'Passwords don\'t match');
  //   }
  //   notifyListeners();
  // }

  // final String value;
  // final String error;
  // AuthValidator({this.value, this.error});

}
