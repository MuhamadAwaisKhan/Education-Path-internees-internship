import 'package:carousel_slider/carousel_slider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:internee/CoursesCategory.dart';
import 'package:internee/applynow.dart';
import 'package:internee/login.dart';
import 'package:internee/util/AppColors.dart';

import 'CourseOverviewScreen.dart';
import 'carscreen1faq.dart';

// Make sure to import the correct screen files here
// import 'education_screen.dart';
// import 'courses_screen.dart';
// import 'study_groups_screen.dart';
// import 'updates_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _current = 0;
  final List<Map<String, dynamic>> imgList = [
    {
      'text': 'Welcome to the Education Path!',
      'color': Colors.red,
      // 'image': 'https://via.placeholder.com/150', // Replace with your image URL
      // Uncomment and replace with actual screen
       'screen': EducationScreen(),
    },
    {
      'text': 'Explore our Courses',
      'color': Colors.green,
      // 'image': 'https://via.placeholder.com/150', // Replace with your image URL
      // Uncomment and replace with actual screen
       'screen': CourseCategory(),
    },
    {
      'text': 'Join our Study Groups',
      'color': Colors.blue,
      // 'image': 'https://via.placeholder.com/150', // Replace with your image URL
      // Uncomment and replace with actual screen
       'screen': StudyGroupsScreen(),
    },
    {
      'text': 'Sign up for the Latest Updates',
      'color': Colors.orange,
      // 'image': 'https://via.placeholder.com/150', // Replace with your image URL
      // Uncomment and replace with actual screen
       'screen': UpdatesScreen(),
    }
  ];

  CarouselController _carouselController = CarouselController();

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
        title: Text('Home Screen',
          style: TextStyle(
              fontFamily: 'Poppins',
              fontWeight: FontWeight.bold,
              fontSize: 25,
              color: AppColors.heading),),
        centerTitle: true,
        backgroundColor: AppColors.background,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () => logout(context),
          ),
        ],
      ),
      backgroundColor: AppColors.background,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Semantics(
              label: 'Carousel slider with educational options',
              child: Container(
                height: 200.0, // Set the height to 200 pixels
                child: Stack(
                  children: [
                    CarouselSlider(
                      items: imgList
                          .map((item) => GestureDetector(
                        onTap: () {
                          if (item['screen'] != null) {
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => item['screen'],
                            ));
                          }
                        },
                        child: Semantics(
                          label: item['text'],
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            margin: EdgeInsets.symmetric(horizontal: 10.0),
                            decoration: BoxDecoration(
                              color: item['color'],
                              borderRadius: BorderRadius.circular(35.0),
                            ),
                            child: Stack(
                              children: [
                                // Image.network(
                                //   item['image'],
                                //   fit: BoxFit.cover,
                                //   width: double.infinity,
                                //   height: double.infinity,
                                // ),
                                Center(
                                  child: Text(
                                    item['text'],
                                    style: TextStyle(
                                      fontFamily: 'Poppins',
                                      fontSize: 17.0,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ))
                          .toList(),
                      options: CarouselOptions(
                        autoPlay: true,
                        enlargeCenterPage: true,
                        aspectRatio: 2.0,
                        onPageChanged: (index, reason) {
                          setState(() {
                            _current = index;
                          });
                        },
                      ),
                      carouselController: _carouselController,
                    ),
                    Positioned(
                      bottom: 20, // Adjust this value as needed
                      left: 0,
                      right: 0,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: imgList.asMap().entries.map((entry) {
                          return GestureDetector(
                            onTap: () => _carouselController.animateToPage(entry.key),
                            child: Container(
                              width: 12.0,
                              height: 12.0,
                              margin: EdgeInsets.symmetric(horizontal: 4.0),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: (Theme.of(context).brightness == Brightness.dark
                                    ? Colors.white
                                    : Colors.black)
                                    .withOpacity(_current == entry.key ? 0.9 : 0.4),
                              ),
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SectionTitle(title: 'Featured Courses', actionText: 'See All'),
            Semantics(
              label: 'Featured internships grid',
              child: InternshipGrid(),
            ),
            SectionTitle(title: 'Popular Technologies', actionText: 'See All'),
            Semantics(
              label: 'Popular technologies grid',
              child: TechnologyGrid(),
            ),
          ],
        ),
      ),
    );
  }
}

class SectionTitle extends StatelessWidget {
  final String title;
  final String actionText;

  SectionTitle({required this.title, required this.actionText});

  @override
  Widget build(BuildContext context) {
    return Semantics(
      header: true,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            TextButton(
              onPressed: () {
                 Navigator.push(context, MaterialPageRoute(builder: (Context)=>CourseCategory()));
              },
              child: Text(actionText),
            ),
          ],
        ),
      ),
    );
  }
}

class InternshipGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: GridView.count(
        crossAxisCount: 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 20,
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        children: [
          InternshipCard(
            title: 'WordPress',
            subtitle: 'Website Design',
            imageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSzAxIzs2yRTPxONA1yBwMZdhkNwlqmIpxFug&s', // Replace with your image URL
            color: Colors.lightBlue,
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => CourseOverviewScreen(),  // Navigate to detail screen or perform other actions
                ),
              );
            },
          ),
          InternshipCard(
            title: 'Figma',
            subtitle: 'Graphic Design',
            imageUrl: 'https://img.uxcel.com/tags/figma-1698087967030-2x.jpg', // Replace with your image URL
            color: Colors.grey,
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (Context) => CourseOverviewScreen(),  // Navigate to detail screen or perform other actions
                ),
              );
            },
          ),
          InternshipCard(
            title: 'Illustrator',
            subtitle: 'Graphic Design',
            imageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSWMzyETcc0w0_21F5JNX0B746-KgBgOKkAtw&s', // Replace with your image URL
            color: Colors.orange,
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => CourseOverviewScreen(),  // Navigate to detail screen or perform other actions
                ),
              );
            },
          ),

          InternshipCard(
            title: 'Data Science',
            subtitle: 'Machine Learning',
            imageUrl: 'https://static.toiimg.com/photo/98969861/98969861.jpg', // Replace with your image URL
            color: Colors.purpleAccent,
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => CourseOverviewScreen(),  // Navigate to detail screen or perform other actions
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

class TechnologyGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: GridView.count(
        crossAxisCount: 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        children: [
          InternshipCard(
            title: 'React',
            subtitle: 'Website Design',
            imageUrl: 'https://upload.wikimedia.org/wikipedia/commons/thumb/a/a7/React-icon.svg/2300px-React-icon.svg.png', // Replace with your image URL
            color: Colors.blueAccent,
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => CourseOverviewScreen(),  // Navigate to detail screen or perform other actions
                ),
              );
            },
          ),
          InternshipCard(
            title: 'Flutter',
            subtitle: 'Mobile App',
            imageUrl: 'https://cdn-images-1.medium.com/max/1200/1*5-aoK8IBmXve5whBQM90GA.png', // Replace with your image URL
            color: Colors.black,
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => CourseOverviewScreen(),  // Navigate to detail screen or perform other actions
                ),
              );
            },
          ),
          InternshipCard(
            title: 'PHP',
            subtitle: 'Website Development',
            imageUrl: 'https://media.licdn.com/dms/image/D4D12AQE1JQfZ6IwTSA/article-cover_image-shrink_720_1280/0/1658841510153?e=2147483647&v=beta&t=A23FMazH5EHng0fTQbFglIQO3UYLbbirEeqTRHV1Igw', // Replace with your image URL
            color: Colors.blue,
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => CourseOverviewScreen(),  // Navigate to detail screen or perform other actions
                ),
              );
            },
          ),
          InternshipCard(
            title: 'Python',
            subtitle: 'Programming Language',
            imageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQtdRsbNblY-trvVBgVFHyP_g2Lrz9dLP3k7Q&s', // Replace with your image URL
            color: Colors.pink,
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => CourseOverviewScreen(),  // Navigate to detail screen or perform other actions
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

class InternshipCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final String imageUrl;
  final Color color;
  final VoidCallback onTap;

  // Ensuring that all parameters passed to the InternshipCard are non-null.
  InternshipCard({
    required this.title,
    required this.subtitle,
    required this.imageUrl, // Ensure imageUrl is never passed as null
    required this.color,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Semantics(
      label: '$title - $subtitle',
      child: Card(
        color: color,
        child: InkWell(
          onTap:onTap,
          child: Padding(
            padding: const EdgeInsets.all(15.0),  // Increased padding
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 40, // Increased height for the image
                  width: 40, // Increased width for the image
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(imageUrl.isNotEmpty ? imageUrl : 'https://via.placeholder.com/150'),
                    ),
                  ),
                ),
                SizedBox(height: 5), // Adjusted spacing
                Expanded( // Changed from Flexible to Expanded
                  child: Text(
                    title,
                    style: TextStyle(
                      fontSize: 18, // Adjusted font size
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                    softWrap: true, // Ensures text wraps within the container
                    textAlign: TextAlign.center, // Centers text
                  ),
                ),
                SizedBox(height: 5), // Adjusted spacing
                Expanded( // Changed from Flexible to Expanded
                  child: Text(
                    subtitle,
                    style: TextStyle(
                      fontSize: 14, // Adjusted font size
                      color: Colors.white70,
                    ),
                    softWrap: true, // Ensures text wraps within the container
                    textAlign: TextAlign.center, // Centers text
                  ),
                ),
                SizedBox(height: 1), // Adjusted spacing
                ElevatedButton(
                  onPressed:() { Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => applynowscreen())
                  );},
                  child: Text('Apply Now'),
                ),
              ],
            ),
          ),
        ),
      ),
    );

  }
}
