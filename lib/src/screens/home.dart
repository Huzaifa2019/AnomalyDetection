import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import './upload.dart';
import './about.dart';
// import './result.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    var statusBarHeight = MediaQuery.of(context).padding.top;
    var size = MediaQuery.of(context).size;
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("lib/src/images/background.png"),
          fit: (MediaQuery.of(context).orientation == Orientation.portrait)
              ? BoxFit.fitHeight
              : BoxFit.fitWidth,
        ),
      ),
      height: size.height,
      width: size.width,
      child: Column(
        children: [
          Container(
            height: (MediaQuery.of(context).orientation == Orientation.portrait)
                ? size.height * 0.3
                : size.height * 0.4,
            width: size.width,
            padding: EdgeInsets.only(top: statusBarHeight),
            decoration: BoxDecoration(
              color: Color.fromRGBO(83, 83, 83, 0.5),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(50),
                bottomRight: Radius.circular(50),
              ),
            ),
            child: Center(
              child: Text(
                (MediaQuery.of(context).orientation == Orientation.portrait)
                    ? "Anomaly\nDetection"
                    : "Anomaly Detection",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Container(
            height: (MediaQuery.of(context).orientation == Orientation.portrait)
                ? size.height * 0.07
                : size.height * 0.05,
          ),
          Center(
            child: Container(
              height: size.height * 0.5,
              width: size.width * 0.8,
              child: Column(
                children: [
                  Container(
                    child: (MediaQuery.of(context).orientation ==
                            Orientation.portrait)
                        ? Text(
                            "Welcome to the real time Surveillance Video Anomaly Detection",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              height: 1.5,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.center,
                          )
                        : Text(
                            "Welcome to the real time Surveillance Video Anomaly Detection",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 19,
                              height: 1.2,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.center,
                          ),
                  ),
                  Container(
                    height: (MediaQuery.of(context).orientation ==
                            Orientation.portrait)
                        ? size.height * 0.07
                        : size.height * 0.05,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Upload()),
                      );
                    },
                    child: Container(
                      width: (MediaQuery.of(context).orientation ==
                              Orientation.portrait)
                          ? size.width * 0.5
                          : size.width * 0.4,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(50),
                        border: Border.all(
                          color: Colors.white,
                          width: 1,
                        ),
                      ),
                      padding: EdgeInsets.symmetric(
                        horizontal: 20,
                      ),
                      child: Container(
                        color: Colors.blue,
                        padding: EdgeInsets.symmetric(
                          vertical: 10,
                          horizontal: 0,
                        ),
                        child: Text(
                          "GET STARTED",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: (MediaQuery.of(context).orientation ==
                                    Orientation.portrait)
                                ? 18
                                : 16,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      top: 10,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => About()),
                      );
                    },
                    child: Container(
                      width: (MediaQuery.of(context).orientation ==
                              Orientation.portrait)
                          ? size.width * 0.5
                          : size.width * 0.4,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(50),
                        border: Border.all(
                          color: Colors.white,
                          width: 1,
                        ),
                      ),
                      padding: EdgeInsets.symmetric(
                        horizontal: 15,
                      ),
                      child: Container(
                        color: Colors.blue,
                        padding: EdgeInsets.symmetric(
                          vertical: 10,
                          horizontal: 10,
                        ),
                        child: Text(
                          "ABOUT US",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: (MediaQuery.of(context).orientation ==
                                    Orientation.portrait)
                                ? 18
                                : 16,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            height: (MediaQuery.of(context).orientation == Orientation.portrait)
                ? size.height * 0.1
                : size.height * 0.05,
          ),
        ],
      ),
    );
  }
}
