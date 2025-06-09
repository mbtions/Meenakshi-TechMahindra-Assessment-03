import 'package:fitnesstrackerapp/model/workout.dart';
import 'package:fitnesstrackerapp/screens/add_workout_screen.dart';
import 'package:fitnesstrackerapp/screens/bmi_screen.dart';
import 'package:fitnesstrackerapp/screens/summary_screen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return HomeScreenState();
  }
}

class HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  final List<Workout> registeredWorkouts = [
    Workout(
      title: "Push Ups",
      category: Category.strength,
      duration: 10,
      date: DateTime.now(),
    ),
    Workout(
      title: "Surya Namaskar Asana",
      category: Category.yoga,
      duration: 15,
      date: DateTime.now(),
    ),
  ];

  void _addWorkout(Workout workout) {
    setState(() => registeredWorkouts.add(workout));
  }

  void _onAddNewWorkoutPress() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) =>
            AddWorkoutScreen(onAddWorkoutButtonPress: _addWorkout),
      ),
    );
  }

  void _removeWorkout(Workout workout, int index) {
    setState(() {
      registeredWorkouts.removeAt(index);
    });

    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: const Text('Workout removed'),
        behavior: SnackBarBehavior.floating,
        duration: const Duration(seconds: 5),
        action: SnackBarAction(
          label: 'UNDO',
          onPressed: () {
            setState(() {
              registeredWorkouts.insert(index, workout);
            });
          },
        ),
      ),
    );
  }

  Widget _buildWorkoutList() {
    return ListView.builder(
      itemCount: registeredWorkouts.length,
      itemBuilder: (context, index) => Dismissible(
        key: ValueKey(registeredWorkouts[index]),
        background: Container(
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          decoration: BoxDecoration(
            color: Colors.red,
            borderRadius: BorderRadius.circular(10),
          ),
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.delete, color: Colors.white),
              SizedBox(width: 8),
              Text(
                'DELETE',
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
            ],
          ),
        ),
        onDismissed: (_) => _removeWorkout(registeredWorkouts[index], index),
        child: Card(
          elevation: 3,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          color: Colors.blue.shade200,
          margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            child: Row(
              children: [
                registeredWorkouts[index].getCategoryIcon(),
                const SizedBox(width: 8),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        registeredWorkouts[index].title,
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "Duration: ${registeredWorkouts[index].duration} min",
                      ),
                    ],
                  ),
                ),
                Text(
                  registeredWorkouts[index].formattedDate(),
                  style: const TextStyle(fontSize: 16),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final pages = [
      Scaffold(
        appBar: AppBar(
          title: const Text('Fitness Tracker'),
          centerTitle: true,
          actions: [
            IconButton(
              onPressed: _onAddNewWorkoutPress,
              icon: const CircleAvatar(child: Icon(Icons.add, size: 30)),
            ),
          ],
        ),
        body: _buildWorkoutList(),
      ),
      BmiScreen(),
      SummaryScreen(),
    ];

    return Scaffold(
      body: pages[_selectedIndex],
      bottomNavigationBar: NavigationBar(
        selectedIndex: _selectedIndex,
        onDestinationSelected: (int index) =>
            setState(() => _selectedIndex = index),
        destinations: const [
          NavigationDestination(icon: Icon(Icons.home), label: 'Home'),
          NavigationDestination(icon: Icon(Icons.monitor_weight), label: 'BMI'),
          NavigationDestination(icon: Icon(Icons.bar_chart), label: 'Summary'),
        ],
      ),
    );
  }
}
