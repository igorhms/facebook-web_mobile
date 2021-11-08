import 'package:facebook_interface/components/navigations_tabs.dart';
import 'package:facebook_interface/components/navigations_tabs_desktop.dart';
import 'package:facebook_interface/data/data.dart';
import 'package:facebook_interface/screens/home.dart';
import 'package:facebook_interface/utils/responsive.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';

class Major extends StatefulWidget {
  const Major({Key? key}) : super(key: key);

  @override
  _MajorState createState() => _MajorState();
}

class _MajorState extends State<Major> {
  final List<Widget> _screens = [
    const Home(),
    const Scaffold(backgroundColor: Colors.green),
    const Scaffold(backgroundColor: Colors.yellow),
    const Scaffold(backgroundColor: Colors.red),
    const Scaffold(backgroundColor: Colors.purple),
    const Scaffold(backgroundColor: Colors.blue),
  ];

  final List<IconData> _icons = [
    Icons.home,
    Icons.ondemand_video,
    Icons.storefront_outlined,
    Icons.flag_outlined,
    LineIcons.bell,
    Icons.menu,
  ];

  int _indexSelectedTab = 0;

  @override
  Widget build(BuildContext context) {
    final bool isDesktop = Responsive.isDesktop(context);
    Size tamanho = MediaQuery.of(context).size;

    return DefaultTabController(
      length: _icons.length,
      child: Scaffold(
        appBar: isDesktop
            ? PreferredSize(
                child: NavigationTabsDesktop(
                  indexSelectedTab: _indexSelectedTab,
                  onTap: (index) {
                    setState(() {
                      _indexSelectedTab = index;
                    });
                  },
                  icons: _icons,
                  user: loggedUser,
                ),
                preferredSize: Size(tamanho.width, 100),
              )
            : null,
        body: TabBarView(
          physics: const NeverScrollableScrollPhysics(),
          children: [
            ..._screens,
          ],
        ),
        bottomNavigationBar: isDesktop
            ? null
            : NavigationTabs(
                indexSelectedTab: _indexSelectedTab,
                onTap: (index) {
                  setState(() {
                    _indexSelectedTab = index;
                  });
                },
                icons: _icons,
              ),
      ),
    );
  }
}
