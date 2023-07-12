import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:miniproject/main_page/user_service.dart';
import 'package:miniproject/main_page/user_simple_info.dart';
import 'package:provider/provider.dart';

import '../introduce_page/introduce_page.dart';
import '../introduce_page/team_detail_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int curidx = 0;
  bool isHeart = true;
  bool isBookmarked = true;

  @override
  Widget build(BuildContext context) {
    return Consumer<UserService>(
      builder: (context, userService, child) {
        List<User> userList = userService.userList;

        return Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: Colors.white,
            elevation: 0.5,
            title: Text(
              '하이 파이브',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 30,
                fontFamily: 'GES',
              ),
            ),
          ),
          body: Column(
            children: [
              // 사진 상단 부분
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 5,
                    ),
                    Icon(
                      Icons.account_circle,
                      size: 50,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      "HI-Five",
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                    SizedBox(
                      width: 199,
                    ),
                    Icon(
                      Icons.more_horiz,
                      size: 50,
                    ),
                  ],
                ),
              ),

              // 화면 swipe 부분
              Expanded(
                child: PageView.builder(
                  itemCount: 3, // 페이지 수
                  itemBuilder: (context, index) {
                    // 각 페이지의 콘텐츠를 구성하는 위젯을 반환합니다.
                    switch (index) {
                      // 팀 사진 페이지
                      case 0:
                        return Container(
                          child: DecoratedBox(
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [
                                  Colors.blue,
                                  Colors.purple
                                ], // 그라데이션 색상 배열
                                begin: Alignment.topLeft, // 그라데이션 시작 위치
                                end: Alignment.bottomRight, // 그라데이션 끝 위치
                              ),
                            ),
                            child: Center(
                              child: Text(
                                "Hi-Five",
                                style: TextStyle(
                                  fontFamily: "Fasthand",
                                  fontSize: 100,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        );

                      case 1:
                        return Container(
                          color: Colors.amber,
                          child: Center(
                              child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              TeamDetailPage()));
                                },
                                child: Icon(
                                  Icons.account_circle_outlined,
                                  size: 80,
                                ),
                              ),
                              Text(
                                "팀 세부 소개",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          )),
                        );

                      // 팀원 소개 페이지
                      case 2:
                        return Container(
                          color: Colors.grey[300],
                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(15.0),
                                      child: GestureDetector(
                                        child: UserSimpleInfo(
                                          num: userList[0].name,
                                          one_line_introduction:
                                              userList[0].oneLiner,
                                        ),
                                        onTap: () {
                                          userList[0].views++;
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      IntroducePage(index: 0)));
                                        },
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(15.0),
                                      child: GestureDetector(
                                        child: UserSimpleInfo(
                                          num: userList[1].name,
                                          one_line_introduction:
                                              userList[1].oneLiner,
                                        ),
                                        onTap: () {
                                          userList[1].views++;
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      IntroducePage(index: 1)));
                                        },
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(15.0),
                                      child: GestureDetector(
                                        child: UserSimpleInfo(
                                          num: userList[2].name,
                                          one_line_introduction:
                                              userList[2].oneLiner,
                                        ),
                                        onTap: () {
                                          userList[2].views++;
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      IntroducePage(index: 2)));
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(15.0),
                                      child: GestureDetector(
                                        child: UserSimpleInfo(
                                          num: userList[3].name,
                                          one_line_introduction:
                                              userList[3].oneLiner,
                                        ),
                                        onTap: () {
                                          userList[3].views++;

                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      IntroducePage(index: 3)));
                                        },
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(15.0),
                                      child: GestureDetector(
                                        child: UserSimpleInfo(
                                          num: userList[4].name,
                                          one_line_introduction:
                                              userList[4].oneLiner,
                                        ),
                                        onTap: () {
                                          userList[4].views++;
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      IntroducePage(index: 4)));
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        );
                    }
                  },
                  onPageChanged: (index) {
                    setState(() {
                      curidx = index;
                    });
                  },
                ),
              ),

              // 화면 수 표시 원
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.circle,
                      size: 10,
                      color: curidx == 0 ? Colors.blue : Colors.grey,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Icon(
                      Icons.circle,
                      size: 10,
                      color: curidx == 1 ? Colors.blue : Colors.grey,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Icon(
                      Icons.circle,
                      size: 10,
                      color: curidx == 2 ? Colors.blue : Colors.grey,
                    )
                  ],
                ),
              ),

              // 아이콘 틀
              Padding(
                padding: const EdgeInsets.only(top: 3, left: 5),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          isHeart = !isHeart;
                        });
                      },
                      child: Icon(
                        // 하트 아이콘
                        isHeart ? Icons.favorite : Icons.favorite_border,
                        color: isHeart ? Colors.pink : Colors.black,

                        size: 40,
                      ),
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    Icon(
                      // 메시지 아이콘
                      Icons.chat_bubble_outline,
                      size: 40,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Icon(
                      Icons.send,
                      size: 40,
                    ),
                    SizedBox(
                      width: 205,
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          isBookmarked = !isBookmarked;
                        });
                      },
                      child: Icon(
                        // 북마크 아이콘
                        isBookmarked ? Icons.bookmark : Icons.bookmark_border,
                        color: isBookmarked ? Colors.amber : Colors.black,
                        size: 40,
                      ),
                    ),
                  ],
                ),
              ),

              // 팀명
              Padding(
                padding: const EdgeInsets.all(6.0),
                child: Row(
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Hi-Five",
                          style: TextStyle(fontSize: 30),
                        ),
                        Text(
                          "팀 소개",
                          style: TextStyle(fontSize: 20),
                        ),
                        Text(
                          "안녕하세요! 하이파이브입니다. 내일 배움 캠프의 첫 프로젝트\n조인만큼 만나서 반갑다는 의미와 팀원이 5명인 점을 고려하여\n팀 이름을 하이파이브로 짓게 되었습니다.",
                          style: TextStyle(fontSize: 15),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              // 여백
              SizedBox(
                height: 10,
              ),
            ],
          ),
        );
      },
    );
    //
  }
}
