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
        introduceMyself: "자신에 대한 설명 (주찬영)",
        myAdvantage: "나의 장점 (주찬영)",
        collaborationStyle: "협업 스타일 소개 (주찬영)",
        blog: "https://dannyjoo.tistory.com/",
        views: 0,
      ),
      User(
        id: "hihyungul",
        name: "김현걸",
        oneLiner: "인생은 두 방",
        mbti: "ISTP",
        introduceMyself: "자신에 대한 설명 (김현걸)",
        myAdvantage: "나의 장점 (김현걸)",
        collaborationStyle: "협업 스타일 소개 (김현걸)",
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
        oneLiner: "인생은 다섯 방",
        mbti: "ISFP",
        introduceMyself: "자신에 대한 설명 (이종민)",
        myAdvantage: "나의 장점 (이종민)",
        collaborationStyle: "협업 스타일 소개 (이종민)",
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
