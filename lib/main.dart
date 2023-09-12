import 'package:flutter/material.dart';
import 'package:hng_mobile_task_two/providers/cv_data_provider.dart';

import 'screens/home.dart';

void main() {
  CVDataContainer().initCVData();
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData.dark(
      useMaterial3: true,
    ),
    home: const HomePage(),
  ));
}
