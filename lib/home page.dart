import 'package:dmrc1/Journey.dart';
import 'package:flutter/material.dart';
class TestApp extends StatelessWidget {
  const TestApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.blueAccent,
            title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Good Morning',style: TextStyle(color: Colors.white,fontSize: 15),),
              Text('Guest',style: TextStyle(color: Colors.white,fontSize: 20),),
      
            ],
          ),
          actions: [IconButton(onPressed: (){}, icon: Icon(Icons.translate,color: Colors.white,),),
            IconButton(onPressed: (){}, icon: Icon(Icons.person,color: Colors.white,),),
          ],
          ),
          body: Center(
            child: Column(
              children: [
      
               Container(padding: EdgeInsets.all(8.0),
                 decoration: BoxDecoration(
                   border: Border.all(
                     color: Colors.black, // Border color
                     width: 2.0, // Border width
                   ),
                 ),
                 child: Padding(
                   padding: const EdgeInsets.all(8.0),
                   child: Column(
                     children: [
                       Text('Metro Services'),
                       SingleChildScrollView(
                         scrollDirection: Axis.horizontal,
                         child: Row(
                           children: [
                             ElevatedButton(onPressed: (){
                               Navigator.push(context,
                                   MaterialPageRoute(builder: (context) => JourneyPage()));
                                                  }, child: Text('Plan your \n Trip',style: TextStyle(fontSize: 10),)),
                             ElevatedButton(onPressed: (){}, child: Text('Book QR \n ticket',style: TextStyle(fontSize: 10))),
                             ElevatedButton(onPressed: (){}, child: Text('Smart Card \n Top-UP',style: TextStyle(fontSize: 10))),
                           ],
                         ),
                       ),
                       SingleChildScrollView(
                         scrollDirection: Axis.horizontal,
                         child: Row(
                           children: [
                             ElevatedButton(onPressed: (){}, child: Text('Fare \nCalculator')),
                             ElevatedButton(onPressed: (){}, child: Text('Metro Lines')),
                             ElevatedButton(onPressed: (){}, child: Text('Metro Map')),
                           ],
                         ),
                       ),
                     ],
                   ),
                 ),
               ),
                Container(padding: EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.black, // Border color
                      width: 2.0, // Border width
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [

      
                      ],
                    ),
                  ),
                )
              ],
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


