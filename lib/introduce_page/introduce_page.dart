import 'package:flutter/material.dart';

class IntroducePage extends StatelessWidget {
  final List<String> imagePaths = [
    'assets/images/hun1.png',
    'assets/images/hun2.png',
    'assets/images/hun3.png',
    'assets/images/hun4.png',
    'assets/images/hun5.png',
    'assets/images/hun6.png',
    'assets/images/hun7.png',
    'assets/images/hun8.png',
    'assets/images/hun9.png',
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Text(
            '하이파이브',
            style: TextStyle(
              color: Colors.black,
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        body: Column(
          children: [
            Container(
              color: Colors.black,
              height: 2,
            ),
            Padding(
              padding: EdgeInsets.only(left: 16),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'ljmin94\n한 줄 소개글\nMBTI\n자신에 대한 설명\n객관적으로 살펴본 자신의 장점\n자신의 협업 스타일 소개',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                  ),
                  textAlign: TextAlign.left,
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.only(top: 30),
                child: GridView.count(
                  crossAxisCount: 3, // 열의 개수
                  children: List.generate(9, (index) {
                    return Container(
                      padding: EdgeInsets.all(10),
                      child: Image.asset(
                        imagePaths[index],
                        fit: BoxFit.scaleDown,
                      ),
                    );
                  }),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
