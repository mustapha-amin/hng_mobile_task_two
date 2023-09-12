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
      emailController,
      phoneNumberController,
      slackUsernameController,
      githubHandleController,
      bioController;

  @override
  void initState() {
    CVData cvData = cvDataContainer.cvData;
    nameController = TextEditingController(text: cvData.fullName);
    emailController = TextEditingController(text: cvData.email);
    phoneNumberController =
        TextEditingController(text: cvData.phoneNumber.toString());
    slackUsernameController = TextEditingController(text: cvData.slackUsername);
    githubHandleController = TextEditingController(text: cvData.githubHandle);
    bioController = TextEditingController(text: cvData.bio);

    nameController.addListener(() {
      cvDataContainer.updateCvData(
        cvData.copyWith(fullName: nameController.text),
      );
    });

    emailController.addListener(() {
      cvDataContainer.updateCvData(
        cvData.copyWith(email: emailController.text),
      );
    });

    phoneNumberController.addListener(() {
      cvDataContainer.updateCvData(
        cvData.copyWith(phoneNumber: int.parse(phoneNumberController.text)),
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
    Size size = MediaQuery.of(context).size;
    return ListView(
      padding: const EdgeInsets.only(top: 10),
      children: [
        TextFormField(
          style: kTextStyle(15),
          controller: nameController,
          decoration: textDecoration("Name").copyWith(
            suffixIcon: const Icon(
              Icons.person,
              size: 30,
            ),
          ),
        ),
        VerticalSpacing(15),
        TextFormField(
          style: kTextStyle(15),
          controller: emailController,
          decoration: textDecoration("Email").copyWith(
            suffixIcon: const Icon(
              Icons.email,
              size: 30,
            ),
          ),
        ),
        VerticalSpacing(15),
        TextFormField(
          style: kTextStyle(15),
          controller: phoneNumberController,
          keyboardType: TextInputType.number,
          decoration: textDecoration("Phone number").copyWith(
            suffixIcon: const Icon(
              Icons.phone,
              size: 30,
            ),
            prefix: Text("234"),
          ),
        ),
        VerticalSpacing(15),
        TextFormField(
          style: kTextStyle(15),
          controller: slackUsernameController,
          decoration: textDecoration("Slack username").copyWith(
            suffixIcon: Image.asset(
              'assets/images/slack.png',
              width: size.width * .1,
            ),
          ),
        ),
        VerticalSpacing(15),
        TextFormField(
          style: kTextStyle(15),
          controller: githubHandleController,
          decoration: textDecoration("Github handle").copyWith(
            suffixIcon: Image.asset(
              'assets/images/github.png',
              color: Colors.white,
              width: size.width * .1,
            ),
          ),
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
          maxLength: 150,
        ),
      ],
    );
  }
}
