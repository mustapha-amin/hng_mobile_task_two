import 'package:flutter/material.dart';
import 'package:hng_mobile_task_two/models/cv_data.dart';
import 'package:hng_mobile_task_two/providers/cv_data_provider.dart';
import 'package:hng_mobile_task_two/screens/edit/edit_page.dart';
import 'package:hng_mobile_task_two/widgets/spacing.dart';

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
        title: const Text(
          "CV",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
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
                  const Text(
                    "Edit details",
                    style: TextStyle(fontSize: 16),
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
              thumbVisibility: true,
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
                          style: const TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                          ),
                          softWrap: true,
                        ),
                        Text(
                          "Slack username: ${cvData.slackUsername}",
                          style: const TextStyle(fontSize: 15),
                        ),
                        Text(
                          "Github handle: ${cvData.githubHandle}",
                          style: const TextStyle(fontSize: 15),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
          VerticalSpacing(20),
          Text(cvData.bio!),
          const Divider(
            color: Colors.white,
          ),
          const Text(
            "Education",
            style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
          ),
          Text(
            cvData.education!.school!,
            style: const TextStyle(fontSize: 15),
          ),
          Text(
            cvData.education!.department!,
            style: const TextStyle(fontSize: 15),
          ),
          VerticalSpacing(15),
          const Text(
            "Skills",
            style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
          ),
          VerticalSpacing(5),
          ...cvData.skills!.map(
            (e) => Text(
              '• $e',
              style: const TextStyle(fontSize: 15),
            ),
          ),
          VerticalSpacing(15),
          const Text(
            "Projects",
            style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
          ),
          ...cvData.projects!.map(
            (e) => Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "• ${e.title}:",
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(" ${e.detail}"),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
