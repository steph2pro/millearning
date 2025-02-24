import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:millearnia/src/core/i18n/l10n.dart';
import 'package:millearnia/src/core/routing/app_router.dart';
import 'package:millearnia/src/core/theme/app_size.dart';
import 'package:millearnia/src/features/home/ui/categories.dart';
import 'package:millearnia/src/features/home/ui/mentors.dart';
import 'package:millearnia/src/features/home/ui/profession.dart';
import 'package:millearnia/src/features/home/ui/courses.dart';
import 'package:millearnia/src/shared/components/courses/course_title.dart';
import 'package:millearnia/src/shared/components/forms/input.dart';
import 'package:millearnia/src/shared/extensions/context_extensions.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:millearnia/src/shared/components/string_extionsions.dart';

@RoutePage()
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
    
  

    final TextEditingController _searshController = TextEditingController();
   
  

  @override
  void dispose() {
    _searshController.dispose();
    super.dispose();
  }
  String? name; // Déclarer une variable pour stocker l'ID de l'utilisateur
int? userId;
  // Récupérer l'ID et les autres informations de l'utilisateur
  Future<void> getUserData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
     userId = prefs.getInt('id');
     name = prefs.getString('name');
    // String? email = prefs.getString('email');
    // String? phone = prefs.getString('phone');
    print('********* $name ************');
    setState(() {}); // Rafraîchir l'interface pour que le nom soit disponible
  }

  @override
  void initState() {
    super.initState();
    getUserData(); // Appeler la méthode pour récupérer les données dès que l'écran est construit
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
            '${I18n.of(context).hi} ${name?.capitalize().truncateWithEllipsis(20)}',
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
                margin: EdgeInsets.only(bottom: 10),
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
      padding: EdgeInsets.all(20),
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
              
        ],
      ),
    ),
     // Ajout du widget Categories ici
    Categories(),
    
          //profession
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20,vertical: 12),
                child: Row(
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
                ),
              //  Expanded(
              //    child: 
              //   FutureBuilder(
              //   future: getUserData(),
              //   builder: (context, snapshot) {
              //     if (userId == null) {
              //       return const Center(child: CircularProgressIndicator());
              //     }
              //     return  Professions(userId: userId!,);
              //   },
              // ),
              // ),
                Professions(),
             
           Padding(
                padding: EdgeInsets.symmetric(horizontal: 20,vertical: 12),
                child:Row(
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
              ),
             Mentors(),

               Padding(
                padding: EdgeInsets.symmetric(horizontal: 20,vertical: 12),
                child:Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                    I18n.of(context).continueLearning,
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
              ),
              CourseList()
              // Expanded(child:  ,)
            // CourseContinue(
            //                 title: 'Introduction of Figma',
            //                 contentImage: 'assets/images/courseContinue.png',
            //                   name:'Jacob Jones', 
            //                   btnText:'Design',
            //                   progress: 20,
            //                   ),

          
          
        ],
      ),
    );
  }
}
