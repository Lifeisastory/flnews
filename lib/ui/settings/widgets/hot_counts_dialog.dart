import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../global/states.dart';
import '../../../ui/core/l10n/app_localizations.dart';

class HotCountsDialog extends StatelessWidget {
  const HotCountsDialog({super.key});
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
              AppLocalizations.of(context)!.choose_hot_list_count,
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
  final List<int> counts = [5, 10, 20, 30];
  @override
  Widget build(BuildContext context) {
    var global = Provider.of<GlobalState>(context, listen: false);
    var selected = global.hotCounts;
    return Container(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children:
            counts
                .map(
                  (e) => RadioListTile(
                    value: e,
                    groupValue: selected,
                    title: Text(
                      AppLocalizations.of(context)!.piece(e),
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    selected: selected == e,
                    onChanged: (value) {
                      setState(() => selected = value!);
                      global.hotCounts = value;
                    },
                  ),
                )
                .toList(),
      ),
    );
  }
}
