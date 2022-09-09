import 'package:intl/intl.dart';

class Utils {
  static bool initState = false;
  static String getAdjustedTime(String utc, String dateTime) {
    //get properties from data
    // String datetime = data['datetime'];
    // String offset = data['utc_offset'].substring(1, 3);
    // debugPrint(datetime);
    // debugPrint(offset);
    DateTime now = DateTime.parse(dateTime);
    now = now.add(Duration(hours: int.parse(utc.substring(1, 3))));
    //Set the time property
    return DateFormat.jm().format(now);
  }

  static bool getUtcOffset(String utc, String dateTime) {
    //isDayTime logic is here
    //create a datetime object
    DateTime now = DateTime.parse(dateTime);
    now = now.add(Duration(hours: int.parse(utc.substring(1, 3))));
    return now.hour > 6 && now.hour < 20 ? true : false;
  }
}
