import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: 5,
              ),
              Icon(
                Icons.person,
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
                width: 210,
              ),
              Icon(
                Icons.more_horiz,
                size: 50,
              ),
            ],
          ),

          // 화면 swipe 부분
          Expanded(
            child: PageView.builder(
              itemCount: 2, // 페이지 수
              itemBuilder: (context, index) {
                // 각 페이지의 콘텐츠를 구성하는 위젯을 반환합니다.
                if (index == 0) {
                  // 첫 번째 페이지
                  return AspectRatio(
                    aspectRatio: 1,
                    child: Container(
                      color: Colors.blue,
                      child: Image(
                        image: AssetImage('assets/images/hun.png'),
                      ),
                    ),
                  );
                } else {
                  // 두 번째 페이지
                  return Scaffold();
                }
              },
            ),
          ),

          Row(
            children: [Icon(Icons.favorite_border)],
          )
        ],
      ),
    );
  }
}

class photoDetail extends StatelessWidget {
  const photoDetail({super.key});

  @override
  Widget build(BuildContext context) {
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
                    child: Image.network(
                      "https://i.pinimg.com/originals/53/7e/f5/537ef59499259ba707068742f91a10f8.jpg",
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
                      Container(
                        width: 92.5,
                        height: 100,
                        decoration: BoxDecoration(
                          color: Colors.white54,
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            image: NetworkImage(
                              "https://upload.wikimedia.org/wikipedia/ko/4/4a/%EC%8B%A0%EC%A7%B1%EA%B5%AC.png",
                            ),
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
                    ],
                  ),
                )
              ],
            ),
            Expanded(
              child: ListView(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(11.0),
                    child: Text(
                      "안녕하세요. 잘 부탁드립니다. ㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁ",
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
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
