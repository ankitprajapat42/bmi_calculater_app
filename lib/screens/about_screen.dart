import 'package:flutter/material.dart';

class AboutScreen extends StatefulWidget {
  const AboutScreen({super.key});

  @override
  State<AboutScreen> createState() => _AboutScreenState();
}

class _AboutScreenState extends State<AboutScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: Text("About", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),),
        foregroundColor: Colors.white,
        leading: IconButton(
            onPressed: (){
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back, color: Colors.white, size: 30,),
        )
      ),
      body:Center(
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: SingleChildScrollView(
            child: Column(
              spacing: 50,
              children: [
                Column(
                  children: [
                    Image.asset('assets/images/app_logo.png', width: 120,),
                    Text("BMI Calculater", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),),
                    Text("Version : 1.0.0", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700, color: Colors.grey.shade500),),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 12.0, right: 12.0),
                  child: Text("BMI Calculator helps you calculate your Body Mass Index (BMI) quickly and accurately. By entering your height and weight, you can determine whether you are underweight, normal weight, overweight, or obese according to standard BMI categories.", textAlign: TextAlign.center, style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: Colors.grey.shade700),),
                ),
                Column(
                  children: [
                    Text("Made with ❤️", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: Colors.grey.shade900),),
                    Text("Stay healthy, stay happy!"),
                  ],
                )
              ],
            ),
          ),
        ),
      ),

    );
  }
}
