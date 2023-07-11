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
                  return Container(
                    color: Colors.red,
                    child: Center(
                      child: Text(
                        '두 번째 페이지',
                        style: TextStyle(
                          fontSize: 24,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  );
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
