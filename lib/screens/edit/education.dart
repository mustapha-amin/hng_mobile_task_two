import 'package:flutter/material.dart';
import 'package:hng_mobile_task_two/providers/cv_data_provider.dart';

import '../../models/cv_data.dart';
import '../../utils/textstyle.dart';
import '../../widgets/spacing.dart';

class EducationSection extends StatefulWidget {
  EducationSection({super.key});

  @override
  State<EducationSection> createState() => _EducationSectionState();
}

class _EducationSectionState extends State<EducationSection> {
  CVDataContainer cvDataContainer = CVDataContainer();
  late TextEditingController schoolController, departmentController;

  @override
  void initState() {
    CVData cvData = cvDataContainer.cvData;
    schoolController = TextEditingController(text: cvData.education!.school);
    departmentController =
        TextEditingController(text: cvData.education!.department);
    schoolController.addListener(() {
      cvDataContainer.updateCvData(
        cvData.copyWith(
          education: cvDataContainer.cvData.education!.copyWith(
            school: schoolController.text,
          ),
        ),
      );
    });

    departmentController.addListener(() {
      cvDataContainer.updateCvData(
        cvData.copyWith(
          education: cvDataContainer.cvData.education!.copyWith(
            department: departmentController.text,
          ),
        ),
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
      children: [
        TextFormField(
          style: kTextStyle(15),
          controller: schoolController,
          decoration: textDecoration("School"),
        ),
        VerticalSpacing(8),
        TextFormField(
          style: kTextStyle(15),
          controller: departmentController,
          decoration: textDecoration("Slack username"),
        ),
        VerticalSpacing(8),
      ],
    );
  }
}
