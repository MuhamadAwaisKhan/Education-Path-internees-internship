import 'package:flutter/material.dart';
import 'package:internee/applynow.dart';
import 'package:internee/util/AppColors.dart';
import 'package:internee/util/uihelper.dart';

class CourseOverviewScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('FAQS',  style: TextStyle(
            fontFamily: 'Poppins',
            fontWeight: FontWeight.bold,
            fontSize: 25,
            color: Colors.white),),
        centerTitle: true,
        backgroundColor: Colors.teal,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              buildSectionHeader('Course Program Overview'),
              buildSectionText(
                  'Are you ready to advance your skills with our comprehensive courses? Each course is designed to give you practical experience and deep insights into the subject matter. Dive into our program:'),
              buildSectionHeader('Our Process:'),
              buildSectionText('Registration & Enrollment',
                  'Start by registering for the course that fits your interests and career goals. Secure your spot by completing the enrollment process.'),
              buildSectionText('Learning Modules',
                  'Access structured learning modules that cover all the essential topics. Engage with interactive materials at your own pace.'),
              buildSectionText('Hands-on Projects',
                  'Apply what you learn in real-world scenarios. Complete projects that challenge your understanding and skills.'),
              buildSectionText('Evaluation & Certification',
                  'Successfully pass the course assessments to earn your certification. Showcase your capabilities with a recognized credential.'),
              buildSectionHeader('Exclusive Features:'),
              buildSectionText('Expert Instructors',
                  'Learn from industry experts who bring years of professional experience into the classroom.'),
              buildSectionText('Interactive Platform',
                  'Utilize our cutting-edge learning platform for an interactive and engaging education experience.'),
              buildSectionText('Community Support',
                  'Join a community of peers who can offer support, insight, and partnership throughout your learning journey.'),
              buildSectionHeader('Job Opportunities:'),
              buildSectionText(
                  'As you wrap up your course, gain access to our job portal. It’s not just about course completion; it’s about the next step in your career journey. Our network of partner software houses eagerly awaits talent like yours.'),
              buildSectionHeader('Mentorship:'),
              buildSectionText(
                  'Gain insights and guidance from seasoned professionals in the industry.'),
              buildSectionHeader('Networking:'),
              buildSectionText(
                  'Build connections that could shape your future career.'),
              buildSectionHeader('Hands-On Experience:'),
              buildSectionText(
                  'Dive into real-world projects and tasks, applying theoretical knowledge to practical scenarios.'),
              buildSectionHeader('Certification:'),
              buildSectionText(
                  'Receive a certificate recognizing your achievements upon successful completion.'),
            build123(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildSectionHeader(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Colors.teal,
        ),
      ),
    );
  }

  Widget buildSectionText(String title, [String content = '']) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: Text(
        title + (content.isNotEmpty ? ": $content" : ''),
        style: TextStyle(
          fontSize: 16,
          color: Colors.black,
        ),
      ),
    );

  }
  Widget build123(BuildContext context) {  // Ensure context is available here if needed inside the function
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: uihelper.CustomButton(
         () {  // Assuming onTap is the correct parameter name expected by CustomButton
          Navigator.push(context,
              MaterialPageRoute(builder: (Context) => applynowscreen()));
        },
        "Apply Now",  // Assuming title and buttonSize are the correct parameter names
         70,
         400,
      ),
    );
  }

}
