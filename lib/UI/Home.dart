import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {


  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(70.0), // here the desired height
          child: AppBar(
            backgroundColor: Colors.black,
            leading: const Padding(
              padding: EdgeInsets.only(left: 10.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'shameer___s_r_b',
                    style: TextStyle(color: Colors.white, fontSize: 22),
                  ),
                  SizedBox(
                    width: 1,
                  ),
                  Icon(
                    Icons.keyboard_arrow_down,
                    color: Colors.white,
                  ),
                ],
              ),
            ),
            centerTitle: false,
            actions: const [
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
                    Icon(
                      Icons.menu_outlined,
                      color: Colors.white,
                      size: 28,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        backgroundColor: Colors.black,
        body:  Padding(
          padding: EdgeInsets.only(left: 25.0),
           child:

          Column(crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 35,
                    backgroundColor: Colors.grey,
                  ),
                  SizedBox(
                    width: 30,
                  ),
                  Column(
                    children: [
                      Text(
                        '6',
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
                        '824',
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
                        '871',
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
              SizedBox(height: 5,),
              Padding(
                padding: EdgeInsets.only(left: 10.0,right: 10.0),
                child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'ShameeR Babu',
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Colors.white),
                    ),
                    SizedBox(height: 2,),

                    Container(
                      width: 140,
                      height: 25,

                      decoration: BoxDecoration(
                          color: Color(0xfd3b3940),
                            borderRadius: BorderRadius.circular(80)),
                     child: Center(
                       child: Row(crossAxisAlignment: CrossAxisAlignment.center,mainAxisAlignment: MainAxisAlignment.center,
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
                                'shameer___s_r_b',
                                style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.white),
                              ),
                         ],
                       ),
                     ),
                      ),

                    Text(
                      'Personal blog',
                      style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: Colors.grey),
                    ),

                    Text(
                      'Flutter developer 💻',
                      style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: Colors.white),
                    ),
                    SizedBox(height: 10,),

                    Container(
                      width: 340,
                      height: 55,


                      decoration: BoxDecoration(
                          color: Color(0xfd3b3940),
                          borderRadius: BorderRadius.circular(8)),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(crossAxisAlignment: CrossAxisAlignment.start,mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Professional dashboard',
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              '253 accounts reached in the last 30 days.',
                              style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.grey),
                            ),
                          ],
                        ),
                      ),
                    ),

                    SizedBox(height: 10,),


                    Row(
                      children: [
                        Container(
                          width: 100,
                          height: 35,

                          decoration: BoxDecoration(
                              color: Color(0xfd3b3940),
                              borderRadius: BorderRadius.circular(8)),
                          child: Center(
                            child: Row(crossAxisAlignment: CrossAxisAlignment.center,mainAxisAlignment: MainAxisAlignment.center,
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
              SizedBox(width: 7,),
                                Container(
                                  width: 100,
                                  height: 35,

                                  decoration: BoxDecoration(
                                      color: Color(0xfd3b3940),
                                      borderRadius: BorderRadius.circular(8)),
                                  child: Center(
                                    child: Row(crossAxisAlignment: CrossAxisAlignment.center,mainAxisAlignment: MainAxisAlignment.center,
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
                        SizedBox(width: 7,),

                              Container(
                                width: 100,
                                height: 35,

                                decoration: BoxDecoration(
                                    color: Color(0xfd3b3940),
                                    borderRadius: BorderRadius.circular(8)),
                                child: Center(
                                  child: Row(crossAxisAlignment: CrossAxisAlignment.center,mainAxisAlignment: MainAxisAlignment.center,
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
                    SizedBox(height: 15,),
                    Row(
                      children: [
                        Column(
                          children: [
                            CircleAvatar(
                              radius: 35,
                              backgroundColor: Colors.white,
                              child: CircleAvatar(
                                radius: 34.4,
                                backgroundColor: Colors.black,
                                child: Center(child: Icon(Icons.add,color: Colors.white,size: 28,)),

                              ),
                            ),
                            SizedBox(height: 5,),
                            Text(
                              'New',
                              style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.white),
                            ),
                          ],
                        ),
                      ],
                    ),


                    TabBar(
                      isScrollable: true,
                      unselectedLabelColor: Colors.grey,

                      labelColor: Colors.white,
                      tabs: [

                        Tab(icon: Icon(Icons.directions_transit,)),
                        Tab(icon: Icon(Icons.directions_car,)),
                      ],

                    ),


                  ],
                ),
              ),
              // controller: tabController,
              Expanded(
                child: TabBarView(viewportFraction: 1.0,
                  children: [
                
                    Icon(Icons.directions_transit, size: 350),
                    Icon(Icons.directions_car, size: 350),
                  ],
                ),
              ),




            ],
          ),
        ),
      ),
    );
  }
}
