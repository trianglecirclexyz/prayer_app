import 'package:flutter/material.dart';

import '../style/colors.dart';

class FadeButton extends StatefulWidget {
  final IconData iconData;
  final VoidCallback onPressedCallback;

  const FadeButton({
    super.key,
    required this.iconData,
    required this.onPressedCallback
      });

  @override
  State<StatefulWidget> createState() => _FadeButtonState();

}

class _FadeButtonState extends State<FadeButton> with SingleTickerProviderStateMixin {

  late AnimationController _animController;
  late Animation<Color?> _colorAnim;

  @override
  void initState() {
    super.initState();

    _animController = AnimationController(
      vsync: this, // the SingleTickerProviderStateMixin
      duration: const Duration(milliseconds: 800),
    );

    _colorAnim = TweenSequence(
      <TweenSequenceItem<Color?>>[
        TweenSequenceItem<Color?>(
            tween: ColorTween(begin: ThemeColors.secondary, end: ThemeColors.accent),
            weight: 1),
        TweenSequenceItem<Color?>(
            tween: ColorTween(begin: ThemeColors.accent, end: ThemeColors.secondary),
            weight: 100),
      ]
    ).animate(_animController)..addListener(() {
      if (_animController.isCompleted) {
        _animController.reset();
      }
    });

  }

  @override
  void dispose() {
    _animController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: _animController,
        builder: (BuildContext context, Widget? child) {
          return IconButton(
              onPressed: () {

                widget.onPressedCallback();

                setState(() {
                  if (_animController.isAnimating) {
                    _animController.reset();
                    _animController.forward();
                  } else {
                    _animController.forward();
                  }
                });
              },
              color: _colorAnim.value,
              highlightColor: Colors.transparent,
              splashColor: Colors.transparent,
              icon: Icon(
                widget.iconData,
                size: 16,
              )
          );
        },
    );
  }
}
