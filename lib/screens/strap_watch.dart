import 'package:flutter/material.dart';

class Strapwatch extends StatefulWidget {
  const Strapwatch({super.key});

  @override
  State<Strapwatch> createState() => _StrapwatchState();
}

class _StrapwatchState extends State<Strapwatch> {
  int hour = 0, minute = 0, second = 0, month = 0, date = 0, year = 0;

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
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Stack(
                alignment: Alignment.center,
                children: [
                  SizedBox(
                    height: 191,
                    width: 191,
                    child: CircularProgressIndicator(
                      color: Colors.white,
                      value: second / 60,
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("$date/$month/$year",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 15)),
                      SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            height: 50,
                            width: 50,
                            decoration: BoxDecoration(
                                color: Colors.blue,
                                borderRadius: BorderRadius.circular(5)),
                              child: Align(
                                alignment: Alignment.center,
                                  child: Text("$hour",style: TextStyle(color: Colors.white,fontSize: 25,fontWeight: FontWeight.bold),)),
                          ),
                          SizedBox(width:8),
                          Container(
                            height: 50,
                            width: 50,
                            decoration: BoxDecoration(
                                color: Colors.blue,
                                borderRadius: BorderRadius.circular(5)),
                              child: Align(
                                alignment: Alignment.center,
                                  child: Text("$minute",style: TextStyle(color: Colors.white,fontSize: 25,fontWeight: FontWeight.bold))),
                          ),
                        ],
                      ),
                     ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 70),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(50)),
                  child: Image.asset("assets/images/google.png",height: 10,),
                ),
                SizedBox(width: 10),
                Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(50)),
                  child: Image.asset("assets/images/facebook.png",height: 20,),
                ),
                SizedBox(width: 10),
                Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(50)),
                  child: Image.asset("assets/images/whatsapp.png",height: 20),
                ),
              ],
            ),
          ],
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
        date = DateTime.now().day;
        month = DateTime.now().month;
        year = DateTime.now().year;
        digitalclock();
      });
    });
    if (hour > 12) {
      hour = hour - 12;
    }
  }
}
