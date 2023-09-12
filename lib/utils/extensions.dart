extension DateTimeExtention on DateTime {
  String get formattedDate {
    List<String> monthNames = [
      'January',
      'February',
      'March',
      'April',
      'May',
      'June',
      'July',
      'August',
      'September',
      'October',
      'November',
      'December',
    ];

    int day = this.day;
    String month =
        monthNames[this.month - 1]; // Subtract 1 to match the list index.
    int year = this.year;

    return '$day, $month, $year';
  }
}
