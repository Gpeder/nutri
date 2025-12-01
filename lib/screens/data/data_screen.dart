import 'package:flutter/material.dart';
import 'package:nutri/screens/data/widgets/container_graphic_metrics.dart';
import 'package:nutri/screens/data/widgets/container_graphic_wheight.dart';
import 'package:nutri/widgets/genericappbar.dart';

class DataScreen extends StatelessWidget {
  const DataScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const GenericAppBar(
        title: 'Métricas',
        subtitle: 'Acompanhe sua evolução corporal.',
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: Column(
          children: [
            const SizedBox(height: 20),
            const ContainerGraphicWheight(),

            const SizedBox(height: 20),

            const ContainerGraphicMetrics(),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
