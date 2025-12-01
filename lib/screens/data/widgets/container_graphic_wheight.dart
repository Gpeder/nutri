import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:nutri/core/theme/colors.dart' show AppColors;
import 'package:nutri/models/month_data.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class ContainerGraphicWheight extends StatelessWidget {
  const ContainerGraphicWheight({
    super.key,
  });

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
                  color: AppColors.green100,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(
                  FontAwesomeIcons.heartPulse,
                  color: AppColors.green200,
                ),
              ),
              const SizedBox(width: 10),
              Text(
                'Histórico de Peso',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: AppColors.gray900,
                ),
              ),
            ],
          ),
    
          const SizedBox(height: 20),
    
          SfCartesianChart(
            plotAreaBorderWidth: 0,
            primaryXAxis: CategoryAxis(
              majorGridLines: MajorGridLines(width: 0),
              axisLine: AxisLine(width: 0),
              interval: 1,
              labelIntersectAction: AxisLabelIntersectAction.rotate45,
              labelStyle: TextStyle(fontSize: 10, color: Colors.grey),
            ),
    
            primaryYAxis: NumericAxis(
              majorGridLines: MajorGridLines(
                dashArray: <double>[5, 5],
                color: AppColors.gray200,
              ),
              axisLine: AxisLine(width: 0),
              minimum: (monthDataList.monthDataList.map((e) => e.weight).reduce((a, b) => a < b ? a : b) - 10).toDouble(),
              maximum:
                  (monthDataList.monthDataList
                              .map((e) => e.weight)
                              .reduce((a, b) => a > b ? a : b) +
                          10)
                      .toDouble(),
              labelIntersectAction: AxisLabelIntersectAction.rotate45,
              labelStyle: TextStyle(fontSize: 10, color: Colors.grey),
            ),
    
            tooltipBehavior: TooltipBehavior(enable: true),
    
            series: <CartesianSeries<MonthData, String>>[
              LineSeries<MonthData, String>(
                dataSource: monthDataList.monthDataList,
                xValueMapper: (MonthData data, _) => data.month,
                yValueMapper: (MonthData data, _) => data.weight,
                color: AppColors.green200,
                width: 3,
                markerSettings: MarkerSettings(
                  isVisible: true,
                  height: 8,
                  width: 8,
                  color: AppColors.green200,
                  borderWidth: 0,
                  shape: DataMarkerType.circle,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
