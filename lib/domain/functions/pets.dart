// import dos pacotes
import 'package:flutter_i18n/flutter_i18n.dart';

class PetsFunctions {

  calculateBirth( String birth, context ) {
    final now = DateTime.now();
    final birthYear = int.parse(birth.split("/")[2]);
    final birthMonth = int.parse(birth.split("/")[1]);
    final birthDay = int.parse(birth.split("/")[0]);
    int year = now.year - birthYear;

    int month = 0;
    if ( birthMonth > now.month ) {
      int calcMonth = birthMonth - now.month;
      month = 12 - calcMonth;
    } else {
      int calcMonth = now.month - birthMonth;
      month = 12 - calcMonth;
    }

    if ( month == 12 ) {
      month = 0;
      year = year + 1;
    }

    int day = 0;
    if ( birthDay > now.day ) {
      day = birthDay - now.day;
    } else {
      day = now.day - birthDay;
    }

    Map<String, String> params = {
      "year": year.toString(),
      "month": month.toString(),
      "day": day.toString(),
    };

    return FlutterI18n.translate(context, "pages.pets.edit.calc_birth", translationParams: params);
  }

}