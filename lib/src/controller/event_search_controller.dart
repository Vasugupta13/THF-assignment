import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:the_internet_folks/src/model/event_search_model.dart';


class EventSearchController extends GetxController {
  final TextEditingController searchController;
  RxList<SearchData> eventDataList = <SearchData>[].obs;
  RxBool isLoading = false.obs;
  EventSearchController({required this.searchController});// Use the EventDetails model
  @override
  void onInit() {
    super.onInit();
    fetchSearchEvents();
  }

  Future<void> fetchSearchEvents() async {
    isLoading.value = true;
    update();
    try {
      final response = await http.get(
        Uri.parse('https://sde-007.api.assignment.theinternetfolks.works/v1/event?search=${searchController.text}'),
      );
      if (response.statusCode == 200) {
        final events = EventSearch.fromJson(jsonDecode(response.body));
        eventDataList.assignAll(events.content?.data ?? []);
      } else {
        throw Exception('Failed to load events');
      }
    } catch (e) {
      print('Error: $e');
    }finally {
      isLoading.value = false;
      update();
    }
  }
  bool get isLoadingValue => isLoading.value;
}