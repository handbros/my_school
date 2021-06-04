import 'package:flutter/material.dart';
import 'package:styled_widget/styled_widget.dart';

class MenuButton extends StatefulWidget {
  final IconData icon;
  final Color iconColor;
  final Color iconBackgroundColor;
  final String title;
  final String description;
  final Function onTap;

  MenuButton({this.icon, this.iconColor, this.iconBackgroundColor, this.title, this.description, this.onTap});

  @override
  _MenuButtonState createState() => _MenuButtonState();
}

class _MenuButtonState extends State<MenuButton> {
  bool pressed = false;

  @override
  Widget build(BuildContext context) {
    final menuButton = ({Widget child}) => Styled.widget(child: child)
        .alignment(Alignment.center)
        .borderRadius(all: 5)
        .ripple()
        .backgroundColor(Colors.white, animate: true)
        .clipRRect(all: 5) // clip ripple
        .borderRadius(all: 5, animate: true)
        .elevation(
      pressed ? 0 : 2,
      borderRadius: BorderRadius.circular(5),
    ) // shadow borderRadius
        .constrained(height: 80)
        .gestures(
      onTap: () => widget.onTap.call(),
    )
        .scale(all: pressed ? 0.95 : 1.0, animate: true)
        .animate(Duration(milliseconds: 150), Curves.easeOut);

    final Widget icon = Icon(widget.icon, size: 20, color: Colors.white)
        .padding(all: 12)
        .decorated(
      color: widget.iconBackgroundColor,
      borderRadius: BorderRadius.circular(30),
    )
        .padding(left: 15, right: 10);

    final Widget title = Text(
      widget.title,
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 16,

      ),
    ).padding(bottom: 5);

    final Widget description = Text(
      widget.description,
      style: TextStyle(
        color: Colors.black26,
        fontWeight: FontWeight.bold,
        fontSize: 12,
      ),
    );

    return menuButton(
      child: <Widget>[
        icon,
        <Widget>[
          title,
          description,
        ].toColumn(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
        ),
      ].toRow(),
    );
  }
}

