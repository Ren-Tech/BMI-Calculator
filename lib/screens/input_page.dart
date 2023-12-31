import 'package:bmi_calculator/calculator_brain.dart';
import 'package:bmi_calculator/components/bottom_button.dart';
import 'package:bmi_calculator/components/reusable_card.dart';
import 'package:bmi_calculator/components/reusable_card_content.dart';
import 'package:bmi_calculator/components/round_icon_button.dart';
import 'package:bmi_calculator/screens/result_screen.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:bmi_calculator/constants.dart';

enum Gender { male, female }

class InputPage extends StatefulWidget {
  const InputPage({super.key});

  @override
  InputPageState createState() => InputPageState();
}

class InputPageState extends State<InputPage> {
  Gender? selectedGender;
  int height = 180;
  int weight = 60;
  int age = 18;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('BMI CALCULATOR')),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    onUserTap: () {
                      setState(() {
                        selectedGender = Gender.male;
                      });
                    },
                    color: selectedGender == Gender.male
                        ? kActiveCardColor
                        : kInActiveCardColor,
                    cardChild: const ReusableCardContent(
                      cardIcon: FontAwesomeIcons.mars,
                      cardTitle: 'MALE',
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedGender = Gender.female;
                      });
                    },
                    child: ReusableCard(
                      onUserTap: () {
                        setState(() {
                          selectedGender = Gender.female;
                        });
                      },
                      cardChild: const ReusableCardContent(
                        cardIcon: FontAwesomeIcons.venus,
                        cardTitle: 'FEMALE',
                      ),
                      color: selectedGender == Gender.female
                          ? kActiveCardColor
                          : kInActiveCardColor,
                    ),
                  ),
                ),
              ],
            ),
          ),
          ReusableCard(
            cardChild: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'HEIGHT',
                  style: kCardTitleTextStyle,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,

                  //this will make the baseline match each other
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline.alphabetic,
                  children: [
                    Text(
                      height.toString(),
                      style: kCardNumberTitleTextStyle,
                    ),
                    const Text(
                      'cm',
                      style: kCardTitleTextStyle,
                    )
                  ],
                ),
                SliderTheme(
                  //this customize slider can be copy and paste it into the theme in main.dart to serve as the slider theme for any other slider in the app
                  data: SliderTheme.of(context).copyWith(
                    activeTrackColor: const Color.fromARGB(255, 231, 231, 235),
                    inactiveTrackColor: const Color(0xFF8D8E98),
                    thumbColor: const Color(0xFFEB1555),
                    overlayColor: const Color(0x29EB1555),

                    //this adjust the size of the overlay and thumb
                    thumbShape:
                        const RoundSliderThumbShape(enabledThumbRadius: 15),
                    overlayShape:
                        const RoundSliderOverlayShape(overlayRadius: 30),
                  ),
                  child: Slider(
                    value: height.toDouble(),
                    min: 120,
                    max: 220,
                    onChanged: (double newValue) {
                      setState(() {
                        height = newValue.round();
                      });
                    },
                  ),
                )
              ],
            ),
            color: kActiveCardColor,
            onUserTap: null,
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'WEIGHT',
                          style: kCardTitleTextStyle,
                        ),
                        Text(
                          weight.toString(),
                          style: kCardNumberTitleTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconButton(
                              icon: const Icon(FontAwesomeIcons.minus),
                              onUserPressed: () {
                                setState(() {
                                  weight--;
                                });
                              },
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            RoundIconButton(
                              icon: const Icon(FontAwesomeIcons.plus),
                              onUserPressed: () {
                                setState(() {
                                  weight++;
                                });
                              },
                            ),
                          ],
                        )
                      ],
                    ),
                    color: kActiveCardColor,
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'AGE',
                          style: kCardTitleTextStyle,
                        ),
                        Text(
                          age.toString(),
                          style: kCardNumberTitleTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconButton(
                                icon: const Icon(FontAwesomeIcons.minus),
                                onUserPressed: () {
                                  setState(() {
                                    age--;
                                  });
                                }),
                            const SizedBox(
                              width: 10,
                            ),
                            RoundIconButton(
                                icon: const Icon(FontAwesomeIcons.plus),
                                onUserPressed: () {
                                  setState(() {
                                    age++;
                                  });
                                }),
                          ],
                        )
                      ],
                    ),
                    color: kActiveCardColor,
                  ),
                ),
              ],
            ),
          ),
          BottomButton(
            buttonTitle: 'CALCULATE',
            onUserTap: () {
              CalculatorBrain calc =
                  CalculatorBrain(height: height, weight: weight);
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => Result(
                            bmiResult: calc.calculateBMI(),
                            resultText: calc.getResult(),
                            interpretation: calc.getInterpretation(),
                          )));
            },
          )
        ],
      ),
    );
  }
}
