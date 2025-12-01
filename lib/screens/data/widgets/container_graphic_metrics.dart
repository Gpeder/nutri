import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:nutri/core/theme/colors.dart' show AppColors;
import 'package:nutri/models/measures.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class ContainerGraphicMetrics extends StatelessWidget {
  const ContainerGraphicMetrics({super.key});

  double? _parseValue(String value) {
    String cleanString = value.replaceAll(RegExp(r'[^0-9.]'), '');
    return double.tryParse(cleanString);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: AppColors.gray200),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: AppColors.blue100,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(
                  FontAwesomeIcons.user,
                  color: AppColors.blue200,
                  size: 20,
                ),
              ),
              const SizedBox(width: 10),
              Text(
                'Comparativo de medidas',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: AppColors.gray900,
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          SizedBox(
            height: 250,
            child: SfCartesianChart(
              isTransposed: true,
              plotAreaBorderWidth: 0,
              primaryXAxis: CategoryAxis(
                majorGridLines: MajorGridLines(
                  width: 1,
                  dashArray: <double>[5, 5],
                  color: AppColors.gray200,
                ),
                majorTickLines: const MajorTickLines(width: 0),
                axisLine: const AxisLine(width: 0),
                labelStyle: TextStyle(
                  fontWeight: FontWeight.w500,
                  color: AppColors.gray500,
                ),
              ),
              primaryYAxis: NumericAxis(isVisible: false, minimum: 0),
              tooltipBehavior: TooltipBehavior(
                enable: true,
                header: '',
              ),
              series: <CartesianSeries<Measures, String>>[
                BarSeries<Measures, String>(
                  name: 'Anterior',
                  dataSource: Measures.measuresData,
                  xValueMapper: (Measures data, _) => data.metrics,
                  yValueMapper: (Measures data, _) => _parseValue(data.before),
                  color: AppColors.gray300,
                  width: 0.6,
                  spacing: 0.2,
                  borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(10),
                    bottomRight: Radius.circular(10),
                  ),
                ),
                BarSeries<Measures, String>(
                  name: 'Atual',
                  dataSource: Measures.measuresData,
                  xValueMapper: (Measures data, _) => data.metrics,
                  yValueMapper: (Measures data, _) => _parseValue(data.after),
                  color: AppColors.blue200,
                  width: 0.6,
                  spacing: 0.2,
                  borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(10),
                    bottomRight: Radius.circular(10),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildLegendItem(AppColors.gray300, 'Anterior'),
              const SizedBox(width: 20),
              _buildLegendItem(AppColors.blue200, 'Atual'),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildLegendItem(Color color, String text) {
    return Row(
      children: [
        Container(
          width: 12,
          height: 12,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(3),
          ),
        ),
        const SizedBox(width: 8),
        Text(text, style: TextStyle(color: AppColors.gray500, fontSize: 12)),
      ],
    );
  }
}
