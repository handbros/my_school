import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:line_icons/line_icons.dart';
import 'package:my_school/SharedAssets.dart';
import 'package:my_school/notifiers/ClassChangeNotifier.dart';
import 'package:my_school/pages/tools/TextViewerPage.dart';
import 'package:my_school/widgets/EmptyAppBar.dart';
import 'package:package_info/package_info.dart';
import 'package:provider/provider.dart';
import 'package:settings_ui/settings_ui.dart';
import 'package:url_launcher/url_launcher.dart';

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool _acceptUsingDeviceStorage = false;
  bool _useOfflineMode = false;

  String version = "1.0.0";
  String buildNumber = "1";

  void initialize() async {
    // Initialize shared assets.
    SharedAssets assets = SharedAssets.getInstance();

    _acceptUsingDeviceStorage = assets.acceptUsingDeviceStorage ?? false;
    _useOfflineMode = assets.useOfflineMode ?? false;

    // Initialize package info.
    PackageInfo.fromPlatform().then((PackageInfo packageInfo) {
      version = packageInfo.version;
      buildNumber = packageInfo.buildNumber;
    });
  }

  void launchUrl(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      // Toast 메시지 호출.
      Fluttertoast.showToast(
        msg: "$url을(를) 열 수 없습니다.",
        toastLength: Toast.LENGTH_SHORT,
      );
    }
  }

  @override
  void initState() {
    super.initState();
    initialize();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: EmptyAppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Card(
                elevation: 2,
                margin: EdgeInsets.fromLTRB(14, 14, 14, 0),
                child: Padding(
                  padding: EdgeInsets.only(top: 10, bottom: 8),
                  child: SettingsSection(
                    title: '기본',
                    titleTextStyle: TextStyle(
                        color: Theme.of(context).hintColor
                    ),
                    tiles: [
                      SettingsTile.switchTile(
                        title: '장치에 데이터 저장 허용',
                        leading: Icon(LineIcons.download),
                        switchValue: _acceptUsingDeviceStorage,
                        onToggle: (bool value) async {
                          SharedAssets.getInstance().acceptUsingDeviceStorage = value;
                          SharedAssets.writeSharedAssets();

                          setState(() {
                            _acceptUsingDeviceStorage = value;
                          });
                        },
                      ),
                    ],
                  ),
                )
            ),
            Card(
                elevation: 2,
                margin: EdgeInsets.fromLTRB(14, 14, 14, 0),
                child: Padding(
                  padding: EdgeInsets.only(top: 10, bottom: 8),
                  child: SettingsSection(
                    title: '오프라인 모드',
                    titleTextStyle: TextStyle(
                        color: Theme.of(context).hintColor
                    ),
                    tiles: [
                      // TODO: 오프라인 모드 기능 추가하기.
                      SettingsTile.switchTile(
                        title: '오프라인 모드 사용',
                        leading: Icon(LineIcons.powerOff),
                        switchValue: _useOfflineMode,
                        enabled: _acceptUsingDeviceStorage,
                        onToggle: (bool value) async {
                          SharedAssets.getInstance().useOfflineMode = value;
                          SharedAssets.writeSharedAssets();

                          setState(() {
                            _useOfflineMode = value;
                          });
                        },
                      ),
                      SettingsTile.switchTile(
                        title: '데이터 자동 수집 허용',
                        leading: Icon(LineIcons.robot),
                        switchValue: _useOfflineMode,
                        enabled: _acceptUsingDeviceStorage,
                        onToggle: (bool value) async {
                          SharedAssets.getInstance().useOfflineMode = value;
                          SharedAssets.writeSharedAssets();

                          setState(() {
                            _useOfflineMode = value;
                          });
                        },
                      ),
                      SettingsTile(
                        title: '데이터 자동 수집 대상 지정',
                        leading: Icon(LineIcons.cogs),
                        onPressed: (BuildContext context) {
                          showResetPreferencesDialog(context); // 다이얼로그 호출.
                        },
                      ),
                    ],
                  ),
                )
            ),
            Card(
                elevation: 2,
                margin: EdgeInsets.fromLTRB(14, 14, 14, 0),
                child: Padding(
                  padding: EdgeInsets.only(top: 10, bottom: 8),
                  child: SettingsSection(
                    title: '지원',
                    titleTextStyle: TextStyle(
                        color: Theme.of(context).hintColor
                    ),
                    tiles: [
                      SettingsTile(
                        title: '개선사항 및 오류 제보',
                        subtitle: '이용 중 겪은 불편한 점을 제보합니다.',
                        leading: Icon(LineIcons.envelopeOpenText),
                        onPressed: (BuildContext context) {
                          launchUrl("https://github.com/handbros/my_school/issues");
                        },
                      ),
                      SettingsTile(
                        title: 'GitHub 저장소',
                        subtitle: '프로젝트의 GitHub 저장소에 방문합니다.',
                        leading: Icon(LineIcons.github),
                        onPressed: (BuildContext context) {
                          launchUrl("https://github.com/handbros/my_school");
                        },
                      ),
                    ],
                  ),
                )
            ),
            Card(
                elevation: 2,
                margin: EdgeInsets.fromLTRB(14, 14, 14, 14),
                child: Padding(
                  padding: EdgeInsets.only(top: 10, bottom: 8),
                  child: SettingsSection(
                    title: '정보',
                    titleTextStyle: TextStyle(
                        color: Theme.of(context).hintColor
                    ),
                    tiles: [
                      SettingsTile(
                        title: '애플리케이션 버전',
                        subtitle: 'version $version build $buildNumber (dev)',
                        onPressed: (BuildContext context) {},
                      ),
                      SettingsTile(
                        title: '개인정보 처리방침',
                        onPressed: (BuildContext context) {
                          Navigator.of(context).push(MaterialPageRoute(builder: (context) => TextViewerPage("개인정보 처리방침", "assets/privacy_policy.txt")));
                          // TODO: 배포 전에 개인정보 처리방침 시행 일자 변경하기.
                        },
                      ),
                      SettingsTile(
                        title: '오픈소스 라이센스',
                        onPressed: (BuildContext context) {
                          // TODO: 배포 전에 오픈소스 라이센스 누락된 것 없나 확인하기.
                          launchUrl("https://github.com/handbros/my_school/blob/master/OPENSOURCES.md");
                        },
                      ),
                    ],
                  ),
                )
            )
          ],
        ),
      ),
    );
  }

  void showResetPreferencesDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("개인 설정", style: Theme.of(context).textTheme.headline6.copyWith(color: Theme.of(context).hintColor)),
          content: Text("모든 개인 설정을 초기화하시겠습니까? 초기화 이후에는 다시 복구할 수 없습니다."),
          actions: <Widget>[
            TextButton(
              child: Text('확인'),
              onPressed: () {
                // 개인 설정 초기화.
                SharedAssets.getInstance().resetPreferences();
                SharedAssets.writeSharedAssets();

                // ClassChangeNotifier 초기화.
                final notifier = Provider.of<ClassChangeNotifier>(context, listen: false);
                notifier.notifyClassChanged();

                Navigator.pop(context);

                // Toast 메시지 호출.
                Fluttertoast.showToast(
                  msg: "개인 설정이 초기화되었습니다.",
                  toastLength: Toast.LENGTH_SHORT,
                );
              },
            ),
            TextButton(
              child: Text('취소'),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        );
      },
    );
  }
}
