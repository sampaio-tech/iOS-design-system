import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

import '../exports.dart';

class CupertinoButtonWidget extends StatefulWidget {
  final Widget child;
  final EdgeInsetsGeometry padding;
  final Color? color;
  final Color? disabledColor;
  final VoidCallback? onPressed;
  final double pressedOpacity;
  final BorderRadius borderRadius;
  final AlignmentGeometry alignment;
  final BoxConstraints? constraints;
  final BoxBorder? border;
  final BoxShape shape;
  final bool displayCupertinoActivityIndicator;
  final CupertinoActivityIndicator cupertinoActivityIndicator;

  const CupertinoButtonWidget({
    super.key,
    required this.child,
    required this.onPressed,
    this.padding = kCupertinoButtonPadding,
    this.constraints,
    this.color,
    this.disabledColor,
    this.pressedOpacity = kCupertinoButtonPressedOpacity,
    this.borderRadius = kCupertinoButtonBorderRadius,
    this.alignment = Alignment.center,
    this.border,
    this.shape = BoxShape.rectangle,
    this.displayCupertinoActivityIndicator = false,
    this.cupertinoActivityIndicator = const CupertinoActivityIndicator(),
  }) : assert((pressedOpacity >= 0.0 && pressedOpacity <= 1.0));

  bool get enabled => onPressed != null;

  @override
  State<CupertinoButtonWidget> createState() => _CupertinoButtonWidgetState();
}

class _CupertinoButtonWidgetState extends State<CupertinoButtonWidget>
    with SingleTickerProviderStateMixin {
  final Tween<double> _opacityTween = Tween<double>(begin: 1.0);

  late AnimationController _animationController;
  late Animation<double> _opacityAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 200),
      value: 0.0,
      vsync: this,
    );
    _opacityAnimation = _animationController
        .drive(CurveTween(curve: Curves.decelerate))
        .drive(_opacityTween);
    _setTween();
  }

  @override
  void didUpdateWidget(CupertinoButtonWidget old) {
    super.didUpdateWidget(old);
    _setTween();
  }

  void _setTween() {
    _opacityTween.end = widget.pressedOpacity;
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  bool _buttonHeldDown = false;

  void _handleTapDown(TapDownDetails event) {
    if (!_buttonHeldDown) {
      _buttonHeldDown = true;
      _animate();
    }
  }

  void _handleTapUp(TapUpDetails event) {
    if (_buttonHeldDown) {
      _buttonHeldDown = false;
      _animate();
    }
  }

  void _handleTapCancel() {
    if (_buttonHeldDown) {
      _buttonHeldDown = false;
      _animate();
    }
  }

  void _animate() {
    if (_animationController.isAnimating) {
      return;
    }
    final bool wasHeldDown = _buttonHeldDown;
    final TickerFuture ticker = _buttonHeldDown
        ? _animationController.animateTo(
            1.0,
            duration: kAnimationInDuration,
            curve: Curves.easeInOutCubicEmphasized,
          )
        : _animationController.animateTo(
            0.0,
            duration: kAnimationOutDuration,
            curve: Curves.easeOutCubic,
          );
    ticker.then<void>((void value) {
      if (mounted && wasHeldDown != _buttonHeldDown) {
        _animate();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final enabled = widget.enabled;
    final backgroundColor = widget.color;
    return MouseRegion(
      cursor: enabled && kIsWeb ? SystemMouseCursors.click : MouseCursor.defer,
      child: IgnorePointer(
        ignoring: widget.displayCupertinoActivityIndicator,
        child: GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTapDown: enabled ? _handleTapDown : null,
          onTapUp: enabled ? _handleTapUp : null,
          onTapCancel: enabled ? _handleTapCancel : null,
          onTap: widget.onPressed,
          child: Semantics(
            button: true,
            child: FadeTransition(
              opacity: _opacityAnimation,
              child: AnimatedContainer(
                duration: kAnimationInDuration,
                padding: widget.padding,
                constraints: widget.constraints,
                decoration: BoxDecoration(
                  border: widget.border,
                  shape: widget.shape,
                  borderRadius: widget.borderRadius,
                  color: backgroundColor != null && !enabled
                      ? widget.disabledColor
                      : backgroundColor,
                ),
                child: AnimatedSwitcher(
                  duration: kAnimationInDuration,
                  reverseDuration: kAnimationOutDuration,
                  transitionBuilder: (child, animation) => FadeTransition(
                    opacity: animation,
                    child: child,
                  ),
                  child: switch (widget.displayCupertinoActivityIndicator) {
                    true => widget.cupertinoActivityIndicator,
                    false => widget.child,
                  },
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
