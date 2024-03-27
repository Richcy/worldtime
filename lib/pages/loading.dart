import 'package:flutter/material.dart';
import 'package:worldtime/services/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  // Constructor for Loading widget, with optional named parameter `key`
  const Loading({super.key});

  // Override createState method to create state for Loading widget
  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  // Method to set up world time
  void setupWorldTime() async {
    // Create a new instance of WorldTime with location, flag, and URL
    WorldTime instance = WorldTime(location: 'Berlin', flag: 'germany.png', url: 'Europe/Berlin');
    // Call getTime method to fetch time data
    await instance.getTime();
    // Check if the widget is mounted before navigating to the home screen
    if (mounted) {
      Navigator.pushReplacementNamed(context, '/home', arguments: {
        'location': instance.location,
        'flag': instance.flag,
        'time': instance.time,
        'isDayTime' : instance.isDayTime,
      });
    }
  }

  @override
  void initState() {
    super.initState();
    // Call setupWorldTime method when the state is initialized
    setupWorldTime();
  }

  @override
  Widget build(BuildContext context) {
    // Return a Scaffold widget as the root of the loading screen
    return Scaffold(
      // Set background color
      backgroundColor: Colors.blue[900],
      // Define the body of the scaffold
      body: const Center(
        // Center a loading spinner widget
        child: SpinKitFadingCube(
          color: Colors.white,
          size: 80.0,
        ),
      ),
    );
  }
}
