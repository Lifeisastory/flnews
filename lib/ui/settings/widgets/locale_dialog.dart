import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../global/states.dart';
import '../../../ui/core/l10n/app_localizations.dart';

class LocaleDialog extends StatelessWidget {
  const LocaleDialog({super.key});

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
              AppLocalizations.of(context)!.choose_language,
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
    final Map<String, String> languages = {
      "auto": AppLocalizations.of(context)!.auto,
      "zh": AppLocalizations.of(context)!.zh,
      "en": AppLocalizations.of(context)!.en,
    };
    var global = Provider.of<GlobalState>(context, listen: false);
    var selected = global.locale ?? "auto";
    return Container(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children:
            languages.keys
                .map(
                  (k) => RadioListTile(
                    value: k,
                    groupValue: selected,
                    title: Text(
                      languages[k]!,
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    selected: selected == k,
                    onChanged: (value) {
                      setState(() => selected = value!);
                      if (value == "auto") {
                        global.locale = null;
                      } else {
                        global.locale = value;
                      }
                    },
                  ),
                )
                .toList(),
      ),
    );
  }
}
