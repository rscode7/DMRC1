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




