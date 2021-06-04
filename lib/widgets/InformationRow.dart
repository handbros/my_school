import 'package:flutter/material.dart';

class InformationRow extends StatefulWidget {
  final Icon icon;
  final String text;
  final double padding;

  InformationRow(this.icon, this.text, {this.padding = 20.0});

  @override
  _InformationRowState createState() => _InformationRowState();
}

class _InformationRowState extends State<InformationRow> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
      child: Row(
        children: [
          widget.icon,
          Padding(padding: EdgeInsets.only(left: widget.padding),),
          Text(widget.text)
        ],
      ),
    );
  }
}

