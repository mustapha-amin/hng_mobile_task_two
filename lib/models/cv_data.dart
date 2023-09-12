import 'package:hng_mobile_task_two/models/education.dart';
import 'package:hng_mobile_task_two/models/project.dart';

class CVData {
  String? fullName;
  String? email;
  int? phoneNumber;
  String? slackUsername;
  String? githubHandle;
  String? bio;
  Education? education;
  List<String>? skills = [];
  List<Project>? projects = [];

  CVData({
    this.fullName,
    this.email,
    this.phoneNumber,
    this.slackUsername,
    this.githubHandle,
    this.bio,
    this.education,
    this.skills,
    this.projects,
  });

  CVData copyWith({
    String? fullName,
    String? email,
    int? phoneNumber,
    String? slackUsername,
    String? githubHandle,
    String? bio,
    Education? education,
    List<String>? skills,
    List<Project>? projects,
  }) {
    return CVData(
      fullName: fullName ?? this.fullName,
      email: email ?? this.email,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      slackUsername: slackUsername ?? this.slackUsername,
      githubHandle: githubHandle ?? this.githubHandle,
      bio: bio ?? this.bio,
      education: education ?? this.education,
      skills: skills ?? this.skills,
      projects: projects ?? this.projects,
    );
  }
}
