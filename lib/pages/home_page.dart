import 'package:calculator/utilitiy/default_color.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String equation = "";
  String currentValue = "0";
  String auxValue = "";
  String auxEquation = "";

  void incrementValue(String value) {
    setState(() {
      currentValue = value;
    });
  }

  void incrementEquation(String value) {
    setState(() {
      if (value.isEmpty) {
        equation = value;
      } else {
        equation += value;
      }      
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: DefaultColor.getcolorBackgroud,
      body: Column(
        children: [
          Expanded(
            flex: 1,
            child: Container(
              alignment: Alignment.centerRight,
              child: Padding(
                padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      equation,
                      textAlign: TextAlign.end,
                      style: const TextStyle(
                          fontSize: 26, fontWeight: FontWeight.normal),
                    ),
                    Text(
                      currentValue,
                      textAlign: TextAlign.end,
                      style: const TextStyle(
                          fontSize: 55, fontWeight: FontWeight.w400),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.only(top: 55, left: 2),
              child: Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      getButtonsOperation(
                          image: 'C',
                          value: 'C',
                          isImage: false,
                          border: true,
                          borderLeft: true),
                      getButtonsOperation(
                        image: 'assets/images/division.png',
                        value: '/',
                      ),
                      getButtonsOperation(
                        image: 'assets/images/multiplication.png',
                        value: '*',
                      ),
                      getButtonsOperation(
                          image: 'assets/images/delete.png',
                          value: 'del',
                          border: true),
                    ],
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      getButtonsOperation(
                        image: '7',
                        value: '7',
                        isImage: false,
                      ),
                      getButtonsOperation(
                        image: '8',
                        value: '8',
                        isImage: false,
                      ),
                      getButtonsOperation(
                        image: '9',
                        value: '9',
                        isImage: false,
                      ),
                      getButtonsOperation(
                        image: 'assets/images/subtraction.png',
                        value: '-',
                      ),
                    ],
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      getButtonsOperation(
                        image: '4',
                        value: '4',
                        isImage: false,
                      ),
                      getButtonsOperation(
                        image: '5',
                        value: '5',
                        isImage: false,
                      ),
                      getButtonsOperation(
                        image: '6',
                        value: '6',
                        isImage: false,
                      ),
                      getButtonsOperation(
                        image: 'assets/images/sum.png',
                        value: '+',
                      ),
                    ],
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              getButtonsOperation(
                                image: '1',
                                value: '1',
                                isImage: false,
                              ),
                              getButtonsOperation(
                                image: '2',
                                value: '2',
                                isImage: false,
                              ),
                              getButtonsOperation(
                                image: '3',
                                value: '3',
                                isImage: false,
                              ),
                            ],
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              getButtonsOperation(
                                image: '%',
                                value: '%',
                                isImage: false,
                              ),
                              getButtonsOperation(
                                image: '0',
                                value: '0',
                                isImage: false,
                              ),
                              getButtonsOperation(
                                image: '.',
                                value: '.',
                                isImage: false,
                              ),
                            ],
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: ElevatedButton(
                          child: Image.asset('assets/images/result.png'),
                          style: ElevatedButton.styleFrom(
                            minimumSize: const Size(93, 188),
                            onPrimary: Colors.white,
                            primary: DefaultColor.getcolorButtonsResult,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(0.0)),
                          ),
                          onPressed: () {
                            incrementEquation(currentValue);
                            auxEquation = equation.trim();
                            double result = 0;
                            auxEquation.split("+");
                            auxEquation.split(" ");                      
                            for (var i = 0; i < auxEquation.length; i++) {
                              if(auxEquation[i] != " " && auxEquation[i] != "+"){
                                result += double.parse(auxEquation[i]);
                              }
                            }
                            auxEquation = "";
                            auxValue = "";
                            incrementValue(result.truncate().toString());                            
                          },
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget getButtonsOperation(
      {required String image,
      required dynamic value,
      bool isImage = true,
      bool border = false,
      bool borderLeft = false}) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: ElevatedButton(
        child: (isImage)
            ? Image.asset(image)
            : Text(image, style: const TextStyle(fontSize: 24)),
        style: ElevatedButton.styleFrom(
          minimumSize: const Size(93, 93),
          onPrimary: Colors.white,
          primary: DefaultColor.getcolorButtonsOperation,
          shape: (borderLeft)
              ? RoundedRectangleBorder(
                  borderRadius: (border)
                      ? const BorderRadius.only(topLeft: Radius.circular(30))
                      : BorderRadius.circular(0.0))
              : RoundedRectangleBorder(
                  borderRadius: (border)
                      ? const BorderRadius.only(topRight: Radius.circular(30))
                      : BorderRadius.circular(0.0)),
        ),
        onPressed: () {
          switch (value) {
            case '1':
            case '2':
            case '3':
            case '4':
            case '5':
            case '6':
            case '7':
            case '8':
            case '9':
            case '0':
            case '.':
              auxValue += value.toString();
              incrementValue(auxValue);
              break;
            case 'C':
              auxValue = "";
              auxEquation = "";
              incrementEquation("");
              incrementValue("0");
              break;
            case 'del':
              auxValue = "";
              incrementValue("0");
              break;
            case '/':
              incrementEquation(auxValue + " / ");
              auxValue = "";
              incrementValue("0");
              break;
            case '*':
              incrementEquation(auxValue + " * ");
              auxValue = "";
              incrementValue("0");
              break;
            case '-':
              incrementEquation(auxValue + " - ");
              auxValue = "";
              incrementValue("0");
              break;
            case '+':
              incrementEquation(auxValue + " + ");
              auxValue = "";
              incrementValue("0");
              break;
            default:
          }
        },
      ),
    );
  }
}
