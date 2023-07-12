import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class UserSimpleInfo extends StatelessWidget {
  const UserSimpleInfo({
    super.key,
    required this.num,
    required this.one_line_introduction,
  });

  final String num;
  final String one_line_introduction;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(
          Icons.account_circle,
          size: 75,
        ),
        Text(
          num,
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          one_line_introduction,
        ),
      ],
    );
  }
}
