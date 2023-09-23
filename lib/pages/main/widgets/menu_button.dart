import 'package:flutter/material.dart';

class MenuButton extends StatelessWidget {
  final VoidCallback onPress;
  final Animation<double> animation;

  const MenuButton({
    super.key,
    required this.onPress,
    required this.animation,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        margin: const EdgeInsets.only(left: 12),
        height: 45 - animation.value * 10,
        width: 45 - animation.value * 10,
        decoration: const BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              offset: Offset(0, 3),
              blurRadius: 8,
            ),
          ],
        ),
        child: InkWell(
          onTap: onPress,
          child: Center(
            child: AnimatedIcon(
              icon: AnimatedIcons.menu_close,
              size: 30,
              progress: animation,
            ),
          ),
        ),
      ),
    );
  }
}
