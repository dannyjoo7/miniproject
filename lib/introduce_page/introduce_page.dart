import 'package:flutter/material.dart';
import 'package:miniproject/main_page/user_service.dart';
import 'package:provider/provider.dart';
import 'package:webview_flutter/webview_flutter.dart';

import 'package:path_provider/path_provider.dart';
import 'dart:io';

import '../photo_Detail_Page/Photo_Detail_Page.dart';

class IntroducePage extends StatelessWidget {
  IntroducePage({required this.userIndex});

  int userIndex;

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
    User user = userService.userList[userIndex];

    userService.loadUserList();

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        title: Text(
          '하이 파이브',
          style: TextStyle(
            color: Colors.black,
            fontSize: 30,
            fontWeight: FontWeight.bold,
            fontFamily: 'GES',
          ),
        ),
        actions: [
          Icon(
            Icons.more_vert,
            color: Colors.black,
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 15),
            child: Row(
              children: [
                // 개인 페이지 아이콘
                Padding(
                  padding: const EdgeInsets.only(left: 25),
                  child: Icon(
                    Icons.account_circle,
                    size: 75,
                  ),
                ),
                SizedBox(
                  width: 80,
                ),
                Column(
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "4",
                          style: TextStyle(
                              fontSize: 23, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "게시물",
                          style: TextStyle(fontSize: 18),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  width: 20,
                ),
                Column(
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "4",
                          style: TextStyle(
                              fontSize: 23, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "팔로워",
                          style: TextStyle(fontSize: 18),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  width: 20,
                ),
                Column(
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "${user.views}",
                          style: TextStyle(
                              fontSize: 23, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "조회수",
                          style: TextStyle(fontSize: 18),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 5),
            child: Row(
              children: [
                // 개인 페이지 아이디
                Padding(
                  padding: const EdgeInsets.only(left: 15),
                  child: Text(
                    user.id,
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),
          Row(
            children: [
              // 한줄 소개글
              Padding(
                padding: const EdgeInsets.only(left: 15),
                child: Text(
                  user.oneLiner,
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
              ),
            ],
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 15),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        // 개인 블로그 주소
                        builder: (context) => WebView(
                          initialUrl: user.blog,
                        ),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: (Colors.white),
                    minimumSize: Size(90, 35),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    side: BorderSide(width: 2),
                  ),
                  child: Text(
                    '블로그',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          ),
          Divider(
            color: Colors.grey[300],
            thickness: 1,
          ),

          // photoPage
          Expanded(
            child: GridView.count(
              crossAxisCount: 3,
              children: List.generate(4, (index) {
                return Container(
                  padding: EdgeInsets.all(3),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => photoDetail(
                                    userIndex: userIndex,
                                    pathIndex: index,
                                  )));
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
        ],
      ),
    );
  }
}
