import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:my_school/ReportBox.dart';
import 'package:my_school/objects/reports/ReportItem.dart';
import 'package:my_school/objects/reports/ReportType.dart';

/// 텍스트 뷰어 위젯을 제공합니다.
class ReportViewerPage extends StatefulWidget {
  @override
  _ReportViewerPageState createState() => _ReportViewerPageState();
}

class _ReportViewerPageState extends State<ReportViewerPage> {
  @override
  Widget build(BuildContext context) {
    List<ReportItem> reports = ReportBox.getInstance().getReports;

    return Scaffold(
      appBar: AppBar(
        title: Text("보고서", style: TextStyle(
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
      body: ListView.builder(
        itemCount: reports.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.only(left: 10, top: 4, right: 10, bottom: 4),
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
              ),
              elevation: 2,
              color: getCardColor(reports[index].type),
              child: Padding(
                padding: EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        getIcon(reports[index].type),
                        Padding(padding: EdgeInsets.only(left: 8)),
                        Text("(${new DateFormat.Hms().format(reports[index].dateTime)}) ${reports[index].title}")
                      ],
                    ),
                    Padding(padding: EdgeInsets.only(top: 8)),
                    Text("${reports[index].content}")
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Icon getIcon(ReportType type) {
    if (type == ReportType.INFO) {
      return Icon(LineIcons.infoCircle);
    }
    else if (type == ReportType.SUCCEED) {
      return Icon(LineIcons.check);
    }
    else if (type == ReportType.CAUTION) {
      return Icon(LineIcons.exclamationTriangle);
    }
    else if (type == ReportType.WARNING) {
      return Icon(LineIcons.skullCrossbones);
    }
    else if (type == ReportType.EXCEPTION) {
      return Icon(LineIcons.bug);
    }
    else if (type == ReportType.ERROR) {
      return Icon(LineIcons.bug);
    }
    else {
      return Icon(LineIcons.infoCircle);
    }
  }

  Color getCardColor(ReportType type) {
    if (type == ReportType.INFO) {
      return Color(0xffffffff);
    }
    else if (type == ReportType.SUCCEED) {
      return Color(0xff2ecc71);
    }
    else if (type == ReportType.CAUTION) {
      return Color(0xffffcb05);
    }
    else if (type == ReportType.WARNING) {
      return Color(0xffd91e18);
    }
    else if (type == ReportType.EXCEPTION) {
      return Color(0xffffcb05);
    }
    else if (type == ReportType.ERROR) {
      return Color(0xffd91e18);
    }
    else {
      return Color(0xffffffff);
    }
  }
}
