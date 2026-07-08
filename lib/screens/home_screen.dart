import 'package:bmi_calculater/screens/about_screen.dart';
import 'package:bmi_calculater/screens/result_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  double? BMI;
  double height = 170;
  double weight = 60;

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("BMI Calculator"),
        foregroundColor: Colors.white,
        backgroundColor: Colors.deepPurple,
        titleTextStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        actions: [
          IconButton(
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(
                    builder: (context){
                      return AboutScreen();
                    } )
                );

              },
              icon: Icon(Icons.info)
          )
        ],

      ),
      body:Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          spacing: 20,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.only(left:12, right: 12, top: 24, bottom: 24),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: Colors.grey.shade500,
                  width: 1
                )
              ),
              child: Column(
                spacing: 20,
                children: [
                  Row(
                    spacing: 5,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Image.asset('assets/images/height_icon.png', height: 35),
                      Text("Height (Cm)", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
                      Expanded(child: Container()),
                      Text(height.toStringAsFixed(2), style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),)
                    ],
                  ),

                  Slider(
                    label: "${height.toStringAsFixed(2)}",
                    value: height,
                    min: 1,
                    max: 250,
                    divisions: 150,
                    activeColor: Theme.of(context).primaryColor,
                    onChanged: (value) {
                      setState(() {
                        height = value;
                      });
                    },
                  )
                ],
              ),
            ),

            Container(
              padding: EdgeInsets.only(left:12, right: 12, top: 24, bottom: 24),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: Colors.grey.shade500,
                  width: 1
                )
              ),
              child: Column(
                spacing: 20,
                children: [
                  Row(
                    spacing: 5,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Image.asset('assets/images/weight_icon.png', height: 35, width: 30,),
                      Text("Weight (Kg)", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
                      Expanded(child: Container()),
                      Text(weight.toStringAsFixed(2), style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),)
                    ],
                  ),
                  Slider(
                    label: "${weight.toStringAsFixed(2)}",
                    value: weight,
                    min: 1,
                    max: 250,
                    divisions: 150,
                    activeColor: Theme.of(context).primaryColor,
                    onChanged: (value) {
                      setState(() {
                        weight = value;
                      });
                    },
                  ),
                ],
              ),
            ),

            SizedBox(
              height: 50,
              width: double.infinity,
              child: ElevatedButton(
                onPressed: (){
                  setState(() {
                    double heightInMeter = height / 100;
                    BMI = weight/(heightInMeter*heightInMeter);
                  });
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ResultScreen(bmi: double.parse(BMI!.toStringAsFixed(2))),
                    ),
                  );
                },

                child: Text("Calculate BMI", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.deepPurple,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)
                  )
                )
              ),
            ),

          ],

        ),
      ),
    );
  }
}
