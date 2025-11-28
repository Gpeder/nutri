import 'package:flutter/material.dart';
import 'package:nutri/core/theme/colors.dart';
import 'package:nutri/widgets/customcheckbox.dart';
import 'package:nutri/widgets/genericappbar.dart';

class TrainingScreen extends StatefulWidget {
  const TrainingScreen({super.key});

  @override
  State<TrainingScreen> createState() => _TrainingScreenState();
}

class _TrainingScreenState extends State<TrainingScreen> {
  bool _isCompleted = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GenericAppBar(
        title: 'Área de treino',
        subtitle: 'Sua planilha digital atualizada.',
      ),
      body: SingleChildScrollView(
        padding: .symmetric(horizontal: 15),
        child: Column(children: [
          TrainingCard(
            title: 'Supino reto',
            series: '4x10',
            weight: '60kg',
            isCompleted: _isCompleted,
            onChanged: (value) {
              setState(() {
                _isCompleted = value!;
              });
            },
          ),
        ]),
      ),
    );
  }
}

class TrainingCard extends StatelessWidget {
  final String title;
  final String series;
  final String weight;
  final bool isCompleted;
  final Function(bool?) onChanged;
  const TrainingCard({
    super.key,
    required this.title,
    required this.series,
    required this.weight,
    required this.isCompleted,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.gray100),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: .start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  color: isCompleted ? AppColors.gray400 : null,
                  decoration: isCompleted ? TextDecoration.lineThrough : null,
                  decorationColor: isCompleted ? AppColors.gray400 : null,
                ),
              ),
              CustomCheckbox(
                value: isCompleted,
                onChanged: onChanged,
                color: AppColors.green200,
              ),
            ],
          ),
          SizedBox(height: 20),
          Row(
            children: [
              MetricTag(metric: 'Séries: $series'),
              MetricTag(metric: 'Peso: $weight'),
            ],
          ),
        ],
      ),
    );
  }
}

class MetricTag extends StatelessWidget {
  final String metric;
  const MetricTag({super.key, required this.metric});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: AppColors.gray100,
      ),
      child: Text(
        metric,
        style: Theme.of(context).textTheme.bodySmall?.copyWith(
          color: AppColors.gray500,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

class SplitButton extends StatelessWidget {
  final VoidCallback onTap;
  final String title;
  final bool isSelected;

  const SplitButton({
    super.key,
    required this.onTap,
    required this.title,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      borderRadius: BorderRadius.circular(50),
      child: Container(
        width: 60,
        height: 60,
        alignment: .center,
        decoration: BoxDecoration(
          shape: .circle,
          color: isSelected ? AppColors.green200 : AppColors.gray200,
          border: .all(color: AppColors.gray100),
        ),
        child: Text(
          title,
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
            color: AppColors.white,
            fontWeight: FontWeight.w900,
          ),
        ),
      ),
    );
  }
}
