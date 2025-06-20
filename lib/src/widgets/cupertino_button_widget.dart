import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

import '../exports.dart' as exports;

class CupertinoButtonWidget extends StatefulWidget {
  const CupertinoButtonWidget({
    required this.child,
    required this.onPressed,
    this.backgroundGradient,
    this.onLongPress,
    this.onDoubleTap,
    this.onHorizontalDragUpdate,
    this.onVerticalDragUpdate,
    this.onPanUpdate,
    super.key,
    this.padding = exports.kCupertinoButtonPadding,
    this.constraints,
    this.color,
    this.disabledColor,
    this.pressedOpacity = exports.kCupertinoButtonPressedOpacity,
    this.borderRadius = exports.kCupertinoButtonBorderRadius,
    this.alignment = Alignment.center,
    this.border,
    this.shape = BoxShape.rectangle,
    this.displayCupertinoActivityIndicator = false,
    this.cupertinoActivityIndicator = const CupertinoActivityIndicator(),
  }) : assert((pressedOpacity >= 0.0 && pressedOpacity <= 1.0));
  final Widget child;
  final EdgeInsetsGeometry padding;
  final Color? color;
  final Color? disabledColor;
  final Gradient? backgroundGradient;
  final VoidCallback? onPressed;
  final VoidCallback? onLongPress;
  final VoidCallback? onDoubleTap;
  final void Function(DragUpdateDetails)? onHorizontalDragUpdate;
  final void Function(DragUpdateDetails)? onVerticalDragUpdate;
  final void Function(DragUpdateDetails)? onPanUpdate;
  final double pressedOpacity;
  final BorderRadius borderRadius;
  final AlignmentGeometry alignment;
  final BoxConstraints? constraints;
  final BoxBorder? border;
  final BoxShape shape;
  final bool displayCupertinoActivityIndicator;
  final CupertinoActivityIndicator cupertinoActivityIndicator;

  bool get enabled =>
      onPressed != null ||
      onLongPress != null ||
      onDoubleTap != null ||
      onHorizontalDragUpdate != null ||
      onVerticalDragUpdate != null ||
      onPanUpdate != null;

  @override
  State<CupertinoButtonWidget> createState() => _CupertinoButtonWidgetState();
}

class _CupertinoButtonWidgetState extends State<CupertinoButtonWidget>
    with SingleTickerProviderStateMixin {
  final Tween<double> _opacityTween = Tween<double>(begin: 1);

  late AnimationController _animationController;
  late Animation<double> _opacityAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 200),
      value: 0,
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

  void _handleOnPanStart(DragStartDetails event) {
    if (!_buttonHeldDown) {
      _buttonHeldDown = true;
      _animate();
    }
  }

  void _handleOnPanDown(DragDownDetails event) {
    if (!_buttonHeldDown) {
      _buttonHeldDown = true;
      _animate();
    }
  }

  void _handleOnPanCancel() {
    if (_buttonHeldDown) {
      _buttonHeldDown = false;
      _animate();
    }
  }

  void _handleOnPanEnd(DragEndDetails event) {
    if (_buttonHeldDown) {
      _buttonHeldDown = false;
      _animate();
    }
  }

  void _handleOnHorizontalDragStart(DragStartDetails event) {
    if (!_buttonHeldDown) {
      _buttonHeldDown = true;
      _animate();
    }
  }

  void _handleOnHorizontalDragDown(DragDownDetails event) {
    if (!_buttonHeldDown) {
      _buttonHeldDown = true;
      _animate();
    }
  }

  void _handleOnHorizontalDragCancel() {
    if (_buttonHeldDown) {
      _buttonHeldDown = false;
      _animate();
    }
  }

  void _handleOnHorizontalDragEnd(DragEndDetails event) {
    if (_buttonHeldDown) {
      _buttonHeldDown = false;
      _animate();
    }
  }

  void _handleOnVerticalDragStart(DragStartDetails event) {
    if (!_buttonHeldDown) {
      _buttonHeldDown = true;
      _animate();
    }
  }

  void _handleOnVerticalDragDown(DragDownDetails event) {
    if (!_buttonHeldDown) {
      _buttonHeldDown = true;
      _animate();
    }
  }

  void _handleOnVerticalDragCancel() {
    if (_buttonHeldDown) {
      _buttonHeldDown = false;
      _animate();
    }
  }

  void _handleOnVerticalDragEnd(DragEndDetails event) {
    if (_buttonHeldDown) {
      _buttonHeldDown = false;
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
    final TickerFuture ticker =
        _buttonHeldDown
            ? _animationController.animateTo(
              1,
              duration: exports.kAnimationInDuration,
              curve: Curves.easeInOutCubicEmphasized,
            )
            : _animationController.animateTo(
              0,
              duration: exports.kAnimationOutDuration,
              curve: Curves.easeOutCubic,
            );
    ticker.then<void>((value) {
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
          onHorizontalDragStart:
              widget.onHorizontalDragUpdate != null
                  ? _handleOnHorizontalDragStart
                  : null,
          onHorizontalDragDown:
              widget.onHorizontalDragUpdate != null
                  ? _handleOnHorizontalDragDown
                  : null,
          onHorizontalDragCancel:
              widget.onHorizontalDragUpdate != null
                  ? _handleOnHorizontalDragCancel
                  : null,
          onHorizontalDragEnd:
              widget.onHorizontalDragUpdate != null
                  ? _handleOnHorizontalDragEnd
                  : null,
          onVerticalDragStart:
              widget.onVerticalDragUpdate != null
                  ? _handleOnVerticalDragStart
                  : null,
          onVerticalDragDown:
              widget.onVerticalDragUpdate != null
                  ? _handleOnVerticalDragDown
                  : null,
          onVerticalDragCancel:
              widget.onVerticalDragUpdate != null
                  ? _handleOnVerticalDragCancel
                  : null,
          onVerticalDragEnd:
              widget.onVerticalDragUpdate != null
                  ? _handleOnVerticalDragEnd
                  : null,
          onPanStart: widget.onPanUpdate != null ? _handleOnPanStart : null,
          onPanDown: widget.onPanUpdate != null ? _handleOnPanDown : null,
          onPanCancel: widget.onPanUpdate != null ? _handleOnPanCancel : null,
          onPanEnd: widget.onPanUpdate != null ? _handleOnPanEnd : null,

          onTap: switch (widget.onPressed) {
            null => null,
            final onPressed => () {
              FocusManager.instance.primaryFocus?.unfocus();
              onPressed();
            },
          },
          onLongPress: switch (widget.onLongPress) {
            null => null,
            final onLongPress => () {
              FocusManager.instance.primaryFocus?.unfocus();
              onLongPress();
            },
          },
          onDoubleTap: switch (widget.onDoubleTap) {
            null => null,
            final onDoubleTap => () {
              FocusManager.instance.primaryFocus?.unfocus();
              onDoubleTap();
            },
          },
          onPanUpdate: switch (widget.onPanUpdate) {
            null => null,
            final onPanUpdate => (DragUpdateDetails details) {
              FocusManager.instance.primaryFocus?.unfocus();
              onPanUpdate(details);
            },
          },
          onHorizontalDragUpdate: switch (widget.onHorizontalDragUpdate) {
            null => null,
            final onHorizontalDragUpdate => (DragUpdateDetails details) {
              FocusManager.instance.primaryFocus?.unfocus();
              onHorizontalDragUpdate(details);
            },
          },
          onVerticalDragUpdate: switch (widget.onVerticalDragUpdate) {
            null => null,
            final onVerticalDragUpdate => (DragUpdateDetails details) {
              FocusManager.instance.primaryFocus?.unfocus();
              onVerticalDragUpdate(details);
            },
          },
          child: Semantics(
            button: true,
            child: FadeTransition(
              opacity: _opacityAnimation,
              child: Container(
                padding: widget.padding,
                constraints: widget.constraints,
                decoration: BoxDecoration(
                  border: widget.border,
                  shape: widget.shape,
                  borderRadius: widget.borderRadius,
                  color:
                      backgroundColor != null && !enabled
                          ? widget.disabledColor
                          : backgroundColor,
                  gradient: widget.backgroundGradient,
                ),
                child: AnimatedSwitcher(
                  duration: exports.kAnimationInDuration,
                  reverseDuration: exports.kAnimationOutDuration,
                  transitionBuilder:
                      (child, animation) =>
                          FadeTransition(opacity: animation, child: child),
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
