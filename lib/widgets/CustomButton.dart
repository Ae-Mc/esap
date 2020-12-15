import 'package:esap/style.dart';
import 'package:flutter/cupertino.dart';

class CustomButton extends StatelessWidget {
  final Widget child;
  final Color color;
  final Function onTap;
  final BoxBorder border;
  final bool expandable;

  CustomButton(
      {@required this.child,
      this.color = primaryColor,
      this.onTap,
      this.border,
      this.expandable = false});

  @override
  Widget build(BuildContext context) {
    var content = GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(1000000000000000.0),
            border: border,
            color: color),
        padding: EdgeInsets.symmetric(vertical: 19),
        child: Center(
          child: child,
        ),
      ),
    );
    if (expandable)
      return Expanded(child: content);
    else
      return content;
  }
}
