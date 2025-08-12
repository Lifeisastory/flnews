import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../global/states.dart';
import '../../core/l10n/app_localizations.dart';

class ThemeDialog extends StatelessWidget {
  const ThemeDialog({super.key});
  @override
  Widget build(BuildContext context) {
    var global = Provider.of<GlobalState>(context, listen: false);
    var theme = global.theme;
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
              AppLocalizations.of(context)!.choose_theme,
              style: Theme.of(context).textTheme.titleSmall,
            ),
            CustomGridView(
              onChangeTheme: (MaterialColor color) => theme = color,    // 使用回调函数从子组件传递状态到父组件，还可以使用状态提升。将子组件和父组件的
                                                                        // 状态单独放到一个ChangeNotifier中，然后用Consumer包裹父组件https://docs.fluttercn.cn/data-and-backend/state-mgmt/simple                                                               
              global: global,
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
                    global.theme = theme;
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

class CustomGridView extends StatefulWidget {
  const CustomGridView({
    super.key,
    required this.global,
    required this.onChangeTheme,
  });

  final GlobalState global;
  final void Function(MaterialColor) onChangeTheme;
  @override
  State createState() => _CustomGridViewState();
}

class _CustomGridViewState extends State<CustomGridView> {
  late MaterialColor theme;

  @override
  void initState() {
    super.initState();
    theme = widget.global.theme;
  }

  @override
  Widget build(BuildContext context) {
    final List<MaterialColor> themes = widget.global.themes;
    return LayoutBuilder(
      builder: (context, constraints) {
        const maxCrossAxisExtent = 100.0;
        const space = 5.0;
        const ratio = 5 / 4;
        var (gridViewHeight, itemWidth) = _getGridViewHeight(
          constraints,
          maxCrossAxisExtent,
          themes.length,
          space,
          ratio,
        );
        return Container(
          margin: const EdgeInsets.only(top: 10),
          constraints: BoxConstraints(
            maxHeight: MediaQuery.of(context).size.height / 5 * 2,
          ),
          height: gridViewHeight,
          child: GridView.extent(
            mainAxisSpacing: space,
            crossAxisSpacing: space,
            maxCrossAxisExtent: maxCrossAxisExtent,
            childAspectRatio: ratio,
            children:
                themes
                    .map(
                      (e) => Builder(
                        // 缩小重绘范围
                        builder: (context) {
                          return GestureDetector(
                            onTap: () {
                              setState(() {
                                theme = e;
                                widget.onChangeTheme(e);
                              });
                            },
                            child: Column(
                              children: [
                                Expanded(
                                  child: Container(
                                    width: itemWidth,
                                    decoration: BoxDecoration(
                                      border:
                                          e == theme
                                              ? Border.all(
                                                color: Colors.white,
                                                width: 2,
                                              )
                                              : null,
                                      borderRadius: BorderRadius.circular(16),
                                      color: e,
                                    ),
                                    child:
                                        e == theme ? Icon(Icons.check) : null,
                                  ),
                                ),
                                Text(
                                  _getColorDescription(e, context),
                                  style: Theme.of(context).textTheme.bodyMedium,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    )
                    .toList(),
          ),
        );
      },
    );
  }

  // 模拟GridView的计算过程，动态地的到GridView的高度
  (double, double) _getGridViewHeight(
    BoxConstraints constraints,
    double maxCrossAxisExtent,
    int itemCount,
    double space,
    double ratio,
  ) {
    final containerWidth = constraints.maxWidth;
    final crossAxisCount = (containerWidth / maxCrossAxisExtent).ceil().clamp(
      1,
      itemCount,
    ); // 结果是否在1到themes.length之间
    final itemWidth =
        (containerWidth - (crossAxisCount - 1) * space) / crossAxisCount;
    final itemHeight = itemWidth / ratio; // 除以childAspectRatio
    final rowCount = (itemCount / crossAxisCount).ceil();
    return (
      rowCount * itemHeight + (rowCount - 1) * space,
      itemWidth,
    ); // 加上每一行的间距
  }

  String _getColorDescription(MaterialColor color, BuildContext context) {
    Map<MaterialColor, String> themes = {
      Colors.blue: AppLocalizations.of(context)!.blue,
      Colors.pink: AppLocalizations.of(context)!.pink,
      Colors.orange: AppLocalizations.of(context)!.orange,
      Colors.red: AppLocalizations.of(context)!.red,
      Colors.purple: AppLocalizations.of(context)!.purple,
    };
    return themes[color]!;
  }
}
