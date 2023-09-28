import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:the_internet_folks/src/consts/colors.dart';
import 'package:the_internet_folks/src/controller/event_detail_controller.dart';
import 'package:the_internet_folks/src/utils/dateTimeHelper/dateTimeHelper.dart';
import 'package:the_internet_folks/src/utils/widgets/reusable_text_widget.dart';

class EventDetailsLandscape extends StatelessWidget {
  final int eventId;
  final double width;
  const EventDetailsLandscape({super.key, required this.eventId, required this.width});

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
              final inputDate = eventDetails.content?.data?.dateTime!;
              final formattedDate =
              DateTimeHelper().formatDateTime(inputDate!);
              final dayName = DateTimeHelper().getDayName(inputDate);
              return Column(
                children: [
                  Expanded(
                    child: CustomScrollView(
                      slivers: <Widget>[
                        SliverAppBar(
                          leading: IconButton(
                            icon: const Icon(
                              Icons.arrow_back,
                            ),
                            color: Colors.white,
                            onPressed: () {
                              Navigator.pop(context);
                            },
                          ),
                          title: const ReusableText(
                            text: 'Event Details',
                            color: Colors.white,
                            fontSize: 28,//diff
                          ),
                          actions: [
                            Padding(
                              padding: const EdgeInsets.only(right: 20),//diff
                              child: Container(
                                padding: const EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                    color: Colors.white.withOpacity(0.3),
                                    borderRadius:
                                    BorderRadius.circular(12)),
                                clipBehavior: Clip.antiAlias,
                                child: BackdropFilter(
                                  filter: ImageFilter.blur(
                                      sigmaX: 3, sigmaY: 3),
                                  child: const Icon(
                                    Icons.bookmark,
                                    size: 30,//diff
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ],
                          expandedHeight:
                          150.0,//diff
                          floating: false,
                          pinned: true,
                          flexibleSpace: Stack(
                            children: [
                              Positioned.fill(
                                child: Image.network(
                                  eventDetails
                                      .content?.data?.bannerImage ??
                                      '',
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                      begin: Alignment.topCenter,
                                      end: Alignment.bottomCenter,
                                      colors: [
                                        Colors.black.withOpacity(0.6),
                                        Colors.black26.withOpacity(0.0)
                                      ],
                                    )),
                              ),
                            ],
                          ),
                        ),
                        SliverList(
                          delegate: SliverChildBuilderDelegate(
                                (BuildContext context, int index) {
                              return Padding(
                                padding: const EdgeInsets.only(
                                    top: 12,
                                    bottom: 5,
                                    left: 20,
                                    right: 20),//diff
                                child: Column(
                                  crossAxisAlignment:
                                  CrossAxisAlignment.start,
                                  children: [
                                    ReusableText(
                                      text: eventDetails
                                          .content?.data?.title ??
                                          '',
                                      fontSize: 35,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                      children: [
                                        Flexible(
                                          child: Padding(
                                            padding:
                                            const EdgeInsets.only(
                                                top: 20),
                                            child: Row(
                                              children: [
                                                Container(
                                                  height: 54,
                                                  width: 54,
                                                  child: eventDetails
                                                      .content
                                                      ?.data
                                                      ?.title ==
                                                      'DevOpsDays Berlin'
                                                      ? Image.asset(
                                                    'assets/icons/docker.png',
                                                    fit: BoxFit
                                                        .cover,
                                                  )
                                                      : Image.network(
                                                      eventDetails
                                                          .content
                                                          ?.data
                                                          ?.organiserIcon ??
                                                          ''),
                                                ),
                                                Flexible(
                                                  child: Padding(
                                                    padding:
                                                    const EdgeInsets
                                                        .only(
                                                        left: 10,
                                                        right: 10),
                                                    child: Column(
                                                      crossAxisAlignment:
                                                      CrossAxisAlignment
                                                          .start,
                                                      children: [
                                                        ReusableText(
                                                          text: eventDetails
                                                              .content
                                                              ?.data
                                                              ?.organiserName ??
                                                              '',
                                                          fontSize: 15,
                                                          fontWeight:
                                                          FontWeight
                                                              .w400,
                                                        ),
                                                        const SizedBox(
                                                          height: 5,
                                                        ),
                                                        const ReusableText(
                                                          text:
                                                          'Organizer',
                                                          fontSize: 12,
                                                          fontWeight:
                                                          FontWeight
                                                              .w400,
                                                          color: AppColors
                                                              .kSecondaryTextColor,
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                        Flexible(
                                          child: Padding(
                                            padding:
                                            const EdgeInsets.only(
                                                top: 20),
                                            child: Row(
                                              children: [
                                                Container(
                                                    height: 54,
                                                    width: 54,
                                                    decoration:
                                                    BoxDecoration(
                                                      color: AppColors
                                                          .kPrimaryBlue
                                                          .withOpacity(
                                                          0.1),
                                                      borderRadius:
                                                      BorderRadius
                                                          .circular(
                                                          12),
                                                    ),
                                                    child: const Center(
                                                        child: Icon(
                                                          Icons
                                                              .calendar_month_outlined,
                                                          color: AppColors
                                                              .kPrimaryBlue,
                                                          size: 30,
                                                        ))),
                                                Flexible(
                                                  child: Padding(
                                                    padding:
                                                    const EdgeInsets
                                                        .only(
                                                        left: 10),
                                                    child: Column(
                                                      crossAxisAlignment:
                                                      CrossAxisAlignment
                                                          .start,
                                                      children: [
                                                        ReusableText(
                                                          text:
                                                          formattedDate,
                                                          fontSize: 15,
                                                          fontWeight:
                                                          FontWeight
                                                              .w400,
                                                        ),
                                                        const SizedBox(
                                                          height: 5,
                                                        ),
                                                        ReusableText(
                                                          text:
                                                          '${dayName},4:00PM - 9:00PM',
                                                          fontSize: 12,
                                                          fontWeight:
                                                          FontWeight
                                                              .w400,
                                                          color: AppColors
                                                              .kSecondaryTextColor,
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                        Flexible(
                                          child: Padding(
                                            padding:
                                            const EdgeInsets.only(
                                                top: 20),
                                            child: Row(
                                              children: [
                                                Container(
                                                    height: 54,
                                                    width: 54,
                                                    decoration:
                                                    BoxDecoration(
                                                      color: AppColors
                                                          .kPrimaryBlue
                                                          .withOpacity(
                                                          0.1),
                                                      borderRadius:
                                                      BorderRadius
                                                          .circular(
                                                          12),
                                                    ),
                                                    child: const Center(
                                                        child: Icon(
                                                          CupertinoIcons
                                                              .location_solid,
                                                          color: AppColors
                                                              .kPrimaryBlue,
                                                          size: 30,
                                                        ))),
                                                Flexible(
                                                  child: Padding(
                                                    padding:
                                                    const EdgeInsets
                                                        .only(
                                                        left: 10),
                                                    child: Column(
                                                      crossAxisAlignment:
                                                      CrossAxisAlignment
                                                          .start,
                                                      children: [
                                                        ReusableText(
                                                          text: eventDetails
                                                              .content
                                                              ?.data
                                                              ?.venueName ??
                                                              '',
                                                          fontSize: 15,
                                                          fontWeight:
                                                          FontWeight
                                                              .w400,
                                                          softWrap: false,
                                                          overflow:
                                                          TextOverflow
                                                              .ellipsis,
                                                        ),
                                                        const SizedBox(
                                                          height: 5,
                                                        ),
                                                        ReusableText(
                                                          text:
                                                          '${eventDetails.content?.data?.venueCity}, ${eventDetails.content?.data?.venueCountry} ',
                                                          fontSize: 12,
                                                          fontWeight:
                                                          FontWeight
                                                              .w400,
                                                          color: AppColors
                                                              .kSecondaryTextColor,
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    const Padding(
                                      padding: EdgeInsets.only(
                                          top: 15, bottom: 15),
                                      child: ReusableText(
                                        text: 'About Event',
                                        fontSize: 18,
                                      ),
                                    ),
                                    Padding(
                                        padding: const EdgeInsets.only(
                                            bottom: 15),
                                        child: ReusableText(
                                          text: eventDetails.content?.data
                                              ?.description ??
                                              '',
                                          fontSize: 16,
                                          fontWeight: FontWeight.w400,
                                          softWrap: true,
                                        ))
                                  ],
                                ),
                              );
                            },
                            childCount:
                            1, // Adjust the number of list items as needed
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8),
                    child: Container(
                      width: width,
                      decoration: const BoxDecoration(boxShadow: [
                        BoxShadow(
                          color: Colors.white,
                          blurRadius: 25.0, // soften the shadow
                          spreadRadius: 25.0,
                          offset: Offset(
                            0.0,
                            0.5,
                          ),
                        )
                      ]),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: width * 0.34,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              color: AppColors.kPrimaryBlue,
                            ),
                            child: Center(
                              child: Row(
                                children: [
                                  SizedBox(
                                    width: width * 0.07,
                                  ),
                                  SizedBox(
                                      width: width * 0.23,
                                      child: Row(
                                        mainAxisAlignment:
                                        MainAxisAlignment
                                            .spaceBetween,
                                        children: [
                                          const Padding(
                                            padding: EdgeInsets.symmetric(
                                                vertical: 20),
                                            child: ReusableText(
                                              text: 'BOOK NOW',
                                              fontSize: 16,
                                              color: Colors.white,
                                            ),
                                          ),
                                          Container(
                                            decoration: const BoxDecoration(
                                                color: AppColors
                                                    .kSecondaryBlue,
                                                shape: BoxShape.circle),
                                            child: const Center(
                                                child: Padding(
                                                  padding: EdgeInsets.all(10),
                                                  child: Icon(
                                                    Icons.arrow_forward,
                                                    color: Colors.white,
                                                  ),
                                                )),
                                          )
                                        ],
                                      )),
                                ],
                              ),
                            ),
                          ),
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
