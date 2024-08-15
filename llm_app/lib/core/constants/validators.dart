import 'package:flutter/services.dart';

typedef ValidatorFunc = String? Function(String?);

class Validators {
  static int maxEmailLength = 50;
  static int maxPasswordLength = 16;
  static int maxTitleLength = 50;
  static int maxNameLength = 50;
  static int maxUsernameLength = 50;
  static int maxDescriptionLength = 255;
  static int maxPhoneLength = 10;
  static int maxIdNumberLength = 10;
  static int maxUrlLength = 2048;
  static int maxSsnLength = 11;
  static int maxSmsCodeLength = 4;

  static List<TextInputFormatter> emailInputFormatters = [
    LengthLimitingTextInputFormatter(Validators.maxEmailLength)
  ];
  static List<TextInputFormatter> passwordInputFormatters = [
    LengthLimitingTextInputFormatter(Validators.maxPasswordLength)
  ];
  static List<TextInputFormatter> titleInputFormatters = [
    LengthLimitingTextInputFormatter(Validators.maxTitleLength)
  ];
  static List<TextInputFormatter> identityNumberFormatters = [
    FilteringTextInputFormatter.digitsOnly,
    LengthLimitingTextInputFormatter(Validators.maxIdNumberLength)
  ];
  static List<TextInputFormatter> nameInputFormatters = [
    LengthLimitingTextInputFormatter(Validators.maxNameLength)
  ];
  static List<TextInputFormatter> usernameInputFormatters = [
    LengthLimitingTextInputFormatter(Validators.maxUsernameLength)
  ];
  static List<TextInputFormatter> descriptionInputFormatters = [
    LengthLimitingTextInputFormatter(Validators.maxDescriptionLength)
  ];
  static List<TextInputFormatter> phoneInputFormatters = [
    FilteringTextInputFormatter.digitsOnly,
    LengthLimitingTextInputFormatter(Validators.maxPhoneLength)
  ];
  static List<TextInputFormatter> urlInputFormatters = [
    LengthLimitingTextInputFormatter(Validators.maxUrlLength)
  ];
  static List<TextInputFormatter> ssnInputFormatters = [
    FilteringTextInputFormatter.digitsOnly,
    LengthLimitingTextInputFormatter(Validators.maxSsnLength)
  ];

  static List<TextInputFormatter> smsCodeInputFormatters = [
    FilteringTextInputFormatter.digitsOnly,
    LengthLimitingTextInputFormatter(Validators.maxSmsCodeLength),
  ];
}
