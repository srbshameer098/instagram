import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:instagram/Bloc/insta_bloc.dart';
import 'package:instagram/Repository/ModelClass/insta_model.dart';

import 'CustomDialog.dart';
import 'page1.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

List<String> img = [
  'assets/picture1166.png',
  'assets/picture1167.png',
  'assets/picture1175.png',
  'assets/picture1177.png',
  'assets/picture1169.png',
  'assets/picture1171.png',
];

List<String> img1 = [
  'assets/Rphoto1.png',
  'assets/Rp3.png',
  'assets/google.png',
];
List<String> title = [
  'Friends',
  'Family',
  'Trip',
];

int index = 0;

late InstaModel response;

class _HomeState extends State<Home> {
  getShortForm(int number) {
    var shortForm = "";
    if (number != null) {
      if (number < 1000) {
        shortForm = number.toString();
      } else if (number >= 1000 && number < 1000000) {
        shortForm = (number / 1000).toStringAsFixed(1) + "K";
      } else if (number >= 1000000 && number < 1000000000) {
        shortForm = (number / 1000000).toStringAsFixed(1) + "M";
      } else if (number >= 1000000000 && number < 1000000000000) {
        shortForm = (number / 1000000000).toStringAsFixed(1) + "B";
      }
    }
    return shortForm;
  }
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(70.0), // here the desired height
          child: AppBar(
            backgroundColor: Colors.black,
            leadingWidth: 210,
            leading: const Padding(
              padding: EdgeInsets.only(left: 10.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Icon(
                  //   Icons.account_box,
                  //   color: Colors.white,
                  // ),
SizedBox(width: 12,),
                  Text(
                    'Instagram',
                    style: TextStyle(color: Colors.white, fontSize: 22),
                  ),
                  SizedBox(
                    width: 1,
                  ),
                  // Icon(
                  //   Icons.keyboard_arrow_down,
                  //   color: Colors.white,
                  // ),
                ],
              ),
            ),
            centerTitle: false,
            actions: [
              Padding(
                padding: EdgeInsets.only(right: 10.0),
                child: Row(
                  children: [
                    Icon(
                      Icons.add_circle_outline_outlined,
                      color: Colors.white,
                      size: 28,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    FloatingActionButton(
                      backgroundColor: Colors.transparent,
                      onPressed: () {
                        showDialog(
                            context: context,
                            builder: (BuildContext context) => CustomDialog());
                      },
                      child: Icon(
                        Icons.menu_outlined,
                        color: Colors.white,
                        size: 28,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        backgroundColor: Colors.black,
        body: BlocBuilder<InstaBloc, InstaState>(
          builder: (context, state) {
            if (state is InstablocLoading) {
              return Center(child: CircularProgressIndicator());
            }
            if (state is InstablocError) {
              return Center(
                child: Text("ERROR"),
              );
            }
            if (state is InstablocLoaded) {
              response = BlocProvider.of<InstaBloc>(context).instaModel;
              String folowers=getShortForm(  response.edgeFollowedBy!.count);
              String folowing=getShortForm(  response.edgeFollow!.count);
              String post=getShortForm(  response.highlightReelCount);

              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 15.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        CircleAvatar(
                          radius: 35,
                          backgroundColor: Colors.grey,backgroundImage: NetworkImage(response.profilePicUrl.toString()),

                        ),
                        SizedBox(
                          width: 30,
                        ),
                        Column(
                          children: [
                            Text(
                              response.edgeOwnerToTimelineMedia!.count.toString(),
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              'Post',
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.white),
                            )
                          ],
                        ),
                        SizedBox(
                          width: 25,
                        ),
                        Column(
                          children: [
                            Text(
                              folowers,
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              'Followers',
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.white),
                            )
                          ],
                        ),
                        SizedBox(
                          width: 25,
                        ),
                        Column(
                          children: [
                            Text(
                              folowing,
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              'Following',
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.white),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 15.0, right: 10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          response.fullName.toString(),
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: Colors.white),
                        ),
                        SizedBox(
                          height: 2,
                        ),
                        Container(

                          height: 25,
                          decoration: BoxDecoration(
                              color: Color(0xfd3b3940),
                              borderRadius: BorderRadius.circular(80)),
                          constraints: BoxConstraints(maxWidth: 130),
                          child: Center(
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  '@',
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.white),
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(
                                response.username.toString(),
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.white,overflow: TextOverflow.ellipsis,),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Text(
                          response.categoryName.toString(),
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              color: Colors.grey),
                        ),
                        Text(
                         response.biography.toString(),
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              color: Colors.white),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        // Container(
                        //   width: 340,
                        //   height: 55,
                        //   decoration: BoxDecoration(
                        //       color: Color(0xfd3b3940),
                        //       borderRadius: BorderRadius.circular(8)),
                        //   child: Padding(
                        //     padding: const EdgeInsets.all(8.0),
                        //     child: Column(
                        //       crossAxisAlignment: CrossAxisAlignment.start,
                        //       mainAxisAlignment: MainAxisAlignment.center,
                        //       children: [
                        //         Text(
                        //           'Professional dashboard',
                        //           style: TextStyle(
                        //               fontSize: 14,
                        //               fontWeight: FontWeight.w500,
                        //               color: Colors.white),
                        //         ),
                        //         SizedBox(
                        //           width: 5,
                        //         ),
                        //         Text(
                        //           '253 accounts reached in the last 30 days.',
                        //           style: TextStyle(
                        //               fontSize: 12,
                        //               fontWeight: FontWeight.w400,
                        //               color: Colors.grey),
                        //         ),
                        //       ],
                        //     ),
                        //   ),
                        // ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Container(
                              width: 101,
                              height: 35,
                              decoration: BoxDecoration(
                                  color: Color(0xfd3b3940),
                                  borderRadius: BorderRadius.circular(8)),
                              child: Center(
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      'Edit Profile',
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600,
                                          color: Colors.white),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 8,
                            ),
                            Container(
                              width: 101,
                              height: 35,
                              decoration: BoxDecoration(
                                  color: Color(0xfd3b3940),
                                  borderRadius: BorderRadius.circular(8)),
                              child: Center(
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      'Share Profile',
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600,
                                          color: Colors.white),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 8,
                            ),
                            Container(
                              width: 101,
                              height: 35,
                              decoration: BoxDecoration(
                                  color: Color(0xfd3b3940),
                                  borderRadius: BorderRadius.circular(8)),
                              child: Center(
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      'Contact',
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600,
                                          color: Colors.white),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Flexible(
                              child: SizedBox(
                                width: 260,
                                height: 104,
                                child: ListView.builder(
                                    scrollDirection: Axis.horizontal,
                                    itemCount: img1.length,
                                    itemBuilder: (context, index) {
                                      return Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Row(
                                            children: [
                                              Column(
                                                children: [
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            8.0),
                                                    child: CircleAvatar(
                                                      radius: 35,
                                                      backgroundColor:
                                                          Colors.white,
                                                      child: CircleAvatar(
                                                        radius: 34.4,
                                                        backgroundColor:
                                                            Colors.black,
                                                        child: Center(
                                                          child: Image.asset(
                                                              img1[index]),
                                                        ),
                                                      ),
                                                      // SizedBox(height: 5,),
                                                    ),
                                                  ),
                                                  Text(
                                                    title[index],
                                                    style: TextStyle(
                                                        fontSize: 12,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        color: Colors.white),
                                                  ),
                                                ],
                                              ),

                                              // Column(
                                              //   children: [
                                              //
                                              //     CircleAvatar(
                                              //       radius: 35,
                                              //       backgroundColor: Colors.white,
                                              //       child: CircleAvatar(
                                              //         radius: 34.4,
                                              //         backgroundColor: Colors.black,
                                              //         child: Center(child: Icon(
                                              //           Icons.add, color: Colors.white,
                                              //           size: 28,)),
                                              //
                                              //       ),
                                              //     ),
                                              //     SizedBox(height: 5,),
                                              //     Text(
                                              //       'New',
                                              //       style: TextStyle(
                                              //           fontSize: 12,
                                              //           fontWeight: FontWeight.w400,
                                              //           color: Colors.white),
                                              //     ),
                                              //   ],
                                              // )
                                            ],
                                          ),
                                        ],
                                      );
                                      // SizedBox(width: 10,),
                                      // Column(
                                      // children: [
                                      //
                                      // CircleAvatar(
                                      // radius: 35,
                                      // backgroundColor: Colors.white,
                                      // child: CircleAvatar(
                                      // radius: 34.4,
                                      // backgroundColor: Colors.black,
                                      // child: Center(child: Icon(
                                      // Icons.add, color: Colors.white,
                                      // size: 28,)),
                                      //
                                      // ),
                                      // ),
                                      // SizedBox(height: 5,),
                                      // Text(
                                      // 'New',
                                      // style: TextStyle(
                                      // fontSize: 12,
                                      // fontWeight: FontWeight.w400,
                                      // color: Colors.white),
                                      // ),
                                      // ],
                                      // );
                                    }),
                              ),
                            ),
                            Column(
                              children: [
                                CircleAvatar(
                                  radius: 35,
                                  backgroundColor: Colors.white,
                                  child: CircleAvatar(
                                    radius: 34.4,
                                    backgroundColor: Colors.black,
                                    child: Center(
                                        child: Icon(
                                      Icons.add,
                                      color: Colors.white,
                                      size: 28,
                                    )),
                                  ),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  'New',
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.white),
                                ),
                              ],
                            )
                          ],
                        ),
                      ],
                    ),
                  ),

                  // controller: tabController,

                  SizedBox(
                    height: 10,
                  ),
                  TabBar(
                    indicator: UnderlineTabIndicator(),
                    indicatorColor: Colors.white,
                    indicatorSize: TabBarIndicatorSize.tab,
                    unselectedLabelColor: Colors.grey,
                    labelColor: Colors.white,
                    tabs: [
                      Tab(
                          icon: Icon(
                        Icons.grid_on_outlined,
                      )),
                      Tab(
                          icon: Icon(
                        Icons.person_pin_outlined,
                        size: 28,
                      )),
                    ],
                  ),

                  Expanded(
                    child: TabBarView(
                      viewportFraction: 1.0,
                      children: [
                        Container(
                          child: GridView.count(
                            crossAxisCount: 3,
                            crossAxisSpacing: 2,
                            mainAxisSpacing: 2,
                             childAspectRatio: 200 / 200,
                            shrinkWrap: true,
                            children: List.generate(
                              response.edgeOwnerToTimelineMedia!.edges!. length,
                              (index) {
                                return Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(10.0),
                                    ),
                                  ),
                                  child: GestureDetector(
                                    onTap: () {
                                      Navigator.of(context)
                                          .push(MaterialPageRoute(builder: (_) => page1(
                                        img: response.edgeOwnerToTimelineMedia!.edges![index].node!.displayUrl.toString(),
                                      like: response.edgeOwnerToTimelineMedia!.edges![index].node!.edgeLikedBy!.count.toString(),
                                          description: response.edgeOwnerToTimelineMedia!.edges![index].node!.edgeMediaToCaption!.edges!.isEmpty?"":response.edgeOwnerToTimelineMedia!.edges![index].node!.edgeMediaToCaption!.edges![0].node!.text.toString(),

                                        comments: response.edgeOwnerToTimelineMedia!.edges![index].node!.edgeMediaToComment!.count,
                                        tag: response.edgeOwnerToTimelineMedia!.edges![index].node!.edgeMediaToTaggedUser!.edges!,




                                      )));
                                    },
                                    child: Image.network(
                                      response.edgeOwnerToTimelineMedia!.edges![index].node!.displayUrl.toString(),fit: BoxFit.fill,
                                      width: 40,
                                      height: 50,
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                        Container(
                          child: GridView.count(
                            crossAxisCount: 3,
                            crossAxisSpacing: 1,
                            mainAxisSpacing: 1,
                            childAspectRatio: 200 / 200,
                            shrinkWrap: true,
                            children: List.generate(
                              response.edgeOwnerToTimelineMedia!.edges!. length,
                              (index) {
                                return Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(10.0),
                                    ),
                                  ),
                                  child: Image.network(
                                    response.edgeOwnerToTimelineMedia!.edges![index].node!.displayUrl.toString(),fit: BoxFit.fill,
                                    width: 40,
                                    height: 50,
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              );
            } else {
              return SizedBox();
            }
          },
        ),
      ),
    );
  }
}
