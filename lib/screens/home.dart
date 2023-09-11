import 'package:flutter/material.dart';
import 'package:hng_mobile_task_two/models/cv_data.dart';
import 'package:hng_mobile_task_two/providers/cv_data_provider.dart';
import 'package:hng_mobile_task_two/screens/edit/edit_page.dart';
import 'package:hng_mobile_task_two/widgets/spacing.dart';

import '../utils/textstyle.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    CVDataContainer cvDataContainer = CVDataContainer();
    CVData cvData = cvDataContainer.cvData;
    ScrollController scrollController = ScrollController();
    //String formattedDate = '${cvData.education.s}, ${date.year}';

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "CV",
          style: kTextStyle(30, isBold: true),
        ),
        elevation: 0,
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton.filledTonal(
              style: IconButton.styleFrom(
                  shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
              )),
              iconSize: 20,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => EditPage(),
                  ),
                );
              },
              icon: Row(
                children: [
                  Text(
                    "Edit details",
                    style: kTextStyle(16),
                  ),
                  HorizontalSpacing(5),
                  const Icon(Icons.edit),
                ],
              ),
            ),
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        children: [
          SizedBox(
            height: size.height * .18,
            child: Scrollbar(
              controller: scrollController,
              child: SingleChildScrollView(
                padding: const EdgeInsets.only(bottom: 10),
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.asset(
                        'assets/images/musty.png',
                        width: size.width * .25,
                      ),
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "${cvData.fullName}",
                          style: kTextStyle(25, isBold: true),
                          softWrap: true,
                        ),
                        Text(
                          "Slack username: ${cvData.slackUsername}",
                          style: kTextStyle(14),
                        ),
                        Text(
                          "Github handle: ${cvData.githubHandle}",
                          style: kTextStyle(14),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
          VerticalSpacing(20),
          Text(
            cvData.bio!,
            style: kTextStyle(14),
          ),
          const Divider(
            color: Colors.white,
          ),
          Text(
            "Education",
            style: kTextStyle(23, isBold: true),
          ),
          Text(
            cvData.education!.school!,
            style: kTextStyle(15),
          ),
          Text(
            cvData.education!.department!,
            style: kTextStyle(15),
          ),
          VerticalSpacing(15),
          Text(
            "Skills",
            style: kTextStyle(23, isBold: true),
          ),
          VerticalSpacing(5),
          ...cvData.skills!.map(
            (e) => Text(
              '• $e',
              style: kTextStyle(15),
            ),
          ),
          VerticalSpacing(15),
          Text(
            "Projects",
            style: kTextStyle(23, isBold: true),
          ),
          ...cvData.projects!.map(
            (e) => Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "• ${e.title}:",
                    style: kTextStyle(15, isBold: true),
                  ),
                  Text(" ${e.detail}", style: kTextStyle(15)),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
