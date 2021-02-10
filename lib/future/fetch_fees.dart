import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_school/modal/fees.dart';
import 'package:smart_school/providers/fees_provider.dart';
import 'package:smart_school/tabs/fees.dart';

class FetchFees extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<FeeData>>.value(
      value: null,
      child: FutureBuilder<List<FeeData>>(
        future: FeesProvider().fetchFees(),
        builder: (BuildContext context, AsyncSnapshot<List<FeeData>> feeData) {
          switch (feeData.connectionState) {
            case ConnectionState.waiting: return Center(child: CircularProgressIndicator());
            default:
              return feeData.hasError? Text('Error: ${feeData.error}')
                  : FeesTab(feedata: feeData.data);
          }
        },
      ),
    );
  }
}