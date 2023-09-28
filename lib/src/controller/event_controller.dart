// events_controller.dart

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:the_internet_folks/src/model/event_model.dart';


class EventsController extends GetxController {
  RxList<Data> eventDataList = <Data>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchEvents();
  }

  Future<void> fetchEvents() async {
    try {
      final response = await http.get(
        Uri.parse('https://sde-007.api.assignment.theinternetfolks.works/v1/event'),
      );

      if (response.statusCode == 200) {
        final events = Events.fromJson(jsonDecode(response.body));
        eventDataList.assignAll(events.content?.data ?? []);
      } else {
        throw Exception('Failed to load events');
      }
    } catch (e) {
      print('Error: $e');
    }
  }
}