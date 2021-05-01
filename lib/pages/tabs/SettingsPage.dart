/*
 * Code Referenced
 * https://github.com/lohanidamodar/flutter_ui_challenges/blob/master/lib/src/pages/settings/settings2.dart
 * modified by my_school
 */

import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:settings_ui/settings_ui.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool _acceptUsingDeviceStorage = false;
  bool _useOfflineMode = false;
  bool _acceptTransferringDeviceInformation = false;

  void initialize() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    _acceptUsingDeviceStorage = prefs.getBool("ACCEPT_USING_DEVICE_STORAGE") ?? false;
    _useOfflineMode = prefs.getBool("USE_OFFLINE_MODE") ?? false;
    _acceptTransferringDeviceInformation = prefs.getBool("ACCEPT_TRANSFERRING_DEVICE_INFORMATION") ?? false;
  }

  @override
  Widget build(BuildContext context) {
    initialize();

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
                  SharedPreferences prefs = await SharedPreferences.getInstance();
                  prefs.setBool("ACCEPT_USING_DEVICE_STORAGE", value);

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
                  SharedPreferences prefs = await SharedPreferences.getInstance();
                  prefs.setBool("USE_OFFLINE_MODE", value);

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
                  SharedPreferences prefs = await SharedPreferences.getInstance();
                  prefs.setBool("ACCEPT_TRANSFERRING_DEVICE_INFORMATION", value);

                  setState(() {
                    _acceptTransferringDeviceInformation = value;
                  });
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
                subtitle: 'Version 0.69.74(dev)',
                onPressed: (BuildContext context) {},
              ),
              SettingsTile(
                title: '개인정보 처리방침',
                onPressed: (BuildContext context) {},
              ),
              SettingsTile(
                title: '오픈소스 라이센스',
                onPressed: (BuildContext context) {},
              ),
            ],
          ),
        ],
      ),
    );
  }
}
