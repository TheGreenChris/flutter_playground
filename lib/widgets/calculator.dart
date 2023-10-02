import 'package:flutter/material.dart';
import 'package:flutter_playground/widgets/round_button.dart';

class Calculator extends StatefulWidget {
  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  int? firstOperand;
  String? operator;
  int? secondOperand;
  int? result;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.black,
        title: Align(
          alignment: Alignment.bottomRight,
          child: Text(_buildDisplayText()),
          ),
      ),
      body: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              RoundButton(label: '7', onTap: () => numberPressed(7)),
              RoundButton(label: '8', onTap:() => numberPressed(8)),
              RoundButton(label: '9', onTap:() => numberPressed(9)),
              RoundButton(label: '*', onTap:() => operatorPressed('*')),
            ],
          ),
          Row(
            children: <Widget>[
              RoundButton(label: '4', onTap: () => numberPressed(4)),
              RoundButton(label: '5', onTap:() => numberPressed(5)),
              RoundButton(label: '6', onTap:() => numberPressed(6)),
              RoundButton(label: '/', onTap:() => operatorPressed('/')),
            ],
          ),
          Row(
            children: <Widget>[
              RoundButton(label: '1', onTap: () => numberPressed(1)),
              RoundButton(label: '2', onTap:() => numberPressed(2)),
              RoundButton(label: '3', onTap:() => numberPressed(3)),
              RoundButton(label: '+', onTap:() => operatorPressed('+')),
            ],
          ),
          Row(
            children: <Widget>[
              RoundButton(label: '=', onTap: calculateResult),
              RoundButton(label: '0', onTap:() => numberPressed(0)),
              RoundButton(label: 'C', onTap: clearCalculation),
              RoundButton(label: '-', onTap:() => operatorPressed('-')),
            ],
          ),
        ],
      ),
    );
  }

  String _buildDisplayText() {
    if (result != null) {
      return '$result';
    }
    if (secondOperand != null) {
      return '$firstOperand$operator$secondOperand';
    }
    if (operator != null) {
      return '$firstOperand$operator';
    }
    if (firstOperand != null) {
      return '$firstOperand'; 
    }
    return '0';
  }

  void calculateResult() {
    if (firstOperand == null || secondOperand == null) {
      return;      
    }
    if (operator == '+' ) {
      add();
      return;
    }
    if (operator == '-') {
      subtract();
      return;
    }
    if (operator == '*') {
      multiply();
      return;
    }
    if (operator == '/') {
      divide();
    }
  }

  void add() {
    setState(() {
      result = firstOperand! + secondOperand!;
    });
  }

  void subtract() {
    setState(() {
      result = firstOperand! - secondOperand!;
    });
  }

  void multiply() {
    setState(() {
      result = firstOperand! * secondOperand!;
    });
  }

  void divide() {
    setState(() {
      result = firstOperand! ~/ secondOperand!;
    });
  }

  void numberPressed(int numberBeeingPressed) {
    if (firstOperand == null){
      setState(() {
        firstOperand = numberBeeingPressed;
      });
      return;
    }

    if (operator == null) {
      setState(() {
        firstOperand = int.parse('$firstOperand$numberBeeingPressed');
      });
      return;
    }
    
    if (secondOperand == null) {
      setState(() {
        secondOperand = numberBeeingPressed;
      });
      return;
    }

    setState(() {
      secondOperand = int.parse('$secondOperand$numberBeeingPressed');
    });
  }
  void operatorPressed(String operatorBeeingPressed) {
    setState(() {
      operator = operatorBeeingPressed;  
    });
  }

  void clearCalculation() {
    setState(() {
      firstOperand = null;
      secondOperand = null;
      operator = null;
      result = null;
    });
  }
}