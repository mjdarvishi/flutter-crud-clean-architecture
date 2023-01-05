import 'package:formz/formz.dart';

enum MobileValidationError { invalid,min,empty,persian}

class Mobile extends FormzInput<String, MobileValidationError> {
  const Mobile.pure() : super.pure('');

  const Mobile.dirty({String value = ''}) : super.dirty(value);
  static final _tellRegex = RegExp(
      r'(^(0|\+98)?([ ]|-|[()]){0,2}9[0|1|2|3|4|9]([ ]|-|[()]){0,2}(?:[0-9]([ ]|-|[()]){0,2}){8}$)'
  );

  @override
  MobileValidationError? validator(String? value) {
    String input=value??'';
    if(input.isEmpty){
      return MobileValidationError.empty;
    }
    if(RegExp(r'^[۰۱۲۳۴۵۶۷۸۹]+$').hasMatch(input)) {
      return MobileValidationError.persian;
    }
    if(input.length<11){
      return MobileValidationError.min;
    }
    return _tellRegex.hasMatch(input)
        ? null
        : MobileValidationError.invalid;
  }
}

extension Explanation on MobileValidationError {
  String get name {
    switch(this){
      case MobileValidationError.persian:
        return 'Just use english number';
      case MobileValidationError.invalid:
        return 'invalid format';
      case MobileValidationError.min:
        return 'mix length must be 11';
      case MobileValidationError.empty:
        return 'input number should not be empty';
    }
  }
}
