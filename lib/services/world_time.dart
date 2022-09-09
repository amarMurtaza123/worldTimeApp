import 'package:flutter/cupertino.dart';
import 'package:http/http.dart';
import 'package:world_time/models/world_model.dart';
import 'package:world_time/services/utils.dart';

class WorldTime with ChangeNotifier {
  String location = ''; //location name of the UI
  String time = ''; //time of that location
  String flag = ''; //url to an asset flag icon
  String url = ''; //location url for api endpoint
  bool isDayTime = true;

  WorldModel? worldModel;
  List<String> urlList = [
    'Europe/London',
    'Europe/Berlin',
    'Africa/Cairo',
    'Africa/Nairobi',
    'America/Chicago',
    'America/New_York',
    'Asia/Seoul',
    'Asia/Jakarta',
  ];
  List<String> locationList = [
    'London',
    'Athens',
    'Cairo',
    'Nairobi',
    'Chicago',
    'New York',
    'Seoul',
    'Jakarta',
  ];

  List<String> flagList = [
    'uk.png',
    'greece.png',
    'egypt.png',
    'kenya.png',
    'usa.png',
    'usa.png',
    'south_korea.png',
    'indonesia.png',
  ];

  void setWorldModel(String url, String location, String flag) {
    this.url = url;
    this.location = location;
    this.flag = flag;
  }

  //Simulate network request for a user name.
  Future<WorldModel> callTimeApi() async {
    // try {
    //   //make the request
    final response =
        await get(Uri.parse('http://worldtimeapi.org/api/timezone/$url'));
    // Map<String, dynamic> data = jsonDecode(response.body);
    debugPrint('myapp: ${response.body}');

    if (response.statusCode < 199 && response.statusCode > 299) {
      throw 'Error in communicating to server';
    }
    worldModel = worldTimeFromJson(response.body);
    notifyListeners();
    return worldTimeFromJson(response.body);
    // } catch (e) {
    //   print('Error Occured: $e');
    //   time = 'Cannot get Time data';
    // }
  }

  String getFlag() {
    return flag;
  }

  void setFlag(String flag) {
    this.flag = flag;
  }

  String getLocation() {
    return location;
  }

  void setLocation(String location) {
    this.location = location;
  }

  String getTime() {
    return Utils.getAdjustedTime(
        worldModel!.utcOffset, worldModel!.datetime.toString());
  }

  bool getDayTime() {
    return Utils.getUtcOffset(
        worldModel!.utcOffset, worldModel!.datetime.toString());
  }
}
