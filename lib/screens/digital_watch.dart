import 'package:flutter/material.dart';

class Digitalclock extends StatefulWidget {
  const Digitalclock({super.key});

  @override
  State<Digitalclock> createState() => _DigitalclockState();
}
class _DigitalclockState extends State<Digitalclock> {
  int hour = 0,
      minute = 0,
      second = 0,
      month = 0,
      date = 0,
      year =0;

  @override
  void initState() {
    super.initState();
    digitalclock();
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Center(
          child: Stack(
            alignment: Alignment.center,
            children: [
              SizedBox(
                height: 200,
                width: 200,
                child: CircularProgressIndicator(
                  color: Colors.blue,
                  value: hour/12,
                ),
              ),
              SizedBox(
                height: 191,
                width: 191,
                child: CircularProgressIndicator(
                  color: Colors.white,
                  value: second/60,
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Sunday",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20)),
                  Text("$date/$month/$year",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20)),
                  Text("$hour : $minute : $second",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 30)),
                  Text("PM   33",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20)),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
  void digitalclock() {
    Future.delayed(Duration(seconds: 1), () {
      setState(() {
        hour = DateTime
            .now()
            .hour;
        minute = DateTime
            .now()
            .minute;
        second = DateTime
            .now()
            .second;
        date = DateTime
            .now()
            .day;
        month= DateTime
            .now()
            .month;
        year = DateTime
            .now()
            .year;
        digitalclock();
      });
    }) ;
    if(hour>12)
    {
      hour=hour-12;
    }
  }
}
