import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:the_internet_folks/src/utils/widgets/tablet_widgets/event_details_landscape_tablet.dart';
import 'package:the_internet_folks/src/utils/widgets/tablet_widgets/event_details_portrait_tablet.dart';

class EventDetailsTabletUI extends StatelessWidget {
  final int eventId;

  const EventDetailsTabletUI({super.key, required this.eventId});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.sizeOf(context).width;
    return OrientationBuilder(
      builder: (context,orientation) {
        if(orientation == Orientation.portrait){
          return EventDetailsPortraitTablet(eventId: eventId, width: width);
        }else
          {
            return EventDetailsLandscapeTablet(eventId: eventId, width: width);
          }
      },

    );
  }
}