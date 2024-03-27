import 'package:flutter/material.dart';
import 'package:worldtime/services/world_time.dart';

class ChooseLocation extends StatefulWidget {
  // Constructor for ChooseLocation widget, with optional named parameter `key`
  const ChooseLocation({super.key});

  // Override createState method to create state for ChooseLocation widget
  @override
  State<ChooseLocation> createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {
  // List of WorldTime instances representing different locations
  List<WorldTime> locations = [
    WorldTime(url: 'Europe/London', location: 'London', flag: 'uk.png'),
    WorldTime(url: 'Europe/Berlin', location: 'Athens', flag: 'greece.png'),
    WorldTime(url: 'Africa/Cairo', location: 'Cairo', flag: 'egypt.png'),
    WorldTime(url: 'Africa/Nairobi', location: 'Nairobi', flag: 'kenya.png'),
    WorldTime(url: 'America/Chicago', location: 'Chicago', flag: 'usa.png'),
    WorldTime(url: 'America/New_York', location: 'New York', flag: 'usa.png'),
    WorldTime(url: 'Asia/Seoul', location: 'Seoul', flag: 'south_korea.png'),
    WorldTime(url: 'Asia/Jakarta', location: 'Jakarta', flag: 'indonesia.png'),
  ];

  // Method to update time and navigate back with selected location data
  void updateTime(index) async {
    // Get the WorldTime instance for the selected location
    WorldTime instance = locations[index];
    // Fetch time data for the selected location
    await instance.getTime();

    // Check if the widget is mounted before navigating back
    if (mounted) {
      // Navigate back to previous screen with selected location data
      Navigator.pop(context, {
        'location': instance.location,
        'flag': instance.flag,
        'time': instance.time,
        'isDayTime': instance.isDayTime,
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    // Return a Scaffold widget as the root of the location selection screen
    return Scaffold(
      // Set background color
      backgroundColor: Colors.grey[200],
      // Define an AppBar for the location selection screen
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: const Text('Choose a Location'),
        centerTitle: true,
        elevation: 0.0,
      ),
      // Define the body of the scaffold using a ListView.builder
      body: ListView.builder(
        // Set the number of items in the list to the length of locations list
        itemCount: locations.length,
        // Define itemBuilder to build each list item dynamically
        itemBuilder: (context, index){
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 1.0, vertical: 0.0),
            // Create a Card widget for each list item
            child: Card(
              child: ListTile(
                // Define onTap callback to handle item tap
                onTap: () {
                  updateTime(index); // Call updateTime method with index
                },
                // Display location name as title
                title: Text(locations[index].location),
                // Display flag image as leading widget
                leading: CircleAvatar(
                  backgroundImage: AssetImage('assets/${locations[index].flag}'),
                ),
              ),
            ),
          );
        }
      ),
    );
  }
}
