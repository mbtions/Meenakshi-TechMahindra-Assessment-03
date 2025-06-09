import 'package:fitnesstrackerapp/model/workout.dart';
import 'package:flutter/material.dart';

class AddWorkoutScreen extends StatefulWidget {
  const AddWorkoutScreen({super.key, required this.onAddWorkoutButtonPress});

  final void Function(Workout) onAddWorkoutButtonPress;

  @override
  AddWorkoutScreenState createState() {
    return AddWorkoutScreenState();
  }
}

class AddWorkoutScreenState extends State<AddWorkoutScreen> {
  TextEditingController titleController = TextEditingController();
  TextEditingController durationController = TextEditingController();
  Category selectedCategory = Category.other;
  DateTime selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add new workout'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: Icon(Icons.cancel, size: 30),
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: 50),
            TextField(
              maxLength: 50,
              controller: titleController,
              decoration: InputDecoration(
                labelText: 'Title',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            DropdownMenu(
              width: double.infinity,
              label: Text('Category'),
              dropdownMenuEntries: const [
                DropdownMenuEntry(value: Category.strength, label: 'Strength'),
                DropdownMenuEntry(value: Category.cardio, label: 'Cardio'),
                DropdownMenuEntry(
                  value: Category.flexibility,
                  label: 'Flexibility',
                ),
                DropdownMenuEntry(value: Category.balance, label: 'Balance'),
                DropdownMenuEntry(value: Category.yoga, label: 'Yoga'),
                DropdownMenuEntry(value: Category.other, label: 'Other'),
              ],
              onSelected: (value) {
                setState(() {
                  selectedCategory = value!;
                });
              },
            ),
            SizedBox(height: 20),
            TextField(
              keyboardType: TextInputType.number,
              controller: durationController,
              decoration: InputDecoration(
                labelText: 'Duration',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    fixedSize: Size(150, 50),
                  ),
                  child: Text("Cancel", style: TextStyle(fontSize: 18)),
                ),
                SizedBox(width: 20),
                ElevatedButton(
                  onPressed: () {
                    Workout workout = Workout(
                      title: titleController.text,
                      category: selectedCategory,
                      duration: double.parse(durationController.text),
                      date: selectedDate,
                    );
                    widget.onAddWorkoutButtonPress(workout);
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('New workout added'),
                        elevation: 5,
                        behavior: SnackBarBehavior.floating,
                        duration: Duration(seconds: 2),
                      ),
                    );
                    Navigator.of(context).pop();
                  },
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    backgroundColor: Colors.black,
                    fixedSize: Size(150, 50),
                  ),
                  child: Text(
                    'Add',
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
