import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.blueGrey,
        appBar: AppBar(
          backgroundColor: Colors.black,
          leading: const Icon(
            Icons.calculate,
            color: Colors.blueGrey,
            size: 30.0,
          ),
          title: const Text(
            'Tip Calculator',
            style: TextStyle(
              color: Colors.blueGrey,
              fontFamily: 'ShadowsIntoLight',
              fontWeight: FontWeight.bold,
              fontSize: 25.0,
              letterSpacing: 1.5,
            ),
          ),
        ),
        body: const Calculator(),
      ),
    );
  }
}

class Calculator extends StatefulWidget {
  const Calculator({Key? key}) : super(key: key);

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  double totalBill = 0.0;
  double percentTip = 0.0;
  int splitTicket = 0;
  double tip = 0.0;
  double billWithTip = 0.0;
  double tipPerPerson = 0.0;
  double billPerPerson = 0.0;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(15.0),
      child: Column(
        children: [
          TextField(
            onChanged: (value) {
              totalBill = double.parse(value);
            },
            showCursor: false,
            decoration: InputDecoration(
              fillColor: Colors.blueGrey.shade400,
              filled: true,
              icon: const Icon(
                Icons.receipt,
                size: 30.0,
                color: Colors.black,
              ),
              border: const OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.black,
                ),
              ),
              focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.black,
                  width: 2.0,
                ),
              ),
              labelText: 'Total Bill',
              labelStyle: const TextStyle(
                color: Colors.black,
                fontFamily: 'ShadowsIntoLight',
                fontWeight: FontWeight.bold,
                fontSize: 20.0,
                letterSpacing: 1.5,
              ),
              hintText: '0.00',
              hintStyle: const TextStyle(
                color: Colors.black,
                fontFamily: 'ShadowsIntoLight',
                fontWeight: FontWeight.normal,
                fontSize: 20.0,
                letterSpacing: 1.5,
              ),
              prefixText: '\$',
              contentPadding: const EdgeInsets.fromLTRB(10.0, 1.0, 1.0, 10.0),
            ),
          ),
          SizedBox(
            height: 20.0,
          ),
          TextField(
            onChanged: (value) {
              percentTip = double.parse(value) / 100;
            },
            showCursor: false,
            decoration: InputDecoration(
              fillColor: Colors.blueGrey.shade400,
              filled: true,
              icon: const Icon(
                Icons.payments,
                size: 30.0,
                color: Colors.black,
              ),
              border: const OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.black,
                ),
              ),
              focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.black,
                  width: 2.0,
                ),
              ),
              labelText: 'Tip',
              labelStyle: const TextStyle(
                color: Colors.black,
                fontFamily: 'ShadowsIntoLight',
                fontWeight: FontWeight.bold,
                fontSize: 20.0,
                letterSpacing: 1.5,
              ),
              hintText: '0',
              hintStyle: const TextStyle(
                color: Colors.black,
                fontFamily: 'ShadowsIntoLight',
                fontWeight: FontWeight.normal,
                fontSize: 20.0,
                letterSpacing: 1.5,
              ),
              suffixText: '%',
              contentPadding: const EdgeInsets.fromLTRB(10.0, 1.0, 1.0, 10.0),
            ),
          ),
          SizedBox(
            height: 20.0,
          ),
          TextField(
            onChanged: (value) {
              splitTicket = int.parse(value);
            },
            showCursor: false,
            decoration: InputDecoration(
              fillColor: Colors.blueGrey.shade400,
              filled: true,
              icon: const Icon(
                Icons.person_add,
                size: 30.0,
                color: Colors.black,
              ),
              border: const OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.black,
                ),
              ),
              focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.black,
                  width: 2.0,
                ),
              ),
              labelText: 'Split ticket',
              labelStyle: const TextStyle(
                color: Colors.black,
                fontFamily: 'ShadowsIntoLight',
                fontWeight: FontWeight.bold,
                fontSize: 20.0,
                letterSpacing: 1.5,
              ),
              hintText: '0',
              hintStyle: const TextStyle(
                color: Colors.black,
                fontFamily: 'ShadowsIntoLight',
                fontWeight: FontWeight.normal,
                fontSize: 20.0,
                letterSpacing: 1.5,
              ),
              suffixText: 'ways',
              contentPadding: const EdgeInsets.fromLTRB(10.0, 1.0, 1.0, 10.0),
            ),
          ),
          SizedBox(
            height: 20.0,
          ),
          TextButton(
            onPressed: () {
              setState(() {
                tip = totalBill * percentTip;
                tipPerPerson = tip / splitTicket;
                billWithTip = totalBill + tip;
                billPerPerson = billWithTip / splitTicket;
                print(splitTicket.toString());
              });
            },
            child: const Text(
              'Calculate',
              style: TextStyle(
                color: Colors.black,
                fontFamily: 'ShadowsIntoLight',
                fontWeight: FontWeight.bold,
                fontSize: 30.0,
                letterSpacing: 2.0,
              ),
            ),
          ),
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Tips:',
                    style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'ShadowsIntoLight',
                      fontWeight: FontWeight.bold,
                      fontSize: 25.0,
                      letterSpacing: 1.5,
                    ),
                  ),
                  Text(
                    '\$${tip.toStringAsFixed(2)}',
                    style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'ShadowsIntoLight',
                      fontWeight: FontWeight.bold,
                      fontSize: 25.0,
                      letterSpacing: 1.5,
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Total Bill With Tip:',
                    style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'ShadowsIntoLight',
                      fontWeight: FontWeight.bold,
                      fontSize: 25.0,
                      letterSpacing: 1.5,
                    ),
                  ),
                  Text(
                    '\$${billWithTip.toStringAsFixed(2)}',
                    style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'ShadowsIntoLight',
                      fontWeight: FontWeight.bold,
                      fontSize: 25.0,
                      letterSpacing: 1.5,
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Tips Per Person:',
                    style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'ShadowsIntoLight',
                      fontWeight: FontWeight.bold,
                      fontSize: 25.0,
                      letterSpacing: 1.5,
                    ),
                  ),
                  Text(
                    '\$${tipPerPerson.toStringAsFixed(2)}',
                    style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'ShadowsIntoLight',
                      fontWeight: FontWeight.bold,
                      fontSize: 25.0,
                      letterSpacing: 1.5,
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Bill Per Person:',
                    style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'ShadowsIntoLight',
                      fontWeight: FontWeight.bold,
                      fontSize: 25.0,
                      letterSpacing: 1.5,
                    ),
                  ),
                  Text(
                    '\$${billPerPerson.toStringAsFixed(2)}',
                    style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'ShadowsIntoLight',
                      fontWeight: FontWeight.bold,
                      fontSize: 25.0,
                      letterSpacing: 1.5,
                    ),
                  ),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
