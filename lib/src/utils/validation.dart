class ValidationMixin
{
  static const String isEmpty = 'empty_field_message';
  static const String isEmoji = 'empty_field_message';
  static const String invalidPassword = 'password_incorrect_message';
  static const String invalidEmail = 'invalid_email_message';
  static const String invalidMobile = 'invalid_mobile_message';
  static const String passwordNotMatching = 'passwords_not_match';

  /// Validates email
  String validateEmail(String value)
  {
    String result = validateNonEmoji(value);
    if (result != '') return result;

    String pattern = r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";
    RegExp regExp = RegExp(pattern);

    if (!regExp.hasMatch(value)) {
      return invalidEmail;
    } else {
      return '';
    }
  }

  /// Validates if the field is empty or not
  String validateField(String? value) {
    if (value == null) {
      return isEmpty;
    } else {
      return '';
    }
  }

  /// Validates if the domain is correct or not
  String validateDomain(String value) {
    if (value.isEmpty) {
      return isEmpty;
    }

    final regExp = RegExp(r'(?=^.{4,253}$)(^((?!-)[a-zA-Z0-9-]{1,63}(?<!-)\.)+[a-zA-Z]{2,63}$)');
    if (!regExp.hasMatch(value)) {
      return 'Please enter a valid domain';
    } else {
      return '';
    }
  }

  /// Validates mobile number
  String validateMobile(String value) {
    String result = validateNonEmoji(value);
    if (result != '') return result;

    String pattern = r'(^(?:(?:\+|0{0,2})91(\s*[\-]\s*)?|[0]?)?[6789]\d{9}$)';
    RegExp regExp = RegExp(pattern);
    if (!regExp.hasMatch(value)) {
      return invalidMobile;
    } else {
      return '';
    }
  }

  ///method to validate passwords
  String validatePassword(String value) {
    if (value == '' || value.trim().isEmpty) {
      return isEmpty;
    }

    String result = validateNonEmoji(value);
    if (result != '') return result;

    if (value.length < 8 || value.length > 32 || value.contains(' ')) {
      return invalidPassword;
    } else {
      return '';
    }
  }

  ///method to validate passwords
  String validateConfirmPassword(String? value, String? value1) {
    if (value == null || value.trim().isEmpty) {
      return isEmpty;
    }

    String result = validateNonEmoji(value);
    if (result != '') return result;

    if (value != value1) {
      return passwordNotMatching;
    } else {
      return '';
    }
  }

  /// Validates if non-emoji is entered or not
  ///
  /// Returns '' for non-emoji value
  String validateNonEmoji(String value) {
    if (value == '' || value.trim().isEmpty) {
      return isEmpty;
    }

    String pattern =
        r'^(?:(?!(?:[\u2700-\u27bf]|(?:\ud83c[\udde6-\uddff]){2}|[\ud800-\udbff][\udc00-\udfff]|[\u0023-\u0039]\ufe0f?\u20e3|\u3299|\u3297|\u303d|\u3030|\u24c2|\ud83c[\udd70-\udd71]|\ud83c[\udd7e-\udd7f]|\ud83c\udd8e|\ud83c[\udd91-\udd9a]|\ud83c[\udde6-\uddff]|\ud83c[\ude01-\ude02]|\ud83c\ude1a|\ud83c\ude2f|\ud83c[\ude32-\ude3a]|\ud83c[\ude50-\ude51]|\u203c|\u2049|[\u25aa-\u25ab]|\u25b6|\u25c0|[\u25fb-\u25fe]|\u00a9|\u00ae|\u2122|\u2139|\ud83c\udc04|[\u2600-\u26FF]|\u2b05|\u2b06|\u2b07|\u2b1b|\u2b1c|\u2b50|\u2b55|\u231a|\u231b|\u2328|\u23cf|[\u23e9-\u23f3]|[\u23f8-\u23fa]|\ud83c\udccf|\u2934|\u2935|[\u2190-\u21ff]))[^`☺]){1,255}$';
    RegExp regExp = RegExp(pattern);
    if (!regExp.hasMatch(value)) {
      return isEmoji;
    } else {
      return '';
    }
  }
}
