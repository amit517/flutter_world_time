import 'package:flutter/material.dart';

class ChooseLocation extends StatefulWidget {
  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {
  int counter = 0;

  void getData() async {
    /*simulate network request for a username*/
    String username = await Future.delayed(Duration(seconds: 3),(){
      //print('yoshi');
      return 'yoshi';
    });

    /*simulate network request to get bio o the username*/
    String bio = await Future.delayed(Duration(seconds: 2),(){
      return '$username is vega, musician & egg collector';
      //print('$username is vega, musician & egg collector');
    });

    print(bio);
  }

  @override
  void initState() {
    super.initState();
    print('initState function ran');
    getData();
  }

  @override
  Widget build(BuildContext context) {
    print('build function ran');
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: Text('Choose Location'),
        centerTitle: true,
        elevation: 0.0,
      ),
      body: RaisedButton(
        onPressed: () {
          setState(() {
            counter++;
          });
        },
        child: Text('counter is $counter'),
      ),
    );
  }
}
