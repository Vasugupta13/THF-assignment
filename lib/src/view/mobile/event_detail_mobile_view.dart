import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:the_internet_folks/src/utils/widgets/mobile_widgets/event_details_landscape_widget.dart';
import 'package:the_internet_folks/src/utils/widgets/mobile_widgets/event_details_portrait_widget.dart';

class EventDetailsMobileUI extends StatelessWidget {
  final int eventId;

  const EventDetailsMobileUI({super.key, required this.eventId});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.sizeOf(context).width;
    return OrientationBuilder(
      builder: (context, orientation) {
        if (orientation == Orientation.portrait) {
          return EventDetailPortraitWidget(eventId: eventId, width: width);
        } else {
          return EventDetailsLandscape(eventId: eventId, width: width);
        }
      },
    );
  }
}
