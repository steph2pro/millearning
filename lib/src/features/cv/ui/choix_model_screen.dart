import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:millearnia/src/core/routing/app_router.dart';
import 'package:millearnia/src/core/theme/app_size.dart';
import 'package:millearnia/src/core/theme/dimens.dart';
import 'package:millearnia/src/datasource/models/api_response/api_response.dart';
import 'package:millearnia/src/features/cv/logic/cv_preview_cubit.dart';
import 'package:millearnia/src/shared/components/dialogs/dialog_builder.dart';
import 'package:millearnia/src/shared/components/modals/modal.dart';
import 'package:millearnia/src/shared/extensions/context_extensions.dart';
import 'package:shared_preferences/shared_preferences.dart';
@RoutePage()

class ChoixModelScreen extends StatefulWidget 
//  implements AutoRouteWrapper
 {
  const ChoixModelScreen({super.key});

  @override
  State<ChoixModelScreen> createState() => _ChoixModelScreenState();
  
  // @override
  // Widget wrappedRoute(BuildContext context) {
  //   return BlocProvider(
  //     create: (_) => CvPreviewCubit()..fetchAllCv(),
  //     child: this,
  //   );
  // }

}


class _ChoixModelScreenState extends State<ChoixModelScreen> {
  Future<void> _saveChoiseModel(int model) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    print('[SaveModelChoise]: Model choisis $model');
    await prefs.setInt(
      'model',
      model,
    );
  }

  final List<String> images = [
    'assets/images/model_cv1.png',
    'assets/images/model_cv2.png',
    'assets/images/model_cv3.png',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Choix du model de CV',
            style: context.textTheme.titleLarge,
          ),
          centerTitle: true,
          backgroundColor: context.colorScheme.onPrimary,
        ),
        body:
      // BlocListener<CvPreviewCubit, CvPreviewState>(
      // listener: (context, state) {
      //   state.whenOrNull(
      //     loading: () => LoadingDialog.show(context: context),
      //     success: (response) {
      //       LoadingDialog.hide(context: context);
      //       showSuccesModal(response.message);
      //       if (response.data != null) {
      //         context.router.push(const HomeRoute());
      //       }
      //     },
      //     error: (error) {
      //       LoadingDialog.hide(context: context);
      //       showErrorModal(error.type == ApiErrorType.user
      //           ? error.error.response.data['message'].toString()
      //           : 'erreur de connexion');
      //     },
      //   );
      // },
      // child:
       ListView.builder(
        itemCount: images.length,
        itemBuilder: (context, index) {
          return Column(
            children: [
              Container(
                width: double.infinity,
                height: 600,
                child: Image.asset(
                  images[index],
                  fit: BoxFit.cover,
                ),
              ),
              gapH10,
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: OutlinedButton.icon(
                  onPressed: () {
                    _saveChoiseModel(index + 1);
                    context.pushRoute(CvBuilderRoute());
                  },
                  icon: Icon(Icons.check),
                  label: Text('Choisir'),
                ),
              ),
              SizedBox(height: 16),
            ],
          );
          })

    // )
    );
  }
}
