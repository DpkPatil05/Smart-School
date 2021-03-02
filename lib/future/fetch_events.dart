import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_school/modal/calender_events.dart';
import 'package:smart_school/providers/home_provider.dart';
import 'package:smart_school/utils/events_calender.dart';

class FetchEvents extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<EventData>>.value(
      value: null,
      child: FutureBuilder<List<EventData>>(
        future: HomeProvider().fetchEvents(),
        builder: (BuildContext context, AsyncSnapshot<List<EventData>> eventsData) {
          switch (eventsData.connectionState) {
            case ConnectionState.waiting: return Center(child: CircularProgressIndicator());
            default:
              return eventsData.hasError? Text('Error: ${eventsData.error}')
                  : EventsCalender(eventsdata: eventsData.data);
          }
        },
      ),
    );
  }
}