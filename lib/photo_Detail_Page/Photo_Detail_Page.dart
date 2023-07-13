import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../main_page/user_service.dart';

class photoDetail extends StatefulWidget {
  photoDetail({super.key, required this.userIndex, required this.pathIndex});

  int userIndex;
  int pathIndex;

  @override
  State<photoDetail> createState() => _photoDetailState();
}

class _photoDetailState extends State<photoDetail> {
  bool like = false;
  int count = 0;

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
    User user = userService.userList[widget.userIndex];

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Stack(
              children: [
                Positioned(
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.7,
                    width: MediaQuery.of(context).size.width * 1,
                    child: Image.asset(
                      "$basicImgPaths${user.id}${path[widget.pathIndex]}", //배경사진
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  child: Container(
                    color: Colors.black38,
                    height: 100,
                    width: MediaQuery.of(context).size.width * 1,
                  ),
                ),
                Positioned(
                  bottom: 0,
                  child: Row(
                    children: [
                      SizedBox(
                        width: 10,
                      ),
                      Container(
                        width: 75,
                        height: 75,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: Colors.black, // 테두리 색상
                            width: 2.0, // 테두리 두께
                          ),
                        ),
                        child: ClipOval(
                          child: Image.asset(
                            "$basicImgPaths${user.id}.png", //프로필사진

                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "이름",
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(
                            height: 3,
                          ),
                          Text(
                            "MBTI",
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.45,
                      ),
                      InkWell(
                        onTap: () {
                          setState(() {
                            like = !like;
                          });
                        },
                        child: Icon(
                          like
                              ? CupertinoIcons.heart_fill
                              : CupertinoIcons.heart,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(
                        width: 4,
                      ),
                      if (like == true)
                        Text(
                          "${count = 1}",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                          ),
                        ),
                      if (like == false)
                        Text(
                          "${count = 0}",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                          ),
                        ),
                    ],
                  ),
                ),
              ],
            ),
            Expanded(
              child: ListView(
                children: [
                  Stack(
                    children: [
                      Image.asset(
                        'assets/images/note.png',
                      ),
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Text(
                          "안녕하세요. 잘 부탁드립니다. ㅁㅁㅁ", //소개글
                          style: TextStyle(fontSize: 18, height: 1.7),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
