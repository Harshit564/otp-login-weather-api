import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

class HomePageOtp extends StatefulWidget {
  final User user;
  HomePageOtp({required this.user});
  @override
  _HomePageOtpState createState() => _HomePageOtpState();
}

class _HomePageOtpState extends State<HomePageOtp> {
  late final response;
  late String _location = "Delhi";

  void getData(String data) async {
    var dio = Dio();
    response = await dio.get('http://api.weatherstack.com/current?access_key=10365c679e33dc206eee945571218eaf&query=$data');
  }

  @override
  void initState() {
    // TODO: implement initState
    getData(_location);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        child: Column(
          children: [
            SizedBox(height: 100),
            Text(response.data['location']['name'].toString(),style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold)),
            SizedBox(height: 20),
            Image.network(response.data['current']['weather_icons'][0].toString()),
            SizedBox(height: 20),
            Text("Temperature:", style: TextStyle(fontSize: 20)),
            Text(response.data['current']['temperature'].toString() + "\u00B0" + "C",style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
            SizedBox(height: 20),
            Text("Humidity:", style: TextStyle(fontSize: 20)),
            Text(response.data['current']['humidity'].toString() + "%",style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
            SizedBox(height: 20),
            Text("Feels Like:", style: TextStyle(fontSize: 20)),
            Text(response.data['current']['feelslike'].toString() + "\u00B0" + "C",style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }
}
