import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'Iconic.dart';
import 'Reuse.dart';
import 'constants.dart';
import 'second_page.dart';
import 'Calculator.dart';

enum Gender { male, female } // gender enum

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  int height = 150;
  int weight = 60;
  int age = 15;
  Color maleactive = inactivecolour;
  Color femaleactive = inactivecolour;
  @override
  void update(Gender type) {
    if (type == Gender.male) {
      if (maleactive == inactivecolour) {
        femaleactive = inactivecolour;
        maleactive = activecolour;
      } else {
        maleactive = inactivecolour;
      }
    } else if (type == Gender.female) {
      if (femaleactive == inactivecolour) {
        maleactive = inactivecolour;
        femaleactive = activecolour;
      } else {
        femaleactive = inactivecolour;
      }
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            'BMI CALCULATOR',
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Row(children: <Widget>[
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    setState(
                      () {
                        update(Gender.male);
                      },
                    );
                  },
                  child: Reuse(
                    col: maleactive,
                    cardproperty: Iconic(
                      ic: FontAwesomeIcons.mars,
                      str: 'Male',
                    ),
                  ),
                ),
              ),
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      update(Gender.female);
                    });
                  },
                  child: Reuse(
                    col: femaleactive,
                    cardproperty: Iconic(
                      ic: FontAwesomeIcons.venus,
                      str: 'Female',
                    ),
                  ),
                ),
              ),
            ]),
          ),
          Expanded(
            child: Reuse(
              col: inactivecolour,
              cardproperty: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'Height',
                    style: text_style,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: <Widget>[
                      Text(
                        height.toString(),
                        style: slider_style,
                      ),
                      Text(
                        'cm',
                        style: slider_style,
                      ),
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      inactiveTrackColor: Color(0xFF8D8E98),
                      activeTrackColor: Colors.white,
                      thumbColor: Color(0xFFEB1555),
                      overlayColor: Color(0x29EB1555),
                      thumbShape:
                          RoundSliderThumbShape(enabledThumbRadius: 10.0),
                      overlayShape:
                          RoundSliderOverlayShape(overlayRadius: 30.0),
                    ),
                    child: Slider(
                      min: 80,
                      max: 250,
                      value: height.toDouble(),
                      onChanged: (double value) {
                        setState(() {
                          height = value.round();
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
              child: Row(
            children: <Widget>[
              Expanded(
                child: Reuse(
                  col: inactivecolour,
                  cardproperty: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'Weight',
                        style: text_style,
                      ),
                      Text(
                        weight.toString(),
                        style: slider_style,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Button(
                              icon: FontAwesomeIcons.minus,
                              onPressed: () {
                                // Your Function
                                setState(() {
                                  weight--;
                                });
                              }),
                          SizedBox(
                            width: 10.0,
                          ),
                          Button(
                              icon: FontAwesomeIcons.plus,
                              onPressed: () {
                                // Your Function
                                setState(() {
                                  weight++;
                                });
                              }),
                        ],
                      )
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Reuse(
                  col: inactivecolour,
                  cardproperty: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'Age',
                        style: text_style,
                      ),
                      Text(
                        age.toString(),
                        style: slider_style,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Button(
                              icon: FontAwesomeIcons.minus,
                              onPressed: () {
                                setState(() {
                                  age--;
                                });
                              }),
                          SizedBox(
                            width: 10.0,
                          ),
                          Button(
                              icon: FontAwesomeIcons.plus,
                              onPressed: () {
                                setState(() {
                                  age++;
                                });
                              }),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ],
          )),
          GestureDetector(
            child: Container(
              child: Center(
                child: Text(
                  'CALCULATE',
                  style: TextStyle(
                    fontSize: 25.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              color: Color(0xFFEB1555),
              margin: EdgeInsets.only(
                top: 10.0,
              ),
              width: double.infinity,
              height: 80.0,
            ),
            onTap: () {
              Calculator cal = Calculator(he_ight: height, we_ight: weight);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Second_page(
                    calculate: cal.Calculate(),
                    interpretation: cal.Interpretation(),
                    result: cal.Result(),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

class Button extends StatelessWidget {
  Button({required this.icon, required this.onPressed});
  late final IconData icon;
  late final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      elevation: 6.0,
      child: Icon(icon),
      onPressed: onPressed,
      constraints: BoxConstraints.tightFor(
        width: 56.0,
        height: 56.0,
      ),
      shape: CircleBorder(),
      fillColor: Color(0xFF4C4F5E),
    );
  }
}
