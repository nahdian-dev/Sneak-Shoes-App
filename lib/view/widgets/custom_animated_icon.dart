import 'package:flutter/material.dart';

class CustomAnimatedIcon extends StatefulWidget {
  final GlobalKey<ScaffoldState> globalKey;
  const CustomAnimatedIcon({Key key, this.globalKey}) : super(key: key);

  @override
  _CustomAnimatedIconState createState() => _CustomAnimatedIconState();
}

class _CustomAnimatedIconState extends State<CustomAnimatedIcon>
    with SingleTickerProviderStateMixin {
  AnimationController _animationController;
  bool isOpened = false;

  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 300));
  }

  @override
  void dispose() {
    super.dispose();
    _animationController.dispose();
  }

  void _handleOnPressed() {
    setState(() {
      isOpened = !isOpened;
      if (!isOpened) {
        _animationController.forward();
        widget.globalKey.currentState.openDrawer();
      } else {
        _animationController.reverse();
        widget.globalKey.currentState.openEndDrawer();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      highlightColor: Colors.transparent,
      splashColor: Colors.transparent,
      icon: AnimatedIcon(
        icon: AnimatedIcons.menu_close,
        color: Colors.black,
        progress: _animationController,
      ),
      onPressed: () {
        _handleOnPressed();
      },
    );
  }
}
