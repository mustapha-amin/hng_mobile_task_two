class Project {
  String? title;
  String? detail;

  Project({this.title, this.detail});

  Project copyWith({String? title, String? detail}) {
    return Project(
      title: title ?? this.title,
      detail: detail ?? this.detail,
    );
  }
}
