import 'package:flutter/material.dart';

import '../photo_Detail_Page/Photo_Detail_Page.dart';

class Message {
  Message({
    required this.isMaster,
    required this.message,
  });

  // Master일 경우 오른쪽에서 채팅
  bool isMaster;
  String message;
}

class TeamDetailPage extends StatelessWidget {
  final List<Message> messageList = [
    Message(isMaster: false, message: "!팀 소개"),
    Message(isMaster: true, message: "안녕하세요!\n\"하이-파이브\"입니다!"),
    Message(
        isMaster: true,
        message:
            "이번 내일배움캠프의 첫 프로젝트 조인 만큼 만나서 반갑다는 의미와 팀원이 5명인 점을 고려하여 팀 이름을 \"하이파이브\"로 짓게 되었습니다."),
    Message(
        isMaster: true,
        message:
            "첫 프로젝트인 만큼\n아직 모르는 것도 많고 서툴지만 열심히 의기투합하여 성공적으로 마무리하도록 하겠습니다!"),
    Message(isMaster: false, message: "!하이-파이브 특징"),
    Message(isMaster: true, message: "<<하이-파이브 특징>>"),
    Message(
        isMaster: true,
        message: "다들 거리가 매우 가깝기 때문에 마음만 먹으면 40분 안에 현실정모를 할 수 있다는 특징이 있습니다."),
    Message(isMaster: false, message: "!하이-파이브 목표"),
    Message(isMaster: true, message: "<<하이-파이브 목표>>"),
    Message(
        isMaster: true,
        message: "팀 프로젝트를 무사히 마치는걸 시작으로 앞으로 11월까지 열심히 달려서 모두 좋은곳에 취업하기!"),
    Message(isMaster: false, message: "!하이-파이브 약속"),
    Message(isMaster: true, message: "<<하이-파이브 약속>>"),
    Message(
        isMaster: true,
        message:
            "- 게더타운 항시 상주\n- Git 관련 요청 시 팀원들에게 먼저 말하기\n- 13시에 점심 식사 및 18시 저녁 식사\n- ~님 존칭 사용 및 예의 갖추기"),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 4),
              child: Icon(
                Icons.account_circle,
                color: Colors.black,
                size: 40,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        '하이파이브',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'GES',
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 4, left: 2),
                        child: Icon(
                          Icons.check_circle,
                          color: Colors.blue,
                          size: 15,
                        ),
                      ),
                    ],
                  ),
                  Text(
                    '현재 활동 중',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                      fontFamily: 'GES',
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              width: 125,
            ),
            Icon(
              Icons.videocam,
              color: Colors.black,
              size: 40,
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          // 메시지 부분
          Expanded(
            child: ListView.builder(
              itemCount: messageList.length,
              itemBuilder: (context, index) {
                final message = messageList[index];
                if (message.isMaster) {
                  // Master인 경우
                  return Container(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Stack(
                        alignment: Alignment.bottomLeft,
                        children: [
                          Container(
                            width: 40,
                            height: 40,
                            child: Icon(
                              Icons.account_circle,
                              size: 40,
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 50),
                            constraints: BoxConstraints(
                              maxWidth: 200,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.grey[300],
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                message.message,
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                } else {
                  // Master가 아닌 경우
                  return Container(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment:
                            MainAxisAlignment.end, // 아이콘과 메시지 박스를 오른쪽으로 정렬
                        children: [
                          Container(
                            // 메시지 박스와 아이콘 사이의 간격 설정
                            constraints: BoxConstraints(
                              maxWidth: 200,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.blue,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                message.message,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }
              },
            ),
          ),

          // 하단 메시지 입력 창 부분
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 50,
              decoration: BoxDecoration(
                color: Colors.grey[300], // 색상을 BoxDecoration으로 설정
                borderRadius:
                    BorderRadius.circular(10), // 모서리를 10의 반지름으로 둥글게 설정
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Icon(
                      Icons.camera_alt_outlined,
                      size: 30,
                      color: Colors.white,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width: 210,
                      child: TextField(
                          decoration: InputDecoration(
                        hintText: "Message...",
                        hintStyle: TextStyle(
                          color: Colors.white,
                        ),
                      )),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 5),
                    child: Icon(
                      Icons.mic_none_outlined,
                      size: 30,
                      color: Colors.black,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 5),
                    child: Icon(
                      Icons.collections_outlined,
                      size: 30,
                      color: Colors.black,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 5),
                    child: Icon(
                      Icons.emoji_emotions_outlined,
                      size: 30,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
