import 'package:flutter/material.dart';
import '../constants.dart';
import '../components/reusableCard.dart';
import '../components/bottomButton.dart';

class Resultspage extends StatelessWidget {
  Resultspage(
      {@required this.bmiresults,
      @required this.resultText,
      @required this.interpretation});

  final String bmiresults;
  final String resultText;
  final String interpretation;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Container(
              padding: EdgeInsets.all(15.0),
              alignment: Alignment.bottomLeft,
              child: Text(
                'Your Result',
                style: kTitleTextStyle,
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: ReusableCard(
              colour: KActiveCardColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(resultText.toUpperCase(), style: kresultTextStyle),
                  Text(bmiresults, style: kBmiTextStyle),
                  Text(interpretation,
                      textAlign: TextAlign.center, style: kBodyTextStyle)
                ],
              ),
            ),
          ),
          BottomButton(
            buttonTitle: 'RE-CALCULATE BMI',
            onTap: () {
              Navigator.pop(context);
            },
          )
        ],
      ),
    );
  }
}
