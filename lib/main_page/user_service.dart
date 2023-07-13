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
        oneLiner: "인생은\n한 방",
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
        oneLiner: "스스로 쉬지 않고\n줄곧 힘쓴다",
        mbti:
            "ISTP\n특징-타인의 일에 무관심한 편\n느낌과 감정, 타인에 대한 마음을 표현하기 어려워한다.\n일반적으로 조용한 편이나 필요에 따라 사교적이다.",
        introduceMyself:
            "안녕하세요 안드로이드 7기에 합류하게 된 김현걸입니다.\n수원에 살고 95년생입니다.\n과는 컴공과이지만 디자인쪽이나 영상편집 등 여러 분야에관심이 많아 여러 부분에서 도전하다가 다시 이쪽으로 돌아오게 됐습니다.\n잘 부탁드립니다.",
        myAdvantage: "책임감이 강한 편이다.\n솔직하다\n이야기를 잘 듣는 편이다.",
        collaborationStyle:
            "제 의견을 적극적으로 밀어 붙이는 타입은 아니고\n자료들을 가져와서 팀원들에게 보여주고 의견을 받아서\n다수결로 보통 정하는 스타일입니다.",
        blog: "https://velog.io/@werds7890",
        views: 0,
      ),
      User(
        id: "limduh2",
        name: "임두형",
        oneLiner: "인생은 짧다 매 순간\n의미있게 살자",
        mbti:
            "ESTJ : \"엄격한 관리자\"\n관리자형 유형은 그들 생각에 반추하여 무엇이 옳고 그른지를 따져 사회나 가족을 하나로 단결시키기 위해\n사회적으로 받아들여지는 통념이나 전통 등 필요한 질서를 정립하는 데 이바지하는 대표적인 유형입니다.\n정직하고 헌신적이며 위풍당당한 이들은 비록 험난한 가시밭길이라도 조언을 통하여\n그들이 옳다고 생각하는 길로 사람들을 인도합니다.",
        introduceMyself: "92생 이고, 수원시에 부모님과 거주중 입니다.\n나이 차이가 많이나는 남동생이 존재합니다.",
        myAdvantage: "천천히 우직하게 전진하는 점 이라고 생각합니다.",
        collaborationStyle:
            "팀원들과의 친분이 높아야 프로젝트의 정교함도 높아진다고 생각하기 때문에\n불화가 있으면 그것을 우선적으로 풀고자 합니다.\n다 같이 발전하는것을 최종 목적을 지니고 행동합니다.",
        blog: "https://duhyoung-tom.tistory.com/",
        views: 0,
      ),
      User(
        id: "hyunjun6133",
        name: "손현준",
        oneLiner: "숙련된 개발자가 되고\n싶은 손현준입니다",
        mbti:
            "제 MBTI는 INTP입니다만, 저는 MBTI에 별 관심이 없어서 제 MBTI가 무엇을 의미하는지 사실 잘 모릅니다.\nE랑 I 그리고 F와 T가 무엇인지만 알고 있는데 주변 사람들이 \"너는 딱 INTP다.\"라고 말하는 것을 보면 검사가 꽤나 정확하다고 생각하고는 있습니다.",
        introduceMyself:
            "26살이고 대학교 4학년 재학 중입니다.\n경기도 안양시에 거주하고 힙합 음악, 해외 축구에 관심이 많아 자주 듣고 보는 편입니다.\n대학교에서 졸업 작품을 하면서 앱 개발에 관심이 생겨 참여하게 되었습니다.\n잘 부탁드립니다.",
        myAdvantage:
            "제 장점은 차분한 성격입니다.\n어떤 상황이든 긍정적으로 보고 현실적으로 주위를 돌아보려고 하는 편입니다.",
        collaborationStyle:
            "팀원과의 소통을 1순위로 하고 제 의견을 먼저 말하기보단 팀원의 이야기를 먼저 들어주려고 하는 스타일입니다.\n원활한 협을 위해서는 충분한 소통을 통해 추구하는 바를 맞춰가야 한다고 생각합니다.",
        blog: "https://velog.io/@hyunjun6133",
        views: 0,
      ),
      User(
        id: "ljmin94",
        name: "이종민",
        oneLiner: "끝날 때까지\n끝난게 아니다",
        mbti: "ISFP",
        introduceMyself:
            "- 94년생 이고, 인천시 부평구에 부모님과 함께 거주하고 있으며,\n위로 형이 한명 있습니다.",
        myAdvantage: "쉽게 포기하지 않는다는 것이 장점입니다.",
        collaborationStyle:
            "소통과 협력을 중시하는 스타일입니다.\n프로젝트를 진행하면서 끊임없이 소통하고\n모르는 것이 있으면 협력을 통해서 풀어 나가려고 합니다.",
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
