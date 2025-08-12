import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../scaffold_viewmodel.dart';

class BottomBar extends StatelessWidget {
  const BottomBar({super.key, required this.pageController});

  final PageController pageController;

  @override
  Widget build(BuildContext context) {
    final iconSize = Theme.of(context).textTheme.headlineLarge!.fontSize;
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(color: Theme.of(context).dividerColor, width: 0.2),
          left: BorderSide(color: Theme.of(context).dividerColor, width: 0.2),
          right: BorderSide(color: Theme.of(context).dividerColor, width: 0.2),
        ),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
        color: Theme.of(
          context,
        ).scaffoldBackgroundColor.withValues(alpha: 0.925),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          IconButton(
            icon: Icon(Icons.home_outlined),
            selectedIcon: Icon(
              Icons.home,
              color: Theme.of(context).colorScheme.primary,
            ),
            iconSize: iconSize,
            isSelected:
                Provider.of<CustomScaffoldViewModel>(
                  context,
                  listen: false,
                ).currentPageIndex ==
                0,
            onPressed: () { 
              pageController.animateToPage(
                0,
                duration: Duration(milliseconds: 300),
                curve: Curves.ease,
              );
            },
          ),
          IconButton(
            icon: Icon(Icons.add_box_outlined),
            selectedIcon: Icon(Icons.add_box),
            iconSize: iconSize,
            isSelected:
                Provider.of<CustomScaffoldViewModel>(
                  context,
                  listen: false,
                ).currentPageIndex ==
                1,
            onPressed: () {
              pageController.animateToPage(
                1,
                duration: Duration(milliseconds: 300),
                curve: Curves.ease,
              );
            },
          ),
          IconButton(
            icon: Icon(Icons.settings_outlined),
            selectedIcon: Icon(Icons.settings),
            iconSize: iconSize,
            isSelected:
                Provider.of<CustomScaffoldViewModel>(
                  context,
                  listen: false,
                ).currentPageIndex ==
                2,
            onPressed: () {
              pageController.animateToPage(
                2,
                duration: Duration(milliseconds: 300),
                curve: Curves.ease,
              );
            },
          ),
        ],
      ),
    );
  }
}
