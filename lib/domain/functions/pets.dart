class PetsFunctions {

  calculateBirth( String birth ) {
    final now = DateTime.now();
    final birthYear = int.parse(birth.split("/")[2]);
    final birthMonth = int.parse(birth.split("/")[1]);
    final birthDay = int.parse(birth.split("/")[0]);
    final year = now.year - birthYear;

    int month = 0;
    if ( birthMonth > now.month ) {
      int calcMonth = birthMonth - now.month;
      month = 12 - calcMonth;
    } else {
      int calcMonth = now.month - birthMonth;
      month = 12 - calcMonth;
    }

    int day = 0;
    if ( birthDay > now.day ) {
      day = birthDay - now.day;
    } else {
      day = now.day - birthDay;
    }

    return "$year ano(s) $month mes(es) e $day dia(s)";
  }

}