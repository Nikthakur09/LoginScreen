class ValidatorMixin {
// ignore: non_constant_identifier_names
  String? ValidateEmail(String value) {
    if (value.contains('@')) {
      return 'Please Enter a Valid Email';
    }
    return null;
  }

  String? ValidatePassword(String value) {
    if (value.length < 8) {
      return 'Password should be more than 8 characters';
    }
    return null;
  }
}
