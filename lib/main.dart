import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    home: HomePage(),
  ));
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() {
    // TODO: implement createState
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage> {
  var weightcontroller = TextEditingController();
  var ftcontroller = TextEditingController();
  var incontroller = TextEditingController();
  var result = "";
  var status = "";
  Color bgcolor = Colors.white;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(title: const Text("BMI Calculator")),
      body: Container(
        color: bgcolor,
        child: Center(
          child: Container(
            width: 300,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "BMI",
                  style: TextStyle(fontSize: 34, fontWeight: FontWeight.w700),
                ),
                TextFormField(
                  controller: weightcontroller,
                  decoration: InputDecoration(
                    label: Text('Weight'),
                    prefixIcon: Icon(Icons.monitor_weight),
                  ),
                  keyboardType: TextInputType.number,
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: ftcontroller,
                  decoration: InputDecoration(
                    label: Text('Enter height in ft'),
                    prefixIcon: Icon(Icons.height),
                  ),
                  keyboardType: TextInputType.number,
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: incontroller,
                  decoration: InputDecoration(
                      label: Text("enter your Height in inch"),
                      prefixIcon: Icon(Icons.height_sharp)),
                  keyboardType: TextInputType.number,
                ),
                SizedBox(height: 20),
                ElevatedButton(
                    onPressed: () {
                      var wt = weightcontroller.text.toString();
                      var ft = ftcontroller.text.toString();
                      var inch = incontroller.text.toString();

                      if (wt != '' && ft != '' && inch != '') {
                        var iwt = int.parse(wt);
                        var ift = int.parse(ft);
                        var iInch = int.parse(inch);

                        var tInch = (ift * 12) + iInch;
                        var tcm = tInch * 2.54;
                        var tM = tcm / 100;

                        var bmi = iwt / (tM * tM);
                        if (bmi <= 18.5) {
                          setState(() {
                            status = "You are UNDERWIGHT !";
                            bgcolor = Colors.yellow.shade100;
                          });
                        }
                        if (bmi < 25 && bmi > 18.5) {
                          setState(() {
                            status = "You are NORMAL !!";
                            bgcolor = Colors.green.shade100;
                          });
                        }
                        if (bmi > 25) {
                          setState(() {
                            status = "You are OVERWEIGHT !!!";
                            bgcolor = Colors.red.shade100;
                          });
                        }

                        setState(() {
                          result = "your BMI is : $bmi";
                        });
                      } else {
                        setState(() {
                          result = "please Enter Your Information Correctly";
                          bgcolor = Colors.white;
                          status = '';
                        });
                      }
                    },
                    child: Text("Calculate")),
                SizedBox(height: 20),
                Text(result),
                Text(status)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
