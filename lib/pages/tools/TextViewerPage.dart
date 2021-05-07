import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';

class TextViewerPage extends StatefulWidget {
  final String title;
  final String textAssetKey;

  const TextViewerPage(this.title, this.textAssetKey);

  @override
  _TextViewerPageState createState() => _TextViewerPageState();
}

class _TextViewerPageState extends State<TextViewerPage> {
  /// Text Asset을 불러옵니다.
  Future<String> loadTextAsset(BuildContext context, String key) async {
    return await DefaultAssetBundle.of(context).loadString(key);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title, style: TextStyle(
            color: Theme.of(context).hintColor,
            fontSize: 18,
            fontWeight: FontWeight.w200
        )),
        elevation: 2,
        backgroundColor: Theme.of(context).bottomAppBarColor,
        centerTitle: true,
        leading: IconButton(
            icon: Icon(LineIcons.arrowLeft),
            color: Theme.of(context).hintColor,
            onPressed: () {
              Navigator.pop(context);
            }
        ),
      ),
      body: FutureBuilder(
        future: loadTextAsset(context, widget.textAssetKey),
        builder: (context, AsyncSnapshot<String> snapshot) {
          if (!snapshot.hasData) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Center(child: CircularProgressIndicator()),
              ],
            );
          } else {
            var result = snapshot.data;
            return SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.all(10),
                child: Column(
                  children: [
                    Text(result, textAlign: TextAlign.left)
                  ],
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
