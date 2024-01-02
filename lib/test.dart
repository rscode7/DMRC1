import 'package:dmrc1/home%20page.dart';
import 'package:flutter/material.dart';
import 'package:shake/shake.dart';
class TestApp extends StatefulWidget {
  const TestApp({super.key});

  @override
  State<TestApp> createState() => _TestAppState();
}

class _TestAppState extends State<TestApp> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    ShakeDetector.autoStart(
      onPhoneShake: () {
        Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => JourneyPage()),
    );
      },
      minimumShakeCount: 1,
      shakeSlopTimeMS: 500,
      shakeCountResetTime: 3000,
      shakeThresholdGravity: 2.7,
    );

    // To close: detector.stopListening();
    // ShakeDetector.waitForStart() waits for user to call detector.startListening();
  }

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
