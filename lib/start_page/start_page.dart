import 'package:flutter/material.dart';

class StartPage extends StatelessWidget {
  const StartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Stack(children: <Widget>[
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  // 보라색 Gradient
                  // colors: [
                  //   const Color.fromARGB(255, 146, 104, 200)!,
                  //   Colors.purple[600]!,
                  //   Colors.purple[900]!
                  // ]
                  // 파란색 Gradient
                  // colors: [
                  //   Color.fromARGB(255, 104, 157, 200)!,
                  //   Colors.blue[600]!,
                  //   Colors.blue[900]!
                  // ]
                  colors: [
                    Color.fromARGB(255, 101, 95, 230)!,
                    Colors.purple[600]!,
                    Colors.red[300]!,
                    Colors.yellow[600]!,
                    Colors.orange[300]!
                  ]),
            ),
          ),
          Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 200,
                ),
                Text(
                  "Hi-Five",
                  style: TextStyle(
                    fontFamily: "Fasthand",
                    fontSize: 100,
                    color: Colors.white,
                  ),
                ),
                SizedBox(
                  height: 150,
                ),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: (Color.fromARGB(255, 219, 238, 247)),
                    minimumSize: Size(250, 60),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    side: BorderSide(width: 2),
                  ),
                  child: Text(
                    '👋🏻 Log in with Hi-Five',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
