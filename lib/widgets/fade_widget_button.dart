import 'package:flutter/material.dart';

import '../style/colors.dart';

class FadeWidgetButton extends StatefulWidget {
  final Widget childWidget;
  final VoidCallback onPressedCallback;

  const FadeWidgetButton({
    super.key,
    required this.childWidget,
    required this.onPressedCallback,
  });

  @override
  State<StatefulWidget> createState() => _FadeWidgetButtonState();

}

class _FadeWidgetButtonState extends State<FadeWidgetButton> with SingleTickerProviderStateMixin {

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
              tween: ColorTween(begin: ThemeColors.primaryText, end: ThemeColors.accent),
              weight: 1),
          TweenSequenceItem<Color?>(
              tween: ColorTween(begin: ThemeColors.accent, end: ThemeColors.primaryText),
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
        return Center(
          child: GestureDetector(
            onTap: () {

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
            child: ColorFiltered(
                colorFilter: ColorFilter.mode(
                    _colorAnim.value!,
                    BlendMode.srcIn
                ),
                child: widget.childWidget
            )
          ),
        );
      },
    );
  }
}