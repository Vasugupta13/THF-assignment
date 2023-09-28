import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:the_internet_folks/src/consts/colors.dart';
import 'package:the_internet_folks/src/controller/event_controller.dart';
import 'package:the_internet_folks/src/utils/dateTimeHelper/dateTimeHelper.dart';
import 'package:the_internet_folks/src/utils/widgets/reusable_text_widget.dart';
import 'package:the_internet_folks/src/view/mobile/event_detail_mobile_view.dart';
import 'package:the_internet_folks/src/view/mobile/event_search_mobile_view.dart';

class EventListPortrait extends StatelessWidget {
  final double height;
  final double width;
  EventListPortrait({super.key, required this.height, required this.width});
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
              title: const ReusableText(text: 'Events',fontSize: 24,),
              stretch: true,
              floating: true,
              pinned: false,
              snap: true,
              actions: [
                IconButton(
                  icon: const ImageIcon(ExactAssetImage('assets/icons/search.png'),color: AppColors.kPrimaryTextColor,),
                  onPressed: () {
                    Get.to(EventSearchMobileUI());
                  },
                ),
                PopupMenuButton(
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
                        value: 'Option 1',
                        child: ReusableText(text: 'Option 1'),
                      ),
                      const PopupMenuItem(
                        value: 'Option 2',
                        child: ReusableText(text: 'Option 2'),
                      ),
                    ];
                  },
                ),
              ],
            ),
            Obx(
                  () {
                if (eventsController.eventDataList.isEmpty) {
                  return SliverToBoxAdapter(
                    child: Column(
                      children: [
                        SizedBox(height: MediaQuery.sizeOf(context).height * 0.4,),
                        const CircularProgressIndicator(),
                      ],
                    )
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
                                Get.to(EventDetailsMobileUI(eventId: event.id!));
                              },
                              child: Container(
                                height: height * 0.16,
                                width: width * 0.89,
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
                                    padding: const EdgeInsets.only(left: 10,right: 10,top: 10,bottom: 10),
                                    child: Container(
                                      width: width * 0.22,
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
                                      padding: const EdgeInsets.only(left: 5,right: 10,top: 10,bottom: 10),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          ReusableText(text: formattedDate,color:AppColors.kPrimaryBlue,fontSize: 13,fontWeight: FontWeight.w400,),
                                          SizedBox(
                                            height: height * 0.01,
                                          ),
                                          ReusableText(text: event.title!,color: AppColors.kPrimaryTextColor,fontSize: 15,fontWeight: FontWeight.w500,softWrap: true,),
                                          SizedBox(
                                            height: height * 0.014,
                                          ),
                                          Align(
                                            alignment: Alignment.bottomCenter,
                                            child: Row(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                const Icon(Icons.location_on_rounded,color: AppColors.kSecondaryTextColor,size:18,),
                                                Flexible(child: ReusableText(text: '${event.venueName!} • ${event.venueCity!}, ${event.venueCountry!}',color: const Color(0xff747688),fontSize: 13,fontWeight: FontWeight.w400,softWrap: true,maxLines: 2,overflow: TextOverflow.ellipsis,)),
                                              ],
                                            ),
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
