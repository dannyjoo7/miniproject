import 'package:flutter/material.dart';

import '../photo_Detail_Page/Photo_Detail_Page.dart';

class IntroducePage extends StatelessWidget {
  final List<String> imagePaths = [
    'assets/images/hun.png',
    'assets/images/hun.png',
    'assets/images/hun.png',
    'assets/images/hun.png',
    'assets/images/hun.png',
    'assets/images/hun.png',
    'assets/images/hun.png',
    'assets/images/hun.png',
    'assets/images/hun.png',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        title: Text(
          '하이파이브',
          style: TextStyle(
            color: Colors.black,
            fontSize: 30,
            fontWeight: FontWeight.bold,
            fontFamily: 'GES',
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
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => photoDetail()));
                      },
                      child: Image.asset(
                        imagePaths[index],
                        fit: BoxFit.scaleDown,
                      ),
                    ),
                  );
                }),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
