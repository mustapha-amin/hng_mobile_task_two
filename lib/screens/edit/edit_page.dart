import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:hng_mobile_task_two/providers/cv_data_provider.dart';
import 'package:hng_mobile_task_two/screens/edit/about.dart';
import 'package:hng_mobile_task_two/screens/edit/education.dart';
import 'package:hng_mobile_task_two/screens/edit/experience.dart';
import 'package:hng_mobile_task_two/utils/textstyle.dart';
import 'package:hng_mobile_task_two/widgets/segmented_button.dart';
import 'package:hng_mobile_task_two/widgets/spacing.dart';

class EditPage extends StatefulWidget {
  EditPage({super.key});

  @override
  State<EditPage> createState() => _EditPageState();
}

class _EditPageState extends State<EditPage> {
  CVDataContainer cvDataContainer = CVDataContainer();
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Edit CV Info",
          style: kTextStyle(20, isBold: true),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pop(context);
              log(cvDataContainer.cvData.education!.startDate!.day.toString());
            },
            icon: const Icon(Icons.done),
          )
        ],
      ),
      body: Form(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              SizedBox(
                height: size.height * .15,
                child: Row(
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: () => setState(() => _selectedIndex = 0),
                        child: CustomSegmentedButton(
                          title: "About Me",
                          iconData: Icons.person,
                          containerColor: _selectedIndex == 0
                              ? Colors.grey[200]
                              : Theme.of(context).scaffoldBackgroundColor,
                          titleAndIconColor:
                              _selectedIndex == 0 ? Colors.black : Colors.white,
                        ),
                      ),
                    ),
                    Expanded(
                      child: GestureDetector(
                        onTap: () => setState(() => _selectedIndex = 1),
                        child: CustomSegmentedButton(
                          title: "Experience",
                          iconData: Icons.work,
                          containerColor: _selectedIndex == 1
                              ? Colors.grey[200]
                              : Theme.of(context).scaffoldBackgroundColor,
                          titleAndIconColor:
                              _selectedIndex == 1 ? Colors.black : Colors.white,
                        ),
                      ),
                    ),
                    Expanded(
                      child: GestureDetector(
                        onTap: () => setState(() => _selectedIndex = 2),
                        child: CustomSegmentedButton(
                          title: "Education",
                          iconData: Icons.book,
                          containerColor: _selectedIndex == 2
                              ? Colors.grey[200]
                              : Theme.of(context).scaffoldBackgroundColor,
                          titleAndIconColor:
                              _selectedIndex == 2 ? Colors.black : Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              VerticalSpacing(30),
              Expanded(
                child: switch (_selectedIndex) {
                  0 => AboutMeSection(),
                  1 => ExperienceSection(),
                  _ => EducationSection()
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
