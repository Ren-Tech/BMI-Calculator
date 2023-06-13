import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'reusable_card.dart';
import 'reusable_card_content.dart';

const double bottomButtonHeight = 80;
const Color activeCardColor = Color(0xFF1D1E33);
const Color inActiveCardColor = Color(0xFF111328);
const Color bottomButtonColor = Color(0xFFEB1555);

enum Gender { male, female }

class InputPage extends StatefulWidget {
  const InputPage({super.key});

  @override
  InputPageState createState() => InputPageState();
}

class InputPageState extends State<InputPage> {
  Color maleCardColor = inActiveCardColor;
  Color femaleCardColor = inActiveCardColor;

  updateColor(Gender selectedGender) {
    if (selectedGender == Gender.male) {
      if (maleCardColor == inActiveCardColor) {
        maleCardColor = activeCardColor;
        femaleCardColor = inActiveCardColor;
      } else {
        maleCardColor = inActiveCardColor;
      }
    }
    if (selectedGender == Gender.female) {
      if (femaleCardColor == inActiveCardColor) {
        femaleCardColor = activeCardColor;
        maleCardColor = inActiveCardColor;
      } else {
        femaleCardColor = inActiveCardColor;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('BMI CALCULATOR')),
      ),
      body: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        updateColor(Gender.male);
                      });
                    },
                    child: ReusableCard(
                      color: maleCardColor,
                      cardChild: const ReusableCardContent(
                        cardIcon: FontAwesomeIcons.mars,
                        cardTitle: 'MALE',
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        updateColor(Gender.female);
                      });
                    },
                    child: ReusableCard(
                      cardChild: const ReusableCardContent(
                        cardIcon: FontAwesomeIcons.venus,
                        cardTitle: 'FEMALE',
                      ),
                      color: femaleCardColor,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const ReusableCard(
            color: activeCardColor,
          ),
          const Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    color: activeCardColor,
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    color: activeCardColor,
                  ),
                ),
              ],
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: bottomButtonColor,
              borderRadius: BorderRadius.circular(10),
            ),
            width: double.infinity,
            height: bottomButtonHeight,
            margin: const EdgeInsets.all(10),
          )
        ],
      ),
    );
  }
}
