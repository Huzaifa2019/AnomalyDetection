import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Result extends StatefulWidget {
  final result;

  Result(this.result);
  @override
  _ResultState createState() => _ResultState(this.result);
}

class _ResultState extends State<Result> {
  final anomaly;

  _ResultState(this.anomaly);
  @override
  Widget build(BuildContext context) {
    var statusBarHeight = MediaQuery.of(context).padding.top;
    var size = MediaQuery.of(context).size;

    return Scaffold(
      body: Container(
        height: size.height,
        width: size.width,
        color: Colors.black12,
        padding: EdgeInsets.only(top: statusBarHeight),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: size.height * 0.05,
              ),
              Container(
                height:
                    (MediaQuery.of(context).orientation == Orientation.portrait)
                        ? size.height * 0.3
                        : size.height * 0.4,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('lib/src/images/logo.png'),
                      fit: BoxFit.fitHeight),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  top: 15,
                ),
              ),
              Container(
                child:
                    (MediaQuery.of(context).orientation == Orientation.portrait)
                        ? Text(
                            "RESULT",
                            style: TextStyle(
                              color: (!anomaly) ? Colors.green : Colors.red,
                              fontSize: 26,
                              height: 1.5,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.center,
                          )
                        : Text(
                            "RESULT",
                            style: TextStyle(
                              color: (!anomaly) ? Colors.green : Colors.red,
                              fontSize: 24,
                              height: 1.2,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.center,
                          ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  top: 5,
                ),
              ),
              Container(
                child:
                    (MediaQuery.of(context).orientation == Orientation.portrait)
                        ? Text(
                            (!anomaly)
                                ? "No Anomaly Detected!"
                                : "Anomaly Detected!",
                            style: TextStyle(
                              color: (!anomaly) ? Colors.green : Colors.red,
                              fontSize: 20,
                              height: 1.5,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.center,
                          )
                        : Text(
                            (!anomaly)
                                ? "No Anomaly Detected!"
                                : "Anomaly Detected!",
                            style: TextStyle(
                              color: (!anomaly) ? Colors.green : Colors.red,
                              fontSize: 19,
                              height: 1.2,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.center,
                          ),
              ),
              Container(
                height: size.height * 0.05,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                  Navigator.pop(context);
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
                      "BACK",
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
              Container(
                height: size.height * 0.05,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
