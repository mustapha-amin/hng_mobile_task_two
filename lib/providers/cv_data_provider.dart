import 'dart:developer';

import 'package:flutter/widgets.dart';
import 'package:hng_mobile_task_two/cv_data_store.dart';
import 'package:hng_mobile_task_two/models/project.dart';

import '../models/cv_data.dart';

class CVDataContainer extends ChangeNotifier {
  late CVData cvData;

  static final CVDataContainer _instance = CVDataContainer._internal();

  factory CVDataContainer() {
    return _instance;
  }

  CVDataContainer._internal();

  void initCVData() {
    cvData = CVDataStore.cvData;
    notifyListeners();
  }

  void updateCvData(CVData newCvData) {
    cvData = newCvData;
    notifyListeners();
  }

  // skills

  void addToSkills(String skill) {
    cvData.skills!.add(skill);
    notifyListeners();
  }

  void removeFromSkills(int index) {
    cvData.skills!.removeAt(index);
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

  void removeFromProjects(int index) {
    cvData.projects!.removeAt(index);
    notifyListeners();
  }

  void editproject(Project project, int index) {
    cvData.projects![index] = project;
    notifyListeners();
  }

  void updateStartDate(DateTime? startDate) {
    cvData.education!.startDate = startDate;
    notifyListeners();
  }

  void updateEndDate(DateTime? endDate) {
    cvData.education!.endDate = endDate;
    notifyListeners();
  }
}
