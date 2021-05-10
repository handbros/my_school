import 'package:flutter/material.dart';
import 'package:my_school/SharedAssets.dart';
import 'package:my_school/notifiers/ClassChangeNotifier.dart';
import 'package:my_school/screens/MainScreen.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  _loadDatas() async {
    await SharedAssets.readSharedAssets(); // SharedAssets 불러오기.

    // ClassChangeNotifier 초기화.
    final notifier = Provider.of<ClassChangeNotifier>(context, listen: false);
    notifier.notifyClassChanged();

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
                  SizedBox(
                    child: CircularProgressIndicator(),
                    width: 24,
                    height: 24,
                  )
                ],
              ),
            ],
          ),
        ),
      )
    );
  }
}
