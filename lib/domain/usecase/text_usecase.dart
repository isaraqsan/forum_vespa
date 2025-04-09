class TextUseCase {
  static String greeting(DateTime dateTime) {
    // if (dateTime.hour < 12) { //
    //   return 'Good Morning';
    // } else if (dateTime.hour < 18) {
    //   return 'Good Afternoon';
    // } else {
    //   return 'Good Evening';
    // }
    if (dateTime.hour > 3 && dateTime.hour < 11){
      return 'Good Morning';
    } else if (dateTime.hour > 11 && dateTime.hour < 15){
      return 'Good Evening';
    } else if (dateTime.hour > 15 && dateTime.hour < 19){
      return 'Good Afternoon';
    } else {
      return 'Good Night';
    }
  }
}
