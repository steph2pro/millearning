import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:millearnia/src/features/home/logic/profession_cubit.dart';
import 'package:millearnia/src/shared/components/home_components/profession_item.dart';
import 'package:millearnia/src/shared/extensions/context_extensions.dart';
import 'package:shimmer/shimmer.dart';

@RoutePage()
class ProfessionsScreen extends StatefulWidget {
  final int categoryId;

  const ProfessionsScreen({super.key, required this.categoryId});

  @override
  State<ProfessionsScreen> createState() => _ProfessionsScreenState();
}

class _ProfessionsScreenState extends State<ProfessionsScreen> {
  @override
  void initState() {
    super.initState();
    context.read<ProfessionCubit>().getProfessionsCategory(widget.categoryId);
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
      ),
      backgroundColor: context.colorScheme.onPrimary,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: BlocBuilder<ProfessionCubit, ProfessionState>(
                builder: (context, state) {
                  return state.when(
                    initial: () => _buildSkeletonLoader(),  // Skeleton loader here
                    loading: () => _buildSkeletonLoader(),  // Skeleton loader here
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

  Widget _buildSkeletonLoader() {
    return ListView.builder(
      itemCount: 5, // You can show a fixed number of skeleton items
      itemBuilder: (context, index) {
        return Shimmer.fromColors(
          baseColor: Colors.grey[300]!,
          highlightColor: Colors.grey[100]!,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 80,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          ),
        );
      },
    );
  }

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
}
