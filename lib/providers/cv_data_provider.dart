import 'package:flutter/widgets.dart';
import 'package:hng_mobile_task_two/cv_data_store.dart';
import 'package:hng_mobile_task_two/models/project.dart';

import '../models/cv_data.dart';

class CVDataContainer extends ChangeNotifier {
  CVData cvData = CVDataStore.cvData;

  static final CVDataContainer _instance = CVDataContainer._internal();

  factory CVDataContainer() {
    return _instance;
  }

  CVDataContainer._internal();

  void updateCvData(CVData newCvData) {
    cvData = newCvData;
    notifyListeners();
  }

  // skills

  void addToSkills(String skill) {
    cvData.skills!.add(skill);
    notifyListeners();
  }

  void removeFromSkills(String skill) {
    cvData.skills!.remove(skill);
    notifyListeners();
  }

  void editSkill(String skill, int index) {
    cvData.skills![index] = skill;
    notifyListeners();
  }

  // projects

  void addToProjects(Project project) {
    cvData.projects!.add(project);
    notifyListeners();
  }

  void removeFromProjects(Project project) {
    cvData.projects!.remove(project);
    notifyListeners();
  }

  void editproject(Project project, int index) {
    cvData.projects![index] = project;
    notifyListeners();
  }
}
