import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_school/modal/timeline.dart';
import 'package:smart_school/providers/profile_provider.dart';
import 'package:smart_school/tabs/hamItems/timeline.dart';

class FetchTimeline extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<TimelineData>>.value(
      value: null,
      child: FutureBuilder<List<TimelineData>>(
        future: ProfileProvider().fetchTimeline(),
        builder: (BuildContext context, AsyncSnapshot<List<TimelineData>> timelineData) {
          switch (timelineData.connectionState) {
            case ConnectionState.waiting: return Center(child: CircularProgressIndicator());
            default:
              return timelineData.hasError? Text('Error: ${timelineData.error}')
                  : TimelineTab(timelineData: timelineData.data);
          }
        },
      ),
    );
  }
}