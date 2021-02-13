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
  final String userrole, studentid, firstlast, imgurl, classsection, standard;
  const Home({this.userrole, this.studentid, this.firstlast, this.imgurl, this.classsection,this.standard});
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
            title: Padding(
              padding: const EdgeInsets.only(left: 55.0),
              child: Text("Demo High School"),
            ),
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
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              width: 120,
                              height: 120,
                              child: CircleAvatar(
                                radius: 30,
                                backgroundImage: NetworkImage(hamData.loadProfilePic(widget.imgurl))==null?
                                                 AssetImage(hamData.defaultProfilePic):NetworkImage(hamData.loadProfilePic(widget.imgurl)),
                                // child: FadeInImage(
                                //   placeholder: AssetImage(hamData.defaultProfilePic),
                                //   image: NetworkImage(hamData.loadProfilePic(widget.imgurl).toString()),
                                // ),
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
                      for(final hamItem in hamData.hamburgerItems)
                        ListTile(
                          title: Row(
                            children: [
                              Icon(IconData(int.parse(hamItem[1]), fontFamily: 'MaterialIcons')),
                              SizedBox(width: 25.0),
                              Expanded(child: Text('${hamItem[0]}')),
                            ],
                          ),
                          onTap: () =>
                              Navigator.push(
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


