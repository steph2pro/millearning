import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:millearnia/src/core/i18n/l10n.dart';
import 'package:millearnia/src/core/routing/app_router.dart';
import 'package:millearnia/src/core/theme/app_size.dart';
import 'package:millearnia/src/shared/components/atoms/dividers/labeled_divider.dart';
import 'package:millearnia/src/shared/components/forms/input.dart';
import 'package:millearnia/src/shared/components/home_components/categorie.dart';
import 'package:millearnia/src/shared/components/home_components/course_component.dart';
import 'package:millearnia/src/shared/components/onboarding/onboarding_item.dart';
import 'package:millearnia/src/shared/components/onboarding/page_indicators.dart';
import 'package:millearnia/src/shared/extensions/context_extensions.dart';

@RoutePage()
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  
    final TextEditingController _searshController = TextEditingController();
     final List<Map<String, String>> categories = [
    {'img': 'assets/images/art.png', 'title': 'Art'},
    {'img': 'assets/images/coding.png', 'title': 'Coding'},
    {'img': 'assets/images/marketing.png', 'title': 'Marketing'},
    {'img': 'assets/images/business.png', 'title': 'Business'},
  ];
   final List<Map<String, String>> Courses = [
    {'img': 'assets/images/course1.png', 'title': 'Design Thinking Fundamental','star':' 4.8','name':'Robert Green','prise':'180.00','btnText':'Best seller'},
    {'img': 'assets/images/course2.png', 'title': '3D Illustration Des','star':'4.9','name':'John Doe','prise':'250.00','btnText':'Recommer'},
  ];
   final List<Map<String, String>> profiles = [
    {'img': 'assets/images/profile1.png', 'title': 'Esther T.'},
    {'img': 'assets/images/profile2.png', 'title': 'Jenny M.'},
    {'img': 'assets/images/profile3.png', 'title': 'Jacob U.'},
    {'img': 'assets/images/profile4.png', 'title': 'Bessi K.'},
  ];
  @override
  void dispose() {
    _searshController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        toolbarHeight: 0,
        backgroundColor: context.colorScheme.primary,
      ),
      backgroundColor: context.colorScheme.onPrimary,
      
      body: ListView(
        children: [
         Container(
      padding: EdgeInsets.all(23),
      width: double.infinity,
      height: 200,
      decoration: BoxDecoration(
        color: context.colorScheme.primary, // Fond bleu
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(20),
          bottomRight: Radius.circular(20),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '${I18n.of(context).hi}Samuel',
                style: context.textTheme.bodyLarge?.copyWith(color:context.colorScheme.onPrimary)
              ),
              Container(
                    width: 38,
                    height: 38,
                    decoration: BoxDecoration(
                      color: context.colorScheme.primaryContainer, // Fond bleu avec opacité
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: 
                    Stack(
                // clipBehavior: Clip.none,
                children: [
                  IconButton(
                      icon: Icon(
                        Icons.notifications,
                        color: context.colorScheme.onPrimary,
                      ),
                      onPressed: () {},
                    ),

                  Positioned(
                    top: 8,
                    right: 6,
                    child: Container(
                      width: 10,
                      height: 10,
                      decoration: BoxDecoration(
                        color: context.colorScheme.error,
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                ],
              ),                  ),
              
            ],
          ),
          gapH10,
          Text(
            I18n.of(context).letStart,
            style: context.textTheme.bodySmall?.copyWith(color:context.colorScheme.onPrimary)
          ),
          gapH30,
          Expanded(
            child:  Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              
              Expanded(
                child: Input(
                  controller: _searshController,
                   prefixIcon: Icon(
                      Icons.search,
                      color: context.colorScheme.primary,
                    ),
                ),
                ),
                gapW6,
              Container(
                // margin: EdgeInsets.only(bottom: 10),
                width: 49,
                height: 59,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: IconButton(
                  icon: Icon(
                    Icons.sync,
                    color: context.colorScheme.primary,
                  ),
                  onPressed: () {},
                ),
              ),
            ],
          ),
          )
        
        ],
      ),
    ),
    Padding(
      padding: EdgeInsets.all(23),
      child: Column(
        children: [
           Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                  I18n.of(context).categories,
                  style: context.textTheme.titleLarge
                  ),
                  gapW4,
                  InkWell(
                    onTap: (){
                    }, 
                    child: Text(
                      I18n.of(context).seeAll,
                      style: context.textTheme.bodySmall!.copyWith(fontSize: 14,color: context.colorScheme.surfaceTint)
                    ),
                  )
                ],
              ),
              gapH12,
              Container(
                width: double.infinity,
                height: 100,
                child:ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: categories.length,
                    itemBuilder: (context, index) {
                      final category = categories[index];
                      return Categorie(
                        title: category['title']!,
                        contentImage: category['img'],
                      );
                    },
                  ),
              
              ),
              gapH20,
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                  I18n.of(context).pupularCourse,
                  style: context.textTheme.titleLarge
                  ),
                  gapW4,
                  InkWell(
                    onTap: (){
                    }, 
                    child: Text(
                      I18n.of(context).seeAll,
                      style: context.textTheme.bodySmall!.copyWith(fontSize: 14,color: context.colorScheme.surfaceTint)
                    ),
                  )
                ],
              ),
               gapH12,
              Container(
                width: double.infinity,
                height: 300,
                child:ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: categories.length,
                    itemBuilder: (context, index) {
                      final course = Courses[index];
                      return 
              CourseComponent(
                title: course['title']!,
                 star: course['star']!, 
                 contentImage: course['img']!,
                  name: course['name']!, 
                  prise:course['prise']!,
                   btnText:course['btnText']!);
                    },
                  ),
              
              ),
              // gapH10,
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                  I18n.of(context).topMentor,
                  style: context.textTheme.titleLarge
                  ),
                  gapW4,
                  InkWell(
                    onTap: (){
                    }, 
                    child: Text(
                      I18n.of(context).seeAll,
                      style: context.textTheme.bodySmall!.copyWith(fontSize: 14,color: context.colorScheme.surfaceTint)
                    ),
                  )
                ],
              ),
               gapH12,
              Container(
                width: double.infinity,
                height: 100,
                child:ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: categories.length,
                    itemBuilder: (context, index) {
                      final profile = profiles[index];
                      return Categorie(
                        title: profile['title']!,
                        contentImage: profile['img'],
                      );
                    },
                  ),
              
              ),
             

        ],
      ),
    )
          
          
        ],
      ),
    );
  }
}
