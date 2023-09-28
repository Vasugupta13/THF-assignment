import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:the_internet_folks/src/consts/colors.dart';
import 'package:the_internet_folks/src/controller/event_search_controller.dart';
import 'package:the_internet_folks/src/utils/dateTimeHelper/dateTimeHelper.dart';
import 'package:the_internet_folks/src/utils/widgets/reusable_text_widget.dart';
import 'package:the_internet_folks/src/utils/widgets/sliver_app_deligate.dart';
import 'package:the_internet_folks/src/view/mobile/event_detail_mobile_view.dart';

class EventSearchLandscape extends StatelessWidget {
  final double height;
  final double width;
  final TextEditingController searchController;
   EventSearchLandscape({super.key, required this.height, required this.width, required this.searchController});
  final EventSearchController eventSearchController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              surfaceTintColor: Colors.white,
              backgroundColor: const Color(0xfffefefe),
              title: const ReusableText(text:'Search',fontSize: 28,color: AppColors.kPrimaryTextColor,),
              stretch: true,
              floating: true,
              pinned: false,
              snap: true,
              leading: IconButton(
                icon: const Icon(Icons.arrow_back,),
                color: AppColors.kPrimaryTextColor,
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),
            SliverPersistentHeader(
              delegate: SliverAppBarDelegate(
                expandedHeight: 60,
                textField: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
                  child: TextFormField(
                    onChanged: (value){
                      searchController.text = value;
                      eventSearchController.fetchSearchEvents();
                    },
                    cursorColor: AppColors.kPrimaryBlue.withOpacity(0.8),
                    controller: searchController,
                    style: GoogleFonts.inter(
                        fontWeight: FontWeight.w400,
                        fontSize: 20,
                        color: Colors.black
                    ),
                    decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        suffixIconConstraints: const BoxConstraints(
                            minHeight: 30,minWidth: 40
                        ),
                        prefixIcon: SizedBox(
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const Padding(
                                padding: EdgeInsets.symmetric(horizontal: 10),
                                child: ImageIcon(AssetImage('assets/icons/searchBlue.png'),color: AppColors.kPrimaryBlue,),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(right: 10),
                                child: Container(
                                  height: 20,
                                  width: 2,
                                  color: const Color(0xff7974E7),
                                ),
                              )
                            ],
                          ),
                        ),
                        isCollapsed: true,
                        contentPadding: const EdgeInsets.all(8),
                        hintText: 'Type Event Name',
                        hintStyle: GoogleFonts.inter(
                            fontWeight: FontWeight.w400,
                            fontSize: 20
                        ),
                        border: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: const BorderSide(
                                color: AppColors.kPrimaryBlue
                            )
                        )
                    ),
                    // Add your text field logic here
                  ),
                ),
              ),
              pinned: true,
            ),
            Obx(
                  () {
                if (eventSearchController.isLoadingValue) {
                  return SliverToBoxAdapter(
                    child: Column(
                      children: [
                        SizedBox(height: MediaQuery.sizeOf(context).height * 0.4,),
                        const CircularProgressIndicator(),
                      ],
                    )
                  );
                }else if(eventSearchController.eventDataList.isEmpty){
                  return SliverList(delegate: SliverChildBuilderDelegate(
                        (context, index){
                      return Column(
                        children: [
                          SizedBox(height: height * 0.2,),
                          const Center( child: ReusableText(text: 'No Events Found',fontWeight: FontWeight.w500, fontSize: 25,color: AppColors.kSecondaryTextColor,),),
                        ],
                      );
                    },childCount: 1,
                  ));
                } else {
                  return SliverList(
                    delegate: SliverChildBuilderDelegate(
                          (context, index) {
                        final event = eventSearchController.eventDataList[index];
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
                                height: height * 0.26,
                                width: width * 0.7,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(16),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0.1),
                                        blurRadius:6, // soften the shadow
                                        spreadRadius: 3, // extend the shadow
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
                                      width: width * 0.16,
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
                                      padding: const EdgeInsets.only(left: 5,right: 10,top: 20,bottom: 10),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          ReusableText(text: formattedDate,color:AppColors.kPrimaryBlue,fontSize: 18,fontWeight: FontWeight.w400,),
                                          SizedBox(
                                            height: height * 0.01,
                                          ),
                                          ReusableText(text: event.title!,color: AppColors.kPrimaryTextColor,fontSize: 21,fontWeight: FontWeight.w500,softWrap: true,),
                                          SizedBox(
                                            height: height * 0.014,
                                          ),
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
                      childCount: eventSearchController.eventDataList.length,
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
