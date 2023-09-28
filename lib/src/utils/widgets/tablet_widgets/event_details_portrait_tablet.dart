import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:the_internet_folks/src/consts/colors.dart';
import 'package:the_internet_folks/src/controller/event_detail_controller.dart';
import 'package:the_internet_folks/src/utils/dateTimeHelper/dateTimeHelper.dart';
import 'package:the_internet_folks/src/utils/widgets/reusable_text_widget.dart';

class EventDetailsPortraitTablet extends StatelessWidget {
  final int eventId;
  final double width;
  const EventDetailsPortraitTablet({super.key, required this.eventId, required this.width});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: GetBuilder<EventDetailsController>(
          init: EventDetailsController(eventId: eventId),
          builder: (eventDetailsController) {
            if (eventDetailsController.isLoading) {
             return Column(
                children: [
                  SizedBox(height: MediaQuery.sizeOf(context).height * 0.4,),
                  const CircularProgressIndicator(),
                ],
              );
            } else if (eventDetailsController.eventDetails != null) {
              final eventDetails = eventDetailsController.eventDetails!;
              final inputDate =eventDetails.content?.data?.dateTime! ;
              final formattedDate = DateTimeHelper().formatDateTime(inputDate!);
              final dayName  = DateTimeHelper().getDayName(inputDate);
              return Column(
                children: [
                  Expanded(
                    child: CustomScrollView(
                      slivers: <Widget>[
                        SliverAppBar(
                          leading: IconButton(
                            icon: const Icon(Icons.arrow_back,size: 35,),
                            color: Colors.white,
                            onPressed: () {
                              Navigator.pop(context);
                            },
                          ),
                          title: const ReusableText(text: 'Event Details',color: Colors.white,fontSize: 35,),
                          actions: [
                            Padding(
                              padding: const EdgeInsets.only(right: 20),
                              child: Container(
                                padding: const EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                    color: Colors.white.withOpacity(0.3),
                                    borderRadius: BorderRadius.circular(12)
                                ),
                                clipBehavior: Clip.antiAlias,
                                child: BackdropFilter(
                                  filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
                                  child:
                                  const Icon(Icons.bookmark, size: 35,color: Colors.white,),),
                              ),
                            ),
                          ],
                          expandedHeight: 500.0,
                          floating: false,
                          pinned: true,
                          flexibleSpace: Stack(
                            children: [
                              Positioned.fill(
                                child: Image.network(
                                  eventDetails.content?.data?.bannerImage ?? '',
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                    gradient:  LinearGradient(
                                      begin: Alignment.topCenter,
                                      end: Alignment.bottomCenter,
                                      colors: [
                                        Colors.black.withOpacity(0.6),
                                        Colors.black26.withOpacity(0.0)
                                      ],
                                    )
                                ),
                              ),
                            ],
                          ),
                        ),
                        SliverList(
                          delegate: SliverChildBuilderDelegate(
                                (BuildContext context, int index) {
                              return Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 40,vertical: 15),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    ReusableText(text: eventDetails.content?.data?.title ?? '',fontSize: 45,),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 20),
                                      child: Row(
                                        children: [
                                          Container(
                                            height:54,
                                            width: 54,
                                            child:eventDetails.content?.data?.title == 'DevOpsDays Berlin'?Image.asset('assets/icons/docker.png', fit: BoxFit.cover,): Image.network(eventDetails.content?.data?.organiserIcon ?? ''),),
                                          Padding(
                                            padding: const EdgeInsets.only(left: 15,),
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                ReusableText(text: eventDetails.content?.data?.organiserName ?? '',fontSize: 20,fontWeight: FontWeight.w400,),
                                                const SizedBox(
                                                  height:10,
                                                ),
                                                const ReusableText(text: 'Organizer',fontSize: 17,fontWeight: FontWeight.w400,color: AppColors.kSecondaryTextColor,),
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 30),
                                      child: Row(
                                        children: [
                                          Container(
                                              height:64,
                                              width: 64,
                                              decoration: BoxDecoration(
                                                color: AppColors.kPrimaryBlue.withOpacity(0.1),
                                                borderRadius: BorderRadius.circular(12),
                                              ),
                                              child: const Center(child: Icon(Icons.calendar_month_outlined,color: AppColors.kPrimaryBlue,size: 30,))),
                                          Padding(
                                            padding: const EdgeInsets.only(left: 15),
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                ReusableText(text: formattedDate,fontSize: 20,fontWeight: FontWeight.w400,),
                                                const SizedBox(
                                                  height: 10,
                                                ),
                                                ReusableText(text: '${dayName},4:00PM - 9:00PM',fontSize: 17,fontWeight: FontWeight.w400,color: AppColors.kSecondaryTextColor,),
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 30),
                                      child: Row(
                                        children: [
                                          Container(
                                              height:64,
                                              width: 64,
                                              decoration: BoxDecoration(
                                                color: AppColors.kPrimaryBlue.withOpacity(0.1),
                                                borderRadius: BorderRadius.circular(12),
                                              ),
                                              child: const Center(child: Icon(CupertinoIcons.location_solid,color: AppColors.kPrimaryBlue,size: 30,))),
                                          Padding(
                                            padding: const EdgeInsets.only(left: 15),
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                ReusableText(text: eventDetails.content?.data?.venueName ?? '',fontSize: 20,fontWeight: FontWeight.w400,),
                                                const SizedBox(
                                                  height: 10,
                                                ),
                                                ReusableText(text: '${eventDetails.content?.data?.venueCity}, ${eventDetails.content?.data?.venueCountry} ',fontSize: 17,fontWeight: FontWeight.w400,color: AppColors.kSecondaryTextColor,),
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                    const Padding(
                                      padding: EdgeInsets.only(top: 25,bottom: 15),
                                      child: ReusableText(text: 'About Event',fontSize: 23,),
                                    ),
                                    ReusableText(text: eventDetails.content?.data?.description ?? '',fontSize: 21,fontWeight: FontWeight.w400,softWrap: true,)
                                  ],
                                ),
                              );
                            },
                            childCount: 1,
                          ),
                        ),

                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8),
                    child: Container(
                      width: width,
                      decoration: const BoxDecoration(

                          boxShadow:[
                            BoxShadow(
                              color: Colors.white,
                              blurRadius: 25.0,
                              spreadRadius: 25.0,
                              offset: Offset(
                                0.0,
                                0.5,
                              ),
                            )]
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: width * 0.3,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              color: AppColors.kPrimaryBlue,
                            ),
                            child:Center(
                              child: Row(
                                children: [
                                  SizedBox(
                                    width: width * 0.08,
                                  ),
                                  SizedBox(
                                      width: width * 0.2,
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          const Padding(
                                            padding: EdgeInsets.symmetric(vertical: 20),
                                            child: ReusableText(text: 'BOOK NOW',fontSize: 19,color: Colors.white,),
                                          ),
                                          Container(
                                            decoration: const BoxDecoration(
                                                color: AppColors.kSecondaryBlue,
                                                shape: BoxShape.circle
                                            ),child: const Center(child: Padding(
                                            padding: EdgeInsets.all(10),
                                            child: Icon(Icons.arrow_forward,color: Colors.white,),
                                          )),
                                          )
                                        ],
                                      )),

                                ],
                              ),
                            ),),
                        ],
                      ),
                    ),
                  )
                ],
              );
            } else {
              return const Text('Event details not available');
            }
          },
        ),
      ),
    );
  }
}
