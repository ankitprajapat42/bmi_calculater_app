import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class ResultScreen extends StatelessWidget {
  ResultScreen({required this.bmi, super.key});
  double? bmi;

  String getCategory() {
    if (bmi == null) {
      return "";
    }

    if (bmi! < 18.5) {
      return "Under Weight";
    } else if (bmi! < 25.0) {
      return "Normal Weight";
    } else if (bmi! < 30.0) {
      return "Over Weight";
    } else {
      return "Obese";
    }
  }
  String getCommentText() {
    if (bmi == null) {
      return "";
    }

    if (bmi! < 18.5) {
      return "You are below the normal\nweight range.";
    } else if (bmi! < 25.0) {
      return "Great! You have a normal\nbody weight.";
    } else if (bmi! < 30.0) {
      return "You are above the normal\nweight range.";
    } else {
      return "Your BMI indicates obesity.\nConsider a healthy lifestyle.";
    }
  }

  Color getColorCategory(){
    if(bmi==null){
      return Colors. grey;
    }

    if (bmi! < 18.5) {
      return Colors.blue;
    } else if (bmi! < 25.0) {
      return Colors.green;
    } else if (bmi! < 30.0) {
      return Colors.orange;
    } else {
      return Colors.red;
    }
  }



  Icon getEmojiCategory(){
    if(bmi==null){
      return Icon(Icons.circle);
    }
    if (bmi! < 18.5) {
      return Icon(Icons.sentiment_dissatisfied, size: 30,  color: getColorCategory());
    } else if (bmi! < 25.0) {
      return Icon(Icons.sentiment_very_satisfied, size: 30,  color: getColorCategory());
    } else if (bmi! < 30.0) {
      return Icon(Icons.sentiment_neutral, size: 30,  color: getColorCategory());
    } else {
      return Icon(Icons.sentiment_very_dissatisfied, size: 30,  color: getColorCategory());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: getColorCategory(),
        foregroundColor: Colors.white,
        title: Text("Result"),
        titleTextStyle: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        leading: IconButton(
          onPressed: (){
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back, color: Colors.white, size: 30,),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            spacing: 20,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                child: CircularPercentIndicator(
                  radius: 100,
                  percent: (bmi! / 40).clamp(0.0, 1.0),
                  lineWidth: 12,
                  progressColor: getColorCategory(),
                  center: Center(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      // spacing: -10,
                      children: [
                        Text("Your bmi", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
                        Text("$bmi", style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: getColorCategory()),),
                        Text("${getCategory()}", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: getColorCategory()),),
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.all(12),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    border: BoxBorder.all(
                      color: getColorCategory(),
                      width: 1.5,
                    )
                ),
                child: Row(
                  children: [
                    getEmojiCategory(),
                    Padding(
                      padding: const EdgeInsets.only(left: 12.0),
                      child: Text(getCommentText(), style: TextStyle(fontSize: 16, color: Colors.black),),
                    ),
                  ],
                ),
              ),

              Container(
                padding: EdgeInsets.all(12),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                        color: Colors.grey.shade500,
                        width: 1.5
                    )
                ),
                child: Column(
                  spacing: 10,
                  children: [
                    Align(
                        alignment: Alignment.centerLeft,
                        child: Text("bmi Categories", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),)),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Under Weight", ),
                        Text("<18.5")
                      ],
                    ),Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Normal Weight", ),
                        Text("18.5 - 24.9")
                      ],
                    ),Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Over Weight", ),
                        Text("25.0 - 29.9")
                      ],
                    ),Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Obese", ),
                        Text(">= 30.0")
                      ],
                    ),
                  ],
                ),
              ),

              SizedBox(
                height: 50,
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: (){
                    Navigator.pop(context);
                  },
                  style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: getColorCategory(),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12)
                      )
                  ),
                  child: Text("Calculate Again", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                ),
              )

            ],
          ),
        ),
      ),

    );
  }
}



