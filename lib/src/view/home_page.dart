import 'package:flutter/material.dart';
import 'package:the_internet_folks/src/view/mobile/event_list_mobile_view.dart';

import 'package:the_internet_folks/src/view/responsive_layout.dart';
import 'package:the_internet_folks/src/view/tablet/event_list_tablet_view.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ResponsiveLayout(mobile: EventsMobileUi(), tablet: EventsTabletUi()),
    );
  }
}
