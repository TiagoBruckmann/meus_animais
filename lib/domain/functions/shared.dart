class SharedFunctions {

  convertMonth( int month ) {
    String monthTxt = "";
    switch ( month ) {
      case 1:
        monthTxt = "January";
        break;
      case 2:
        monthTxt = "February";
        break;
      case 3:
        monthTxt = "March";
        break;
      case 4:
        monthTxt = "April";
        break;
      case 5:
        monthTxt = "May";
        break;
      case 6:
        monthTxt = "June";
        break;
      case 7:
        monthTxt = "July";
        break;
      case 8:
        monthTxt = "August";
        break;
      case 9:
        monthTxt = "September";
        break;
      case 10:
        monthTxt = "October";
        break;
      case 11:
        monthTxt = "November";
        break;
      case 12:
        monthTxt = "December";
        break;
    }
    return monthTxt;
  }

  formatDay( int value ) {
    String? newValue;
    if ( value < 10 ) {
      newValue = "0$value";
    }
    newValue = value.toString();
    return newValue;
  }

  formatHour( int value ) {

    String newValue = "";
    if ( value == 24 ) {
      newValue = "00 am";
    } else if ( value < 12 ) {
      newValue = "$value am";
    }
    newValue = "$value pm";

    return newValue;
  }
}