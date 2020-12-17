import 'package:esap/style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class InputTextField extends StatefulWidget {
  final Widget leftIcon;
  final List<Widget> rightIcons;
  final String hintText;
  final bool obscureText;
  final TextStyle textStyle;
  final Function(String text) onChanged;
  final Function(String text) onSubmitted;

  InputTextField({
    this.leftIcon,
    this.hintText,
    this.rightIcons,
    this.obscureText = false,
    this.textStyle,
    this.onChanged,
    this.onSubmitted,
  }) {
    if (rightIcons != null) assert(rightIcons.length == 2);
  }

  createState() => _InputTextField();
}

class _InputTextField extends State<InputTextField> {
  FocusNode _focusNode;
  bool obscureText;
  final Border disabledBorder = Border.all(color: outlineColor, width: 1);
  final Border activeBorder = Border.all(color: primaryColor, width: 2);
  Border _border;

  @override
  void initState() {
    _border = disabledBorder;
    obscureText = widget.obscureText;
    _focusNode = FocusNode();
    _focusNode.addListener(() {
      setState(() {
        if (_focusNode.hasFocus)
          _border = activeBorder;
        else
          _border = disabledBorder;
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 24),
      decoration: BoxDecoration(
        color: Theme.of(context).backgroundColor,
        border: _border,
        borderRadius: BorderRadius.circular(32),
      ),
      child: Row(
        children: [
          widget.leftIcon == null
              ? SizedBox()
              : Row(
                  children: [
                    SizedBox(
                      width: 24,
                      height: 24,
                      child: widget.leftIcon,
                    ),
                    SizedBox(width: 12),
                  ],
                ),
          Expanded(
            child: TextField(
              style: widget.textStyle,
              decoration: InputDecoration(
                hintText: widget.hintText,
                hintStyle: Theme.of(context).textTheme.bodyText2,
                border: InputBorder.none,
              ),
              obscureText: obscureText,
              focusNode: _focusNode,
              onChanged: widget.onChanged,
              onSubmitted: widget.onSubmitted,
            ),
          ),
          SizedBox(width: 5),
          widget.rightIcons == null
              ? SizedBox()
              : GestureDetector(
                  onTap: () => setState(() => obscureText = !obscureText),
                  child: SizedBox(
                    width: 24,
                    height: 24,
                    child: widget.rightIcons[obscureText ? 0 : 1],
                  ),
                ),
        ],
      ),
    );
  }
}
