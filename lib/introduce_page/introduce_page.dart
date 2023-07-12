import 'package:flutter/material.dart';
import 'package:miniproject/main_page/user_service.dart';
import 'package:provider/provider.dart';
import 'package:webview_flutter/webview_flutter.dart';

import 'package:path_provider/path_provider.dart';
import 'dart:io';

import '../photo_Detail_Page/Photo_Detail_Page.dart';

class IntroducePage extends StatelessWidget {
  IntroducePage({required this.index});

  int index;

  String basicImgPaths = "assets/images/";
  List<String> path = [
    "/mbti.png",
    "/self_introduce.png",
    "/advantages.png",
    "/collaboration_style.png",
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
                '${user.views}\n${user.name}\n${user.oneLiner}\n${user.mbti}\n${user.introduceMyself}\n${user.myAdvantage}\n${user.collaborationStyle}',
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
                children: List.generate(4, (index) {
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
                        "$basicImgPaths${user.id}${path[index]}",
                        fit: BoxFit.fill,
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
