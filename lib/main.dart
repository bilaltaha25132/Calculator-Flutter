import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'dart:math';

void main() {
  return runApp(
    const MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        body: Calculator(),
      ),
    ),
  );
}

class Calculator extends StatefulWidget {
  const Calculator({super.key});

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  String mathExpression = '';
  dynamic finalValue = 0;
  String toDisplay = '0';

  void getFinalValue(String expr) {
    var expression = expr;
    Parser p = Parser();
    Expression exp = p.parse(expression);
    // Evaluate expression
    double eval = exp.evaluate(EvaluationType.REAL, ContextModel());
    if (eval % 1 == 0) {
      // If yes, convert to int
      finalValue = eval.toInt();
    } else {
      // If no, keep it as double
      finalValue = eval;
    }
  }

  void buttonFunctionalities(String button) {
    if (button == '7') {
      mathExpression = '${mathExpression}7';
      toDisplay = mathExpression;
    }
    if (button == '8') {
      mathExpression = '${mathExpression}8';
      toDisplay = mathExpression;
    }
    if (button == '9') {
      mathExpression = '${mathExpression}9';
      toDisplay = mathExpression;
    }
    if (button == '4') {
      mathExpression = '${mathExpression}4';
      toDisplay = mathExpression;
    }
    if (button == '5') {
      mathExpression = '${mathExpression}5';
      toDisplay = mathExpression;
    }
    if (button == '6') {
      mathExpression = '${mathExpression}6';
      toDisplay = mathExpression;
    }
    if (button == '1') {
      mathExpression = '${mathExpression}1';
      toDisplay = mathExpression;
    }
    if (button == '2') {
      mathExpression = '${mathExpression}2';
      toDisplay = mathExpression;
    }
    if (button == '3') {
      mathExpression = '${mathExpression}3';
      toDisplay = mathExpression;
    }
    if (button == '0') {
      mathExpression = '${mathExpression}0';
      toDisplay = mathExpression;
    }
    if (button == '.') {
      mathExpression = '${mathExpression}.';
      toDisplay = mathExpression;
    }
    if (button == '%') {
      mathExpression = '${mathExpression}%';
      toDisplay = mathExpression;
    }
    if (button == '/') {
      mathExpression = '$mathExpression/';
      toDisplay = mathExpression;
    }
    if (button == 'x') {
      mathExpression = '${mathExpression}*';
      toDisplay = mathExpression;
    }
    if (button == '-') {
      mathExpression = '$mathExpression-';
      toDisplay = mathExpression;
    }
    if (button == '+') {
      mathExpression = '$mathExpression+';
      toDisplay = mathExpression;
    }
    if (button == '+/-') {
      mathExpression = '-1*($mathExpression)';
      toDisplay = mathExpression;
    }
    if (button == '=') {
      getFinalValue(mathExpression);
      if (finalValue % 1 != 0) {
        toDisplay = finalValue.toString();
      } else {
        toDisplay = finalValue.toString();
      }
      mathExpression = toDisplay;
    }
    if (button == 'AC') {
      mathExpression = '';
      toDisplay = '0';
      finalValue = 0;
    }
  }

  Widget calculatorbuttons(String btntxt, Color btnColor, Color txtColor) {
    return Container(
      child: ElevatedButton(
        onPressed: () {
          setState(() {
            buttonFunctionalities(btntxt);
          });
        },
        style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.all(20),
            shape: const CircleBorder(),
            backgroundColor: btnColor),
        child: Text(
          btntxt,
          style: TextStyle(
            fontSize: 25,
            color: txtColor,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(10.0),
                child: AutoSizeText(
                  toDisplay,
                  style: const TextStyle(
                    fontSize: 60,
                    color: Colors.white,
                  ),
                  maxLines: 1, // Ensures the text does not wrap
                  minFontSize: 10,
                  overflow: TextOverflow.ellipsis, // Shows ellipsis on overflow
                  textAlign: TextAlign.right,
                ),
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            calculatorbuttons('AC', Colors.grey, Colors.black),
            calculatorbuttons('+/-', Colors.grey, Colors.black),
            calculatorbuttons('%', Colors.grey, Colors.black),
            calculatorbuttons('/', Colors.amber.shade700, Colors.white),
          ],
        ),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            calculatorbuttons('7', Colors.grey.shade800, Colors.white),
            calculatorbuttons('8', Colors.grey.shade800, Colors.white),
            calculatorbuttons('9', Colors.grey.shade800, Colors.white),
            calculatorbuttons('x', Colors.amber.shade700, Colors.white),
          ],
        ),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            calculatorbuttons('4', Colors.grey.shade800, Colors.white),
            calculatorbuttons('5', Colors.grey.shade800, Colors.white),
            calculatorbuttons('6', Colors.grey.shade800, Colors.white),
            calculatorbuttons('-', Colors.amber.shade700, Colors.white),
          ],
        ),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            calculatorbuttons('1', Colors.grey.shade800, Colors.white),
            calculatorbuttons('2', Colors.grey.shade800, Colors.white),
            calculatorbuttons('3', Colors.grey.shade800, Colors.white),
            calculatorbuttons('+', Colors.amber.shade700, Colors.white),
          ],
        ),
        SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.fromLTRB(34, 20, 128, 15),
                shape: const StadiumBorder(),
                backgroundColor: Colors.grey.shade800,
              ),
              onPressed: () {
                setState(() {
                  mathExpression = '${mathExpression}0';
                  toDisplay = mathExpression;
                });
              },
              child: const Text(
                '0',
                style: TextStyle(
                  fontSize: 35,
                  color: Colors.white,
                ),
              ),
            ),
            calculatorbuttons('.', Colors.grey.shade800, Colors.white),
            calculatorbuttons('=', Colors.amber.shade700, Colors.white),
          ],
        ),
      ],
    );
  }
}
