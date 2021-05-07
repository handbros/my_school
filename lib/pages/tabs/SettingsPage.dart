import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:my_school/SharedAssets.dart';
import 'package:my_school/pages/tools/TextViewerPage.dart';
import 'package:settings_ui/settings_ui.dart';

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool _acceptUsingDeviceStorage = false;
  bool _useOfflineMode = false;
  bool _acceptTransferringDeviceInformation = false;

  void initialize() async {
    SharedAssets assets = SharedAssets.getInstance();

    _acceptUsingDeviceStorage = assets.acceptUsingDeviceStorage ?? false;
    _useOfflineMode = assets.useOfflineMode ?? false;
    _acceptTransferringDeviceInformation = assets.acceptTransferringDeviceInformation ?? false;
  }

  @override
  void initState() {
    super.initState();
    initialize();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("설정", style: TextStyle(
            color: Theme.of(context).hintColor,
            fontSize: 18,
            fontWeight: FontWeight.w200
        )),
        elevation: 2,
        backgroundColor: Theme.of(context).bottomAppBarColor,
        centerTitle: true,
      ),
      body: SettingsList(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        contentPadding: EdgeInsets.only(top: 20),
        sections: [
          SettingsSection(
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
              SettingsTile.switchTile(
                title: '오프라인 모드 사용',
                leading: Icon(LineIcons.wiredNetwork),
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
            ],
          ),
          SettingsSection(
            title: '개인정보',
            titleTextStyle: TextStyle(
                color: Theme.of(context).hintColor
            ),
            tiles: [
              SettingsTile.switchTile(
                title: '기기정보 수집 허용',
                leading: Icon(LineIcons.flag),
                switchValue: _acceptTransferringDeviceInformation,
                onToggle: (bool value) async {
                  SharedAssets.getInstance().acceptTransferringDeviceInformation = value;
                  SharedAssets.writeSharedAssets();

                  setState(() {
                    _acceptTransferringDeviceInformation = value;
                  });
                },
              ),
              SettingsTile(
                title: '개인 설정 초기화',
                subtitle: '개인 설정을 초기화합니다.',
                leading: Icon(LineIcons.userCog),
                onPressed: (BuildContext context) {
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

                              Navigator.pop(context);
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
                },
              ),
            ],
          ),
          SettingsSection(
            title: '고객지원',
            titleTextStyle: TextStyle(
                color: Theme.of(context).hintColor
            ),
            tiles: [
              SettingsTile(
                title: '개선사항 및 오류 제보',
                subtitle: '이용 시 겪은 불편한 점을 제보합니다.',
                leading: Icon(LineIcons.envelopeOpenText),
                onPressed: (BuildContext context) {
                  // TODO: FireBase를 이용한 오류 제보 시스템 구축하기.
                },
              ),
            ],
          ),
          SettingsSection(
            title: '정보',
            titleTextStyle: TextStyle(
                color: Theme.of(context).hintColor
            ),
            tiles: [
              SettingsTile(
                title: '애플리케이션 버전',
                subtitle: 'Version 0.64.5(dev)',
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
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => TextViewerPage("오픈소스 라이센스", "assets/open_source_licenses.txt")));
                  // TODO: 배포 전에 오픈소스 라이센스 누락된 것 없나 확인하기.
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
