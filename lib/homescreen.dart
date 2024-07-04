import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:internee/login.dart';
import 'package:internee/util/AppColors.dart';
class homescreen extends StatefulWidget {
  const homescreen({super.key});

  @override
  State<homescreen> createState() => _homescreenState();
}

class _homescreenState extends State<homescreen> {
  Future<void> logout(BuildContext context) async {
    await FirebaseAuth.instance.signOut().then((value) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => LoginUser()),
      );
    });
  }
  @override

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.background,
      ),
      backgroundColor: AppColors.background,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,

        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              Container(
                child: Text('Home Screen'),
              ),

            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [


              ElevatedButton(
                onPressed: () => logout(context),
                child: Text("Logout"),
              ),
            ],
          ),
        ],
      ),
    );
  }
}