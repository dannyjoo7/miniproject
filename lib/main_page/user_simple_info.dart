import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class UserSimpleInfo extends StatelessWidget {
  const UserSimpleInfo({
    Key? key,
    required this.name,
    required this.one_line_introduction,
    required this.id,
  }) : super(key: key);

  final String name;
  final String one_line_introduction;
  final String id;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
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
              'assets/images/$id.png', // 이미지 파일 경로
              fit: BoxFit.cover,
            ),
          ),
        ),
        Text(
          name,
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          one_line_introduction,
          style: TextStyle(),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
