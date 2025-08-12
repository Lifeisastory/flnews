import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../global/states.dart';
import '../../core/l10n/app_localizations.dart';

class DarkModeDialog extends StatelessWidget {
  const DarkModeDialog({super.key});
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
              AppLocalizations.of(context)!.choose_dark_mode,
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
    final Map<String, String> modes = {
      "dark": AppLocalizations.of(context)!.dark,
      "light": AppLocalizations.of(context)!.light,
    };
    var global = Provider.of<GlobalState>(context, listen: false);
    var selected = global.darkMode ?? "dark";
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
                      global.darkMode = value;
                    },
                  ),
                )
                .toList(),
      ),
    );
  }
}
