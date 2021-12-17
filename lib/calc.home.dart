import 'widgets/button.neu.dart';
import 'package:math_expressions/math_expressions.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class Calculator extends StatefulWidget {
  const Calculator({Key? key}) : super(key: key);

  @override
  _CalculatorState createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  // final Color themeColor = Colors.blueGrey[600]!;

  String userInput = '';
  String answer = '';

  @override
  Widget build(BuildContext context) {
    final Color themeColor = Colors.blueGrey[600]!;
    final Color antiThemeColor = Colors.blueGrey[200]!;
    final List<String> buttons = [
      'C', //0
      '%', //1
      '<', //2
      '/', //3
      '7', //4
      '8', //5
      '9', //6
      'x', //7
      '4', //8
      '5', //9
      '6', //10
      '-', //11
      '1', //12
      '2', //13
      '3', //14
      '+', //15
      '00', //16
      '0', //17
      '.', //18
      '=', //19
    ];
    return Scaffold(
      backgroundColor: themeColor,
      appBar: AppBar(
        title: const Text('Calculator'),
        backgroundColor: Colors.blueGrey[900],
      ),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(25),
              child: Neumorphic(
                curve: Neumorphic.DEFAULT_CURVE,
                padding: const EdgeInsets.symmetric(horizontal: 20),
                style: NeumorphicStyle(color: themeColor),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Container(
                      alignment: Alignment.centerRight,
                      child: Text(
                        userInput,
                        style: TextStyle(
                          fontSize: 18,
                          color: antiThemeColor,
                        ),
                      ),
                    ),
                    Container(
                      alignment: Alignment.centerRight,
                      child: Text(
                        answer,
                        style: TextStyle(
                          fontSize: 30,
                          color: antiThemeColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: SizedBox(
              child: GridView.builder(
                itemCount: buttons.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                ),
                itemBuilder: (BuildContext context, int index) {
                  // Clear Button
                  if (index == 0) {
                    return NeuNumButton(
                      onPressed: () {
                        setState(() {
                          userInput = '';
                          answer = '0';
                        });
                      },
                      text: buttons[index],
                      color: antiThemeColor,
                    );
                  }

                  // % button
                  else if (index == 1) {
                    return NeuNumButton(
                      onPressed: () {
                        userInput += buttons[index];
                      },
                      text: buttons[index],
                      color: antiThemeColor,
                    );
                  }
                  // Delete Button
                  else if (index == 2) {
                    return NeuNumButton(
                      onPressed: () {
                        setState(() {
                          userInput =
                              userInput.substring(0, userInput.length - 1);
                        });
                      },
                      text: buttons[index],
                      color: antiThemeColor,
                    );
                  }
                  // Equal_to Button
                  else if (index == 19) {
                    return NeuNumButton(
                      onPressed: () {
                        setState(() {
                          equalPressed();
                        });
                      },
                      text: buttons[index],
                      color: antiThemeColor,
                    );
                  }
                  //  other buttons
                  else {
                    return NeuNumButton(
                      onPressed: () {
                        setState(() {
                          userInput += buttons[index];
                        });
                      },
                      text: buttons[index],
                      color: isOperator(buttons[index])
                          ? antiThemeColor
                          : themeColor,
                      textColor: isOperator(buttons[index])
                          ? Colors.black
                          : Colors.white,
                    );
                  }
                },
              ), // GridView.builder
            ),
          ),
        ],
      ),
    );
  }

  bool isOperator(String x) {
    if (x == '/' || x == 'x' || x == '-' || x == '+' || x == '=') {
      return true;
    }
    return false;
  }

  void equalPressed() {
    String finaluserinput = userInput;
    finaluserinput = userInput.replaceAll('x', '*');
    Parser p = Parser();
    Expression exp = p.parse(finaluserinput);
    ContextModel cm = ContextModel();
    double eval = exp.evaluate(EvaluationType.REAL, cm);
    answer = eval.toString();
  }
}
