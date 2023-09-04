import 'package:flutter/cupertino.dart';

import '../../ios_design_system.dart';

class CupertinoPickerWidget extends StatefulWidget {
  final double itemExtent;
  final void Function(int)? onSelectedItemChanged;
  final bool useMagnifier;
  final bool looping;
  final List<Widget> children;
  final double magnification;
  final double squeeze;
  final double diameterRatio;
  final double offAxisFraction;
  final int initialItem;
  final bool showGradient;

  const CupertinoPickerWidget({
    Key? key,
    required this.itemExtent,
    this.onSelectedItemChanged,
    this.showGradient = true,
    this.useMagnifier = false,
    this.looping = false,
    required this.children,
    this.magnification = 1.0,
    this.squeeze = 1.45,
    this.diameterRatio = 1.07,
    this.offAxisFraction = 0.0,
    this.initialItem = 0,
  }) : super(key: key);

  static Future<int?> show({
    required BuildContext context,
    BoxConstraints? boxConstraints,
    required double itemExtent,
    void Function(int)? onSelectedItemChanged,
    bool useMagnifier = false,
    bool looping = false,
    required List<Widget> children,
    double magnification = 1.0,
    double squeeze = 1.45,
    double diameterRatio = 1.07,
    double offAxisFraction = 0.0,
    bool barrierFilter = false,
    bool useRootNavigator = true,
    bool showGradient = true,
    int initialItem = 0,
  }) =>
      showCupertinoModalPopup<int>(
        filter: switch (barrierFilter) {
          true => kImageFilterBlur,
          false => null,
        },
        barrierColor: switch (barrierFilter) {
          true => SystemMaterialsBackgroundsColors.thickDark,
          false => SystemMaterialsBackgroundsColors.ultraThinDark,
        },
        context: context,
        useRootNavigator: useRootNavigator,
        builder: (BuildContext context) => ConstrainedBox(
          constraints: boxConstraints ?? const BoxConstraints.expand(),
          child: CupertinoPickerWidget(
            showGradient: showGradient,
            diameterRatio: diameterRatio,
            offAxisFraction: offAxisFraction,
            initialItem: initialItem,
            onSelectedItemChanged: onSelectedItemChanged,
            useMagnifier: useMagnifier,
            looping: looping,
            magnification: magnification,
            squeeze: squeeze,
            itemExtent: itemExtent,
            children: children,
          ),
        ),
      );

  @override
  State<CupertinoPickerWidget> createState() => _CupertinoPickerWidgetState();
}

class _CupertinoPickerWidgetState extends State<CupertinoPickerWidget> {
  late final FixedExtentScrollController fixedExtentScrollController;

  @override
  void initState() {
    super.initState();
    fixedExtentScrollController = FixedExtentScrollController(
      initialItem: widget.initialItem,
    );
  }

  @override
  void dispose() {
    fixedExtentScrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final brightness = CupertinoTheme.brightnessOf(context);
    final kBackgroundColor = switch (brightness) {
      Brightness.light => DefaultSystemGroupedBackgroundsColors.primaryLight,
      Brightness.dark => DefaultSystemBackgroundsColors.primaryDarkElevated,
    };
    return DecoratedBox(
      decoration: BoxDecoration(color: kBackgroundColor),
      child: SafeArea(
        top: false,
        maintainBottomViewPadding: true,
        minimum: kMinimumSafeAreaPadding,
        child: Stack(
          children: [
            Positioned.fill(
              child: CupertinoPicker(
                diameterRatio: widget.diameterRatio,
                offAxisFraction: widget.offAxisFraction,
                looping: widget.looping,
                backgroundColor: kBackgroundColor,
                magnification: widget.magnification,
                squeeze: widget.squeeze,
                useMagnifier: widget.useMagnifier,
                itemExtent: widget.itemExtent,
                scrollController: fixedExtentScrollController,
                onSelectedItemChanged: widget.onSelectedItemChanged,
                children: List.generate(
                  widget.children.length,
                  (index) => GestureDetector(
                    child: widget.children[index],
                    onTap: () {
                      final selectedItem =
                          fixedExtentScrollController.selectedItem;
                      if (selectedItem == index) {
                        Navigator.of(context).pop<int>(index);
                        return;
                      }
                      fixedExtentScrollController.animateToItem(
                        index,
                        duration: kAnimationInDuration,
                        curve: Curves.decelerate,
                      );
                    },
                  ),
                ),
              ),
            ),
            if (widget.showGradient)
              Positioned.fill(
                child: _GradientWidget(color: kBackgroundColor),
              ),
          ],
        ),
      ),
    );
  }
}

class _GradientWidget extends StatelessWidget {
  final Color color;
  const _GradientWidget({
    Key? key,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      ignoring: true,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.max,
        children: [
          Expanded(
            flex: 2,
            child: DecoratedBox(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    color,
                    color.withOpacity(.5),
                    color.withOpacity(0),
                  ],
                ),
              ),
            ),
          ),
          const Spacer(flex: 6),
          Expanded(
            flex: 2,
            child: DecoratedBox(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: [
                    color,
                    color.withOpacity(.5),
                    color.withOpacity(0),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
