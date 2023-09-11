import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:hng_mobile_task_two/models/cv_data.dart';
import 'package:hng_mobile_task_two/providers/cv_data_provider.dart';
import 'package:hng_mobile_task_two/utils/textstyle.dart';

import '../../widgets/spacing.dart';

class AboutMeSection extends StatefulWidget {
  AboutMeSection({super.key});

  @override
  State<AboutMeSection> createState() => _AboutMeSectionState();
}

class _AboutMeSectionState extends State<AboutMeSection> {
  CVDataContainer cvDataContainer = CVDataContainer();
  late TextEditingController nameController,
      slackUsernameController,
      githubHandleController,
      bioController;

  @override
  void initState() {
    CVData cvData = cvDataContainer.cvData;
    nameController = TextEditingController(text: cvData.fullName);
    slackUsernameController = TextEditingController(text: cvData.slackUsername);
    githubHandleController = TextEditingController(text: cvData.githubHandle);
    bioController = TextEditingController(text: cvData.bio);

    nameController.addListener(() {
      cvDataContainer.updateCvData(
        cvData.copyWith(fullName: nameController.text),
      );
    });

    slackUsernameController.addListener(() {
      cvDataContainer.updateCvData(
        cvData.copyWith(slackUsername: slackUsernameController.text),
      );
    });

    githubHandleController.addListener(() {
      cvDataContainer.updateCvData(
        cvData.copyWith(githubHandle: githubHandleController.text),
      );
    });

    bioController.addListener(() {
      cvDataContainer.updateCvData(
        cvData.copyWith(bio: bioController.text),
      );
    });

    super.initState();
  }

  InputDecoration textDecoration(String label) => InputDecoration(
        border: const OutlineInputBorder(),
        labelText: label,
        labelStyle: kTextStyle(15),
      );

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.only(top: 10),
      children: [
        TextFormField(
          style: kTextStyle(15),
          controller: nameController,
          decoration: textDecoration("Name"),
        ),
        VerticalSpacing(15),
        TextFormField(
          style: kTextStyle(15),
          controller: slackUsernameController,
          decoration: textDecoration("Slack username"),
        ),
        VerticalSpacing(15),
        TextFormField(
          style: kTextStyle(15),
          controller: githubHandleController,
          decoration: textDecoration("Github handle"),
        ),
        VerticalSpacing(15),
        TextFormField(
          style: kTextStyle(15),
          controller: bioController,
          maxLines: 5,
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
            hintText: 'Bio',
          ),
        ),
      ],
    );
  }
}
