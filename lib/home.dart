import 'package:bmi/result.dart';
import 'package:flutter/material.dart';
import 'dart:math';

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool isMale = true;

  double heightVal = 150;

  int weight = 55;
  int age = 18;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Body mass"),
        centerTitle: true,
      ),
      body: SafeArea(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Row(
                children: [
                  m1Expanded(context, 'male'),
                  SizedBox(
                    width: 15,
                  ),
                  m1Expanded(context, 'female'),
                ],
              ),
            ),
          ),
          Expanded(
            child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.blueGrey),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "height",
                        style: Theme.of(context).textTheme.headline2,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        textBaseline: TextBaseline.alphabetic,
                        children: [
                          Text(
                            heightVal.toStringAsFixed(1),
                            style: Theme.of(context).textTheme.headline1,
                          ),
                          Text(
                            "cm",
                            style: Theme.of(context).textTheme.bodyText1,
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          SizedBox(width: 30,),
                          FloatingActionButton(
                            onPressed: () {
                              setState(() {
                                heightVal++;
                              });
                            },
                            child: Icon(
                              Icons.add,
                            ),
                            mini: true,
                          ),
                          Slider(
                            value: heightVal,
                            onChanged: (val) {
                              setState(() {
                                heightVal = val;

                              });
                            },
                            min: 90,
                            max: 220,
                          ),
                          SizedBox(width: 30,),
                          FloatingActionButton(
                            onPressed: () {
                              setState(() {
                                heightVal--;
                              });
                            },
                            child: Icon(
                              Icons.remove,
                            ),
                            mini: true,
                          ),
                        ],
                      )
                    ],
                  ),
                )),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Row(
                children: [
                  m2Expanded(context, 'weight'),
                  SizedBox(
                    width: 15,
                  ),
                  m2Expanded(context, 'age'),
                ],
              ),
            ),
          ),
          Container(
            color: Colors.teal,
            width: double.infinity,
            child: TextButton(
              onPressed: () {
                var result = weight / pow(heightVal / 100, 2);
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return Result(
                    result: result,
                    isMale: isMale,
                    age: age,
                  );
                }));
              },
              child: Text(
                "Calculate",
                style: Theme.of(context).textTheme.headline2,
              ),
            ),
          )
        ],
      )),
    );
  }

  Expanded m1Expanded(
    BuildContext context,
    String type,
  ) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          setState(() {
            isMale = type == "male" ? true : false;
          });
        },
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: (isMale && type == "male") || (!isMale && type == "female")
                ? Colors.teal
                : Colors.blueGrey,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                type == "male" ? Icons.male : Icons.female,
                size: 90,
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                type == "male" ? "Male" : "Female",
                style: Theme.of(context).textTheme.headline2,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Expanded m2Expanded(BuildContext context, String type) {
    return Expanded(
      child: Container(
        color: Colors.blueGrey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              type == "weight" ? "Weight" : "age",
              style: Theme.of(context).textTheme.headline2,
            ),
            SizedBox(
              height: 15,
            ),
            Text(
              type == "weight" ? "$weight" : "$age",
              style: Theme.of(context).textTheme.headline1,
            ),
            SizedBox(
              height: 5,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FloatingActionButton(
                  onPressed: () {
                    setState(() {
                      type == "weight" ? weight += 1 : age += 1;
                    });
                  },
                  child: Icon(
                    Icons.add,
                  ),
                  mini: true,
                ),
                SizedBox(
                  width: 30,
                ),
                FloatingActionButton(
                  onPressed: () {
                    setState(() {
                      type == "weight" ? weight -= 1 : age -= 1;
                    });
                  },
                  child: Icon(
                    Icons.remove,
                  ),
                  mini: true,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
