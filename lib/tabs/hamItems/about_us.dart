import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:provider/provider.dart';
import 'package:smart_school/hive_operations.dart';
import 'package:smart_school/providers/about_provider.dart';
import 'package:smart_school/providers/home_provider.dart';
import 'package:smart_school/providers/welcome_provider.dart';

class AboutUs extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var welcomeProvider = Provider.of<WelcomeProvider>(context);
    var aboutProvider = Provider.of<AboutProvider>(context);

    // ignore: missing_return
    Widget _buildLinkedin(int i) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(width: 13.0),
          ImageIcon(
              AssetImage(HomeProvider().linkedinlogo)
          ),
          TextButton(
              onPressed: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => WebviewScaffold(
                    url: aboutProvider.devURLList[i],
                    appBar: AppBar(
                      title: const Text('Developers LinkedIn'),
                      backgroundColor: Colors.red,
                    ),
                    withZoom: true,
                    withJavascript: true,
                    withOverviewMode: true,
                    supportMultipleWindows: true,
                    allowFileURLs: true,
                    withLocalStorage: true,
                  )),
                );
              },
              child: Text(
                  '${aboutProvider.devNameList[i]}',
                  style: TextStyle(color: Colors.black)
              )
          ),
        ],
      );
    }

    return Center(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 200.0,
              height: 200.0,
              child: ClipOval(
                child: CachedNetworkImage(
                  imageUrl:'${aboutProvider.schoolLogo}',
                  imageBuilder: (context, imageProvider) => Container(
                    width: 200.0,
                    height: 200.0,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          image: imageProvider, fit: BoxFit.cover),
                    ),
                  ),
                  placeholder: (context, url) => CircularProgressIndicator(),
                  errorWidget: (context, url, error) => Icon(
                    Icons.school_rounded, size: 200.0,),
                ),
              ),
            ),
            SizedBox(height: 10.0),
            SizedBox(
              width: 400.0,
              child: Center(
                child: Text(
                  '${HiveOperation().schoolName}',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0
                  ),
                ),
              ),
            ),
            Divider(thickness: 3.0, height: 70.0),
            Text(
              'About Us',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20.0
              ),
            ),
            Container(
              child: Image.asset(welcomeProvider.paperfreeLogo),
            ),
            SizedBox(height: 50.0),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Developed By',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20.0
                      ),
                    ),
                  ],
                ),
                for(int i=0; i<aboutProvider.devNameList.length; i++)
                  _buildLinkedin(i),
              ],
            )
          ],
        ),
      ),
    );
  }
}