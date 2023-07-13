import 'dart:convert';
import 'package:webview_flutter/webview_flutter.dart';

import 'package:flutter/material.dart';

import '../main.dart';

// User 데이터의 형식을 정해줍니다.
class User {
  User({
    required this.id,
    required this.name,
    required this.oneLiner,
    required this.mbti,
    required this.introduceMyself,
    required this.myAdvantage,
    required this.collaborationStyle,
    required this.blog,
    required this.views,
  });

  String id;
  String name;
  String oneLiner;
  String mbti;
  String introduceMyself;
  String myAdvantage;
  String collaborationStyle;
  String? blog;
  int views;

  Map toJson() {
    return {
      'id': id,
      'name': name,
      'oneLiner': oneLiner,
      'mbti': mbti,
      'introduceMyself': introduceMyself,
      'myAdvantage': myAdvantage,
      'collaborationStyle': collaborationStyle,
      'blog': blog,
      'views': views,
    };
  }

  factory User.fromJson(json) {
    return User(
      id: json['id'],
      name: json['name'],
      oneLiner: json['oneLiner'],
      mbti: json['mbti'],
      introduceMyself: json['introduceMyself'],
      myAdvantage: json['myAdvantage'],
      collaborationStyle: json['collaborationStyle'],
      views: json['views'],
      blog: json['blog'],
    );
  }
}

// User 데이터는 모두 여기서 관리
class UserService extends ChangeNotifier {
  UserService() {
    initUserList();
    loadUserList();
  }

  late List<User> userList;

  initUserList() {
    userList = [
      User(
        id: "dannyjoo",
        name: "주찬영",
        oneLiner: "인생은 한 방",
        mbti: "INTP",
        introduceMyself: "안녕하세요 주찬영입니다!\n광명에서 거주하고 있으며 나이는 빠른00입니다.",
        myAdvantage: "한 번 시작하면 반드시 마무리를 짓는 스타일입니다.\n",
        collaborationStyle:
            "협업을 많이 진행해보지 않아 스타일이 정해지지는 않았습니다.\n이전까지의 작은 경험들을 미루어봐 설계를 중요하게 생각하는 스타일인 것 같습니다.",
        blog: "https://dannyjoo.tistory.com/",
        views: 0,
      ),
      User(
        id: "hihyungul",
        name: "김현걸",
        oneLiner: "인생은 두 방",
        mbti: "ISTP",
        introduceMyself:
            "안녕하세요.\n내일배움캠프 7기_Android 10조 김현걸입니다.\n극 I의 성향이라.. 협업에 익숙치는 않지만 열심히 하겠습니다.\n잘 부탁드립니다.",
        myAdvantage: "책임감이 강한 편이다.\n솔직하다\n이야기를 잘 듣는 편이다.",
        collaborationStyle:
            "제 의견을 적극적으로 밀어 붙이는 타입은 아니고\n자료들을 가져와서 팀원들에게 보여주고 의견을 받아서\n다수결로 보통 정하는 스타일입니다.",
        blog: "https://velog.io/@werds7890",
        views: 0,
      ),
      User(
        id: "limduh2",
        name: "임두형",
        oneLiner: "인생은 세 방",
        mbti: "ESTJ",
        introduceMyself: "자신에 대한 설명 (임두형)",
        myAdvantage: "나의 장점 (임두형)",
        collaborationStyle: "협업 스타일 소개 (임두형)",
        blog: "https://duhyoung-tom.tistory.com/",
        views: 0,
      ),
      User(
        id: "hyunjun6133",
        name: "손현준",
        oneLiner: "인생은 네 방",
        mbti: "INTP",
        introduceMyself: "자신에 대한 설명 (손현준)",
        myAdvantage: "나의 장점 (손현준)",
        collaborationStyle: "협업 스타일 소개 (손현준)",
        blog: "https://velog.io/@hyunjun6133",
        views: 0,
      ),
      User(
        id: "ljmin94",
        name: "이종민",
        oneLiner: "끝날 때까지 끝난게 아니다.",
        mbti: "ISFP",
        introduceMyself: "94년생 이고 인천시 부평구에 부모님과 함께 거주하고 있으며,\n위로 형이 한명 있습니다.",
        myAdvantage: "쉽게 포기하지 않는다는 것이 장점입니다.",
        collaborationStyle:
            "소통과 협력을 중시하는 스타일입니다.\n프로젝트를 진행하면서 끊임없이 소통하고 모르는 것이 있으면 협력을 통해서 풀어 나가려고 합니다.",
        blog: "https://velog.io/@ljmin94",
        views: 0,
      ),
    ];
  }

  User selectUser({required int index}) {
    return userList[index];
  }

  saveUserList() {
    List userJsonList = userList.map((user) => user.toJson()).toList();
    // [{"content": "1"}, {"content": "2"}]

    String jsonString = jsonEncode(userJsonList);
    // '[{"content": "1"}, {"content": "2"}]'

    prefs.setString('userList', jsonString);
    // notifyListeners();
  }

  loadUserList() {
    String? jsonString = prefs.getString('userList');
    // '[{"content": "1"}, {"content": "2"}]'

    if (jsonString == null) return; // null 이면 로드하지 않음

    List userJsonList = jsonDecode(jsonString);
    // [{"content": "1"}, {"content": "2"}]

    userList = userJsonList.map((json) => User.fromJson(json)).toList();
  }

  // 조회수 업 함수
  countUpViews(int index) {
    userList[index].views++;
    saveUserList();
  }
}
