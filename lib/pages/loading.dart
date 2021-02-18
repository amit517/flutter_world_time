
import 'package:flutter/material.dart';
import 'package:flutter_world_time/model/Time.dart';
import 'package:flutter_world_time/services/world_time.dart';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  void setupWorldTime() async{
    WorldTime instance = WorldTime("Berlin", "germany.png", "Europe/Berlin");
    await instance.getTime();
    Navigator.pushReplacementNamed(context, "/home",arguments: {
      'location': instance.location,
      'flag':instance.flag,
      'time':instance.time
    });
  }

  @override
  void initState() {
    super.initState();
    setupWorldTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(50.0),
          child: Text('Loading'),
        ),
      ),
    );
  }
}
