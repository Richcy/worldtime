import 'package:http/http.dart'; // Import HTTP package for making HTTP requests
import 'dart:convert'; // Import convert package for JSON decoding
import 'package:intl/intl.dart'; // Import intl package for date and time formatting

class WorldTime {
  String location; // Location name for the UI
  String time; // Time in that location
  String flag; // URL to an asset flag icon
  String url; // Location URL for API endpoint
  bool isDayTime; // True or false if daytime or not

  // Constructor with optional initialization for time and isDayTime
  WorldTime({ required this.location, required this.flag, required this.url }) : time = '', isDayTime = false;

  // Method to fetch time data from the WorldTime API
  Future<void> getTime() async {
    try {
      // Make the HTTP request to fetch time data
      Uri link = Uri.parse('http://worldtimeapi.org/api/timezone/$url');
      Response response = await get(link);
      Map data = jsonDecode(response.body); // Decode JSON response into a Map
      //print(data);

      // Extract properties from data
      String datetime = data['datetime']; // Get datetime string from response data
      String offset = data['utc_offset'].substring(1, 3); // Extract UTC offset from response data
      // print(datetime);
      // print(offset);

      // Create DateTime object adjusted by UTC offset
      DateTime now = DateTime.parse(datetime);
      now = now.add(Duration(hours: int.parse(offset)));
      //print(now);

      // Determine if it's daytime based on the hour (between 6:00 and 18:00)
      isDayTime = now.hour >= 6 && now.hour < 18 ? true : false;
      // Format the time using the 12-hour time format
      time = DateFormat.jm().format(now);
    } catch (e) {
      // Catch any errors that occur during the API request
      print('caught error: $e');
      time = 'could not get time data'; // Set error message for time
    }
  }
}
