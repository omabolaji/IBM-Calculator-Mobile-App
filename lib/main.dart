import 'package:flutter/material.dart';
import 'roundicon_btn.dart';
import 'reuseablecard.dart';
import 'constant.dart';
import 'result_page.dart';
import 'calaculator_brain.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter/services.dart';

enum Gender { male, female }

Future main() async {
  await SystemChrome.setPreferredOrientations(
    [
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ],
  );
  runApp(
    BMICalculator(),
  );
}

class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
          primaryColor: Color(0xFF0A0E21),
          scaffoldBackgroundColor: Color(0xFF0A0E21)),
      home: Scaffold(
        appBar: AppBar(
          title: Center(
            child: Text('BMI CALCULATOR'),
          ),
        ),
        body: BMIHome(),
      ),
    );
  }
}

class BMIHome extends StatefulWidget {
  @override
  _BMIHomeState createState() => _BMIHomeState();
}

class _BMIHomeState extends State<BMIHome> {
  Gender selectedGender;

  int height = 100;
  int weight = 30;
  int age = 16;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedGender = Gender.male;
                      print('you just click male');
                    });
                  },
                  child: ReuseableCard(
                    colour: selectedGender == Gender.male
                        ? kCardActiveColor
                        : kInactiveCardColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(
                          FontAwesomeIcons.mars,
                          size: 80,
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        Text(
                          'MALE',
                          style: kCardTextStyle,
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedGender = Gender.female;
                      print('you just click female');
                    });
                  },
                  child: ReuseableCard(
                    colour: selectedGender == Gender.female
                        ? kCardActiveColor
                        : kInactiveCardColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(
                          FontAwesomeIcons.venus,
                          size: 80,
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        Text(
                          'FEMALE',
                          style: kCardTextStyle,
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: ReuseableCard(
            colour: kInactiveCardColor,
            cardChild: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'HEIGHT',
                  style: kCardTextStyle,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline.alphabetic,
                  children: <Widget>[
                    Text(
                      height.toString(),
                      style: kTextStyle,
                    ),
                    Text(
                      'cm',
                      style: kCardTextStyle,
                    ),
                  ],
                ),
                SliderTheme(
                  data: SliderTheme.of(context).copyWith(
                    activeTrackColor: Colors.white,
                    thumbColor: Color(0xFFEB1555),
                    overlayColor: Color(0x25EB1555),
                    thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15.0),
                    overlayShape: RoundSliderOverlayShape(overlayRadius: 22.0),
                  ),
                  child: Slider(
                    value: height.toDouble(),
                    min: 30,
                    max: 220,
                    inactiveColor: Color(0xFF8D8E98),
                    onChanged: (double newValue) {
                      setState(() {
                        height = newValue.round();
                      });
                    },
                  ),
                )
              ],
            ),
          ),
        ),
        Expanded(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Expanded(
                child: ReuseableCard(
                  colour: kInactiveCardColor,
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'WEIGHT',
                        style: kCardTextStyle,
                      ),
                      Text(
                        weight.toString(),
                        style: kTextStyle,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          RoundIconButton(
                            icon: FontAwesomeIcons.minus,
                            onPressed: () {
                              setState(() {
                                weight--;
                              });
                            },
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          RoundIconButton(
                            icon: FontAwesomeIcons.plus,
                            onPressed: () {
                              setState(() {
                                weight++;
                              });
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: ReuseableCard(
                  colour: kInactiveCardColor,
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'AGE',
                        style: kCardTextStyle,
                      ),
                      Text(
                        age.toString(),
                        style: kTextStyle,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          RoundIconButton(
                            icon: FontAwesomeIcons.minus,
                            onPressed: () {
                              setState(() {
                                age--;
                              });
                            },
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          RoundIconButton(
                            icon: FontAwesomeIcons.plus,
                            onPressed: () {
                              setState(() {
                                age++;
                              });
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        GestureDetector(
          onTap: () {
            CalculatorBrain calculate = CalculatorBrain(
              height: height,
              weight: weight,
            );

            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ResultPage(
                  bmiResult: calculate.getBMIResult(),
                  bmiState: calculate.getResultState(),
                  bmiInterpretation: calculate.getInterpretation(),
                ),
              ),
            );
          },
          child: Container(
            padding: EdgeInsets.only(bottom: 12),
            margin: EdgeInsets.only(top: 5),
            color: Color(0xffEB1555),
            width: double.infinity,
            height: 70,
            child: Center(
              child: Text(
                'Calculate',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
