import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:the_internet_folks/src/controller/event_search_controller.dart';
import 'package:the_internet_folks/src/utils/widgets/mobile_widgets/event_search_landscape_widget.dart';
import 'package:the_internet_folks/src/utils/widgets/mobile_widgets/event_search_portrait_widget.dart';


class EventSearchMobileUI extends StatelessWidget {
  final EventSearchController eventSearchController = Get.find();
  EventSearchMobileUI({super.key});


  @override
  Widget build(BuildContext context) {
    TextEditingController searchController = eventSearchController.searchController;
    double height = MediaQuery.sizeOf(context).height;
    double width = MediaQuery.sizeOf(context).width;
    return OrientationBuilder(
      builder: (context,orientation) {
        if(orientation == Orientation.portrait){
          return EventSearchPortrait(searchController: searchController, height: height, width: width);
        }else
          {
            return EventSearchLandscape(height: height, width: width, searchController: searchController);
          }
      },
    );
  }
}
