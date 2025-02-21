import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:internee/util/AppColors.dart';
import 'package:internee/util/uihelper.dart';
import 'package:lottie/lottie.dart';

class forgetpassword extends StatefulWidget {
  const forgetpassword({super.key});

  @override
  State<forgetpassword> createState() => _forgetpasswordState();
}

class _forgetpasswordState extends State<forgetpassword> {
  TextEditingController emailcontroller = TextEditingController();

  forgetpassword(String email) async {
    if (email == "") {
      return uihelper.CustomAlertbox(
          context, "Enter an Email To Reset Password");
    } else {
      try {
        await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
        uihelper.CustomAlertbox(context, "Password reset link sent to $email");
        emailcontroller.clear();
      } catch (e) {
        print("Error sending password reset email: $e");
        uihelper.CustomAlertbox(context, "Error sending reset password email");
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Forget Password",
          style: TextStyle(
            fontFamily: 'Poppins',
            fontWeight: FontWeight.bold,
            fontSize: 20,
        ),),
        centerTitle: true,
        backgroundColor: AppColors.background,
      ),
      backgroundColor: AppColors.background,
      body: Column(
        children: [
          Lottie.asset(
            'assets/images/forget.json',
            height: 200,
            fit: BoxFit.cover,
          ),
          SizedBox(
            height: 22,
          ),
          uihelper.CustomTextField(
              emailcontroller, "Email", Icons.mail_outline, false),
          SizedBox(
            height: 20,
          ),
          uihelper.CustomButton(() {
            forgetpassword(emailcontroller.text.toString().trim());
          }, "Reset Password", 50, 190)
        ],
      ),
    );
  }
}
