import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:my_school/SharedAssets.dart';
import 'package:my_school/screens/MainScreen.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  _loadDatas() async {
    await SharedAssets.readSharedAssets();
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context) => MainScreen()));
  }

  @override
  void initState() {
    super.initState();

    // 페이지가 빌드되기 전에 작업이 끝나면 예외가 발생함. 아래 코드를 사용하여 이를 방지함.
    WidgetsBinding.instance.addPostFrameCallback((_) => _loadDatas());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(
                    LineIcons.graduationCap,
                    size: 32,
                    color: Theme.of(context).hintColor,
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10.0),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "My School",
                    style: TextStyle(
                        color: Theme.of(context).hintColor,
                        fontSize: 24,
                        fontWeight: FontWeight.w300
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      )
    );
  }
}
