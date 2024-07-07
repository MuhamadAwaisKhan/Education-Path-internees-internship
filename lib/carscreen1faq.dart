import 'package:flutter/material.dart';

// Define a custom color palette
class MyColors {
  static const Color primary = Color(0xFF1B87E7); // Green
  static const Color accent = Color(0xFFFFC107); // Amber
  static const Color background = Color(0xFFF1F8E9); // Light green
  static const Color text = Color(0xFF212121); // Dark grey
}

void main() {
  runApp(MaterialApp(
    theme: ThemeData(
      primaryColor: MyColors.primary,
      hintColor: MyColors.accent,
      scaffoldBackgroundColor: MyColors.background,
      textTheme: TextTheme(
        bodyLarge: TextStyle(color: MyColors.text),
        bodyMedium: TextStyle(color: MyColors.text),
      ),
    ),
    home: EducationScreen(),
  ));
}

class EducationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Education Path'),
        backgroundColor: MyColors.primary,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Welcome to the Education Path!',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: MyColors.text),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20),
              Text(
                'This path will guide you through our comprehensive educational resources designed to enhance your learning experience.',
                style: TextStyle(fontSize: 18, color: MyColors.text),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20),
              ElevatedButton.icon(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => CoursesScreen()),
                  );
                },
                icon: Icon(Icons.book),
                label: Text('Explore Courses'),
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white, backgroundColor: MyColors.primary,
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton.icon(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => StudyGroupsScreen()),
                  );
                },
                icon: Icon(Icons.group),
                label: Text('Join Study Groups'),
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white, backgroundColor: MyColors.primary,
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton.icon(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => UpdatesScreen()),
                  );
                },
                icon: Icon(Icons.update),
                label: Text('Latest Updates'),
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white, backgroundColor: MyColors.primary,
                ),
              ),
            ],
          ),
        ),
      ),
      backgroundColor: MyColors.background,
    );
  }
}

class CoursesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Courses'),
        backgroundColor: MyColors.primary,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Explore our Courses',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: MyColors.text),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 20),
                Text(
                  'We offer a variety of courses to cater to different interests and skill levels. Whether you are looking to develop new skills or enhance existing ones, we have something for everyone.',
                  style: TextStyle(fontSize: 18, color: MyColors.text),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 20),
                ElevatedButton.icon(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => StudyGroupsScreen()),
                    );
                  },
                  icon: Icon(Icons.group),
                  label: Text('Join Study Groups'),
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white, backgroundColor: MyColors.primary,
                  ),
                ),
                SizedBox(height: 20),
                ElevatedButton.icon(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => UpdatesScreen()),
                    );
                  },
                  icon: Icon(Icons.update),
                  label: Text('Latest Updates'),
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white, backgroundColor: MyColors.primary,
                  ),
                ),
                SizedBox(height: 20),
                CourseList(),
              ],
            ),
          ),
        ),
      ),
      backgroundColor: MyColors.background,
    );
  }
}

class StudyGroupsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Study Groups'),
        backgroundColor: MyColors.primary,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Join our Study Groups',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: MyColors.text),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 20),
                Text(
                  'Collaborate with peers, share knowledge, and work together to achieve your academic goals. Our study groups provide a supportive environment for learning and growth.',
                  style: TextStyle(fontSize: 18, color: MyColors.text),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 20),
                ElevatedButton.icon(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => UpdatesScreen()),
                    );
                  },
                  icon: Icon(Icons.update),
                  label: Text('Sign up for Updates'),
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white, backgroundColor: MyColors.primary,
                  ),
                ),
                SizedBox(height: 20),
                StudyGroupList(),
              ],
            ),
          ),
        ),
      ),
      backgroundColor: MyColors.background,
    );
  }
}

class UpdatesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Latest Updates'),
        backgroundColor: MyColors.primary,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Sign up for the Latest Updates',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: MyColors.text),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 20),
                Text(
                  'Stay informed about our latest courses, events, and special offers. Sign up for our newsletter and never miss an update!',
                  style: TextStyle(fontSize: 18, color: MyColors.text),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 20),
                ElevatedButton.icon(
                  onPressed: () {
                    // Action to sign up for updates
                  },
                  icon: Icon(Icons.email),
                  label: Text('Sign Up Now'),
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white, backgroundColor: MyColors.primary,
                  ),
                ),
                SizedBox(height: 20),
                UpdateList(),
              ],
            ),
          ),
        ),
      ),
      backgroundColor: MyColors.background,
    );
  }
}

class CourseList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Card(
          child: ListTile(
            leading: Icon(Icons.book, color: MyColors.accent),
            title: Text('Course 1: Introduction to Programming', style: TextStyle(color: MyColors.text)),
            subtitle: Text('Learn the basics of programming with hands-on examples.', style: TextStyle(color: MyColors.text)),
          ),
        ),
        Card(
          child: ListTile(
            leading: Icon(Icons.book, color: MyColors.accent),
            title: Text('Course 2: Advanced Data Structures', style: TextStyle(color: MyColors.text)),
            subtitle: Text('Deep dive into complex data structures and algorithms.', style: TextStyle(color: MyColors.text)),
          ),
        ),
        Card(
          child: ListTile(
            leading: Icon(Icons.book, color: MyColors.accent),
            title: Text('Course 3: Web Development', style: TextStyle(color: MyColors.text)),
            subtitle: Text('Build modern, responsive websites from scratch.', style: TextStyle(color: MyColors.text)),
          ),
        ),
        // Add more courses as needed
      ],
    );
  }
}

class StudyGroupList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Card(
          child: ListTile(
            leading: Icon(Icons.group, color: MyColors.accent),
            title: Text('Study Group 1: Programming Basics', style: TextStyle(color: MyColors.text)),
            subtitle: Text('Join peers to discuss and learn programming fundamentals.', style: TextStyle(color: MyColors.text)),
          ),
        ),
        Card(
          child: ListTile(
            leading: Icon(Icons.group, color: MyColors.accent),
            title: Text('Study Group 2: Data Structures', style: TextStyle(color: MyColors.text)),
            subtitle: Text('Collaborate on data structure problems and solutions.', style: TextStyle(color: MyColors.text)),
          ),
        ),
        Card(
          child: ListTile(
            leading: Icon(Icons.group, color: MyColors.accent),
            title: Text('Study Group 3: Web Development', style: TextStyle(color: MyColors.text)),
            subtitle: Text('Work together to build and debug web projects.', style: TextStyle(color: MyColors.text)),
          ),
        ),
        // Add more study groups as needed
      ],
    );
  }
}

class UpdateList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Card(
          child: ListTile(
            leading: Icon(Icons.update, color: MyColors.accent),
            title: Text('Update 1: New Course on AI and Machine Learning', style: TextStyle(color: MyColors.text)),
            subtitle: Text('Enroll now in our latest course on artificial intelligence.', style: TextStyle(color: MyColors.text)),
          ),
        ),
        Card(
          child: ListTile(
            leading: Icon(Icons.update, color: MyColors.accent),
            title: Text('Update 2: Upcoming Webinar on Cybersecurity', style: TextStyle(color: MyColors.text)),
            subtitle: Text('Join our webinar to learn about the latest trends in cybersecurity.', style: TextStyle(color: MyColors.text)),
          ),
        ),
        Card(
          child: ListTile(
            leading: Icon(Icons.update, color: MyColors.accent),
            title: Text('Update 3: Special Discount on All Courses', style: TextStyle(color: MyColors.text)),
            subtitle: Text('Get a 20% discount on all courses for a limited time.', style: TextStyle(color: MyColors.text)),
          ),
        ),
        // Add more updates as needed
      ],
    );
  }
}
