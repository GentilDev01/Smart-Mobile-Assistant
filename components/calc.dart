import 'package:flutter/material.dart';

class Calculator extends StatefulWidget {
  const Calculator({super.key});

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  String outputt = "0";

  String _output = "0";

  double num1 = 0;

  double num2 = 0;

  String operand = "";

  buttonPressed(String buttonText) {
    if (buttonText == "DEL") {
      _output = " ";
      num1 = 0;
      num2 = 0;
      operand = "";
    }else if(buttonText == 'CLEAR'){
      _output = "0";
      num1 = 0;
      num2 = 0;
      operand = "";
    }
     else if (buttonText == "+" ||
        buttonText == "-" ||
        buttonText == "/" ||
        buttonText == "*") {
      num1 = double.parse(outputt);

      operand = buttonText;

      _output = "0";
    } else if (buttonText == ".") {
      if (_output.contains(".")) {
        //print("Already contains a decimal");
        return;
      } else {
        _output = _output + buttonText;
      }
    } else if (buttonText == "=") {
      num2 = double.parse(outputt);

      if (operand == "+") {
        _output = (num1 + num2).toString();
      }
      if (operand == "-") {
        _output = (num1 - num2).toString();
      }
      if (operand == "*") {
        _output = (num1 * num2).toString();
      }
      if (operand == "/") {
        _output = (num1 / num2).toString();
      }

      num1 = 0.0;
      num2 = 0.0;
      operand = "";
    } else {
      _output = _output + buttonText;
    }

    //print(_output);

    setState(() {
      outputt = double.parse(_output).toStringAsFixed(1);
    });
  }

  Widget buildButton(String buttonText) {
  return Expanded(
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
          padding: const EdgeInsets.all(14.0), // Adjust padding as needed
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50.0), // Adjust the radius as needed
          ),
          side: const BorderSide(color: Colors.white, width: 2.0),
          backgroundColor: const Color.fromARGB(255, 5, 14, 136), // Background color
        ),
        onPressed: () => buttonPressed(buttonText),
        child: Text(
          buttonText,
          style: const TextStyle(
            fontSize: 20.0, // Adjust font size as needed
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
    ),
  );
}

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
          body: Center(
        child: Stack(
          children: <Widget>[
            Positioned.fill(
              child: Image.asset(
                'assets/image/background.jpg',
                fit: BoxFit.cover,
              ),
            ),

            // Overlay with color and opacity
            Positioned.fill(
              child: Container(
                color: const Color.fromRGBO(2, 28, 49, 0.75),
              ),
            ),
         
            // Content in the center
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 10.0,
                ),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    // crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      //kagastuff ko hejuru

                      Container(
                        width: 360,
                        height: 100,
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(
                              190, 1, 17, 31), // Color with 75% opacity
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Column(
                          children: [
                            const Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text(
                                  'Answer',
                                  style: TextStyle(
                                      fontSize: 20, color: Colors.white),
                                ),
                                
                                 
                                  Text(
                                   ("DEL"),
                                  style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.white,
                                  ), 
                                ),
                              ],
                            ),
                            const SizedBox(height: 4.0),
                            // umurongo
                            Row(
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                      width: 320,
                                      height: 2,
                                      color: Colors.white),
                                ),
                              ],
                            ),

                            const SizedBox(height: 4.0),

                            Row(
                              children: <Widget>[
                                Container(
                                  width: 310,
                                  height: 40,
                                  decoration: BoxDecoration(
                                    color: const Color.fromARGB(
                                      189,
                                      3,
                                      69,
                                      126,
                                    ), // Color with 75% opacity
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  margin: const EdgeInsets.only(left: 12.0),
                                  child: Center(
                                    child: Text(
                                        outputt,
                                      style:const TextStyle(
                                         fontSize: 24, color: Colors.white),
                                    ),
                                  ),
                                ),
                              ],
                            ),

                            const SizedBox(height: 2.0),
                          ],
                        ),
                      ),

                      //spacing ndashyiramo
                      const SizedBox(height: 20.0),
                      //section yama buttons

                      // padding: EdgeInsets.symmetric(horizontal: 20.0)
                        Container( 
                          width: 360,
                          height: 320,
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(190, 1, 17, 31),
                            borderRadius: BorderRadius.circular(25),
                          ),
                           margin: const EdgeInsets.only(left: 5.0,right: 5.0, top: 24,bottom: 0.0),
                          child:  SafeArea(
                            child: Column(
                              children:  [
                                Row(
                                  children: [
                                    buildButton("7"),
                                    buildButton("8"),
                                    buildButton("9"),
                                    buildButton("/"),
                                  ],
                                ),
                                Row(
                                  children: [
                                    buildButton("4"),
                                    buildButton("5"),
                                    buildButton("6"),
                                    buildButton("*"),
                                  ],
                                ),
                                 Row(
                                   children: [
                                     buildButton("1"),
                                     buildButton("2"),
                                     buildButton("3"),
                                     buildButton("-"),
                                   ],
                                 ),
                                 Row(
                                   children: [
                                     buildButton("."),
                                     buildButton("0"),
                                     buildButton("00"),
                                     buildButton("+"),
                                   ],
                                 ),
                                 Row(
                                   children: [
                                     buildButton("CLEAR"),
                                     buildButton("="),
                                   ],
                                 
                                 ),
                              
                               ],
                            ),
                          ),
                        ),
                   
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
       
      ),
    );
    
  }
}