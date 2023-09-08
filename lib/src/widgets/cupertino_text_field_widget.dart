import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../ios_design_system.dart';

class CupertinoTextFieldWidget extends StatefulWidget {
  final String? placeholder;
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final UndoHistoryController? undoController;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final TextCapitalization textCapitalization;
  final TextAlign textAlign;
  final TextAlignVertical? textAlignVertical;
  final TextDirection? textDirection;
  final bool readOnly;
  final bool? showCursor;
  final bool autofocus;
  final String obscuringCharacter;
  final bool obscureText;
  final bool autocorrect;
  final SmartDashesType? smartDashesType;
  final SmartQuotesType? smartQuotesType;
  final bool enableSuggestions;
  final int? maxLines;
  final int? minLines;
  final bool expands;
  final int? maxLength;
  final MaxLengthEnforcement? maxLengthEnforcement;
  final void Function(String)? onChanged;
  final void Function()? onEditingComplete;
  final void Function(String)? onSubmitted;
  final void Function(PointerDownEvent)? onTapOutside;
  final List<TextInputFormatter>? inputFormatters;
  final bool cursorOpacityAnimates;
  final BoxHeightStyle selectionHeightStyle;
  final BoxWidthStyle selectionWidthStyle;
  final EdgeInsets scrollPadding;
  final DragStartBehavior dragStartBehavior;
  final bool? enableInteractiveSelection;
  final TextSelectionControls? selectionControls;
  final void Function()? onTap;
  final ScrollController? scrollController;
  final ScrollPhysics? scrollPhysics;
  final Iterable<String>? autofillHints;
  final ContentInsertionConfiguration? contentInsertionConfiguration;
  final Clip clipBehavior;
  final String? restorationId;
  final bool scribbleEnabled;
  final bool enableIMEPersonalizedLearning;
  final Widget Function(BuildContext, EditableTextState)? contextMenuBuilder;
  final SpellCheckConfiguration? spellCheckConfiguration;
  final TextMagnifierConfiguration? magnifierConfiguration;

  const CupertinoTextFieldWidget({
    super.key,
    this.placeholder,
    this.controller,
    this.focusNode,
    this.undoController,
    this.keyboardType,
    this.textInputAction,
    this.textAlignVertical,
    this.textDirection,
    this.showCursor,
    this.smartDashesType,
    this.smartQuotesType,
    this.minLines,
    this.maxLength,
    this.maxLengthEnforcement,
    this.onChanged,
    this.onEditingComplete,
    this.onSubmitted,
    this.onTapOutside,
    this.inputFormatters,
    this.enableInteractiveSelection,
    this.selectionControls,
    this.onTap,
    this.scrollController,
    this.scrollPhysics,
    this.contentInsertionConfiguration,
    this.restorationId,
    this.spellCheckConfiguration,
    this.magnifierConfiguration,
    this.textCapitalization = TextCapitalization.none,
    this.textAlign = TextAlign.start,
    this.readOnly = false,
    this.autofocus = false,
    this.obscuringCharacter = '•',
    this.obscureText = false,
    this.autocorrect = true,
    this.enableSuggestions = true,
    this.maxLines = 1,
    this.expands = false,
    this.cursorOpacityAnimates = true,
    this.selectionHeightStyle = BoxHeightStyle.tight,
    this.selectionWidthStyle = BoxWidthStyle.tight,
    this.scrollPadding = const EdgeInsets.all(20.0),
    this.dragStartBehavior = DragStartBehavior.start,
    this.autofillHints = const <String>[],
    this.clipBehavior = Clip.hardEdge,
    this.scribbleEnabled = true,
    this.enableIMEPersonalizedLearning = true,
    this.contextMenuBuilder = _defaultContextMenuBuilder,
  });

  static Widget _defaultContextMenuBuilder(
    BuildContext context,
    EditableTextState editableTextState,
  ) {
    return CupertinoAdaptiveTextSelectionToolbar.editableText(
      editableTextState: editableTextState,
    );
  }

  @override
  State<CupertinoTextFieldWidget> createState() =>
      _CupertinoTextFieldWidgetState();
}

class _CupertinoTextFieldWidgetState extends State<CupertinoTextFieldWidget> {
  late final TextEditingController? _controller;

  @override
  void initState() {
    _controller = widget.controller == null ? TextEditingController() : null;
    super.initState();
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  TextEditingController? get _effectiveController =>
      widget.controller ?? _controller;

  @override
  Widget build(BuildContext context) {
    final textScaleFactor = MediaQuery.textScaleFactorOf(context);
    final brightness = CupertinoTheme.brightnessOf(context);
    const kCursorWidth = 1.0;
    const kCursorHeight = 24.0;
    const kClearButtonMode = OverlayVisibilityMode.never;
    const kSuffixMode = OverlayVisibilityMode.editing;
    const kPadding = EdgeInsets.only(
      left: 16,
      top: 11,
      bottom: 11,
      right: 0,
    );

    /// this is always enabled because Flutter don't allow change disabled
    /// color of [CupertinoTextField]
    const kEnabled = true;
    return Theme(
      data: AppThemeData.kTextFieldThemeData(brightness),
      child: CupertinoTextField(
        keyboardType: widget.keyboardType,
        textInputAction: widget.textInputAction,
        textCapitalization: widget.textCapitalization,
        textAlign: widget.textAlign,
        textAlignVertical: widget.textAlignVertical,
        textDirection: widget.textDirection,
        readOnly: widget.readOnly,
        showCursor: widget.showCursor,
        autofocus: widget.autofocus,
        obscuringCharacter: widget.obscuringCharacter,
        obscureText: widget.obscureText,
        autocorrect: widget.autocorrect,
        smartDashesType: widget.smartDashesType,
        smartQuotesType: widget.smartQuotesType,
        enableSuggestions: widget.enableSuggestions,
        maxLines: widget.maxLines,
        minLines: widget.minLines,
        expands: widget.expands,
        maxLength: widget.maxLength,
        maxLengthEnforcement: widget.maxLengthEnforcement,
        onChanged: widget.onChanged,
        onEditingComplete: widget.onEditingComplete,
        onSubmitted: widget.onSubmitted,
        onTapOutside: widget.onTapOutside,
        inputFormatters: widget.inputFormatters,
        cursorOpacityAnimates: widget.cursorOpacityAnimates,
        selectionHeightStyle: widget.selectionHeightStyle,
        selectionWidthStyle: widget.selectionWidthStyle,
        scrollPadding: widget.scrollPadding,
        dragStartBehavior: widget.dragStartBehavior,
        enableInteractiveSelection: widget.enableInteractiveSelection,
        selectionControls: widget.selectionControls,
        onTap: widget.onTap,
        scrollController: widget.scrollController,
        scrollPhysics: widget.scrollPhysics,
        autofillHints: widget.autofillHints,
        contentInsertionConfiguration: widget.contentInsertionConfiguration,
        clipBehavior: widget.clipBehavior,
        restorationId: widget.restorationId,
        contextMenuBuilder: widget.contextMenuBuilder,
        spellCheckConfiguration: widget.spellCheckConfiguration,
        magnifierConfiguration: widget.magnifierConfiguration,
        scribbleEnabled: widget.scribbleEnabled,
        enableIMEPersonalizedLearning: widget.enableIMEPersonalizedLearning,
        controller: _effectiveController,
        focusNode: widget.focusNode,
        undoController: widget.undoController,
        enabled: kEnabled,
        keyboardAppearance: brightness,
        placeholder: widget.placeholder,
        clearButtonMode: kClearButtonMode,
        suffixMode: kSuffixMode,
        suffix: GestureDetector(
          onTap: _effectiveController?.clear,
          child: Padding(
            padding: const EdgeInsets.only(right: 16, left: 8),
            child: Icon(
              CupertinoIcons.clear_thick_circled,
              size: 18 * textScaleFactor,
              color: switch (brightness) {
                Brightness.light => DefaultColors.systemGray01Light,
                Brightness.dark => DefaultColors.systemGray01Dark,
              },
            ),
          ),
        ),
        placeholderStyle: AppTypography.bodyRegular.copyWith(
          color: switch (brightness) {
            Brightness.light => DefaultLabelColors.secondaryLight,
            Brightness.dark => DefaultLabelColors.secondaryDark,
          },
        ),
        style: AppTypography.bodyRegular.copyWith(
          color: switch (brightness) {
            Brightness.light => DefaultLabelColors.primaryLight,
            Brightness.dark => DefaultLabelColors.primaryDark,
          },
        ),
        cursorWidth: kCursorWidth,
        cursorHeight: kCursorHeight,
        cursorColor: switch (brightness) {
          Brightness.light => DefaultColors.systemBlueLight,
          Brightness.dark => DefaultColors.systemBlueDark,
        },
        padding: kPadding,
        decoration: BoxDecoration(
          color: switch (brightness) {
            Brightness.light => DefaultSystemBackgroundsColors.primaryLight,
            Brightness.dark =>
              DefaultSystemBackgroundsColors.primaryDarkElevated,
          },
        ),
      ),
    );
  }
}
