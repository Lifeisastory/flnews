import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../global/states.dart';
import '../../../ui/core/l10n/app_localizations.dart';

class FontSizeDialog extends StatelessWidget {
  const FontSizeDialog({super.key});
  @override
  Widget build(BuildContext context) {
    var global = Provider.of<GlobalState>(context, listen: false);
    var fontSize = global.fontSize ?? 1;    // 用户选择的字体大小（值为倍率，从0.75 - 1.5）
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20, 20, 20, 10),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              AppLocalizations.of(context)!.choose_font_size,
              style: Theme.of(context).textTheme.titleSmall,
            ),
            CustomFontSizeSelector(
              onChangeFontSize: (double size) => fontSize = size,   // 使用回调函数在父组件中按下确认时字体改变生效
              initFontSize: fontSize,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: Text(AppLocalizations.of(context)!.cancel),
                ),
                TextButton(
                  onPressed: () {
                    global.fontSize = fontSize;
                    Navigator.of(context).pop();
                  },
                  child: Text(AppLocalizations.of(context)!.confirm),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class CustomFontSizeSelector extends StatefulWidget {
  const CustomFontSizeSelector({
    super.key,
    required this.onChangeFontSize,
    required this.initFontSize,
  });

  final void Function(double) onChangeFontSize;
  final double initFontSize;

  @override
  State createState() => _CustomFontSizeSelectorState();
}

class _CustomFontSizeSelectorState extends State<CustomFontSizeSelector> {
  late double fontSize;

  @override
  void initState() {
    super.initState();
    fontSize = widget.initFontSize; // 在这里初始化字体大小。如果直接在build()中使用全局字体大小变量，会使得这个变量随着每次的build重置
  }

  @override
  Widget build(BuildContext context) {
    final Map<double, String> hint = {
      0.75: AppLocalizations.of(context)!.small,
      1: AppLocalizations.of(context)!.standard,
      1.25: AppLocalizations.of(context)!.large,
      1.5: AppLocalizations.of(context)!.extra_large,
    };
    return Padding(
      padding: const EdgeInsets.only(top: 20.0),
      child: Column(
        children: [
          Text(
            hint[fontSize]!,
            style: TextStyle(
              fontSize:
                  Theme.of(context).textTheme.bodyMedium!.fontSize! * fontSize,
            ),
          ),
          SliderTheme(
            data: SliderThemeData(
              thumbShape: RoundSliderThumbShape(
                enabledThumbRadius: 5, // 滑块大小
              ),
            ),
            child: Slider(
              min: 0.75,
              max: 1.5,
              value: fontSize,
              onChanged: (value) {
                setState(() {
                  fontSize = value;
                  widget.onChangeFontSize(value);
                });
              },
              divisions: 3,   // 分三段
            ),
          ),
        ],
      ),
    );
  }
}
