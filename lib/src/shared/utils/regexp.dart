class RegExpApp {
  static bool validateEmail(String email) {
    return RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(email.trim());
  }

  static bool validateSpecialCaracter(String password) {
    return RegExp(r'[\^$*.\[\]{}()?\-"!@#%&/\,><:;_~`+='
            "'"
            ']')
        .hasMatch(password);
  }

  static bool validateContainsDigits(String password) {
    return RegExp(r'\d').hasMatch(password);
  }

  static bool validateContainsUpercase(String password) {
    return RegExp(r'[A-Z]').hasMatch(password);
  }
}