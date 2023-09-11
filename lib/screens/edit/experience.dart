import 'package:flutter/material.dart';
import 'package:hng_mobile_task_two/models/project.dart';
import 'package:hng_mobile_task_two/providers/cv_data_provider.dart';
import 'package:hng_mobile_task_two/widgets/dialog.dart';

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
          style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
        ),
        ...cvDataContainer.cvData.skills!.map(
          (skill) => Row(
            children: [
              SizedBox(
                width: size.width * .6,
                child: Text(skill),
              ),
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
                        content:
                            const Text("Do you want to delete this skill?"),
                        action: () => cvDataContainer.removeFromSkills(skill),
                        actionTitle: "Yes",
                        dismissalTitle: "No",
                      );
                    },
                  );
                },
                icon: const Icon(Icons.delete),
              )
            ],
          ),
        ),
        TextButton(
          onPressed: () {},
          child: const Text("Add a skill"),
        ),
        ...cvDataContainer.cvData.projects!.map(
          (e) => Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(e.title!),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      IconButton(onPressed: () {}, icon: Icon(Icons.edit)),
                      IconButton(onPressed: () {}, icon: Icon(Icons.delete)),
                    ],
                  )
                ],
              ),
              Text(e.detail!),
            ],
          ),
        ),
        TextButton(
          onPressed: () {
            showDialog(
              context: context,
              builder: (context) {
                return CustomAlertDialog(
                  title: "Add a project",
                  content: Row(
                    children: [
                      TextField(
                        controller: projectTitleContoller,
                      ),
                      TextField(
                        controller: projectDetailController,
                      ),
                    ],
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
          child: const Text("Add a project"),
        ),
      ],
    );
  }
}
