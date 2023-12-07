import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:instagram/UI/Home.dart';
class page1 extends StatefulWidget {
  const page1({Key? key}) : super(key: key);

  @override
  State<page1> createState() => _page1State();
}

class _page1State extends State<page1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: Icon(Icons.arrow_back,color: Colors.white,),
        title: Text('Posts',style: TextStyle(
          color: Colors.white,
        ),),

      ),
      backgroundColor: Colors.black,
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 20.r,
                  backgroundImage: NetworkImage(response.profilePicUrl.toString()),
                ),
                SizedBox(width: 10.w,),
                Column(
                  children: [
                    Text('shameer',
                      // response.username.toString(),
                      style: TextStyle(color: Colors.white,fontSize: 14.sp),),
                     Text( 'rootsys',
                       // response.edgeOwnerToTimelineMedia!.edges![index].node!.location.toString(),
                       style: TextStyle(color: Colors.white,fontSize: 12.sp),)
                  ],
                ),
SizedBox(width: 220.w,),
                Icon(Icons.more_vert,color: Colors.white,)
              ],
            ),

          ),
          Container(
            width: 375,
            height: 355,
            color: Colors.white,
          )
        ],
      ),
    );
  }
}
