import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:the_internet_folks/src/consts/colors.dart';
import 'package:the_internet_folks/src/controller/event_controller.dart';
import 'package:the_internet_folks/src/utils/dateTimeHelper/dateTimeHelper.dart';
import 'package:the_internet_folks/src/utils/widgets/reusable_text_widget.dart';
import 'package:the_internet_folks/src/view/tablet/event_detail_tablet_view.dart';
import 'package:the_internet_folks/src/view/tablet/event_search_tablet_view.dart';

class EventListLandscapeTablet extends StatelessWidget {
  final double height;
  final double width;
   EventListLandscapeTablet({super.key, required this.height, required this.width});
  final EventsController eventsController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfffefefe),
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              surfaceTintColor: Colors.white,
              backgroundColor: const Color(0xfffefefe),
              title: const ReusableText(text: '      Events',fontSize: 40,),
              stretch: true,
              floating: true,
              pinned: false,
              snap: true,
              actions: [
                IconButton(
                  icon: Transform.scale(
                      scale: 1.2,
                      child: const ImageIcon(ExactAssetImage('assets/icons/search.png'),color: AppColors.kPrimaryTextColor,)),
                  onPressed: () {
                    Get.to(EventSearchTabletUI());
                  },
                ),
                Transform.scale(
                  scale: 1.4,
                  child: PopupMenuButton(
                    padding: const EdgeInsets.only(right: 50,left: 20),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)
                    ),
                    surfaceTintColor: Colors.white,
                    color: Colors.white,
                    shadowColor: Colors.white,
                    itemBuilder: (context) {
                      // Add menu items here
                      return [
                        const PopupMenuItem(
                          padding: EdgeInsets.all(12),
                          value: 'Option 1',
                          child: ReusableText(text: 'Option 1',fontSize: 25,),
                        ),
                        const PopupMenuItem(
                          padding: EdgeInsets.all(12),
                          value: 'Option 2',
                          child: ReusableText(text: 'Option 2',fontSize: 25,),
                        ),
                      ];
                    },
                  ),
                ),
              ],
            ),
            Obx(
                  () {
                if (eventsController.eventDataList.isEmpty) {
                  return const SliverToBoxAdapter(
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  );
                } else {
                  return SliverList(
                    delegate: SliverChildBuilderDelegate(
                          (context, index) {
                        final event = eventsController.eventDataList[index];
                        String originalDate = event.dateTime!;
                        String formattedDate = DateTimeHelper().formatDate(originalDate);
                        return Center(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: InkWell(
                              onTap: (){
                                Get.to(EventDetailsTabletUI(eventId: event.id!));
                              },
                              child: Container(
                                height: height * 0.18,
                                width: width * 0.7,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(16),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0.1),
                                        blurRadius:6,
                                        spreadRadius: 3,
                                        offset: const Offset(
                                          0.0,
                                          0.0,
                                        ),
                                      ),
                                    ]
                                ),child: Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 20,right: 30,top: 10,bottom: 10),
                                    child: Container(
                                      width: width * 0.15,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(12),
                                          image: DecorationImage(
                                              image: NetworkImage(event.bannerImage!),
                                              fit: BoxFit.cover
                                          )
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.only(left: 5,right: 10,top: 10,bottom: 0),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          ReusableText(text: formattedDate,color:AppColors.kPrimaryBlue,fontSize: 20,fontWeight: FontWeight.w400,),
                                          SizedBox(
                                            height: height * 0.01,
                                          ),
                                          ReusableText(text: event.title!,color: AppColors.kPrimaryTextColor,fontSize: 22,fontWeight: FontWeight.w500,softWrap: true,),
                                          SizedBox(
                                            height: height * 0.014,
                                          ),
                                          Row(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              const Icon(Icons.location_on_rounded,color: AppColors.kSecondaryTextColor,size:25,),
                                              Flexible(child: ReusableText(text: '${event.venueName!} • ${event.venueCity!}, ${event.venueCountry!}',color: AppColors.kSecondaryTextColor,fontSize: 20,fontWeight: FontWeight.w400,softWrap: true,maxLines: 2,overflow: TextOverflow.ellipsis,)),
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              ),
                            ),
                          ),
                        );
                      },
                      childCount: eventsController.eventDataList.length,
                    ),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
