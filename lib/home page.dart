import 'package:audioplayers/audioplayers.dart';
import 'package:dmrc1/Journey.dart';
import 'package:flutter/material.dart';
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
                                   onPressed: () {},
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
                                   onPressed: () {},
                                   style: ElevatedButton.styleFrom(
                                     primary: Colors.transparent,
                                     elevation: 0,
                                   ),
                                   child: Column(
                                     children: [
                                       Icon(Icons.timer,color: Colors.red,),
                                       Text(
                                         'Timings',
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
                    'Station 1',
                    'Station 2',
                    'Station 3',
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
                    'Station A',
                    'Station B',
                    'Station C',
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


class BookQRTicketPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Book QR Ticket'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Depart From:',
              style: TextStyle(fontSize: 16.0),
            ),
            DropdownButton<String>(
              value: 'Select Station',
              onChanged: (String? newValue) {
                // Handle dropdown value change
              },
              items: <String>[
                'Select Station',
                'Station A',
                'Station B',
                'Station C',
                // Add more station names as needed
              ].map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
            SizedBox(height: 16.0),
            Text(
              'Destination:',
              style: TextStyle(fontSize: 16.0),
            ),
            DropdownButton<String>(
              value: 'Select Station',
              onChanged: (String? newValue) {
                // Handle dropdown value change
              },
              items: <String>[
                'Select Station',
                'Station A',
                'Station B',
                'Station C',
                // Add more station names as needed
              ].map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
            SizedBox(height: 16.0),
            Text(
              'Choose Route Preference:',
              style: TextStyle(fontSize: 16.0),
            ),
            Row(
              children: [
                Radio(
                  value: 0,
                  groupValue: 0,
                  onChanged: (int? value) {
                    // Handle radio button selection
                  },
                ),
                Text('Shortest Route'),
                Radio(
                  value: 1,
                  groupValue: 0,
                  onChanged: (int? value) {
                    // Handle radio button selection
                  },
                ),
                Text('Min Interchange'),
              ],
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                // Handle button press
              },
              child: Text('Show Fare'),
            ),
          ],
        ),
      ),
    );
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
            Row(
              children: [
                Radio(
                  value: 0,
                  groupValue: 0,
                  onChanged: (int? value) {
                    // Handle radio button selection
                  },
                ),
                Text('Shortest Route'),
                Radio(
                  value: 1,
                  groupValue: 0,
                  onChanged: (int? value) {
                    // Handle radio button selection
                  },
                ),
                Text('Min Interchange'),
              ],
            ),
            SizedBox(height: 10,),
            Text(
              'Depart From:',
              style: TextStyle(fontSize: 16.0),
            ),
            DropdownButton<String>(
              value: 'Select Station',
              onChanged: (String? newValue) {
                // Handle dropdown value change
              },
              items: <String>[
                'Select Station',
                'Station A',
                'Station B',
                'Station C',
                // Add more station names as needed
              ].map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
            SizedBox(height: 16.0),
            Text(
              'Destination:',
              style: TextStyle(fontSize: 16.0),
            ),
            DropdownButton<String>(
              value: 'Select Station',
              onChanged: (String? newValue) {
                // Handle dropdown value change
              },
              items: <String>[
                'Select Station',
                'Station A',
                'Station B',
                'Station C',
                // Add more station names as needed
              ].map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
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
}