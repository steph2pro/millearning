import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:millearnia/src/core/i18n/l10n.dart';
import 'package:millearnia/src/core/routing/app_router.dart';
import 'package:millearnia/src/shared/components/atoms/dividers/labeled_divider.dart';
import 'package:millearnia/src/shared/components/onboarding/onboarding_item.dart';
import 'package:millearnia/src/shared/components/onboarding/page_indicators.dart';
import 'package:millearnia/src/shared/extensions/context_extensions.dart';

@RoutePage()
class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  late PageController _controller;
  late int _currentIndex;

  @override
  void initState() {
    super.initState();
    _currentIndex = 0;
    _controller = PageController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: context.colorScheme.onPrimary,
        title:  Align(
          alignment: Alignment.topRight,
          child: TextButton(
                    onPressed: (){
                      context.router.push(const WelcomeRoute());
                    }, 
                    child: Text(
                      I18n.of(context).skip,
                      style: context.textTheme.bodySmall!.copyWith(fontSize: 12,color: context.colorScheme.primaryContainer)
                    ),
                  )
        ),
      ),
      backgroundColor: context.colorScheme.onPrimary,
      
      body: Column(
        children: [
          Expanded(
            flex: 4,
            child: PageView(
              controller: _controller,
              onPageChanged: (index) {
                setState(() {
                  _currentIndex = index;
                });
              },
              children: const [
                OnboardingItem(
                  imageUrl: 'assets/images/onboarding1.png',
                  title: 'Discover Your ',
                  titlecolor: "Learning Adventure",
                  description:
                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor',
                ),
                OnboardingItem(
                  imageUrl: 'assets/images/onboarding2.png',
                  title: 'Stay Organized with',
                  titlecolor: "Bookmarks",
                  description:
                      '  Booking a taxi has never been easier. Enter your destination, choose your vehicle type, and confirm your booking. Track your taxi in real-time',
                ),
                OnboardingItem(
                  imageUrl: 'assets/images/onboarding3.png',
                  title: 'Achieve ',
                  titlecolor: " Certification ",
                  titlesecond: 'with Ease ',
                  description:
                      'With TaxiExpress, benefit from competitive rates, professional drivers, and 24/7 customer service',
                ),
              ],
            ),
          ),
          
             Expanded(
            child: Column(
              children: [
                Padding(
            padding: EdgeInsets.symmetric(horizontal: 25),
            child:
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Bouton flèche gauche
                    Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: context.colorScheme.primary, width: 2.0), // Bordure bleue
                      ),
                      child: IconButton(
                        icon: Icon(Icons.arrow_back, color: context.colorScheme.primary), // Icône bleue
                        onPressed: () {
                           if (_currentIndex != 0) {
                            _controller.previousPage(
                              duration: const Duration(milliseconds: 500),
                              curve: Curves.fastOutSlowIn,
                            );
                          }
                        },
                      ),
                    ),
                    PageIndicators(
                      index: _currentIndex,
                      currentIndex: _currentIndex,
                    ),
                    // Bouton flèche droite
                    Container(
                      decoration: BoxDecoration(
                        color: context.colorScheme.primary, // Fond bleu
                        shape: BoxShape.circle,
                      ),
                      child: IconButton(
                        icon: Icon(Icons.arrow_forward, color: context.colorScheme.onPrimary), // Icône blanche
                        onPressed: () {
                          if (_currentIndex != 2) {
                            _controller.nextPage(
                                duration: const Duration(milliseconds: 500),
                                curve: Curves.fastOutSlowIn);
                          } else {
                            context.router.push(const LoginRoute());
                            print("object");
                          }
                        },
                      ),
                    ),
                  ],
                ),


                )
                
              ],
            ),
          )
          
        ],
      ),
    );
  }
}
