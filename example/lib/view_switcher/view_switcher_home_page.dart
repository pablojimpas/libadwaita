import 'package:flutter/material.dart';
import 'package:libadwaita/libadwaita.dart';
import 'package:libadwaita_bitsdojo/libadwaita_bitsdojo.dart';

class ViewSwitcherHomePage extends StatefulWidget {
  const ViewSwitcherHomePage({Key? key}) : super(key: key);

  @override
  _ViewSwitcherHomePageState createState() => _ViewSwitcherHomePageState();
}

class _ViewSwitcherHomePageState extends State<ViewSwitcherHomePage> {
  ValueNotifier<int> index = ValueNotifier(0);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: index,
      builder: (context, int value, child) => AdwScaffold(
        headerbar: (viewSwitcher) => AdwHeaderBar(
          actions: AdwActions().bitsdojo,
          title: viewSwitcher,
        ),
        viewSwitcher: AdwViewSwitcher(
          tabs: const [
            ViewSwitcherData(
              title: 'World',
              icon: Icons.public,
            ),
            ViewSwitcherData(
              title: 'Alarm',
              icon: Icons.alarm,
            ),
            ViewSwitcherData(
              title: 'Stopwatch',
              icon: Icons.stop,
              badge: '9',
            ),
            ViewSwitcherData(
              title: 'Timer',
              icon: Icons.timer,
              badge: '1',
            ),
          ],
          onViewChanged: (idx) => index.value = idx,
          currentIndex: value,
        ),
        body: AdwViewStack(
          index: value,
          children: const [
            Center(
              child: Text('World'),
            ),
            Center(
              child: Text('Alarm'),
            ),
            Center(
              child: Text('Stopwatch'),
            ),
            Center(
              child: Text('Timer'),
            ),
          ],
        ),
      ),
    );
  }
}
