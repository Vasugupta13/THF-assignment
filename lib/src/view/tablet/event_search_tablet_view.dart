import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:the_internet_folks/src/controller/event_search_controller.dart';
import 'package:the_internet_folks/src/utils/widgets/tablet_widgets/event_search_landscape_tablet.dart';
import 'package:the_internet_folks/src/utils/widgets/tablet_widgets/event_search_portrait_tablet.dart';


class EventSearchTabletUI extends StatelessWidget {

  EventSearchTabletUI({super.key});

  final EventSearchController eventSearchController = Get.find();

  @override
  Widget build(BuildContext context) {
    TextEditingController searchController = eventSearchController.searchController;
    double height = MediaQuery.sizeOf(context).height;
    double width = MediaQuery.sizeOf(context).width;
    return OrientationBuilder(
      builder: (context,orientation) {
        if(orientation == Orientation.portrait){
          return EventSearchPortraitTablet(height: height, width: width, searchController: searchController);
        }else{
          return EventSearchLandscapeTablet(height: height, width: width, searchController: searchController);
        }
      },
    );
  }
}
