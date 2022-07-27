class VaccinesFunctions {

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
    }

    return dayToReapply;
  }

  calculateDay( int day, String typeTime, int time, int month, int year, int dayInMonth, int dayInNextMonth ) {
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
      if ( month == 1 ) {
        year += 1;
      }
    } else {
      year += 1;
    }

    if ( month < 10 ) {
      return "$day/0$month/$year";
    }
    return "$day/$month/$year";
  }

}