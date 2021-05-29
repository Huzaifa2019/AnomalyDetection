import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class About extends StatefulWidget {
  @override
  _AboutState createState() => _AboutState();
}

class _AboutState extends State<About> {
  @override
  Widget build(BuildContext context) {
    var statusBarHeight = MediaQuery.of(context).padding.top;
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
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
              height:
                  (MediaQuery.of(context).orientation == Orientation.portrait)
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
                  "About Us",
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
              height:
                  (MediaQuery.of(context).orientation == Orientation.portrait)
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
                              "Real-World Anomaly Detection in Surveillance videos is an application of Deep Learning & Computer vision.\nIt is designed to classify anomalous videos based on realistic anomalies.",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                height: 1.5,
                                fontWeight: FontWeight.bold,
                              ),
                              textAlign: TextAlign.center,
                            )
                          : Text(
                              "Real-World Anomaly Detection in Surveillance videos is an application of Deep Learning & Computer vision. It is designed to classify anomalous videos based on realistic anomalies.",
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
                            color: Colors.blue,
                            width: 1,
                          ),
                        ),
                        padding: EdgeInsets.symmetric(
                          horizontal: 20,
                        ),
                        child: Container(
                          color: Colors.white,
                          padding: EdgeInsets.symmetric(
                            vertical: 10,
                            horizontal: 0,
                          ),
                          child: Text(
                            "BACK",
                            style: TextStyle(
                              color: Colors.blue,
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
                  ],
                ),
              ),
            ),
            Container(
              height:
                  (MediaQuery.of(context).orientation == Orientation.portrait)
                      ? size.height * 0.1
                      : size.height * 0.05,
            ),
          ],
        ),
      ),
    );
  }
}
