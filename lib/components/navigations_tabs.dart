import 'package:facebook_interface/utils/colors.dart';
import 'package:flutter/material.dart';

class NavigationTabs extends StatefulWidget {
  const NavigationTabs({
    Key? key,
    required this.icons,
    required this.indexSelectedTab,
    required this.onTap,
    this.downIndicator = false,
  }) : super(key: key);

  final List<IconData> icons;
  final int indexSelectedTab;
  final Function(int) onTap;

  final bool downIndicator;

  @override
  State<NavigationTabs> createState() => _NavigationTabsState();
}

class _NavigationTabsState extends State<NavigationTabs> {
  @override
  Widget build(BuildContext context) {
    return TabBar(
      onTap: widget.onTap,
      indicator: BoxDecoration(
        border: widget.downIndicator
            ? const Border(
                bottom: BorderSide(
                  color: ColorsPalette.azulFacebook,
                  width: 3,
                ),
              )
            : const Border(
                top: BorderSide(
                  color: ColorsPalette.azulFacebook,
                  width: 3,
                ),
              ),
      ),
      tabs: widget.icons
          .asMap()
          .map((indice, icone) => MapEntry(
                indice,
                Tab(
                  icon: Icon(
                    icone,
                    size: 28,
                    color: widget.indexSelectedTab == indice
                        ? ColorsPalette.azulFacebook
                        : Colors.black54,
                  ),
                ),
              ))
          .values
          .toList(),
    );
  }
}
