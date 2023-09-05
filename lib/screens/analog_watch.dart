import 'dart:math';
import 'package:flutter/material.dart';

class Analogclock extends StatefulWidget {
  const Analogclock({super.key});

  @override
  State<Analogclock> createState() => _AnalogclockState();
}

class _AnalogclockState extends State<Analogclock> {
  int hour = 0,
      minute = 0,
      second = 0;

  @override
  void initState() {
    super.initState();
    digitalclock();
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: Stack(
            alignment: Alignment.center,
            children: [
              Image.asset("assets/images/clock.png"),
              Transform.rotate(
                angle: pi/2,
                child: Transform.rotate(
                  angle: hour*(pi*2)/12,
                  child: Divider(
                    thickness: 5,
                    color: Colors.red,
                    endIndent: MediaQuery.of(context).size.width*0.50,
                    indent: MediaQuery.of(context).size.width*0.40,
                  ),
                ),
              ),
              Transform.rotate(
                angle: pi/2,
                child: Transform.rotate(
                  angle: minute*(pi*2)/60,
                  child: Divider(
                    thickness: 3,
                    color: Colors.green,
                    endIndent: MediaQuery.of(context).size.width*0.50,
                    indent: MediaQuery.of(context).size.width*0.30,
                  ),
                ),
              ),
              Transform.rotate(
                angle: pi/2,
                child: Transform.rotate(
                  angle: second*(pi*2)/60,
                  child: Divider(
                    thickness: 2,
                    color: Colors.black,
                    endIndent: MediaQuery.of(context).size.width*0.50,
                    indent: MediaQuery.of(context).size.width*0.25,
                  ),
                ),
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
        hour = DateTime.now().hour;
        minute = DateTime.now().minute;
        second = DateTime.now().second;

        if (hour > 12) {
          hour = hour - 12;
        }
      });
      digitalclock();
    });
  }
}

