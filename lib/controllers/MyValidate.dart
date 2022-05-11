class MyValidate {
  String value = '';

  MyValidate(String? value) {
    value ??= '';
    this.value = value.trim();
  }

  String? validateEmpty() {
    if (value.isEmpty) {
      return "This field is required.";
    }
    return null;
  }

  String? validateDigits() {
    if (num.tryParse(value) == null) {
      return "This field must be digit.";
    }
    return null;
  }
}
