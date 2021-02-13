import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_school/modal/profile.dart';
import 'package:smart_school/modal/transport.dart';
import 'package:smart_school/modal/transport_details.dart';
import 'package:smart_school/providers/profile_provider.dart';
import 'package:smart_school/providers/transport_provider.dart';

class Profile extends StatefulWidget {
  final ProfileData studentData;
  final List<TransportData> transportData;
  const Profile({this.studentData, this.transportData});
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> with SingleTickerProviderStateMixin{
  TabController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    var profileProvider = Provider.of<ProfileProvider>(context, listen: false);
    return StreamProvider<TransportDetailsData>.value(
      value: null,
      child: FutureBuilder<TransportDetailsData>(
        future: TransportProvider().
          fetchTransportDetails(TransportProvider().getVehicleId(widget.transportData)),
          builder: (BuildContext context, AsyncSnapshot<TransportDetailsData> transportDetailData) {
          switch (transportDetailData.connectionState) {
            case ConnectionState.waiting: return Center(child: CircularProgressIndicator());
            default:
              return transportDetailData.hasError ? Text('Error: ${transportDetailData.error}')
              : Scaffold(
                body: ListView(
                  children: <Widget>[
                    Column(
                      children: [
                        DrawerHeader(
                          decoration: BoxDecoration(color: Colors.grey),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                             SizedBox(
                               width: 120.0,
                               height: 150.0,
                               child: CircleAvatar(
                                 radius: 30.0,
                                 backgroundColor: Colors.grey,
                                 backgroundImage: NetworkImage(profileProvider.getImageUrl(widget.studentData.imgurl.replaceAll('\\', '')))==null?
                                 AssetImage(profileProvider.defaultProfilePic):NetworkImage(profileProvider.getImageUrl(widget.studentData.imgurl.replaceAll('\\', ''))),
                                 // child: FadeInImage(
                                 //     placeholder: AssetImage(profileProvider.defaultProfilePic),
                                 //     image: NetworkImage(profileProvider.getImageUrl(
                                 //         widget.studentData.imgurl.replaceAll('\\', '')).toString()
                                 //     )
                                 // ),
                                 // ClipOval(
                                 //   // clipper: MyClipper(),
                                 //   child:
                                 // ),
                               )
                             ),
                              SizedBox(width: 20.0),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Expanded(
                                    child: Row(
                                      children: [
                                        Text(
                                          "Name:",
                                          style: TextStyle(
                                              fontSize: 14.0,
                                              fontWeight: FontWeight.bold
                                          ),
                                        ),
                                        SizedBox(width: 10.0),
                                        SizedBox(
                                          width: 150.0,
                                          child: Text(
                                            widget.studentData.firstlast,
                                            style: TextStyle(fontSize: 14.0),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Expanded(
                                    child: Row(
                                      children: [
                                        Text(
                                          "Class:",
                                          style: TextStyle(
                                              fontSize: 14.0,
                                              fontWeight: FontWeight.bold
                                          ),
                                        ),
                                        SizedBox(width: 10.0),
                                        Text(
                                          widget.studentData.classsection,
                                          style: TextStyle(fontSize: 13.0),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Expanded(
                                    child: Row(
                                      children: [
                                        Text(
                                          "Admission No:",
                                          style: TextStyle(
                                              fontSize: 14.0,
                                              fontWeight: FontWeight.bold
                                          ),
                                        ),
                                        SizedBox(width: 10.0),
                                        Text(
                                          widget.studentData.admissionno,
                                          style: TextStyle(fontSize: 13.0),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Expanded(
                                    child: Row(
                                      children: [
                                        Text(
                                          "Roll No:",
                                          style: TextStyle(
                                              fontSize: 14.0,
                                              fontWeight: FontWeight.bold
                                          ),
                                        ),
                                        SizedBox(width: 10.0),
                                        Text(
                                          widget.studentData.rollno,
                                          style: TextStyle(fontSize: 13.0),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(color: Colors.red),
                          child: TabBar(
                            controller: _controller,
                            tabs: [
                              Tab(
                                // icon: const Icon(Icons.account_circle_rounded),
                                text: 'Personal',
                              ),
                              Tab(
                                // icon: const Icon(Icons.my_location),
                                text: 'Parents',
                              ),
                              Tab(
                                // icon: const Icon(Icons.home),
                                text: 'Others',
                              ),
                            ],
                          ),
                        ),
                        Container(
                          height: 450.0,
                          child:TabBarView(
                            controller: _controller,
                            children: <Widget>[
                              ListView(
                                padding: const EdgeInsets.all(8),
                                children: <Widget>[
                                  Container(
                                    height: 50,
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'Admission Date',
                                          style: TextStyle(fontWeight: FontWeight.bold),
                                        ),
                                        SizedBox(
                                            width:150.0,
                                            child: Text('${widget.studentData.admissiondate}')
                                        ),
                                      ],
                                    ),
                                  ),
                                  Divider(color: Colors.black),
                                  Container(
                                    height: 50,
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'Date of Birth',
                                          style: TextStyle(fontWeight: FontWeight.bold),
                                        ),
                                        SizedBox(
                                            width:150.0,
                                            child: Text('${widget.studentData.dob}')
                                        ),
                                      ],
                                    ),
                                  ),
                                  Divider(color: Colors.black),
                                  Container(
                                    height: 50,
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'Category',
                                          style: TextStyle(fontWeight: FontWeight.bold),
                                        ),
                                        SizedBox(
                                            width:150.0,
                                            child: Text('${widget.studentData.category}')
                                        ),
                                      ],
                                    ),
                                  ),
                                  Divider(color: Colors.black),
                                  Container(
                                    height: 50,
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'Mobile Number',
                                          style: TextStyle(fontWeight: FontWeight.bold),
                                        ),
                                        SizedBox(
                                            width:150.0,
                                            child: Text('${widget.studentData.mobile}')
                                        ),
                                      ],
                                    ),
                                  ),
                                  Divider(color: Colors.black),
                                  Container(
                                    height: 50,
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'Caste',
                                          style: TextStyle(fontWeight: FontWeight.bold),
                                        ),
                                        SizedBox(
                                            width:150.0,
                                            child: Text('${widget.studentData.caste}')
                                        ),
                                      ],
                                    ),
                                  ),
                                  Divider(color: Colors.black),
                                  Container(
                                    height: 50,
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'Religion',
                                          style: TextStyle(fontWeight: FontWeight.bold),
                                        ),
                                        SizedBox(
                                            width:150.0,
                                            child: Text('${widget.studentData.religion}')
                                        ),
                                      ],
                                    ),
                                  ),
                                  Divider(color: Colors.black),
                                  Container(
                                    height: 50,
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'Email',
                                          style: TextStyle(fontWeight: FontWeight.bold),
                                        ),
                                        SizedBox(
                                            width:150.0,
                                            child: Text('${widget.studentData.email}')
                                        ),
                                      ],
                                    ),
                                  ),
                                  Divider(color: Colors.black),
                                  Container(
                                    height: 50,
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'Current Address',
                                          style: TextStyle(fontWeight: FontWeight.bold),
                                        ),
                                        SizedBox(
                                            width:150.0,
                                            child: Text('${widget.studentData.caddress}')
                                        ),
                                      ],
                                    ),
                                  ),
                                  Divider(color: Colors.black),
                                  Container(
                                    height: 50,
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'Permanent Address',
                                          style: TextStyle(fontWeight: FontWeight.bold),
                                        ),
                                        SizedBox(
                                            width:150.0,
                                            child: Text('${widget.studentData.paddress}')
                                        ),
                                      ],
                                    ),
                                  ),
                                  Divider(color: Colors.black),
                                  Container(
                                    height: 50,
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'Blood Group',
                                          style: TextStyle(fontWeight: FontWeight.bold),
                                        ),
                                        SizedBox(
                                            width:150.0,
                                            child: Text('${widget.studentData.bloodgroup}')
                                        ),
                                      ],
                                    ),
                                  ),
                                  Divider(color: Colors.black),
                                  Container(
                                    height: 50,
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'Height',
                                          style: TextStyle(fontWeight: FontWeight.bold),
                                        ),
                                        SizedBox(
                                            width:150.0,
                                            child: Text('${widget.studentData.height}')
                                        ),
                                      ],
                                    ),
                                  ),
                                  Divider(color: Colors.black),
                                  Container(
                                    height: 50,
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'Weight',
                                          style: TextStyle(fontWeight: FontWeight.bold),
                                        ),
                                        SizedBox(
                                            width:150.0,
                                            child: Text('${widget.studentData.weight}')
                                        ),
                                      ],
                                    ),
                                  ),
                                  Divider(color: Colors.black),
                                  Container(
                                    height: 50,
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'As on date',
                                          style: TextStyle(fontWeight: FontWeight.bold),
                                        ),
                                        SizedBox(
                                            width:150.0,
                                            child: Text('${widget.studentData.measurementdate}')
                                        ),
                                      ],
                                    ),
                                  ),
                                  Divider(color: Colors.black),
                                ],
                              ),

                              ListView(
                                padding: const EdgeInsets.all(8),
                                children: <Widget>[
                                  Container(
                                    height: 180.0,
                                    child: Row(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                       SizedBox(
                                         width: 150.0,
                                         height: 150.0,
                                         child: CircleAvatar(
                                           radius: 30.0,
                                           backgroundImage: NetworkImage(profileProvider.getImageUrl(widget.studentData.fatherpic))==null?
                                                            AssetImage(profileProvider.defaultProfilePic):NetworkImage(profileProvider.getImageUrl(widget.studentData.fatherpic)),
                                           // child: FadeInImage(
                                           //   placeholder: AssetImage(profileProvider.defaultProfilePic),
                                           //   image: NetworkImage(profileProvider.getImageUrl(widget.studentData.fatherpic).toString()),
                                           // ),
                                         ),
                                       ),
                                        SizedBox(width: 50.0),
                                        Column(
                                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            // SizedBox(height: 10.0),
                                            Text(
                                              'Father',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 20.0
                                              ),
                                            ),
                                            Row(
                                              children: [
                                                Icon(Icons.person),
                                                SizedBox(width: 10.0),
                                                SizedBox(
                                                  width: 150.0,
                                                  child: Text('${widget.studentData.fathername}')
                                                ),
                                              ],
                                            ),
                                            Row(
                                              children: [
                                                Icon(Icons.call),
                                                SizedBox(width: 10.0),
                                                Text('${widget.studentData.fatherphone}'),
                                              ],
                                            ),
                                            Row(
                                              children: [
                                                Icon(Icons.work_outline),
                                                SizedBox(width: 10.0),
                                                Text('${widget.studentData.fatheroccupation}'),
                                              ],
                                            )
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                  Divider(color: Colors.black),
                                  Container(
                                    height: 180.0,
                                    child: Row(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        SizedBox(
                                          width: 150.0,
                                          height: 150.0,
                                          child: CircleAvatar(
                                            radius: 30.0,
                                            backgroundImage:  NetworkImage(profileProvider.getImageUrl(widget.studentData.motherpic))==null?
                                                              AssetImage(profileProvider.defaultProfilePic):NetworkImage(profileProvider.getImageUrl(widget.studentData.motherpic)),
                                            // child: FadeInImage(
                                            //   placeholder: AssetImage(profileProvider.defaultProfilePic),
                                            //   image: NetworkImage(profileProvider.getImageUrl(widget.studentData.motherpic).toString()),
                                            // ),
                                          ),
                                        ),
                                        SizedBox(width: 50.0),
                                        Column(
                                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            // SizedBox(height: 10.0),
                                            Text(
                                              'Mother',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 20.0
                                              ),
                                            ),
                                            Row(
                                              children: [
                                                Icon(Icons.person),
                                                SizedBox(width: 10.0),
                                               SizedBox(
                                                 width: 150.0,
                                                 child: Text('${widget.studentData.mothername}'),
                                               )
                                              ],
                                            ),
                                            Row(
                                              children: [
                                                Icon(Icons.call),
                                                SizedBox(width: 10.0),
                                                Text('${widget.studentData.motherphone}'),
                                              ],
                                            ),
                                            Row(
                                              children: [
                                                Icon(Icons.work_outline),
                                                SizedBox(width: 10.0),
                                                Text('${widget.studentData.motheroccupation}'),
                                              ],
                                            )
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                  Divider(color: Colors.black),
                                  Container(
                                    height: 180.0,
                                    child: Row(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        SizedBox(
                                          width: 150.0,
                                          height: 150.0,
                                          child: CircleAvatar(
                                            radius: 30.0,
                                            backgroundImage: NetworkImage(profileProvider.getImageUrl(widget.studentData.guardianpic))==null?
                                                              AssetImage(profileProvider.defaultProfilePic):NetworkImage(profileProvider.getImageUrl(widget.studentData.guardianpic)),
                                            // child: FadeInImage(
                                            //   placeholder: AssetImage(profileProvider.defaultProfilePic),
                                            //   image: NetworkImage(profileProvider.getImageUrl(widget.studentData.guardianpic).toString()),
                                            // ),
                                          ),
                                        ),
                                        SizedBox(width: 50.0),
                                        Column(
                                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            // SizedBox(height: 10.0),
                                            Text(
                                              'Guardian',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 20.0
                                              ),
                                            ),
                                            Row(
                                              children: [
                                                Icon(Icons.person),
                                                SizedBox(width: 10.0),
                                                SizedBox(
                                                  width: 150.0,
                                                  child:  Text('${widget.studentData.guardianname}'),
                                                )
                                              ],
                                            ),
                                            Row(
                                              children: [
                                                Icon(Icons.call),
                                                SizedBox(width: 10.0),
                                                Text('${widget.studentData.guardianphone}'),
                                              ],
                                            ),
                                            Row(
                                              children: [
                                                Icon(Icons.work_outline),
                                                SizedBox(width: 10.0),
                                                Text('${widget.studentData.guardianoccupation}'),
                                              ],
                                            )
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                  Divider(color: Colors.black),
                                ],
                              ),

                              ListView(
                                padding: const EdgeInsets.all(8),
                                children: <Widget>[
                                  Container(
                                    height: 50,
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'Previous School',
                                          style: TextStyle(fontWeight: FontWeight.bold),
                                        ),
                                        SizedBox(
                                            width:150.0,
                                            child: Text('${widget.studentData.previousschool}')
                                        ),
                                      ],
                                    ),
                                  ),
                                  Divider(color: Colors.black),
                                  Container(
                                    height: 50,
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'National ID Number',
                                          style: TextStyle(fontWeight: FontWeight.bold),
                                        ),
                                        SizedBox(
                                            width:150.0,
                                            child: Text('${widget.studentData.nationalid}')
                                        ),
                                      ],
                                    ),
                                  ),
                                  Divider(color: Colors.black),
                                  Container(
                                    height: 50,
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'Local ID Number',
                                          style: TextStyle(fontWeight: FontWeight.bold),
                                        ),
                                        SizedBox(
                                            width:150.0,
                                            child: Text('${widget.studentData.localid}')
                                        ),
                                      ],
                                    ),
                                  ),
                                  Divider(color: Colors.black),
                                  Container(
                                    height: 50,
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'Bank Account Number',
                                          style: TextStyle(fontWeight: FontWeight.bold),
                                        ),
                                        SizedBox(
                                            width:150.0,
                                            child: Text('${widget.studentData.accountno}')
                                        ),
                                      ],
                                    ),
                                  ),
                                  Divider(color: Colors.black),
                                  Container(
                                    height: 50,
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'Bank Name',
                                          style: TextStyle(fontWeight: FontWeight.bold),
                                        ),
                                        SizedBox(
                                            width:150.0,
                                            child: Text('${widget.studentData.bankname}')
                                        ),
                                      ],
                                    ),
                                  ),
                                  Divider(color: Colors.black),
                                  Container(
                                    height: 50,
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'IFSC Code',
                                          style: TextStyle(fontWeight: FontWeight.bold),
                                        ),
                                        SizedBox(
                                            width:150.0,
                                            child: Text('${widget.studentData.ifsc}')
                                        ),
                                      ],
                                    ),
                                  ),
                                  Divider(color: Colors.black),
                                  Container(
                                    height: 50,
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'RTE',
                                          style: TextStyle(fontWeight: FontWeight.bold),
                                        ),
                                        SizedBox(
                                            width:150.0,
                                            child: Text('${widget.studentData.rte}')
                                        ),
                                      ],
                                    ),
                                  ),
                                  Divider(color: Colors.black),
                                  Container(
                                    height: 50,
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'Vehicle Route',
                                          style: TextStyle(fontWeight: FontWeight.bold),
                                        ),
                                        SizedBox(
                                            width:150.0,
                                            child: Text('${widget.studentData.routename}')
                                        ),
                                      ],
                                    ),
                                  ),
                                  Divider(color: Colors.black),
                                  Container(
                                    height: 50,
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'Vehicle Number',
                                          style: TextStyle(fontWeight: FontWeight.bold),
                                        ),
                                        SizedBox(
                                            width:150.0,
                                            child: Text('${transportDetailData.data.vehicleData.vehicleNo}')
                                        ),
                                      ],
                                    ),
                                  ),
                                  Divider(color: Colors.black),
                                  Container(
                                    height: 50,
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'Driver Name',
                                          style: TextStyle(fontWeight: FontWeight.bold),
                                        ),
                                        SizedBox(
                                            width:150.0,
                                            child: Text('${transportDetailData.data.vehicleData.driverName}')
                                        ),
                                      ],
                                    ),
                                  ),
                                  Divider(color: Colors.black),
                                  Container(
                                    height: 50,
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'Driver Contact',
                                          style: TextStyle(fontWeight: FontWeight.bold),
                                        ),
                                        SizedBox(
                                            width:150.0,
                                            child: Text('${transportDetailData.data.vehicleData.driverNo}')
                                        ),
                                      ],
                                    ),
                                  ),
                                  Divider(color: Colors.black),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              );
          }
        },
      ),
    );
  }
}
