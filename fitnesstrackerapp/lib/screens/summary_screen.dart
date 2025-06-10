import 'package:fitnesstrackerapp/model/workout.dart';
import 'package:flutter/material.dart';
import '../widgets/workout_pie_chart.dart';

class SummaryScreen extends StatelessWidget {
  // static const routeName = '/summary';

  const SummaryScreen({super.key, required this.workouts});

  final List<Workout> workouts;

  @override
  Widget build(BuildContext context) {
    // final workouts = Provider.of<WorkoutProvider>(context).workouts;

    String getTotalWorkoutPerCategory(Category category) {
      int total = 0;
      for (var workout in workouts) {
        if (workout.category == category) {
          total++;
        }
      }
      return total.toString();
    }

    Color getCategoryColorByName(String categoryName) {
      switch (categoryName) {
        case "strength":
          return Colors.red;
        case "cardio":
          return Colors.blue;
        case "yoga":
          return Colors.green;
        case "flexibility":
          return Colors.purple;
        case "other":
          return Colors.grey;
        default:
          return Colors.grey; // unknown category kept in other
      }
    }

    Widget buildSummaryContent(BuildContext context, List<Workout> workouts) {
      return SingleChildScrollView(
        child: Column(
          children: [
            WorkoutPieChart(workouts: workouts),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Total Workouts: ${workouts.length}',
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            ListView(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              padding: const EdgeInsets.all(8),
              children: List.generate(Category.values.length, (index) {
                final category = Category.values[index];
                final totalWorkouts = getTotalWorkoutPerCategory(category);
                return ListTile(
                  style: ListTileStyle.drawer,
                  titleTextStyle: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                  leadingAndTrailingTextStyle: const TextStyle(
                    fontSize: 16,
                    color: Colors.white70,
                  ),
                  leading: CircleAvatar(
                    backgroundColor: getCategoryColorByName(category.name),
                    radius: 10,
                  ),
                  title: Text(category.name),
                  trailing: Text(totalWorkouts),
                );
              }),
            ),
          ],
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(title: const Text('Workout Summary')),
      body: workouts.isEmpty
          ? Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 20,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.asset(
                        'assets/images/empty_workout.png',
                        width: double.infinity,
                        height: 400,
                        fit: BoxFit.cover,
                      ),
                    ),
                    SizedBox(height: 20),
                    Text(
                      'No workouts recorded yet.',
                      style: TextStyle(fontSize: 24, color: Colors.white),
                    ),
                  ],
                ),
              ),
            )
          // if workouts are not empty, show the summary
          : buildSummaryContent(context, workouts),
    );
  }
}
