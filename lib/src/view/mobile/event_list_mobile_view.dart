import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:the_internet_folks/src/consts/colors.dart';
import 'package:the_internet_folks/src/controller/event_controller.dart';
import 'package:the_internet_folks/src/utils/dateTimeHelper/dateTimeHelper.dart';
import 'package:the_internet_folks/src/utils/widgets/mobile_widgets/event_list_landscape_widget.dart';
import 'package:the_internet_folks/src/utils/widgets/mobile_widgets/event_list_portrait_widget.dart';
import 'package:the_internet_folks/src/utils/widgets/reusable_text_widget.dart';
import 'package:the_internet_folks/src/view/mobile/event_detail_mobile_view.dart';
import 'package:the_internet_folks/src/view/mobile/event_search_mobile_view.dart';

class EventsMobileUi extends StatelessWidget {
  const EventsMobileUi({super.key});

  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(
      builder: (context, orientation) {
        double height = MediaQuery.of(context).size.height;
        double width = MediaQuery.of(context).size.width;
        if (orientation == Orientation.portrait){
          return EventListPortrait(height: height, width: width);
        }else{
          return  EventListLandscape(height: height, width: width);
        }
      },
    );
  }
}
