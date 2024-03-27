import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  // Constructor for Home widget, with optional named parameter `key`
  const Home({super.key});

  // Override createState method to create state for Home widget
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // Declare a Map variable to store data received from arguments
  Map data = {};

  @override
  Widget build(BuildContext context) {
    // Check if data is not empty, if empty, assign data from arguments
    data = data.isNotEmpty ? data : ModalRoute.of(context)?.settings.arguments as Map<dynamic, dynamic>;
    //print(data);

    // Set background image and color based on isDayTime
    String bgImage = data['isDayTime'] ? 'day.png' : 'night.png';
    Color? bgColor = data['isDayTime'] ? Colors.blue : Colors.indigo[700];

    // Return a Scaffold widget as the root of the home screen
    return Scaffold(
      // Set background color
      backgroundColor: bgColor,
      // Define the body of the scaffold
      body: SafeArea(
        child: Container(
          // Decorate container with background image
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/$bgImage'),
              fit: BoxFit.cover,
            )
          ),
          // Add padding and column to arrange widgets vertically
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 120.0, 0, 0),
            child: Column(
              children: <Widget>[
                // Button to navigate to location selection screen
                TextButton.icon(
                  onPressed: () async {
                    // Navigate to location selection screen and await result
                    dynamic result = await Navigator.pushNamed(context, '/location');
                    // Update state with new data received from location selection screen
                    setState(() {
                      data = {
                        'time': result['time'],
                        'location': result['location'],
                        'isDayTime': result['isDayTime'],
                        'flag': result['flag'],
                      };
                    });
                  },
                  icon: Icon(
                    Icons.edit_location,
                    color: Colors.grey[300],
                  ),
                  label: Text(
                    'Edit Location',
                    style: TextStyle(
                      color: Colors.grey[300],
                    ),
                  ),
                ),
                const SizedBox(height: 20.0),
                // Display location name
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      data['location'],
                      style: const TextStyle(
                        fontSize: 28.0,
                        letterSpacing: 2.0,
                        color: Colors.white,
                      )
                    )
                  ],
                ),
                const SizedBox(height: 20.0),
                // Display time
                Text(
                  data['time'],
                  style: const TextStyle(
                    fontSize: 66.0,
                    color: Colors.white,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
