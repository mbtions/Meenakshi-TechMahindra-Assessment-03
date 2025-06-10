import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import '../model/workout.dart';

class WorkoutPieChart extends StatelessWidget {
  final List<Workout> workouts;

  const WorkoutPieChart({super.key, required this.workouts});

  Map<Category, int> _calculateCategoryCounts() {
    final Map<Category, int> counts = {};
    for (var w in workouts) {
      counts[w.category] = (counts[w.category] ?? 0) + 1;
    }
    return counts;
  }

  @override
  Widget build(BuildContext context) {
    final categoryCounts = _calculateCategoryCounts();
    final total = categoryCounts.values.fold(0, (sum, c) => sum + c);

    if (total == 0) {
      return const Center(child: Text("No data to show"));
    }

    return AspectRatio(
      aspectRatio: 1.2,
      child: PieChart(
        PieChartData(
          sectionsSpace: 4,
          centerSpaceRadius: 40,
          sections: categoryCounts.entries.map((entry) {
            final category = entry.key;
            final count = entry.value;
            final percent = (count / total * 100).toStringAsFixed(1);

            return PieChartSectionData(
              color: Workout(
                title: '',
                category: category,
                duration: 0,
                date: DateTime.now(),
              ).getCategoryColor(),
              value: count.toDouble(),
              title: '$percent%',
              radius: 60,
              titleStyle: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
