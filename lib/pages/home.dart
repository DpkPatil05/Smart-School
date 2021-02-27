import 'package:cached_network_image/cached_network_image.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:smart_school/future/fetch_exam.dart';
import 'package:smart_school/future/fetch_fees.dart';
import 'package:smart_school/future/fetch_homework.dart';
import 'package:smart_school/future/fetch_notice.dart';
import 'package:smart_school/pages/settings.dart';
import 'package:smart_school/providers/home_provider.dart';
import 'package:smart_school/tabs/home.dart';
import 'package:smart_school/hive_operations.dart';


const _kPages = <String, IconData>{
  'Home': Icons.home,
  'Homework': Icons.book,
  'Fees': Icons.monetization_on,
  'Notice': Icons.mail,
  'Exam': Icons.text_snippet,
};

dynamic pageWidgets = <String, Widget>{
  'Home': HomeTab(),
  'Homework': FetchHomework(),
  'Fees': FetchFees(),
  'Notice': FetchNotice(),
  'Exam': FetchExam()
};

class Home extends StatefulWidget {
  final String userrole, studentid, firstlast, imgurl, classsection, standard,
  site, school;
  const Home({this.userrole, this.studentid, this.firstlast, this.imgurl,
    this.classsection,this.standard, this.site, this.school});
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TabStyle _tabStyle = TabStyle.flip;
  Future<bool> _onPressed(){
    return showDialog(
      context: context,
      builder: (BuildContext context){
        return AlertDialog(
          title: Text('Are You Sure'),
          content: Text('You are going to exit the application!'),
          actions: <Widget>[
            FlatButton(
              child: Text('NO'),
              onPressed: (){
                Navigator.of(context).pop(false);
              },
            ),
            FlatButton(
              child: Text('YES'),
              onPressed: (){
                SystemNavigator.pop();
              },
            )
          ],
        );
      }
    );
  }
  @override
  Widget build(BuildContext context) {
    HiveOperation().studentBox.put('site', widget.site);
    HiveOperation().studentBox.put('school', widget.school);
    HiveOperation().studentBox.put('sid', int.parse(widget.studentid));
    return DefaultTabController(
      length: 5,
      initialIndex: 0,
      child: Container(
        decoration: BoxDecoration(color: Colors.black87),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            backgroundColor: Colors.red,
            title: Center(child: Text('${widget.school}')),
            actions: [
              Builder(
                builder: (context) => IconButton(
                  icon: Icon(Icons.settings),
                  onPressed: () => Scaffold.of(context).openEndDrawer(),
                  tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
                ),
              ),
            ],
          ),
          endDrawer: Settings(),
          drawer: ChangeNotifierProvider(
            create: (context) => HomeProvider(),
            child: Consumer<HomeProvider>(
              builder: (context, hamData, child) {
                return Drawer(
                  child: ListView(
                    children: [
                      DrawerHeader(
                        decoration: BoxDecoration(color: Colors.grey),
                        child: SizedBox(
                          width: 300.0,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              ClipOval(
                                child: CachedNetworkImage(
                                  imageUrl:'${hamData.loadProfilePic(widget.imgurl)}',
                                  imageBuilder: (context, imageProvider) => Container(
                                    width: 120.0,
                                    height: 120.0,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      image: DecorationImage(
                                          image: imageProvider, fit: BoxFit.cover),
                                    ),
                                  ),
                                  placeholder: (context, url) =>
                                      CircularProgressIndicator(),
                                  errorWidget: (context, url, error) =>
                                      Image.asset('${hamData.defaultProfilePic}'),
                                ),
                              ),
                              Column(
                                children: [
                                  SizedBox(height: 40.0),
                                  SizedBox(
                                    width: 110.0,
                                    child: Center(
                                      child: Text(
                                        widget.firstlast,
                                        style: TextStyle(
                                          fontSize: 14.0,
                                          fontWeight: FontWeight.bold
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 13.0),
                                  SizedBox(
                                    width: 110.0,
                                    child: Center(
                                      child: Text(
                                        widget.standard,
                                        style: TextStyle(fontSize: 13.0),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      for(final hamItem in hamData.hamburgerItems)
                        ListTile(
                          title: Row(
                            children: [
                              Icon(IconData(int.parse(hamItem[1]), fontFamily: 'MaterialIcons')),
                              SizedBox(width: 25.0),
                              Expanded(child: Text('${hamItem[0]}')),
                            ],
                          ),
                          onTap: () => "Logout" == hamItem[0] ? hamData.logoutFunction(context)
                              : Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) =>
                                    Scaffold(
                                      appBar: AppBar(
                                        backgroundColor: Colors.red,
                                        title: Text('${hamItem[0]}'),
                                      ),
                                      body: hamData.openPage(int.parse(hamItem[2])),
                                    ),
                                ),
                              ),
                        ),
                    ],
                  ),
                );
              }
            ),
          ),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                  child: TabBarView(
                    children: [for(final widget in pageWidgets.values) widget],
                )
              ),
              WillPopScope(
                onWillPop: _onPressed,
                child: Container(),
              )
            ],
          ),
          bottomNavigationBar: ConvexAppBar(
            // Optional badge argument: keys are tab indices, values can be
            // String, IconData, Color or Widget.
            // /*badge=*/ const <int, dynamic>{3: '99+'},
            style: _tabStyle,
            backgroundColor: Colors.red,
            items: <TabItem>[
              for (final entry in _kPages.entries)
                TabItem(icon: entry.value, title: entry.key),
            ],
          ),
        ),
      ),
    );
  }
}


