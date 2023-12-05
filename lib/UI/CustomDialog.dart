import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:instagram/Bloc/insta_bloc.dart';
TextEditingController name=TextEditingController();
class CustomDialog extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.0)),
      elevation: 0.0,
      backgroundColor: Colors.transparent,
      child: dialogContent(context),
    );
  }

  Widget dialogContent(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 0.0,right: 0.0),
      child: Stack(
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(
              top: 18.0,
            ),
            margin: EdgeInsets.only(top: 13.0,right: 8.0),
            decoration: BoxDecoration(
                color: Colors.black,
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(16.0),
                boxShadow: <BoxShadow>[
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 0.0,
                    offset: Offset(0.0, 0.0),
                  ),
                ]),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                SizedBox(
                  height: 20.0,
                ),
                Center(
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child:  TextField(controller: name,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                              borderSide: BorderSide.none,

                              borderRadius: BorderRadius.circular(20)
                          ),
                          hintText: 'User_name',
                          hintStyle: TextStyle(
                            fontSize: 20
                          ),
                        ),
                      ),
                    )//
                ),

                SizedBox(height: 24.0),
                // Divider(thickness: 0.5,),
                InkWell(
                  child: Container(
                    padding: EdgeInsets.only(top: 15.0,bottom:15.0),
                    decoration: BoxDecoration(
                      color:Colors.white,
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(16.0),
                          bottomRight: Radius.circular(16.0)),
                    ),
                    child:  Text(
                      "Search",
                      style: TextStyle(color: Colors.blue,fontSize: 25.0),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  onTap:(){
                    BlocProvider.of<InstaBloc>(context).add(FetchInsta(message:name.text));
                    Navigator.of(context).pop();
                  },
                )
              ],
            ),
          ),
          Positioned(
            right: 0.0,
            child: GestureDetector(
              onTap: (){
                Navigator.of(context).pop();
              },
              child: Align(
                alignment: Alignment.topRight,
                child: CircleAvatar(
                  radius: 14.0,
                  backgroundColor: Colors.white,
                  child: Icon(Icons.close, color: Colors.blueAccent),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}