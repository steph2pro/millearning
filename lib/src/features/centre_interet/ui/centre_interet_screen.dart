import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:millearnia/src/core/routing/app_router.dart';
import 'package:millearnia/src/datasource/models/api_response/api_response.dart';
import 'package:millearnia/src/features/centre_interet/logic/interet_cubit.dart';
import 'package:millearnia/src/features/centre_interet/models/interet_request.dart';
import 'package:millearnia/src/shared/components/dialogs/dialog_builder.dart';
import 'package:millearnia/src/shared/components/modals/modal.dart';
import 'package:millearnia/src/shared/extensions/context_extensions.dart';
import 'package:shared_preferences/shared_preferences.dart';

@RoutePage()
class CentreInteretScreen extends StatefulWidget {
  const CentreInteretScreen({super.key});

  @override
  State<CentreInteretScreen> createState() => _CentreInteretScreenState();
}

class _CentreInteretScreenState extends State<CentreInteretScreen> {
  List<Map<String, dynamic>> interests = [
    {'id':1,'name': 'Sciences', 'icon': Icons.science, 'color': Colors.blue, 'selected': false},
    {'id':2,'name': 'Mathématiques', 'icon': Icons.calculate, 'color': Colors.orange, 'selected': false},
    {'id':3,'name': 'Informatique', 'icon': Icons.computer, 'color': Colors.teal, 'selected': false},
    {'id':4,'name': 'Littérature', 'icon': Icons.menu_book, 'color': Colors.red, 'selected': false},
    {'id':5,'name': 'Histoire & Géographie', 'icon': Icons.public, 'color': Colors.brown, 'selected': false},
    {'id':6,'name': 'Économie & Gestion', 'icon': Icons.trending_up, 'color': Colors.green, 'selected': false},
    {'id':7,'name': 'Médecine & Santé', 'icon': Icons.health_and_safety, 'color': Colors.pink, 'selected': false},
    {'id':8,'name': 'Droit & Justice', 'icon': Icons.gavel, 'color': Colors.purple, 'selected': false},
    {'id':9,'name': 'Arts & Design', 'icon': Icons.palette, 'color': Colors.indigo, 'selected': false},
    {'id':10,'name': 'Ingénierie & Technologie', 'icon': Icons.build, 'color': Colors.grey, 'selected': false},
  ];

int? userId; 
  // Récupérer l'ID et les autres informations de l'utilisateur
  Future<void> getUserData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    userId = prefs.getInt('id'); // Récupérer l'ID
    // Tu peux aussi récupérer le nom, l'email, etc.
    // String? name = prefs.getString('name');
    // String? email = prefs.getString('email');
    // String? phone = prefs.getString('phone');
    print('********* $userId ************');
    setState(() {}); 
  }

  @override
  void initState() {
    super.initState();
    getUserData(); // Appeler la méthode pour récupérer les données dès que l'écran est construit
  }

  void toggleSelection(int index) {
    setState(() {
      interests[index]['selected'] = !interests[index]['selected'];
    });
  }


  @override
  Widget build(BuildContext context) {
    int selectedCount = interests.where((e) => e['selected']).length;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Choisis tes centres d\'intérêt',
          style: context.textTheme.titleLarge,
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: context.colorScheme.onPrimary,
      ),
      body: BlocConsumer<InteretCubit, InteretState>(
        listener: (context, state) {
          state.whenOrNull(
          loading: () => LoadingDialog.show(context: context),
          success: (response) {
            // LoadingDialog.hide(context: context);
            // showSuccesModal(response.message);
              context.router.push(const HomePageRoute());
            

            print(response);
          },
          error: (error) {
                LoadingDialog.hide(context: context);
                showErrorModal(error.type == ApiErrorType.user ? error.error.response.data['message'].toString() : 'erreur de connexion');
            // _showErrorDialog(context, error.message!);
          },
        );
        },
        builder: (context, state) {
          return Column(
            children: [
              Expanded(
                child: GridView.builder(
                  padding: const EdgeInsets.all(16.0),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 16,
                    childAspectRatio: 1, // Pour un bon équilibre
                  ),
                  itemCount: interests.length,
                  itemBuilder: (context, index) {
                    final item = interests[index];
                    return GestureDetector(
                      onTap: () => toggleSelection(index),
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                        decoration: BoxDecoration(
                          color: Colors.grey.shade100,
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(
                            color: item['selected'] ? item['color'] : Colors.transparent,
                            width: 2,
                          ),
                          boxShadow: const [
                            BoxShadow(
                              color: Colors.black12,
                              blurRadius: 6,
                              spreadRadius: 2,
                              offset: Offset(2, 4),
                            ),
                          ],
                        ),
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                CircleAvatar(
                                  radius: 30,
                                  backgroundColor: item['color'].withOpacity(0.8),
                                  child: Icon(item['icon'], size: 32, color: Colors.white),
                                ),
                                const SizedBox(height: 10),
                                Text(
                                  item['name'],
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black87,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                            Positioned(
                              top: 8,
                              right: 8,
                              child: AnimatedSwitcher(
                                duration: const Duration(milliseconds: 300),
                                child: item['selected']
                                    ? Icon(Icons.check_circle, color: item['color'], size: 24, key: ValueKey(true))
                                    : Icon(Icons.circle_outlined, color: Colors.grey, size: 24, key: ValueKey(false)),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          );
        },
      ),
      bottomNavigationBar: BottomAppBar(
        elevation: 2,
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(1.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextButton(
                onPressed: () {
                  context.router.push(const HomePageRoute());

                },
                child: const Text(
                  'Ignorer',
                  style: TextStyle(fontSize: 18, color: Colors.blue),
                ),
              ),
              SizedBox(
                width: 185,
                height: 100,
                child: ElevatedButton.icon(
                  onPressed: selectedCount > 0
                      ? () {
                          // Collecter les centres d'intérêt sélectionnés
                          final selectedInterests = interests
                            .where((item) => item['selected'])
                            .map((item) => item['id'] as int)
                            .toList();

                          // Créer l'objet InteretRequest
                          final interetRequest = InteretRequest(
                            id: userId!, // Remplacez ceci par l'ID de l'utilisateur
                            interests: selectedInterests,
                          );

                          // Appeler la méthode du Cubit pour enregistrer les centres d'intérêt
                          context.read<InteretCubit>().interetSave(interetRequest);
                        }
                      : null,
                  icon: Icon(Icons.arrow_forward),
                  label: Text('Suivant ($selectedCount)', style: TextStyle(fontSize: 12)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
