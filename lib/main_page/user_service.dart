import 'dart:convert';
import 'package:webview_flutter/webview_flutter.dart';

import 'package:flutter/material.dart';

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
    required this.views,
  });

  int id;
  String name;
  String oneLiner;
  String mbti;
  String introduceMyself;
  String myAdvantage;
  String collaborationStyle;
  int views;

  Map toJson() {
    return {
      'name': name,
      'oneLiner': oneLiner,
      'mbti': mbti,
      'introduceMyself': introduceMyself,
      'myAdvantage': myAdvantage,
      'collaborationStyle': collaborationStyle,
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
    );
  }
}

// User 데이터는 모두 여기서 관리
class UserService extends ChangeNotifier {
  UserService() {
    initUserList();
  }

  late List<User> userList;

  initUserList() {
    userList = [
      User(
        id: 0,
        name: "주찬영",
        oneLiner: "인생은 한 방",
        mbti: "INTP",
        introduceMyself: "자신에 대한 설명 (주찬영)",
        myAdvantage: "나의 장점 (주찬영)",
        collaborationStyle: "협업 스타일 소개 (주찬영)",
        views: 0,
      ),
      User(
        id: 1,
        name: "김현걸",
        oneLiner: "인생은 두 방",
        mbti: "INTP",
        introduceMyself: "자신에 대한 설명 (김현걸)",
        myAdvantage: "나의 장점 (김현걸)",
        collaborationStyle: "협업 스타일 소개 (김현걸)",
        views: 0,
      ),
      User(
        id: 2,
        name: "임두형",
        oneLiner: "인생은 세 방",
        mbti: "INTP",
        introduceMyself: "자신에 대한 설명 (임두형)",
        myAdvantage: "나의 장점 (임두형)",
        collaborationStyle: "협업 스타일 소개 (임두형)",
        views: 0,
      ),
      User(
        id: 3,
        name: "손현준",
        oneLiner: "인생은 네 방",
        mbti: "INTP",
        introduceMyself: "자신에 대한 설명 (손현준)",
        myAdvantage: "나의 장점 (손현준)",
        collaborationStyle: "협업 스타일 소개 (손현준)",
        views: 0,
      ),
      User(
        id: 4,
        name: "이종민",
        oneLiner: "인생은 다섯 방",
        mbti: "INTP",
        introduceMyself: "자신에 대한 설명 (이종민)",
        myAdvantage: "나의 장점 (이종민)",
        collaborationStyle: "협업 스타일 소개 (이종민)",
        views: 0,
      ),
    ];
  }

  User selectUser({required int index}) {
    return userList[index];
  }

  // createMemo({required String content}) {
  //   User memo = User(name: content, oneLiner: false, mbti: DateTime.now());
  //   userList.add(memo);
  //   notifyListeners(); // Consumer<MemoService>의 builder 부분을 호출해서 화면 새로고침
  //   saveMemoList();
  // }

  // updateMemo({required int index, required String content}) {
  //   User memo = userList[index];
  //   memo.name = content;

  //   // 수정된 시간
  //   memo.mbti = DateTime.now();

  //   notifyListeners();
  //   saveMemoList();
  // }

  // fiexedMemo({required int index, required bool isFixed}) {
  //   User memo = userList[index];
  //   memo.oneLiner = isFixed;

  //   sortList();
  //   notifyListeners();
  //   saveMemoList();
  // }

  // deleteMemo({required int index}) {
  //   userList.removeAt(index);
  //   notifyListeners();
  //   saveMemoList();
  // }

  // saveMemoList() {
  //   List memoJsonList = userList.map((memo) => memo.toJson()).toList();
  //   // [{"content": "1"}, {"content": "2"}]

  //   String jsonString = jsonEncode(memoJsonList);
  //   // '[{"content": "1"}, {"content": "2"}]'

  //   prefs.setString('memoList', jsonString);
  // }

  // loadMemoList() {
  //   String? jsonString = prefs.getString('memoList');
  //   // '[{"content": "1"}, {"content": "2"}]'

  //   if (jsonString == null) return; // null 이면 로드하지 않음

  //   List memoJsonList = jsonDecode(jsonString);
  //   // [{"content": "1"}, {"content": "2"}]

  //   userList = memoJsonList.map((json) => User.fromJson(json)).toList();
  // }

  // // 재정렬
  // sortList() {
  //   userList.sort((a, b) {
  //     if (a.oneLiner && !b.oneLiner) {
  //       return -1; // a가 true이고 b가 false이면 a를 더 앞에 배치
  //     } else if (!a.oneLiner && b.oneLiner) {
  //       return 1; // a가 false이고 b가 true이면 b를 더 앞에 배치
  //     } else {
  //       return 0; // 두 요소의 isFixed 값이 동일하면 순서 변경 없음
  //     }
  //   });
  // }
}
