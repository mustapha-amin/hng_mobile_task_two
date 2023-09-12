import 'package:flutter/material.dart';
import 'package:hng_mobile_task_two/models/project.dart';
import 'package:hng_mobile_task_two/providers/cv_data_provider.dart';
import 'package:hng_mobile_task_two/widgets/dialog.dart';
import 'package:hng_mobile_task_two/widgets/spacing.dart';

import '../../utils/textstyle.dart';

class ExperienceSection extends StatefulWidget {
  CVDataContainer? cvDataContainer;
  ExperienceSection({this.cvDataContainer, super.key});

  @override
  State<ExperienceSection> createState() => _ExperienceSectionState();
}

class _ExperienceSectionState extends State<ExperienceSection> {
  CVDataContainer cvDataContainer = CVDataContainer();
  TextEditingController skillController = TextEditingController();
  TextEditingController projectTitleContoller = TextEditingController();
  TextEditingController projectDetailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return ListView(
      physics: const BouncingScrollPhysics(),
      children: [
        Text(
          "Skills",
          style: kTextStyle(28, isBold: true),
        ),
        ...cvDataContainer.cvData.skills!.map(
          (skill) => Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: size.width * .6,
                child: Text(skill, style: kTextStyle(15)),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  IconButton(
                    onPressed: () {
                      int index = cvDataContainer.cvData.skills!.indexOf(skill);
                      setState(() {
                        skillController.text = skill;
                      });
                      showDialog(
                        context: context,
                        builder: (context) {
                          return CustomAlertDialog(
                            title: "Edit Skill",
                            content: TextField(
                              style: kTextStyle(15),
                              controller: skillController,
                            ),
                            action: () => cvDataContainer.editSkill(
                                skillController.text, index),
                            actionTitle: "Save",
                            dismissalTitle: "Cancel",
                          );
                        },
                      );
                    },
                    icon: const Icon(Icons.edit),
                  ),
                  IconButton(
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return CustomAlertDialog(
                            title: "Delete Skill",
                            content: Text(
                              "Do you want to delete this skill?",
                              style: kTextStyle(15),
                            ),
                            action: () =>
                                cvDataContainer.removeFromSkills(skill),
                            actionTitle: "Yes",
                            dismissalTitle: "No",
                          );
                        },
                      );
                    },
                    icon: const Icon(Icons.delete),
                  )
                ],
              )
            ],
          ),
        ),
        VerticalSpacing(20),
        OutlinedButton(
          onPressed: () {
            setState(() {
              skillController.text = '';
            });
            showDialog(
              context: context,
              builder: (context) {
                return CustomAlertDialog(
                  title: "Add Skills",
                  content: TextField(
                    controller: skillController,
                  ),
                  action: () =>
                      cvDataContainer.addToSkills(skillController.text),
                  actionTitle: "Yes",
                  dismissalTitle: "No",
                );
              },
            );
          },
          child: Text(
            "Add a skill",
            style: kTextStyle(15),
          ),
        ),
        VerticalSpacing(20),
        ...cvDataContainer.cvData.projects!.map(
          (e) => Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    e.title!,
                    style: kTextStyle(18, isBold: true),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      IconButton(onPressed: () {}, icon: Icon(Icons.edit)),
                      IconButton(onPressed: () {}, icon: Icon(Icons.delete)),
                    ],
                  )
                ],
              ),
              Text(
                e.detail!,
                style: kTextStyle(15),
              ),
            ],
          ),
        ),
        VerticalSpacing(20),
        OutlinedButton(
          onPressed: () {
            showDialog(
              context: context,
              builder: (context) {
                return CustomAlertDialog(
                  title: "Add a project",
                  content: SizedBox(
                    height: size.height * .18,
                    child: Column(
                      children: [
                        TextField(
                          controller: projectTitleContoller,
                        ),
                        TextField(
                          controller: projectDetailController,
                        ),
                      ],
                    ),
                  ),
                  action: () => cvDataContainer.addToProjects(
                    Project(
                      title: projectTitleContoller.text,
                      detail: projectDetailController.text,
                    ),
                  ),
                  actionTitle: "Save",
                  dismissalTitle: "Cancel",
                );
              },
            );
          },
          child: Text("Add a project", style: kTextStyle(15)),
        ),
      ],
    );
  }
}
