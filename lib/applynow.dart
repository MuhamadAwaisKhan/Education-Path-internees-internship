import 'package:flutter/material.dart';
import 'package:internee/util/AppColors.dart';
import 'package:lottie/lottie.dart';

class applynowscreen extends StatefulWidget {
  const applynowscreen({super.key});

  @override
  State<applynowscreen> createState() => _applynowscreenState();
}

class _applynowscreenState extends State<applynowscreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Application Form",
            style: TextStyle(
              fontFamily: 'Poppins',
              fontSize: 17,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          centerTitle: true,
          backgroundColor: AppColors.heading,
        ),
        backgroundColor: AppColors.background2,
        body: Column(children: [
          Center(
            child: Lottie.asset(
              'assets/images/bk.json',
              height: 200,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(
            height: 22,
          ),
          Container(
            height: 150,
            width: double.infinity,
            //color: Colors.purple,
            alignment: Alignment.center,
            margin: const EdgeInsets.all(20),
            padding: const EdgeInsets.all(30),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black, width: 2),
            ),
            child: Column(
              children: [
                Text("Course Slot are fully booked",
                   style: TextStyle(
                   fontFamily: 'Poppins',
                    fontSize: 17,
                     color: Colors.redAccent,
                   fontWeight: FontWeight.bold,),
                ),
                SizedBox(
                  height: 22,
                ),
                Text("Course slot are currently fully.Please wait for the further announcements",
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 14,

                    ),
                ),
              ],
            ),
          ),
        ]));
  }
}
