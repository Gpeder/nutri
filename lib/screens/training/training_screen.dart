import 'package:flutter/material.dart';
import 'package:nutri/core/theme/colors.dart';
import 'package:nutri/core/theme/app_theme.dart';
import 'package:nutri/models/training_model.dart';
import 'package:nutri/screens/training/widgets/splitbutton.dart';
import 'package:nutri/screens/training/widgets/trainingselect.dart';
import 'package:nutri/widgets/genericappbar.dart';

class TrainingScreen extends StatefulWidget {
  const TrainingScreen({super.key});

  @override
  State<TrainingScreen> createState() => _TrainingScreenState();
}

class _TrainingScreenState extends State<TrainingScreen> {
  String _selectedSplit = 'A';
  final Set<String> _completedExercises = {};

  Map<String, List<TrainingModel>> get _trainingSplits => {
    'A': chestTrainings,
    'B': backTrainings,
    'C': legTrainings,
    'D': shoulderTrainings,
    'E': [...bicepsTrainings, ...tricepsTrainings],
    'F': [...absTrainings, ...cardioTrainings],
  };

  void _toggleExercise(String id) {
    setState(() {
      if (_completedExercises.contains(id)) {
        _completedExercises.remove(id);
      } else {
        _completedExercises.add(id);
      }
    });
  }

  void _completeAllExercises() {
    final currentTrainings = _trainingSplits[_selectedSplit] ?? [];
    setState(() {
      for (final training in currentTrainings) {
        final String exerciseId = '${_selectedSplit}_${training.name}';
        _completedExercises.add(exerciseId);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final currentTrainings = _trainingSplits[_selectedSplit] ?? [];

    return Scaffold(
      appBar: GenericAppBar(
        title: 'Área de treino',
        subtitle: 'Sua planilha digital atualizada.',
      ),
      body: Column(
        children: [
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            child: Row(
              children: _trainingSplits.keys.map((split) {
                return Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: SplitButton(
                    title: split,
                    isSelected: _selectedSplit == split,
                    onTap: () {
                      setState(() {
                        _selectedSplit = split;
                      });
                    },
                  ),
                );
              }).toList(),
            ),
          ),
          Expanded(
            child: ListView.separated(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              separatorBuilder: (context, index) {
                return const SizedBox(height: 10);
              },
              itemCount: currentTrainings.length,
              itemBuilder: (context, index) {
                final training = currentTrainings[index];
                final String exerciseId = '${_selectedSplit}_${training.name}';
                final bool isCompleted = _completedExercises.contains(
                  exerciseId,
                );

                return TrainingSelect(
                  onTap: () => _toggleExercise(exerciseId),
                  title: training.name,
                  series: training.series,
                  rest: training.rest,
                  isCompleted: isCompleted,
                  onChanged: (value) => _toggleExercise(exerciseId),
                );
              },
            ),
          ),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: AppTheme.primaryButtonStyle,
                onPressed: _completeAllExercises,
                child: Text(
                  'Finalizar treino',
                  style: Theme.of(
                    context,
                  ).textTheme.titleMedium?.copyWith(color: AppColors.white),
                ),
              ),
            ),
          ),
          const SizedBox(height: 10),
        ],
      ),
    );
  }
}
