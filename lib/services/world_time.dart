import 'package:flutter_world_time/model/Time.dart';
import 'package:http/http.dart';

class WorldTime {
  String location; // location name in the ui
  String time; // time in that lcation
  String flag; //url to an asset flag icon
  String url;

  WorldTime(
      this.location, this.flag, this.url); //location url for api
  
  Future<void> getTime() async {
    Response response = await get('http://worldtimeapi.org/api/timezone/$url');
    TimeObject timeObject = timeObjectFromJson(response.body);
    print(timeObject.datetime);
    String offset = timeObject.utcOffset.toString().substring(1,3);

    DateTime now = DateTime.parse(timeObject.datetime.toString());
    now = now.add(Duration(hours: int.parse(offset)));
    time = now.toString(); // Set the time property
    return timeObject;
  }

}

