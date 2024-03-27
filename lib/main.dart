// Import necessary packages and libraries
import 'package:flutter/material.dart';
import 'package:worldtime/pages/choose_location.dart';
import 'package:worldtime/pages/home.dart';
import 'package:worldtime/pages/loading.dart';

// Main function, entry point of the Flutter app
void main() => runApp(
  // Create a MaterialApp widget, the root of the Flutter app
  MaterialApp(
    // Define the initial route of the app
    initialRoute: '/',
    // Define named routes for different screens/pages of the app
    routes: {
      // Route for the loading screen, associated with the Loading widget
      '/': (context) => const Loading(),
      // Route for the home screen, associated with the Home widget
      '/home': (context) => const Home(),
      // Route for the location selection screen, associated with the ChooseLocation widget
      '/location': (context) => const ChooseLocation(),
    },
  ),
);
