import 'package:flutter/material.dart';

class CommonVerticalItem extends StatelessWidget {
  final IconData iconData;
  final String text;
  final Function onPressed;

  const CommonVerticalItem({this.iconData, this.text, this.onPressed})
      : super();

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        alignment: Alignment.center,
        height: 80,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              iconData,
              size: 18,
            ),
            SizedBox(height: 5),
            Text(text)
          ],
        ),
      ),
    );
  }
}
