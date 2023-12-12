import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:instagram/UI/Home.dart';
import 'package:instagram/UI/page2.dart';
import 'package:readmore/readmore.dart';

import '../Repository/ModelClass/insta_model.dart';

class page1 extends StatefulWidget {
  final String img;
  final String like;
  final String description;
  final int comments;
  final List<Edges3> tag;


  const page1({
    Key? key,
    required this.img,
    required this.like,
    required this.description,
    required this.comments,required this.tag


  }) : super(key: key);

  @override
  State<page1> createState() => _page1State();
}

class _page1State extends State<page1> {
  @override
  Widget build(BuildContext context) {
    print("hi"+widget.tag.length.toString());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: Icon(
          Icons.arrow_back,
          color: Colors.white,
        ),
        title: Text(
          'Posts',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Column(
          children: [
            // ---------------   Row 1    ---------------------------  //
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 20.r,
                    backgroundImage:
                        NetworkImage(response.profilePicUrl.toString()),
                  ),
                  SizedBox(
                    width: 10.w,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        // 'shameer',
                        response.username.toString(),
                        style: TextStyle(color: Colors.white, fontSize: 14.sp),
                      ),
                      Text(
                        'rootsys',
                        // response.edgeOwnerToTimelineMedia!.edges![index].node!.location!..toString(),
                        style: TextStyle(color: Colors.white, fontSize: 12.sp),
                      )
                    ],
                  ),
                  SizedBox(
                    width: 170.w,
                  ),
                  Icon(
                    Icons.more_vert,
                    color: Colors.white,
                  )
                ],
              ),
            ),

            // ---------------   Image Container 1    ---------------------------  //

            Stack(children: [
              Container(
                width: 375.w,
                height: 355.h,
                color: Colors.white,
                child: Image.network(
                  widget.img,
                  fit: BoxFit.fill,
                ),
              ),
              Positioned(
                left: 0.w,
                top: 310.h,
                child: TextButton(
                  onPressed: () {
                    // ---------------   Show model bottom sheet 1    ---------------------------  //

                    showModalBottomSheet<void>(
                      // context and builder are
                      // required properties in this widget
                      context: context, isScrollControlled: true,
                      builder: (BuildContext context) {
                        // we set up a container inside which
                        // we create center column and display text

                        // Returning SizedBox instead of a Container
                        return Container(
                          height: 350.h,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            color: Color(0xfd2c2c31),
                          ),
                          child: Center(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(top: 15.h),
                                  child: Center(
                                    child: Container(
                                        width: 48.w.w,
                                        height: 8.h,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(4.r),
                                            color: Color(0x3fd6d9d6))),
                                  ),
                                ),
                                SizedBox(
                                  height: 15.h,
                                ),
                                Center(
                                  child: Text("In this photo",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w600)),
                                ),
                                SizedBox(
                                  height: 15.h,
                                ),
                                SizedBox(
                                    width: 375.w,
                                    child: Divider(
                                      thickness: 0.5,
                                      color: Colors.grey.shade800,
                                    )),
                                Expanded(
                                  child: ListView.builder(
                                    itemCount: widget.tag.length,
                                    itemBuilder: (context, position) {
                                      print(position);
                                      return Padding(
                                        padding: EdgeInsets.only(
                                            left: 12.w, top: 8.h),
                                        child: GestureDetector(
                                          onTap: (){
                                            Navigator.of(context)
                                                .push(MaterialPageRoute(builder: (_) => page2(username:widget.tag[position].node!.user!.username.toString(),

                                            )));
                                          },
                                          child: Row(children: [
                                            CircleAvatar(
                                              radius: 30.r,
                                              // backgroundColor: Colors.red,
                                              backgroundImage: NetworkImage(widget.tag[position].node!.user!.profilePicUrl.toString()),
                                            ),
                                            SizedBox(
                                              width: 15.w,
                                            ),
                                            SizedBox(
                                              width: 100,
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                      widget.tag[position].node!.user!.username.toString(),
                                                      style: TextStyle(
                                                          color: Colors.white,
                                                          fontWeight:
                                                              FontWeight
                                                                  .w600),maxLines: 1,overflow: TextOverflow.ellipsis,),



                                                  Text(
                                                      widget.tag[position].node!.user!.fullName.toString(),
                                                      style: TextStyle(
                                                          color: Colors.grey,
                                                          fontWeight:
                                                              FontWeight.w400,
                                                          fontSize: 12)),
                                                ],
                                              ),
                                            ),
                                            SizedBox(
                                              width: 60.w,
                                            ),
                                            Container(
                                                width: 100.w,
                                                height: 25.h,
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                    BorderRadius.circular(4.r),
                                                    color: Color(0x3fd6d9d6)),
                                                child: Center(
                                                  child: Text("Following",
                                                      style: TextStyle(
                                                          color: Colors.white,
                                                          fontWeight:
                                                          FontWeight
                                                              .w600)),
                                                ),
                                            ),
                                          ]),
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  },
                  child: CircleAvatar(
                    radius: 13.r,
                    backgroundColor: Colors.black54,
                    child: Center(
                        child: Icon(
                      Icons.person,
                      color: Colors.white,
                      size: 18.sp,
                    )),
                  ),
                ),
              )
            ]),

            // ---------------   Row 2  -  Icons    ---------------------------  //

            Padding(
              padding: EdgeInsets.only(
                left: 15.w,
              ),
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 12.h),
                    child: Row(
                      children: [
                        Icon(
                          Icons.favorite_border,
                          color: Colors.white,
                          size: 26.sp,
                        ),

                        Transform.scale(
                          scaleX: -1,
                          child: TextButton(
                            clipBehavior: Clip.none,
                            child: Icon(
                              Icons.chat_bubble_outline,
                              color: Colors.white,
                              size: 26.sp,
                            ),
                            onPressed: () {
                              // ---------------   Show model bottom sheet 2    ---------------------------  //

                              showModalBottomSheet<void>(
                                context: context,
                                isScrollControlled: true,
                                builder: (BuildContext context) {
                                  // Returning SizedBox instead of a Container
                                  return Container(
                                    height: 750.h,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(25),
                                      color: Color(0xfd2c2c31),
                                    ),
                                    child: Center(
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: const <Widget>[
                                          Text('GeeksforGeeks'),
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              );
                            },
                          ),
                        ),
                        // SizedBox(width: 15.w,),

                        Transform.rotate(
                          angle: 5.885398,
                          // Angle in radians (45 degrees = pi/4)
                          child: RotatedBox(
                            quarterTurns: 0,
                            // Number of quarter turns (45 degrees = 1/8th turn)
                            child: Icon(
                              Icons.send_outlined,
                              color: Colors.white,
                              size: 26,
                            ),
                          ),
                        ),

                        SizedBox(
                          width: 205.w,
                        ),

                        Icon(
                          Icons.bookmark_outline_outlined,
                          color: Colors.white,
                          size: 26,
                        )
                      ],
                    ),
                  ),

                  SizedBox(
                    height: 8.h,
                  ),

                  // SizedBox(width: 360.w,
                  //     child: Divider(thickness:0.5 ,color: Colors.grey,))

                  // ---------------   Row 3  -  likes    ---------------------------  //

                  Row(
                    children: [
                      Text(
                        widget.like,
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.w600),
                      ),
                      SizedBox(
                        width: 5.w,
                      ),
                      Text(
                        "likes",
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.w600),
                      )
                    ],
                  ),

                  // ---------------   Row 4 - description & # tags   ---------------------------  //

                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        response.username.toString(),
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.w600),
                      ),
                      SizedBox(
                        width: 5.w,
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      width: 350.w,
                      child: ReadMoreText(
                        // "Flutter is Google’s mobile UI open source framework to build high-quality native (super fast) interfaces for iOS and Android apps with the unified codebase",
                        widget.description,
                        style: TextStyle(color: Colors.white),
                        trimLines: 1,
                        colorClickableText: Colors.white,
                        trimMode: TrimMode.Line,
                        trimCollapsedText: ' more',
                        trimExpandedText: '    .... less',

                        moreStyle: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    ),
                  ),

                  TextButton(
                    onPressed: () {
                      // ---------------   Show model bottom sheet 2    ---------------------------  //

                      showModalBottomSheet<void>(
                        // context and builder are
                        // required properties in this widget
                        context: context, isScrollControlled: true,
                        builder: (BuildContext context) {
                          // we set up a container inside which
                          // we create center column and display text

                          // Returning SizedBox instead of a Container
                          return Container(
                            height: 500.h,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25),
                              color: Color(0xfd2c2c31),
                            ),
                            child: Center(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(top: 15.h),
                                    child: Center(
                                      child: Container(
                                          width: 48.w.w,
                                          height: 8.h,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(4.r),
                                              color: Color(0x3fd6d9d6))),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 15.h,
                                  ),
                                  Center(
                                    child: Text("Comments",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w600)),
                                  ),
                                  SizedBox(
                                    height: 15.h,
                                  ),
                                  SizedBox(
                                      width: 375.w,
                                      child: Divider(
                                        thickness: 0.5,
                                        color: Colors.grey.shade800,
                                      )),
                                  Expanded(
                                    child: ListView.builder(
                                      itemCount: widget.comments,
                                      itemBuilder: (context, position) {
                                        return Padding(
                                          padding: EdgeInsets.only(
                                              left: 12.w, top: 8.h),
                                          child: Row(children: [
                                            CircleAvatar(
                                              radius: 20.r,
                                              backgroundColor: Colors.red,
                                            ),
                                            SizedBox(
                                              width: 10.w,
                                            ),
                                            SizedBox(
                                              width: 150,
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Row(
                                                    children: [
                                                      Text("User",
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.white,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600)),
                                                      SizedBox(
                                                        width: 10.w,
                                                      ),
                                                      Text("time",
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.grey,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400,
                                                              fontSize: 12.sp)),
                                                    ],
                                                  ),
                                                  Text("comment",
                                                      style: TextStyle(
                                                          color: Colors.white,
                                                          fontWeight:
                                                              FontWeight.w400)),
                                                  Text("Replay",
                                                      style: TextStyle(
                                                          color: Colors.grey,
                                                          fontWeight:
                                                              FontWeight.w400,
                                                          fontSize: 12)),
                                                ],
                                              ),
                                            ),
                                            SizedBox(
                                              width: 100.w,
                                            ),
                                            Icon(
                                              Icons.favorite_border,
                                              color: Colors.grey,
                                              size: 18,
                                            )
                                          ]),
                                        );
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      );
                    },
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("View all ",
                            style: TextStyle(
                                color: Colors.grey,
                                fontWeight: FontWeight.w400)),
                        Text(widget.comments.toString(),
                            style: TextStyle(
                                color: Colors.grey,
                                fontWeight: FontWeight.w400)),
                        Text(" comments",
                            style: TextStyle(
                                color: Colors.grey,
                                fontWeight: FontWeight.w400)),
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
