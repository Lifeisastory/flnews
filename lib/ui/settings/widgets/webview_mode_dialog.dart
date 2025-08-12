
import 'package:flutter/material.dart';

import '../../../global/variable/global.dart';
import '../../core/l10n/app_localizations.dart';

class WebViewModeDialog extends StatelessWidget {
  const WebViewModeDialog({super.key});
  @override
  Widget build(BuildContext context) {
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
              AppLocalizations.of(context)!.choose_webview_mode,
              style: Theme.of(context).textTheme.titleSmall,
            ),
            CustomRadioListTile(),
          ],
        ),
      ),
    );
  }
}

class CustomRadioListTile extends StatefulWidget {
  const CustomRadioListTile({super.key});

  @override
  State createState() => _CustomRadioListTileState();
}

class _CustomRadioListTileState extends State {
  @override
  Widget build(BuildContext context) {
    final Map<bool, String> modes = {
      true: AppLocalizations.of(context)!.enbale,
      false: AppLocalizations.of(context)!.disable,
    };
    var webViewMode = Global.isWebViewOn;
    var selected = webViewMode;
    return Container(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children:
            modes.keys
                .map(
                  (k) => RadioListTile(
                    value: k,
                    groupValue: selected,
                    title: Text(
                      modes[k]!,
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    selected: selected == k,
                    onChanged: (value) {
                      setState(() => selected = value!);
                      Global.isWebViewOn = value!;
                      Navigator.pop(context);
                    },
                  ),
                )
                .toList(),
      ),
    );
  }
}
