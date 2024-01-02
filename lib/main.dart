import 'dart:async';

import 'package:dmrc1/home%20page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp( MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen()));
}


class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Simulate a delay before navigating to the home page
    Timer(Duration(seconds: 3), () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => NoticePage()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Welcome To DMRC!',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            CircularProgressIndicator(),
          ],
        ),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
      ),
      body: Center(
        child: Text('Welcome to the DMRC!'),
      ),
    );
  }
}
class NoticePage extends StatelessWidget {
  const NoticePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('How to use App'),
              Text('Shake 2 times to Plan your Trip'),
              Text('Shake 4 times to Book QR Ticket'),
              ElevatedButton(onPressed: (){Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => TestApp()),
              );}, child: Text('OK'))
            ],
          ),
        ),
      ),
    );

  }
}