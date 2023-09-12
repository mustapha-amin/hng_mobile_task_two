import 'package:hng_mobile_task_two/models/cv_data.dart';

import 'models/education.dart';
import 'models/project.dart';

class CVDataStore {
  static CVData cvData = CVData(
    fullName: "Mustapha Amin",
    email: "mustaphaamin2003@gmail.com",
    phoneNumber: 7069510236,
    slackUsername: "Mustieyy",
    githubHandle: "mustapha-amin",
    bio:
        "A flutter developer with a year and a half years of experience with deep "
        "passion for crafting seamless and intuitive mobile applications",
    education: Education(
      school: "Bayero University, Kano",
      department: "Software Engineering",
      startDate: DateTime(2019, 1),
    ),
    skills: [
      "Flutter",
      "Dart",
      "Firebase",
      "Version control: Git and Github",
      "Local data persistance: Hive DB and shared preferences",
      "State management: Provider",
      "API integeration",
    ],
    projects: [
      Project(
        title: "Conversio",
        detail:
            "A messaging app built with flutter and firebase. It's features include authentication, "
            "cloud storage with firebase cloud firestore, light and dark theme mode, shared preference for "
            "saving preferred theme mode and state management with provider.",
      ),
      Project(
        title: "Crypto price monitor",
        detail:
            " It’s an app that fetches prices of crypto coins from CoinGecko api. It's "
            "features include top performing coins in the last 24 hours, prices of 40 most popular coins on "
            "the home page, ability to search any coin of your choice to view the price, chart sparkline for "
            "prices of each coin, etc.",
      ),
      Project(
        title: "Quizzly",
        detail:
            "An app that allows users to take quizzes based on different categories such as politics, "
            "anime, movies, etc. It fetches quizzes from OpenTDB api.",
      ),
      Project(
        title: "GoShop",
        detail:
            "An e-commerce app including an admin dashboard i'm building at the "
            "moment with flutter and firebase. It's features at the moment include authentication, product"
            "catalog, shopping cart and checkout.  ",
      )
    ],
  );
}
