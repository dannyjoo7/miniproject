import 'package:flutter/material.dart';
import 'package:miniproject/main_page/user_service.dart';
import 'package:provider/provider.dart';

import '../photo_Detail_Page/Photo_Detail_Page.dart';

class IntroducePage extends StatelessWidget {
  IntroducePage({required this.index});

  int index;

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
    UserService userService = context.read<UserService>();
    User user = userService.userList[index];

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
                '${user.name}\n${user.oneLiner}\n${user.mbti}\n${user.introduceMyself}\n${user.myAdvantage}\n${user.collaborationStyle}',
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
