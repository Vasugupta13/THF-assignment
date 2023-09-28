

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:the_internet_folks/src/model/event_detail_model.dart';

class EventDetailsController extends GetxController {
  final int eventId;
  bool isLoading = false;
  EventDetails? eventDetails; // Use the EventDetails model

  EventDetailsController({required this.eventId});

  @override
  void onInit() {
    super.onInit();
    fetchEventDetails();
  }

  Future<void> fetchEventDetails() async {
    isLoading = true;
    update();

    try {
      final response = await http.get(
        Uri.parse('https://sde-007.api.assignment.theinternetfolks.works/v1/event/$eventId'),
      );

      if (response.statusCode == 200) {
        final eventData = EventDetails.fromJson(jsonDecode(response.body));
        eventDetails = eventData;
      } else {
        throw Exception('Failed to load event details');
      }
    } catch (e) {
      print('Error: $e');
    } finally {
      isLoading = false;
      update();
    }
  }
}