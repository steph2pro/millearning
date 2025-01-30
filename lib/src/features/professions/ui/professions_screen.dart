import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:millearnia/src/features/home/logic/category_cubit.dart';
import 'package:millearnia/src/features/home/logic/profession_cubit.dart';
import 'package:millearnia/src/features/home/models/category.dart';
import 'package:millearnia/src/shared/components/home_components/profession_item.dart';
import 'package:millearnia/src/shared/extensions/context_extensions.dart';

@RoutePage()
class ProfessionsScreen extends StatefulWidget {
  const ProfessionsScreen({super.key});

  @override
  State<ProfessionsScreen> createState() => _ProfessionsScreenState();
}

class _ProfessionsScreenState extends State<ProfessionsScreen> {
  int? _selectedCategoryId; // Catégorie sélectionnée

  @override
  void initState() {
    super.initState();
    context.read<CategoryCubit>().getCategories(); // Charger les catégories
    context.read<ProfessionCubit>().getProfessions(); // Charger les professions
  }

  void _onCategorySelected(int? categoryId) {
    setState(() {
      _selectedCategoryId = categoryId;
    });
    if (categoryId != null) {
    context.read<ProfessionCubit>().getProfessionsCategory(categoryId);
  } else {
    // Si categoryId est null, appelle une méthode pour récupérer toutes les professions
    context.read<ProfessionCubit>().getProfessions();
  }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Professions",
          style: context.textTheme.titleLarge,
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: context.colorScheme.onPrimary,
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 10),
            child: Icon(Icons.search, color: Colors.black),
          ),
        ],
      ),
      backgroundColor: context.colorScheme.onPrimary,
      body: SafeArea(
        child: Column(
          children: [
            // Liste des catégories
            BlocBuilder<CategoryCubit, CategoryState>(
              builder: (context, state) {
                return state.when(
                  initial: () => const Center(child: CircularProgressIndicator()),
                  loading: () => const Center(child: CircularProgressIndicator()),
                  successGetCategories: (categories) {
                    return _buildCategoryList(categories.categories!);
                  },
                  error: (error) => Center(child: Text('Erreur: $error')),
                );
              },
            ),

            // Liste des professions filtrées
            Expanded(
              child: BlocBuilder<ProfessionCubit, ProfessionState>(
                builder: (context, state) {
                  return state.when(
                    initial: () => const Center(child: CircularProgressIndicator()),
                    loading: () => const Center(child: CircularProgressIndicator()),
                    successGetProfessions: (response) {
                      return _buildProfessionList(response.professions);
                    },
                    error: (error) => Center(child: Text('Erreur: $error')),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// Affichage des catégories sous forme de boutons filtrants
  Widget _buildCategoryList(List<Category> categories) {
    return Padding(
      padding: EdgeInsets.all(10.0),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            _buildCategoryButton("All", isSelected: _selectedCategoryId == null, onTap: () => _onCategorySelected(null)),
            for (var category in categories)
              _buildCategoryButton(
                category.title,
                isSelected: _selectedCategoryId == category.id,
                onTap: () => _onCategorySelected(category.id),
              ),
          ],
        ),
      ),
    );
  }

  /// Affichage des professions sous forme de liste
  Widget _buildProfessionList(List professions) {
    return ListView.builder(
      itemCount: professions.length,
      itemBuilder: (context, index) {
        final profession = professions[index];
        return ProfessionItem(
          title: profession.name,
          contentImage: profession.thumbnail,
          name: profession.user.name,
          btnText: 'Join',
          prise: '25 000',
        );
      },
    );
  }

  /// Boutons de catégories
  Widget _buildCategoryButton(String text, {bool isSelected = false, required VoidCallback onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 5),
        padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        decoration: BoxDecoration(
          color: isSelected ? Colors.blue : Colors.grey[200],
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text(
          text,
          style: TextStyle(
            color: isSelected ? Colors.white : Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
