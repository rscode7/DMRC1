import 'package:audioplayers/audioplayers.dart';
import 'package:dmrc1/Journey.dart';
import 'package:flutter/material.dart';
import 'package:shake/shake.dart';
import 'package:vibration/vibration.dart';
class TestApp extends StatefulWidget {
  const TestApp({super.key});

  @override
  State<TestApp> createState() => _TestAppState();
}

class _TestAppState extends State<TestApp> {
  final AudioPlayer audioPlayer = AudioPlayer();

  // Function to play the audio file
  void playAudio() async {
    // Replace 'path_to_your_audio_file.mp3' with the actual path to your audio file
    await audioPlayer.play('assets/test.mp3' as Source);
  }
  void initState() {
    // TODO: implement initState
    super.initState();
    int shakeCount = 0;

    ShakeDetector.autoStart(
      onPhoneShake: () {
        shakeCount++;

        // Check the number of shakes and perform corresponding operations
        if (shakeCount == 2) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => JourneyPage()),
          );
          Vibration.vibrate( pattern: [500, 1000, 500, 2000, 500, 3000, 500, 500],
            intensities: [0, 128, 0, 255, 0, 64, 0, 255],);
        } else if (shakeCount == 4) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => BookQRTicketPage()),
          );
        }

        // Reset the shake count after each set of operations
        if (shakeCount >= 4) {
          shakeCount = 0;
        }
      },
      minimumShakeCount: 2,
      shakeSlopTimeMS: 400,
      shakeCountResetTime: 3000,
      shakeThresholdGravity: 2.7,
    );

    // To close: detector.stopListening();
    // ShakeDetector.waitForStart() waits for user to call detector.startListening();
  }

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      home: SafeArea(
        child: Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.blueAccent,
              title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Good Morning',style: TextStyle(color: Colors.white,fontSize: 10,fontStyle: FontStyle.italic),),
                Text('Guest',style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold),),

              ],
            ),
            actions: [
              IconButton(onPressed: (){playAudio();}, icon: Icon(Icons.record_voice_over,color: Colors.white,),),

              IconButton(onPressed: (){}, icon: Icon(Icons.translate,color: Colors.white,),),
              IconButton(onPressed: (){}, icon: Icon(Icons.person,color: Colors.white,),),
            ],
            ),
            body: Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [

                   Container(
                     decoration: BoxDecoration(
                       border: Border.all(
                         color: Colors.black, // Border color
                         width: 2.0, // Border width
                       ),
                       borderRadius: BorderRadius.circular(20),
                     ),
                     child: Padding(
                       padding: const EdgeInsets.all(18.0),
                       child: Column(
                         crossAxisAlignment: CrossAxisAlignment.start,
                         children: [
                           Text('Metro Services',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,),),
                           SizedBox(height: 20,),
                           Row(
                             mainAxisAlignment: MainAxisAlignment.center,
                             crossAxisAlignment: CrossAxisAlignment.center,
                             children: [
                               Flexible(
                                 child: ElevatedButton(
                                   onPressed: () {
                                     Navigator.push(
                                       context,
                                       MaterialPageRoute(builder: (context) => JourneyPage()),
                                     );
                                   },
                                   style: ElevatedButton.styleFrom(
                                     primary: Colors.transparent, // Set button background color to transparent
                                     elevation: 0, // Remove button elevation
                                   ),
                                   child: Column(
                                     children: [
                                       Icon(Icons.train_outlined,color: Colors.red,),
                                       Text(
                                         'Plan your Trip',
                                         style: TextStyle(fontSize: 15,color: Colors.black),
                                         textAlign: TextAlign.center,
                                       ),
                                     ],
                                   ),
                                 ),
                               ),
                               Flexible(
                                 child: ElevatedButton(
                                   onPressed: () {
                                     Navigator.push(
                                       context,
                                       MaterialPageRoute(builder: (context) => BookQRTicketPage()),
                                     );
                                   },
                                   style: ElevatedButton.styleFrom(
                                     primary: Colors.transparent,
                                     elevation: 0,
                                   ),
                                   child: Column(
                                     children: [
                                       Icon(Icons.qr_code,color: Colors.red,),
                                       Text(
                                         'Book QR ticket',
                                         style: TextStyle(fontSize: 15,color: Colors.black),
                                         textAlign: TextAlign.center,
                                       ),
                                     ],
                                   ),
                                 ),
                               ),
                               Flexible(
                                 child: ElevatedButton(
                                   onPressed: () {
                                     Navigator.push(
                                       context,
                                       MaterialPageRoute(builder: (context) => AddMetroSmartCardPage()),
                                     );
                                   },
                                   style: ElevatedButton.styleFrom(
                                     primary: Colors.transparent,
                                     elevation: 0,
                                   ),
                                   child: Column(
                                     children: [
                                       Icon(Icons.credit_card,color: Colors.red,),
                                       Text(
                                         'Smart Card Top-UP',
                                         style: TextStyle(fontSize: 15,color: Colors.black),
                                         textAlign: TextAlign.center,
                                       ),
                                     ],
                                   ),
                                 ),
                               ),
                             ],
                           ),
                           SizedBox(height: 20,),
                           Row(
                             mainAxisAlignment: MainAxisAlignment.center,
                             crossAxisAlignment: CrossAxisAlignment.center,
                             children: [
                               Flexible(
                                 child: ElevatedButton(
                                   onPressed: () {
                                     Navigator.push(
                                       context,
                                       MaterialPageRoute(builder: (context) => CalculateFare()),
                                     );
                                   },
                                   style: ElevatedButton.styleFrom(
                                     primary: Colors.transparent, // Set button background color to transparent
                                     elevation: 0, // Remove button elevation
                                   ),
                                   child: Column(
                                     children: [
                                       Icon(Icons.calculate_outlined,color: Colors.red,),
                                       Text(
                                         'Fare \n Calculator',
                                         style: TextStyle(fontSize: 15,color: Colors.black),
                                         textAlign: TextAlign.center,
                                       ),
                                     ],
                                   ),
                                 ),
                               ),
                               Flexible(
                                 child: ElevatedButton(
                                   onPressed: () {
                                     Navigator.push(
                                       context,
                                       MaterialPageRoute(builder: (context) => MetroLines()),
                                     );
                                   },
                                   style: ElevatedButton.styleFrom(
                                     primary: Colors.transparent,
                                     elevation: 0,
                                   ),
                                   child: Column(
                                     children: [
                                       Icon(Icons.stacked_line_chart_sharp,color: Colors.red,),
                                       Text(
                                         'Metro Lines',
                                         style: TextStyle(fontSize: 15,color: Colors.black),
                                         textAlign: TextAlign.center,
                                       ),
                                     ],
                                   ),
                                 ),
                               ),
                               Flexible(
                                 child: ElevatedButton(
                                   onPressed: () {
                                     Navigator.push(context, MaterialPageRoute(builder: (context) => Help()),
                                     );
                                   },
                                   style: ElevatedButton.styleFrom(
                                     primary: Colors.transparent,
                                     elevation: 0,
                                   ),
                                   child: Column(
                                     children: [
                                       Icon(Icons.support_agent_sharp,color: Colors.red,),
                                       Text(
                                         'Help & Info',
                                         style: TextStyle(fontSize: 15,color: Colors.black),
                                         textAlign: TextAlign.center,
                                       ),
                                     ],
                                   ),
                                 ),
                               ),
                             ],
                           ),



                         ],
                       ),
                     ),
                   ),
                  ],
                ),
              ),
            ),
          ),
      ),
    );
  }
}








class JourneyPage extends StatefulWidget {
  const JourneyPage({Key? key});

  @override
  _JourneyPageState createState() => _JourneyPageState();
}

class _JourneyPageState extends State<JourneyPage> {
  final _formKey = GlobalKey<FormState>();

  String? _selectedDeparture;
  String? _selectedDestination;
  DateTime _selectedDate = DateTime.now();
  TimeOfDay _selectedTime = TimeOfDay.now();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Plan Your Journey'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                DropdownButtonFormField<String>(
                  decoration: InputDecoration(
                    labelText: 'Depart From',
                    border: OutlineInputBorder(),
                  ),
                  value: _selectedDeparture,
                  onChanged: (String? newValue) {
                    setState(() {
                      _selectedDeparture = newValue;
                    });
                  },
                  items: [
                    'Select Station', // Default option
                    'Shaheed Sthal (NBA)',
                    'Hindon River',
                    'Arthala',
                    'Dilshad Garden',
                    'Mansarovar Park',
                    'Jhilmil',
                    'Shahdara',
                    'Welcome',
                    'Kashmere Gate',
                    'Inderlok',
                    // Add more stations as needed
                  ].map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
                SizedBox(height: 16),
                DropdownButtonFormField<String>(
                  decoration: InputDecoration(
                    labelText: 'Destination',
                    border: OutlineInputBorder(),
                  ),
                  value: _selectedDestination,
                  onChanged: (String? newValue) {
                    setState(() {
                      _selectedDestination = newValue;
                    });
                  },
                  items: [
                    'Select Station', // Default option
                    'Shaheed Sthal (NBA)',
                    'Hindon River',
                    'Arthala',
                    'Dilshad Garden',
                    'Mansarovar Park',
                    'Jhilmil',
                    'Shahdara',
                    'Welcome',
                    'Kashmere Gate',
                    'Inderlok',
                    // Add more stations as needed
                  ].map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
                SizedBox(height: 16),
                // Date Input Field
                GestureDetector(
                  onTap: () async {
                    DateTime? pickedDate = await showDatePicker(
                      context: context,
                      initialDate: _selectedDate,
                      firstDate: DateTime.now(),
                      lastDate: DateTime.now().add(Duration(days: 365)),
                    );
                    if (pickedDate != null && pickedDate != _selectedDate) {
                      setState(() {
                        _selectedDate = pickedDate;
                      });
                    }
                  },
                  child: InputDecorator(
                    decoration: InputDecoration(
                      labelText: 'Select Date',
                      border: OutlineInputBorder(),
                      suffixIcon: Icon(Icons.date_range),
                    ),
                    child: Text(
                      '${_selectedDate.toLocal()}'.split(' ')[0],
                    ),
                  ),
                ),
                SizedBox(height: 16),
                // Time Input Field
                GestureDetector(
                  onTap: () async {
                    TimeOfDay? pickedTime = await showTimePicker(
                      context: context,
                      initialTime: _selectedTime,
                    );
                    if (pickedTime != null && pickedTime != _selectedTime) {
                      setState(() {
                        _selectedTime = pickedTime;
                      });
                    }
                  },
                  child: InputDecorator(
                    decoration: InputDecoration(
                      labelText: 'Select Time',
                      border: OutlineInputBorder(),
                      suffixIcon: Icon(Icons.access_time),
                    ),
                    child: Text(
                      '${_selectedTime.format(context)}',
                    ),
                  ),
                ),
                SizedBox(height: 16),
                // Show Route Button
                ElevatedButton(
                  onPressed: () {
                    // Handle show route logic
                  },
                  child: Text('Show Route'),
                ),
                SizedBox(height: 16),
                // Reset Button
                ElevatedButton(
                  onPressed: () {
                    _formKey.currentState?.reset();
                    setState(() {
                      _selectedDeparture = null;
                      _selectedDestination = null;
                      _selectedDate = DateTime.now();
                      _selectedTime = TimeOfDay.now();
                    });
                  },
                  child: Text('Reset'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}


class BookQRTicketPage extends StatefulWidget {
  @override
  _BookQRTicketPageState createState() => _BookQRTicketPageState();
}

class _BookQRTicketPageState extends State<BookQRTicketPage> {
  String departFrom = 'Select Station';
  String destination = 'Select Station';
  int routePreference = 0; // 0 for Shortest Route, 1 for Min Interchange
  double costPerStation = 1.0; // Adjust the cost as needed

  List<String> stations = [
    'Select Station',
    'Shaheed Sthal (NBA)',
    'Hindon River',
    'Arthala',
    'Dilshad Garden',
    'Mansarovar Park',
    'Jhilmil',
    'Shahdara',
    'Welcome',
    'Kashmere Gate',
    'Inderlok',
    // Add more station names as needed
  ];

  double calculateFare() {
    if (departFrom != 'Select Station' &&
        destination != 'Select Station' &&
        departFrom != destination) {
      int departIndex = stations.indexOf(departFrom);
      int destinationIndex = stations.indexOf(destination);

      if (departIndex != -1 && destinationIndex != -1) {
        int stationsTravelled = (destinationIndex - departIndex).abs() ;
        double totalFare = (stationsTravelled + costPerStation)*10;
        return totalFare;
      }
    }

    return costPerStation; // Default, return cost for 1 station if calculation fails
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Book QR Ticket'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            DropdownButtonFormField<String>(
              decoration: InputDecoration(
                labelText: 'Depart From',
                border: OutlineInputBorder(),
              ),
              value: departFrom,
              onChanged: (String? newValue) {
                setState(() {
                  departFrom = newValue!;
                });
              },
              items: getStationDropdownItems(),
            ),
            SizedBox(height: 16.0),
            DropdownButtonFormField<String>(
              decoration: InputDecoration(
                labelText: 'Destination',
                border: OutlineInputBorder(),
              ),
              value: destination,
              onChanged: (String? newValue) {
                setState(() {
                  destination = newValue!;
                });
              },
              items: getStationDropdownItems(),
            ),
            SizedBox(height: 16.0),
            Text(
              'Choose Route Preference:',
              style: TextStyle(fontSize: 16.0),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  Radio(
                    value: 0,
                    groupValue: routePreference,
                    onChanged: (int? value) {
                      setState(() {
                        routePreference = value!;
                      });
                    },
                  ),
                  Text('Shortest Route'),
                  Radio(
                    value: 1,
                    groupValue: routePreference,
                    onChanged: (int? value) {
                      setState(() {
                        routePreference = value!;
                      });
                    },
                  ),
                  Text('Min Interchange'),
                ],
              ),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                _showFareDialog();
              },
              child: Text('Show Fare'),
            ),
          ],
        ),
      ),
    );
  }

  List<DropdownMenuItem<String>> getStationDropdownItems() {
    return stations.map<DropdownMenuItem<String>>((String value) {
      return DropdownMenuItem<String>(
        value: value,
        child: Text(value),
      );
    }).toList();
  }

  void _showFareDialog() {
    if (departFrom != 'Select Station' &&
        destination != 'Select Station' &&
        departFrom != destination) {
      double stationsTravelled = calculateFare();
      double totalFare = stationsTravelled * costPerStation;
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Fare Details'),
            content: Text('Total Fare: ₹$totalFare'),
            actions: [
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('OK'),
              ),
            ],
          );
        },
      );
    } else {
      // Handle invalid selection (same departFrom and destination)
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Invalid Selection'),
            content: Text(
                'Please select valid departure and destination stations.'),
            actions: [
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('OK'),
              ),
            ],
          );
        },
      );
    }
  }
}


class AddMetroSmartCardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Metro Smart Card'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Enter Your Smart Card Number:',
              style: TextStyle(fontSize: 16.0),
            ),
            TextFormField(keyboardType: TextInputType.number,
              decoration: InputDecoration(
                hintText: 'Smart Card Number',
              ),
            ),
            SizedBox(height: 16.0),
            Text(
              'Your Name:',
              style: TextStyle(fontSize: 16.0),
            ),
            TextFormField(
              decoration: InputDecoration(
                hintText: 'Your Name',
              ),
            ),
            SizedBox(height: 24.0),
            ElevatedButton(
              onPressed: () {
                // Handle saving data
              },
              child: Text('Save'),
            ),
          ],
        ),
      ),
    );
  }
}

class CalculateFare extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calculate Fare'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  Radio(
                    value: 0,
                    groupValue: 0,
                    onChanged: (int? value) {
                      // Handle radio button selection
                    },
                  ),
                  Text('Shortest Route'),

                ],
              ),
            ),
            SizedBox(height: 10),
            DropdownButtonFormField<String>(
              decoration: InputDecoration(
                labelText: 'Depart From',
                border: OutlineInputBorder(),
              ),
              value: 'Select Station',
              onChanged: (String? newValue) {
                // Handle dropdown value change
              },
              items: getStationDropdownItems(),
            ),
            SizedBox(height: 16.0),
            DropdownButtonFormField<String>(
              decoration: InputDecoration(
                labelText: 'Destination',
                border: OutlineInputBorder(),
              ),
              value: 'Select Station',
              onChanged: (String? newValue) {
                // Handle dropdown value change
              },
              items: getStationDropdownItems(),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                // Handle button press
              },
              child: Text('Calculate Fare'),
            ),
          ],
        ),
      ),
    );
  }

  List<DropdownMenuItem<String>> getStationDropdownItems() {
    return [
      'Select Station',
      'Shaheed Sthal (NBA)',
      'Hindon River',
      'Arthala',
      'Dilshad Garden',
      'Mansarovar Park',
      'Jhilmil',
      'Shahdara',
      'Welcome',
      'Kashmere Gate',
      'Inderlok',
      // Add more station names as needed
    ].map<DropdownMenuItem<String>>((String value) {
      return DropdownMenuItem<String>(
        value: value,
        child: Text(value),
      );
    }).toList();
  }
}

class MetroLines extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Metro Lines'),
      ),
      body: ListView(
        children: [
          _buildLineCard('Red Line', Icons.train, Colors.red),
          _buildLineCard('Yellow Line', Icons.train, Colors.yellow),
          _buildLineCard('Blue Line', Icons.train, Colors.blue),
          _buildLineCard('Pink Line', Icons.train, Colors.pink),
          _buildLineCard('Violet Line', Icons.train, Colors.deepPurpleAccent),
          _buildLineCard('Grey Line', Icons.train, Colors.grey),
          _buildLineCard('Airport Line', Icons.train, Colors.deepOrangeAccent),
          // Add more lines as needed
        ],
      ),
    );
  }

  Widget _buildLineCard(String lineName, IconData icon, Color iconColor) {
    return Card(
      child: ListTile(
        title: Text(lineName),
        leading: Icon(
          icon,
          color: iconColor,
        ),
      ),
    );
  }
}


class Help extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Help & Info.'),
      ),
      body: ListView(
        padding: EdgeInsets.all(16.0),
        children: [
          _buildEmergencyCard('Police Helpline', '112'),
          _buildEmergencyCard('Women Helpline', '1091'),
          _buildEmergencyCard('Senior Citizen Helpline', '1291'),
          _buildEmergencyCard('Missing Helpline', '011-23415480'),
          _buildEmergencyCard('DMRC Support Email', 'dmrc.support@gmail.com'),
          // Add more emergency contacts as needed
        ],
      ),
    );
  }

  Widget _buildEmergencyCard(String title, String contact) {
    return Card(
      child: ListTile(
        title: Center(
          child: Text(
            title,
            style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
          ),
        ),
        subtitle: Center(
          child: Text(
            contact,
            style: TextStyle(fontSize: 16.0),
          ),
        ),
      ),
    );
  }
}