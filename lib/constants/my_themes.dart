import 'package:flutter/material.dart';
import 'package:movie_app/constants/my_colors.dart';

class MyThemes {
  static final darkTheme = ThemeData(
    appBarTheme: AppBarTheme(
      backgroundColor: Color.fromARGB(255, 2, 20, 27),
      actionsIconTheme:
          const IconThemeData(color: Color.fromARGB(255, 255, 255, 255)),
    ),
    scaffoldBackgroundColor: MyColors.myGrey,
    colorScheme: ColorScheme.dark(),
  );

  static final lightTheme = ThemeData(
    appBarTheme: AppBarTheme(
      backgroundColor: MyColors.myYellow,
      actionsIconTheme: const IconThemeData(color: Colors.white),
    ),
    scaffoldBackgroundColor: Color.fromARGB(255, 253, 249, 238),
    colorScheme: ColorScheme.light(),
  );
}
