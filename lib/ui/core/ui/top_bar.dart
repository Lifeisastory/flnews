import 'package:flnews/ui/core/l10n/app_localizations.dart';
import 'package:flutter/material.dart';

class TopBar extends StatelessWidget {
  const TopBar({super.key, required this.pageName});

  final String pageName;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: Theme.of(context).dividerColor, width: 0.2),
        ),
        color: Theme.of(
          context,
        ).scaffoldBackgroundColor.withValues(alpha: 0.925),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(pageName, style: Theme.of(context).textTheme.headlineLarge),
          const Spacer(),
          if (pageName == AppLocalizations.of(context)!.hot) ...[
            IconButton(
              icon: Icon(
                Icons.search,
                size: Theme.of(context).textTheme.headlineLarge!.fontSize,
                color: Theme.of(context).colorScheme.primary,
              ),
              onPressed: () {},
            ),
            // IconButton(
            //   icon: Icon(
            //     Icons.more_vert,
            //     size: Theme.of(context).textTheme.headlineLarge!.fontSize,
            //     color: Theme.of(context).colorScheme.primary,
            //   ),
            //   onPressed: () {},
            // ),
          ],
        ],
      ),
    );
  }
}
