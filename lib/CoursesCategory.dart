import 'package:flutter/material.dart';
import 'package:internee/applynow.dart';
import 'package:internee/util/AppColors.dart';
import 'CourseOverviewScreen.dart';

class CourseCategory extends StatefulWidget {
  CourseCategory({Key? key}) : super(key: key);

  @override
  State<CourseCategory> createState() => _CourseCategoryState();
}

class _CourseCategoryState extends State<CourseCategory> {
  final List<Map<String, dynamic>> courses = [
    { "title": 'WordPress',
      "subtitle": 'Website Design',
      "imageUrl":
      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSzAxIzs2yRTPxONA1yBwMZdhkNwlqmIpxFug&s',
      "color": Colors.lightBlue,
    },
    {
      "title": "Figma",
      "subtitle": "Graphic Design",
      "imageUrl": "https://img.uxcel.com/tags/figma-1698087967030-2x.jpg",
      "color": Colors.grey,
    },
    {
      "title": "Illustrator",
      "subtitle": "Graphic Design",
      "imageUrl": "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSWMzyETcc0w0_21F5JNX0B746-KgBgOKkAtw&s",
      "color": Colors.orange,
    },
    {
      "title": "React",
      "subtitle": "Web Development",
      "imageUrl": "https://upload.wikimedia.org/wikipedia/commons/thumb/a/a7/React-icon.svg/2300px-React-icon.svg.png",
      "color": Colors.blueAccent,
    },
    {
      "title": "Flutter",
      "subtitle": "Mobile App Development",
      "imageUrl": "https://cdn-images-1.medium.com/max/1200/1*5-aoK8IBmXve5whBQM90GA.png",
      "color": Colors.black,
    },
    {
      "title": "PHP",
      "subtitle": "Web Development",
      "imageUrl": "https://media.licdn.com/dms/image/D4D12AQE1JQfZ6IwTSA/article-cover_image-shrink_720_1280/0/1658841510153?e=2147483647&v=beta&t=A23FMazH5EHng0fTQbFglIQO3UYLbbirEeqTRHV1Igw",
      "color": Colors.blue,
    },
    {
      "title": "Python",
      "subtitle": "Programming Language",
      "imageUrl": "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQtdRsbNblY-trvVBgVFHyP_g2Lrz9dLP3k7Q&s",
      "color": Colors.pink,
    },
    {
      "title": "Data Science",
      "subtitle": "Machine Learning",
      "imageUrl": "https://static.toiimg.com/photo/98969861/98969861.jpg",
      "color": Colors.purpleAccent,
    },
    {
      "title": "Java",
      "subtitle": "Back-end Development",
      "imageUrl": "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS_D_n0YE9r71rbZdLg67lSiHyyDZ6iENeYDQ&s",
      "color": Colors.green,
    },
    {
      "title": "Cyber Security",
      "subtitle": "Security Practices",
      "imageUrl": "https://media.istockphoto.com/id/1335169133/vector/cyber-security-line-icon-shield-with-electronic-components-and-padlock.jpg?s=612x612&w=0&k=20&c=9Wb9umNUOwZm3_vZyt1cfHBxPKi-NIDyenBfJgO7C2M=",
      "color": Colors.red,
    },
    // Technology and Programming
    {
      "title": "Full Stack Development",
      "subtitle": "Learn Full Development",
      "imageUrl": "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSwUF7FVR84dLd_2k-BSTSIcsCeGr7MrM93gw&s",
      "color": Colors.blueGrey,
    },
    {
      "title": "Data Structures",
      "subtitle": "Problem-solving tasks",
      "imageUrl": "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT0NSLNld4vHeW4RH5YLdO7cpEh0OmRAqA6Pg&s",
      "color": Colors.deepOrange,
    },
    {
      "title": "Cloud Computing",
      "subtitle": "AWS,Azure,and Cloud",
      "imageUrl": "https://e7.pngegg.com/pngimages/404/442/png-clipart-cloud-computing-and-big-data-information-technology-cloud-storage-cloud-computing-text-service.png",
      "color": Colors.lightBlueAccent,
    },
    {
      "title": "Artificial Intelligence",
      "subtitle": "AI concepts",
      "imageUrl": "https://cdn.vectorstock.com/i/500p/33/66/artificial-intelligence-icon-sign-logo-vector-49693366.jpg",
      "color": Colors.redAccent,
    },

    // Design
    {
      "title": "Graphic Designing",
      "subtitle": "Design fundamentals",
      "imageUrl": "https://t3.ftcdn.net/jpg/04/66/70/54/360_F_466705447_GYD2vEwbAtJhsSAqWflzzJcs3JV6aqZP.jpg",
      "color": Colors.purple,
    },
    {
      "title": "UX/UI Design",
      "subtitle": "Design User Interfaces",
      "imageUrl": "https://i0.wp.com/blog.knoldus.com/wp-content/uploads/2019/12/ui-ux.jpg?fit=1200%2C434&ssl=1",
      "color": Colors.orange,
    },
    {
      "title": "Animation",
      "subtitle": "Create  Animations",
      "imageUrl": "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSqrbMnkHSrD7vaWFgZ6tXcDYeTWewHlXsbng&s",
      "color": Colors.blue,
    },
    // Business
    {
      "title": "Digital Marketing",
      "subtitle": "Strategies in a digital world",
      "imageUrl": "https://t4.ftcdn.net/jpg/05/04/20/75/360_F_504207567_5GWwqsazyOyHwYXUf3CrqbilLPL4qkYJ.jpg",
      "color": Colors.indigo,
    },
    {
      "title": "Project Management",
      "subtitle": "Skills for leading projects",
      "imageUrl": "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTm_9rsN-HEoamSKWLyft8GqwArqoKUnCZTuA&s",
      "color": Colors.brown,
    },
    {
      "title": "Entrepreneurship",
      "subtitle": "Start your own business",
      "imageUrl": "https://www.shutterstock.com/image-vector/effective-solution-icon-yellow-gear-260nw-2189877243.jpg",
      "color": Colors.lightGreen,
    },

    {      "title": "NodeJS",
      "subtitle": "Website Development",
      "imageUrl": "https://cdn.iconscout.com/icon/free/png-256/free-node-js-1174925.png?f=webp&w=256",
      "color": Colors.purpleAccent,
    },
    {
      "title": "Generative AI",
      "subtitle": "CRM's & Chatbot",
      "imageUrl": "https://www.executive-advisory.com/wp-content/uploads/2024/02/What-is-Artiificial-IntelligenceAI-1.webp",
      "color": Colors.pinkAccent,
    },
    {
      "title": "HTML CSS JS",
      "subtitle": "Website Design",
      "imageUrl": "https://p92.com/binaries/content/gallery/p92website/technologies/htmlcssjs-details.png",
      "color": Colors.teal,
    },
    {
      "title": "Firebase",
      "subtitle": "Backend Development",
      "imageUrl": "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSW6eyjw-sncwZxtTnaQj66DdHF2PJ0uL6PGQ&s",
      "color": Colors.green,
    },
    // Additional random fillers for demonstration
    // ...List.generate(20, (index) => {
    //   "title": "Course ${index + 15}",
    //   "subtitle": "Details of course ${index + 15}",
    //   "imageUrl": "https://via.placeholder.com/150",
    //   "color": Colors.accents[index % Colors.accents.length],
    // }),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Courses Category',
          style: TextStyle(
              fontFamily: 'Poppins',
              fontWeight: FontWeight.bold,
              fontSize: 18,
              color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.green,
      ),   backgroundColor: AppColors.background2,
      body: GridView.builder(
        padding: const EdgeInsets.all(16),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 20,
        ),
        itemCount: courses.length,
        itemBuilder: (context, index) {
          var course = courses[index];
          return CourseCard(
            title: course['title'],
            subtitle: course['subtitle'],
            imageUrl: course['imageUrl'],
            color: course['color'],
            onTap: () => Navigator.of(context).push(
              MaterialPageRoute(builder: (Context) => CourseOverviewScreen()),
            ),
          );
        },
      ),
    );
  }
}

class CourseCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final String imageUrl;
  final Color color;
  final VoidCallback onTap;

  const CourseCard({
    Key? key,
    required this.title,
    required this.subtitle,
    required this.imageUrl,
    required this.color,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: color,
      child: InkWell(
        onTap: onTap,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.network(imageUrl, fit: BoxFit.cover),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(1.0),
              child: Text(title, style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
            ),
            Text(subtitle, style: TextStyle(color: Colors.white70)),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 6.0),
              child: ElevatedButton(
                onPressed:(){
                  Navigator.push(context, MaterialPageRoute(builder: (Context)=>applynowscreen()));
                },
                child: const Text('Apply Now'),
                style: ElevatedButton.styleFrom(
                  foregroundColor: color,
                  backgroundColor: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}