import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:miniproject/main_page/user_simple_info.dart';

import '../introduce_page/introduce_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int curidx = 0;

  @override
  Widget build(BuildContext context) {
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
                      color: Colors.black,
                      child: Image(
                        image: AssetImage('assets/images/hun.png'),
                      ),
                    );

                  case 1:
                    return Container(
                      color: Colors.amber,
                      child: Center(
                          child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.account_circle_outlined,
                            size: 80,
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
                      color: Colors.grey,
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
                                      num: "팀원1",
                                      one_line_introduction: "팀원 1 소개글",
                                    ),
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  IntroducePage()));
                                    },
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(15.0),
                                  child: UserSimpleInfo(
                                    num: "팀원2",
                                    one_line_introduction: "팀원 2 소개글",
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(15.0),
                                  child: UserSimpleInfo(
                                    num: "팀원3",
                                    one_line_introduction: "팀원 3 소개글",
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(15.0),
                                  child: UserSimpleInfo(
                                    num: "팀원4",
                                    one_line_introduction: "팀원 4 소개글",
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(15.0),
                                  child: UserSimpleInfo(
                                    num: "팀원5",
                                    one_line_introduction: "팀원 5 소개글",
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
                Icon(
                  // 하트 아이콘
                  Icons.favorite_border,
                  size: 40,
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
                Icon(
                  Icons.bookmark_border,
                  size: 40,
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
                      "세부사항",
                      style: TextStyle(fontSize: 20),
                    ),
                  ],
                ),
              ],
            ),
          ),

          // 여백
          SizedBox(
            height: 40,
          ),
        ],
      ),
    );
  }
}
