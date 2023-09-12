import 'package:flutter/material.dart';
import 'package:hng_mobile_task_two/providers/cv_data_provider.dart';
import 'package:hng_mobile_task_two/utils/extensions.dart';

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

  late TextEditingController schoolController,
      departmentController,
      startDateController,
      endDateController;

  @override
  void initState() {
    CVData cvData = cvDataContainer.cvData;
    schoolController = TextEditingController(text: cvData.education!.school);
    departmentController =
        TextEditingController(text: cvData.education!.department);

    startDateController = TextEditingController(
      text: cvData.education!.startDate!.formattedDate,
    );
    endDateController = TextEditingController(
      text: cvData.education!.endDate!.formattedDate,
    );
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

  Future<void> _selectDate(
      BuildContext context, DateTime selectedDate, bool isStartDate) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(1900, 1, 1),
        lastDate: DateTime(2101, 1, 1),
        builder: (context, child) {
          return Theme(
            data: ThemeData.dark().copyWith(
                textTheme: const TextTheme(
              headlineMedium: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 30,
                letterSpacing: 0,
                fontFamily: "Montserrat",
              ),
            )),
            child: child!,
          );
        });

    if (picked != null && picked != selectedDate) {
      // Do something with the selected date.
      setState(() {
        selectedDate = picked;
      });

      isStartDate
          ? cvDataContainer.updateStartDate(selectedDate)
          : cvDataContainer.updateEndDate(selectedDate);
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    CVData cvData = cvDataContainer.cvData;
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
          decoration: textDecoration("Department"),
        ),
        VerticalSpacing(8),
        GestureDetector(
          onTap: () {
            _selectDate(context, cvData.education!.startDate!, true);
          },
          child: SingleChildScrollView(
            child: Container(
              width: size.width,
              height: 63,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(6),
              ),
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.only(left: 10),
              child: Text(
                cvData.education!.startDate!.formattedDate,
                style: kTextStyle(15),
              ),
            ),
          ),
        ),
        VerticalSpacing(8),
        GestureDetector(
          onTap: () {
            _selectDate(context, cvData.education!.endDate!, false);
          },
          child: Container(
            width: size.width,
            height: 63,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(6),
            ),
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.only(left: 10),
            child: Text(
              cvData.education!.endDate!.formattedDate,
              style: kTextStyle(15),
            ),
          ),
        ),
      ],
    );
  }
}
