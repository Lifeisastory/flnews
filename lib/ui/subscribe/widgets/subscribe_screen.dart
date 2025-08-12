import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../global/states.dart';
import '../../core/l10n/app_localizations.dart';
import '../view_models/subscribe_viewmodel.dart';

class SubscribeScreen extends StatelessWidget {
  const SubscribeScreen({super.key, required this.viewmodel});

  final SubscribeViewModel viewmodel;

  @override
  Widget build(BuildContext context) {
    var global = Provider.of<GlobalState>(context, listen: false);
    return StreamBuilder(
      stream: viewmodel.sitesConfigStream,
      builder: (context, snapshot) {
        final sitesConfig = snapshot.data ?? []; // 从数据库中流式获取数据
        return CustomScrollView(
          slivers: [
            SliverList.builder(
              itemCount: sitesConfig.length + 2,
              itemBuilder: (context, index) {
                if (index == 0) {
                  return SizedBox(height: global.barHeight);
                }
                if (index == sitesConfig.length + 1) {
                  return SizedBox(height: global.barHeight);
                }
                return Container(
                  margin: const EdgeInsets.only(
                    top: 10.0,
                    left: 10.0,
                    right: 10.0,
                  ),
                  height: 60 * global.fontSize!,
                  child: Row(
                    spacing: 5,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(6),
                        child: Image.network(
                          sitesConfig[index - 1].iconUrl,
                          height: 26 * global.fontSize!,
                          width: 26 * global.fontSize!,
                        ),
                      ),
                      Expanded(
                        child: Text(
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          sitesConfig[index - 1].name,
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                      ),
                      TextButton(
                        onPressed:
                            () => viewmodel.switchSubscription(
                              id: sitesConfig[index - 1].id,
                              isSubscribed: sitesConfig[index - 1].isSubscribed,
                            ),
                        style: ButtonStyle(
                          minimumSize: WidgetStateProperty.all(Size(8, 12)),
                          shape: WidgetStateProperty.all(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16),
                            ),
                          ),
                          backgroundColor: WidgetStateProperty.all(
                            sitesConfig[index - 1].isSubscribed
                                ? Theme.of(context).colorScheme.secondary
                                : Theme.of(context).colorScheme.primary,
                          ),
                        ),
                        child: SizedBox(
                          height: 25 * global.fontSize!,
                          width:
                              Localizations.localeOf(context) ==
                                      const Locale('en')
                                  ? 78 * global.fontSize!
                                  : 48 * global.fontSize!,
                          child: Center(
                            child:
                                sitesConfig[index - 1].isSubscribed
                                    ? Text(
                                      AppLocalizations.of(context)!.subscribed,
                                      style:
                                          Theme.of(
                                            context,
                                          ).textTheme.labelLarge,
                                    )
                                    : RichText(
                                      text: TextSpan(
                                        children: [
                                          WidgetSpan(
                                            child: Icon(
                                              Icons.add,
                                              size: 16 * global.fontSize!,
                                              color:
                                                  Theme.of(
                                                    context,
                                                  ).colorScheme.onPrimary,
                                            ),
                                          ),
                                          TextSpan(
                                            text:
                                                AppLocalizations.of(
                                                  context,
                                                )!.subscribe,
                                          ),
                                        ],
                                        style: TextStyle(
                                          color:
                                              Theme.of(
                                                context,
                                              ).colorScheme.onPrimary,
                                          fontSize:
                                              Theme.of(
                                                context,
                                              ).textTheme.labelLarge!.fontSize,
                                        ),
                                      ),
                                    ),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ],
        );
      },
    );
  }
}
