import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';

class MealPage extends StatefulWidget {
  @override
  _MealPageState createState() => _MealPageState();
}

class _MealPageState extends State<MealPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("식단표", style: TextStyle(
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
      body: mealContent(context),
    );
  }

  Widget mealContent(BuildContext context) {
    return Column(
      children: [
        Expanded(
          flex: 1,
          child: Row(

          ),
        ),
        Divider(),
        Expanded(
          flex: 10,
          child: Column(

          ),
        ),
        Divider(),
        Expanded(
          flex: 1,
          child: Row(

          ),
        ),
      ],
    );
  }
}
