// imports nativos
import 'dart:math';
import 'dart:io';

// imports globais
import 'package:meus_animais/session.dart';

// import dos domains
import 'package:meus_animais/domain/source/local/mobx/connection.dart';

// import dos pacotes
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_i18n/flutter_i18n.dart';

class SharedServices {

  bool validateConnection( ConnectionMobx connectionMobx ) {
    if ( connectionMobx.connectionStatus == ConnectivityResult.wifi || connectionMobx.connectionStatus == ConnectivityResult.mobile ) {
      return true;
    }
    return false;
  }

  String getRandomString( int length ) {
    const String chars = 'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
    final Random rnd = Random();

    return String.fromCharCodes(
      Iterable.generate(
        length,
          (_) => chars.codeUnitAt(
          rnd.nextInt(chars.length),
        ),
      ),
    );
  }

  String convertMonth( int month ) {
    final months = {
      "1": "January",
      "2": "February",
      "3": "March",
      "4": "April",
      "5": "May",
      "6": "June",
      "7": "July",
      "8": "August",
      "9": "September",
      "10": "October",
      "11": "November",
      "12": "December"
    };

    return months[month.toString()] ?? "December";

  }

  String formatDate( int date ) {
    String newDate = date.toString();
    if ( date < 10 ) {
      newDate = "0$date";
    }

    return newDate;
  }

  String calculateBirth( String birth ) {
    final now = DateTime.now();
    final birthYear = int.parse(birth.split("/")[2]);
    final birthMonth = int.parse(birth.split("/")[1]);
    final birthDay = int.parse(birth.split("/")[0]);
    int year = now.year - birthYear;

    int calcMonth = now.month - birthMonth;
    int month = 12 - calcMonth;
    if ( birthMonth > now.month ) {
      int calcMonth = birthMonth - now.month;
      month = 12 - calcMonth;
    }

    if ( month == 12 ) {
      month = 0;
      year = year + 1;
    }

    int day = now.day - birthDay;
    if ( birthDay > now.day ) {
      day = birthDay - now.day;
    }

    Map<String, String> params = {
      "year": year.toString(),
      "month": month.toString(),
      "day": day.toString(),
    };

    return FlutterI18n.translate(Session.globalContext.currentContext!, "pages.pets.edit.calc_birth", translationParams: params);
  }

  calculateDate( String date, String time, String typeTime ) {
    String dayToReapply = "";
    int day = int.parse(date.split("/")[0]);
    int month = int.parse(date.split("/")[1]);
    int year = int.parse(date.split("/")[2]);
    int timeParse = int.parse(time);

    switch( month ) {
      case 1:
        dayToReapply = calculateDay(day, typeTime, timeParse, month, year, 31, 28);
        break;
      case 2:
        dayToReapply = calculateDay(day, typeTime, timeParse, month, year, 28, 31);
        break;
      case 3:
        dayToReapply = calculateDay(day, typeTime, timeParse, month, year, 31, 30);
        break;
      case 4:
        dayToReapply = calculateDay(day, typeTime, timeParse, month, year, 30, 31);
        break;
      case 5:
        dayToReapply = calculateDay(day, typeTime, timeParse, month, year, 31, 30);
        break;
      case 6:
        dayToReapply = calculateDay(day, typeTime, timeParse, month, year, 30, 31);
        break;
      case 7:
        dayToReapply = calculateDay(day, typeTime, timeParse, month, year, 31, 31);
        break;
      case 8:
        dayToReapply = calculateDay(day, typeTime, timeParse, month, year, 31, 30);
        break;
      case 9:
        dayToReapply = calculateDay(day, typeTime, timeParse, month, year, 30, 31);
        break;
      case 10:
        dayToReapply = calculateDay(day, typeTime, timeParse, month, year, 31, 30);
        break;
      case 11:
        dayToReapply = calculateDay(day, typeTime, timeParse, month, year, 30, 31);
        break;
      case 12:
        dayToReapply = calculateDay(day, typeTime, timeParse, month, year, 31, 31);
        break;
      default:
        dayToReapply = calculateDay(day, typeTime, timeParse, month, year, 31, 31);
        break;
    }

    return dayToReapply;
  }

  String calculateDay( int day, String typeTime, int time, int month, int year, int dayInMonth, int dayInNextMonth ) {
    if ( typeTime == "Dia(s)" ) {
      day += time;
      if ( day > dayInMonth ) {
        day = day - dayInMonth;
        if ( day == dayInMonth ) {
          day = day - dayInNextMonth;
          month += 2;
        }
        month += 1;
      }
    } else if ( typeTime == "Semana(s)" ) {
      day += time * 7;
      if ( day > dayInMonth ) {
        day = day - dayInMonth;
        if ( day == dayInMonth ) {
          day = day - dayInNextMonth;
          month += 2;
        }
        month += 1;
      }
    } else if ( typeTime == "Mês/Meses" ) {
      month += time;
      if ( month > 12 ) {
        month = month - 12;
        year += 1;
      }
    } else {
      year += time;
    }

    final formattedDay = formatDate(day);
    final formattedMonth = formatDate(month);

    return "$formattedDay/$formattedMonth/$year";
  }

  Future<void> rateApp() async {

    Session.appEvents.sharedEvent("rate_app");

    Uri url = Uri.https("play.google.com", "/store/apps/details", {"id": "br.com.meus_animais"});
    if ( Platform.isIOS ) {
      url = Uri.https("www.apple.com", "/br/app-store/");
    }

    if ( await canLaunchUrl(url) ) {
      await launchUrl(
        url,
        mode: LaunchMode.inAppWebView,
      );
    } else {
      Session.crash.onError("Could not launch appStoreLink");
      throw 'Could not launch appStoreLink';
    }

  }

}