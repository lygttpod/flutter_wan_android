import 'package:flutter/material.dart';

class CommonHorizontalItem extends StatelessWidget {
  final IconData iconData;
  final String text;
  final Function onPressed;

  const CommonHorizontalItem({this.iconData, this.text, this.onPressed}) : super();

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        margin: EdgeInsets.only(left: 15, right: 15),
        height: 50,
        child: Row(
          children: [
            Icon(
              iconData,
              size: 18,
            ),
            Expanded(
                child: Container(
              margin: EdgeInsets.only(left: 5),
              child: Text(text),
            )),
            Icon(Icons.chevron_right)
          ],
        ),
      ),
    );
  }
}
