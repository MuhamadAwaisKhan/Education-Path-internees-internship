import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:internee/login.dart';
import 'package:lottie/lottie.dart';

import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  int _currentIndex = 0;
  final CarouselController _controller = CarouselController();

  List<Widget> _buildScreens() {
    return [
      _buildScreen(
        title: 'Welcome to EduPAth',
        description: 'Your journey to better skin starts here!',
        color: Colors.deepOrange,
        animation: 'assets/images/welcome.json',
      ),
      _buildScreen(
        title: 'Discover Courses',
        description: 'Explore a wide range of courses and find your passion.',
        color: Colors.teal,
        animation: 'assets/images/discover.json',
      ),
      _buildScreen(
        title: 'Track Your Learning',
        description: 'Monitor your progress and achieve your educational goals.',
        color: Colors.indigo,
        animation: 'assets/images/track.json',
      ),
      _buildScreen(
        title: 'Join Our Community',
        description: 'Connect with learners like you and enhance your learning journey.',
        color: Colors.amber,
        animation: 'assets/images/join.json',
      ),
    ];
  }


  @override
  Widget _buildScreen({required String title,
    required String description,
    required Color color,
    required String animation}) {
    // Determine text color based on background brightness
    bool isDark =
        ThemeData.estimateBrightnessForColor(color) == Brightness.dark;
    Color textColor =
    isDark ? Colors.white : Colors.black; // High contrast text color
    Color iconColor =
    isDark ? Colors.white : Colors.teal; // High contrast icon color

    return Container(
      color: color,
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Lottie.asset(animation, height: 200),
              SizedBox(height: 20),
              Text(
                title,
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 24,
                  color: textColor,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20),
              Text(
                description,
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 16,
                  color: textColor,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          CarouselSlider(
            items: _buildScreens(),
            carouselController: _controller,
            options: CarouselOptions(
              height: double.infinity,
              enableInfiniteScroll: false,
              enlargeCenterPage: true,
              viewportFraction: 1.0,
              onPageChanged: (index, reason) {
                setState(() {
                  _currentIndex = index;
                });
              },
            ),
          ),
          Positioned(
            top: 40,
            right: 20,
            child: TextButton(
              onPressed: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (Context) => LoginUser()));
                print("button is pressed");
              },
              child: Text('Skip', style: TextStyle(fontFamily: 'Poppins',
                  color: Colors.white)),
              // Consistent high contrast text
              style: TextButton.styleFrom(
                backgroundColor: Colors.brown, // Clear background or use theme color with opacity
              ),
            ),
          ),
          Positioned(
            bottom: 40,
            right: 20,
            child: GestureDetector(
              onTap: () {
                if (_currentIndex == 3) {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (Context) => LoginUser()));
                } else {
                  _controller.nextPage();
                }
              },
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.blue, // Attractive and consistent with theme
                ),
                padding: EdgeInsets.all(12),
                child: Icon(
                  _currentIndex == 3 ? Icons.check : Icons.arrow_forward,
                  color: Colors.white, // High contrast
                ),
              ),
            ),
          ),
          Positioned(
            top: 650,
            left: 0,
            right: 0,
            child: Center(
              child: AnimatedSmoothIndicator(
                activeIndex: _currentIndex,
                count: 4,
                effect: ExpandingDotsEffect(
                  dotHeight: 8.0,
                  dotWidth: 8.0,
                  activeDotColor: Colors.white,
                  dotColor: Colors.grey,
                  // Sufficient contrast
                  expansionFactor: 4,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}