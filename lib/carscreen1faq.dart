import 'package:flutter/material.dart';

class FaqScreen extends StatefulWidget {
  const FaqScreen({Key? key}) : super(key: key);

  @override
  State<FaqScreen> createState() => _FaqScreenState();
}

class _FaqScreenState extends State<FaqScreen> {
  ExpansionTileController mcontroller=ExpansionTileController();
  // It's best to define the FAQs list inside the state class if it doesn't need to be accessed externally
  final List<Map<String, dynamic>> faqs = [
    {
      'title': 'Why You Were Not Selected',
      'content': 'Dear applicants, we believe in transparency, and we\'d like to highlight a few reasons why some applications weren\'t successful in our internship selection process.'
          '\n\n- Lack of Domain Knowledge: Our internship program is designed to provide immersive experiences in specific domains. This time, we observed that some applications did not showcase a strong understanding of the domain they applied for, hindering their chances of success.'
          '\n\n- Limited Engagement: Successful interns contribute not only within our company but also to the community around them. We noticed that some applicants didn\'t engage with our news and updates, which is a crucial aspect of our internship culture.'
          '\n\n- Multiple Domain Submissions: Applicants who apply for multiple domains often do not tailor their applications sufficiently for each specific area, reducing their overall chance of being selected.',
    },
    {
      'title': 'How to Apply',
      'content': 'Applying for our internship is simple! Visit our careers page, select the internship that fits your skills, and submit your application with a tailored cover letter and your resume. Remember to focus your application on the specific domain you are interested in.',
    },
    {
      'title': 'Benefits of Interning with Us',
      'content': 'Interning at our company offers numerous benefits including hands-on experience in your field of study, networking opportunities with professionals, and a potential path to full-time employment.'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('FAQs'),
        centerTitle: true,
      ),
      body:ExpansionTile(
             title: Text("'Why You Were Not Selected"),
      ),
    );
  }
}
