import 'package:dars3/utils/app_constants.dart';
import 'package:dars3/views/screens/pin_code_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';

int countTrue = 0;
int countFalse = 0;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  void toggleThemeMode(bool value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool("theme", value);
    AppConstants.themeMode = value ? ThemeMode.dark : ThemeMode.light;
    setState(() {});
  }

  void backgroundImage(String imageUrl) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(
      () {
        if (imageUrl.trim().isNotEmpty) {
          AppConstants.images = imageUrl;
          preferences.setString("image", AppConstants.images);
        }
      },
    );
  }

  void appBarColor(Color appBarStayle) {
    AppConstants.appBarColor = appBarStayle;
    setState(() {});
  }

  void fontSize(double textFontSize) {
    print(textFontSize);
    AppConstants.fontSize = textFontSize;
    setState(() {});
  }

  void textColor(Color textFontColor) {
    AppConstants.textColor = textFontColor;
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    AppConstants().setConstants().then((value) {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    double sceenWidth = MediaQuery.of(context).size.width;
    return ScreenUtilInit(
        designSize: sceenWidth > 800 ? Size(1440, 900) : Size(414, 896),
        builder: (context, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              appBarTheme: const AppBarTheme(
                backgroundColor: Colors.amber,
              ),
            ),
            darkTheme: ThemeData.dark(),
            themeMode: AppConstants.themeMode,
            // home: const PinCodeScreen(),
            home: PinCodeScreen(
              onThemeChanged: toggleThemeMode,
              onBackgroundImageChanged: backgroundImage,
              onAppBarColorChanged: appBarColor,
              onTextFontSize: fontSize,
              onTextColor: textColor,
            ),
          );
        });
  }
}

// MaterialApp(
//             debugShowCheckedModeBanner: false,
//             home: Scaffold(
//               backgroundColor: Colors.white,
//               body: sceenWidth > 800 ? DesktopScreen() : MobilScreen(),
//             ),
//           );

