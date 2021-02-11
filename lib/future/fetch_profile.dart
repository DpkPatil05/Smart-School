import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_school/modal/profile.dart';
import 'package:smart_school/modal/transport.dart';
import 'package:smart_school/providers/profile_provider.dart';
import 'package:smart_school/providers/transport_provider.dart';
import 'package:smart_school/tabs/hamItems/profile.dart';


class FetchProfile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<ProfileData>.value(
      value: null,
      child: FutureBuilder<ProfileData>(
        future: ProfileProvider().fetchUser(),  // a Future<ProfileData> or null
        builder: (BuildContext context, AsyncSnapshot<ProfileData> profileData) {
          switch (profileData.connectionState) {
            case ConnectionState.waiting: return Center(child: CircularProgressIndicator());
            default:
              return profileData.hasError? Text('Error: ${profileData.error}')
                  : FutureBuilder<TransportData>(
                    future: TransportProvider().fetchTransport(),  // a Future<ProfileData> or null
                    builder: (BuildContext context, AsyncSnapshot<TransportData> transportData) {
                    switch (transportData.connectionState) {
                      default:
                        return transportData.hasError ? Text('Error: ${transportData.error}')
                          : Profile(studentData: profileData.data, transportData: transportData.data);
                  }
                },
              );
          }
        },
      ),
    );
  }
}