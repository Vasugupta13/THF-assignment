import 'package:flutter/material.dart';
import 'package:the_internet_folks/src/utils/widgets/tablet_widgets/event_list_landscape_tablet.dart';
import 'package:the_internet_folks/src/utils/widgets/tablet_widgets/event_list_portrait_tablet.dart';


class EventsTabletUi extends StatelessWidget {
   const EventsTabletUi({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.sizeOf(context).height;
    double width = MediaQuery.sizeOf(context).width;
    return OrientationBuilder(
      builder: (context,orientation) {
        if(orientation == Orientation.portrait){
         return EventListPortraitTablet(height: height, width: width);
        }else{
          return EventListLandscapeTablet(height: height, width: width);
        }
      },
    );
  }
}
