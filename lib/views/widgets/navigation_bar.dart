// import 'package:dars3/views/screens/home_screen.dart';
// import 'package:flutter/material.dart';

// class NavigationBars extends StatefulWidget {
//   final ValueChanged<bool> onThemeChanged;
//   final ValueChanged<String> onBackgroundImageChanged;
//   final ValueChanged<Color> onAppBarColorChanged;
//   final ValueChanged<double> onTextFontSize;
//   final ValueChanged<Color> onTextColor;
//   const NavigationBars({
//     super.key,
//     required this.onThemeChanged,
//     required this.onBackgroundImageChanged,
//     required this.onAppBarColorChanged,
//     required this.onTextFontSize,
//     required this.onTextColor,
//   });

//   @override
//   State<NavigationBars> createState() => _NavigationBarsState();
// }

// class _NavigationBarsState extends State<NavigationBars> {
//   int selectIndex = 0;
//   List<Widget> screens = [
//     HomeScreen(
//       onThemeChanged: widget.onThemeChanged,
//       onBackgroundImageChanged: widget.onBackgroundImageChanged,
//       onAppBarColorChanged: widget.onAppBarColorChanged,
//       onTextFontSize: widget.onTextFontSize,
//       onTextColor: widget.onTextColor,
//     ),
//     const Center(
//       child: Text("Onboarding screen"),
//     ),
//     const Center(
//       child: Text("Login screen"),
//     )
//   ];

//   void onItemTap(int index) {
//     setState(() {
//       selectIndex = index;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: screens[selectIndex],
//       bottomNavigationBar: BottomNavigationBar(
//         currentIndex: selectIndex,
//         onTap: onItemTap,
//         items: const [
//           BottomNavigationBarItem(
//             icon: Icon(Icons.home),
//             label: "Home",
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.search),
//             label: "Search",
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.person),
//             label: "Profile",
//           ),
//         ],
//       ),
//     );
//   }
// }

import 'package:dars3/views/screens/home_screen.dart';
import 'package:dars3/views/screens/profile_screen.dart';
import 'package:dars3/views/screens/results_screen.dart';
import 'package:flutter/material.dart';

class NavigationBars extends StatefulWidget {
  final ValueChanged<bool> onThemeChanged;
  final ValueChanged<String> onBackgroundImageChanged;
  final ValueChanged<Color> onAppBarColorChanged;
  final ValueChanged<double> onTextFontSize;
  final ValueChanged<Color> onTextColor;
  const NavigationBars({
    super.key,
    required this.onThemeChanged,
    required this.onBackgroundImageChanged,
    required this.onAppBarColorChanged,
    required this.onTextFontSize,
    required this.onTextColor,
  });

  @override
  State<NavigationBars> createState() => _NavigationBarsState();
}

class _NavigationBarsState extends State<NavigationBars> {
  int selectIndex = 0;
  late List<Widget> screens;

  @override
  void initState() {
    super.initState();
    screens = [
      HomeScreen(
        onThemeChanged: widget.onThemeChanged,
        onBackgroundImageChanged: widget.onBackgroundImageChanged,
        onAppBarColorChanged: widget.onAppBarColorChanged,
        onTextFontSize: widget.onTextFontSize,
        onTextColor: widget.onTextColor,
      ),
      ResultScreen(),
      ProfileScreen(),
    ];
  }

  void onItemTap(int index) {
    setState(() {
      selectIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[selectIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectIndex,
        onTap: onItemTap,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: "Search",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "Profile",
          ),
        ],
      ),
    );
  }
}
