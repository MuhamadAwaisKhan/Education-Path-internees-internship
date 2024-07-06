import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:internee/forget.dart';
import 'package:internee/homescreen.dart';
import 'package:internee/signup.dart';
import 'package:internee/util/AppColors.dart';
import 'package:internee/util/uihelper.dart';
import 'package:lottie/lottie.dart';

class LoginUser extends StatefulWidget {
  const LoginUser({super.key});

  @override
  State<LoginUser> createState() => _LoginUserState();
}

class _LoginUserState extends State<LoginUser> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool _hidePassword = false;
  bool _rememberMe = false;
  bool _isLoading = false;

  void login(String email, String password) async {
    if (email.isEmpty || password.isEmpty) {
      uihelper.CustomAlertbox(context, "Enter required fields");
      return;
    }
    setState(() {
      _isLoading = true;
    });
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      QuerySnapshot<Map<String, dynamic>> snapshot = await FirebaseFirestore
          .instance
          .collection('user')
          .where('email', isEqualTo: email)
          .get();
      if (snapshot.docs.isNotEmpty) {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (Context) => HomeScreen()));
      } else {
        uihelper.CustomAlertbox(context, "User not found with this email");
      }
    } on FirebaseAuthException catch (ex) {
      uihelper.CustomAlertbox(context, ex.code.toString());
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: AppColors.background),
      backgroundColor: AppColors.background,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Lottie.asset(
              'assets/images/education.json',
              height: 200,
              fit: BoxFit.cover,
            ),
            SizedBox(height: 22),
            Text("Hello Learners!",
                style: TextStyle(
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.bold,
                    fontSize: 17,
                    color: AppColors.heading)),
            SizedBox(
              height: 12,
            ),
            Text(
              "Welcome Back, You Have Been ",
              style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 17,
                color: AppColors.heading,
              ),
            ),
            Text(
              "Missed For A Long Time ",
              style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 17,
                color: AppColors.heading,
              ),
            ),
            SizedBox(
              height: 12,
            ),
            uihelper.CustomTextField(
                emailController, "Email Address", Icons.email_rounded, false),
            uihelper.CustomTextfieldpassword(
                context, passwordController, 'Password', _hidePassword,
                (bool value) {
              setState(() {
                _hidePassword = value;
              });
            }),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Checkbox(
                      value: _rememberMe,
                      onChanged: (bool? newValue) {
                        setState(() {
                          _rememberMe = newValue ?? false;
                        });
                      },
                    ),
                    Text('Remember Me',
                        style: TextStyle(
                            color: Colors.indigo,
                            fontFamily: 'Poppins',
                            fontSize: 17)),
                  ],
                ),
                GestureDetector(
                  onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => forgetpassword())),
                  child: Text('Forget Password?',
                      style: TextStyle(
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w600,
                          fontSize: 15,
                          color: Colors.indigo)),
                ),
              ],
            ),
            if (_isLoading)
              CircularProgressIndicator(
                  color: Colors.lime, backgroundColor: Colors.black45),
            SizedBox(height: 10),
            uihelper.CustomButton(
                () => login(emailController.text.trim(),
                    passwordController.text.trim()),
                "Login",
                50,
                190),
            SizedBox(height: 20),
            Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 38.0),
                  child: Text("Don't have an account?",
                      style: TextStyle(
                          color: Colors.black,
                          fontFamily: 'Poppins',
                          fontSize: 17)),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 15.0),
                  child: GestureDetector(
                    onTap: () => Navigator.push(context,
                        MaterialPageRoute(builder: (context) => signup())),
                    child: Text('Sign Up',
                        style: TextStyle(
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w600,
                            fontSize: 15,
                            color: Colors.indigo)),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 38.0),
                  child: Text("Get Some Experience?",
                      style: TextStyle(
                          color: Colors.black,
                          fontFamily: 'Poppins',
                          fontSize: 19)),
                ),
                SizedBox(height: 15),
                Padding(
                  padding: EdgeInsets.only(left: 15.0),
                  child: uihelper.CustomButton(
                          () =>  Navigator.push(context,
    MaterialPageRoute(builder: (context) => HomeScreen())),
                      "As a Guest",
                      50,
                      190),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
