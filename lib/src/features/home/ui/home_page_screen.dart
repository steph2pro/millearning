import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:millearnia/src/core/i18n/l10n.dart';
import 'package:millearnia/src/features/cv/ui/choix_model_screen.dart';
import 'package:millearnia/src/features/home/ui/course_detail.dart';
import 'package:millearnia/src/features/home/ui/home_screen.dart';

@RoutePage()
class HomePageScreen extends StatefulWidget {
  const HomePageScreen({super.key});

  @override
  _HomePageScreenState createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen> {

  int currentIndex = 0;
  final TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: [
        const CourseDetailScreen(),
        const HomeScreen(),
        const ChoixModelScreen(),
      ].elementAt(currentIndex),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        items:  [
          BottomNavigationBarItem(
            icon: const Icon(Icons.book),
            label: 'Cours'
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.home),
            label: 'Acceil'
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.description),
            label:'CV'
          ),
        ],
      ),
    );
  }
}
