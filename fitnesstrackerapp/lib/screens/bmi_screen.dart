import 'package:flutter/material.dart';

class BmiScreen extends StatefulWidget {
  const BmiScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return BmiScreenState();
  }
}

class BmiScreenState extends State<BmiScreen> {
  TextEditingController heightController = TextEditingController();
  TextEditingController weightController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF121420),
      appBar: AppBar(
        title: Text('BMI'),
        centerTitle: true,
        backgroundColor: Color(0xFFB76D68),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: heightController,
                decoration: InputDecoration(
                  labelText: 'Height (cm)',
                  labelStyle: TextStyle(color: Colors.white),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Colors.white, width: 2),
                  ),
                ),

                keyboardType: TextInputType.number,
              ),
              SizedBox(height: 20),
              TextField(
                controller: weightController,
                decoration: InputDecoration(
                  labelText: 'Weight (Kg)',
                  labelStyle: TextStyle(color: Colors.white),
                  // focusedBorder: OutlineInputBorder(
                  //   borderRadius: BorderRadius.circular(10),
                  //   borderSide: BorderSide(color: Colors.white, width: 2),
                  // ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Colors.white, width: 2),
                  ),
                ),
                keyboardType: TextInputType.number,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
