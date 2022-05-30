import 'package:calculator/utilitiy/default_color.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      "256.6 + 9.5",
                      style: TextStyle(
                          fontSize: 26, fontWeight: FontWeight.normal),
                    ),
                    Text(
                      "269.1",
                      style:
                          TextStyle(fontSize: 55, fontWeight: FontWeight.w400),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(
              child: Padding(
                padding: const EdgeInsets.only(top:55 ,left: 2),
                child: Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        getButtonsOperation(
                            image: 'C',
                            isImage: false,
                            border: true,
                            borderLeft: true),
                        getButtonsOperation(
                            image: 'assets/images/division.png'),
                        getButtonsOperation(
                            image: 'assets/images/multiplication.png'),
                        getButtonsOperation(
                            image: 'assets/images/delete.png', border: true),
                      ],
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        getButtonsOperation(
                          image: '7',
                          isImage: false,
                        ),
                        getButtonsOperation(
                          image: '8',
                          isImage: false,
                        ),
                        getButtonsOperation(
                          image: '9',
                          isImage: false,
                        ),
                        getButtonsOperation(
                            image: 'assets/images/subtraction.png'),
                      ],
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        getButtonsOperation(
                          image: '4',
                          isImage: false,
                        ),
                        getButtonsOperation(
                          image: '5',
                          isImage: false,
                        ),
                        getButtonsOperation(
                          image: '6',
                          isImage: false,
                        ),
                        getButtonsOperation(image: 'assets/images/sum.png'),
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
                                  isImage: false,
                                ),
                                getButtonsOperation(
                                  image: '2',
                                  isImage: false,
                                ),
                                getButtonsOperation(
                                  image: '3',
                                  isImage: false,
                                ),
                              ],
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                getButtonsOperation(
                                  image: '%',
                                  isImage: false,
                                ),
                                getButtonsOperation(
                                  image: '0',
                                  isImage: false,
                                ),
                                getButtonsOperation(
                                  image: '.',
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
                            onPressed: () {},
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget getButtonsOperation(
      {required String image,
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
        onPressed: () {},
      ),
    );
  }
}
