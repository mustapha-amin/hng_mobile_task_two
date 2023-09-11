class Education {
  String? school;
  String? department;
  DateTime? startDate;
  DateTime? endDate;

  Education({
    this.school,
    this.department,
    this.startDate,
    this.endDate,
  });

  Education copyWith({
    String? school,
    String? department,
    DateTime? startDate,
    DateTime? endDate,
  }) {
    return Education(
      school: school ?? this.school,
      department: department ?? this.department,
      startDate: startDate ?? this.startDate,
      endDate: endDate ?? this.endDate,
    );
  }
}
