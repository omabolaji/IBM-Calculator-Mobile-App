import 'package:flutter/material.dart';
import 'constant.dart';
import 'reuseablecard.dart';

class ResultPage extends StatelessWidget {
  ResultPage({
    @required this.bmiState,
    @required this.bmiResult,
    @required this.bmiInterpretation,
  });

  final String bmiState;
  final String bmiResult;
  final String bmiInterpretation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
              child: Container(
            alignment: Alignment.bottomLeft,
            padding: EdgeInsets.all(10),
            child: Text(
              'Your Result',
              style: kTextStyle,
            ),
          )),
          Expanded(
            flex: 5,
            child: ReuseableCard(
              colour: kCardActiveColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
//                    'normal',
                    bmiState.toUpperCase(),
                    style: kResultTextStyle,
                  ),
                  Text(
//                    '20',
                    bmiResult,
                    style: kBMIResultStyle,
                  ),
                  Text(
//                    'weight is cool',
                    bmiInterpretation,
                    textAlign: TextAlign.center,
                    style: kBodyResultStyle,
                  ),
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(
              padding: EdgeInsets.only(bottom: 12),
              margin: EdgeInsets.only(top: 5),
              color: Color(0xffEB1555),
              width: double.infinity,
              height: 70,
              child: Center(
                child: Text(
                  'Re-Calculate',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
