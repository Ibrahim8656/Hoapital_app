import 'package:avatar_view/avatar_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:hosptial_project/sheared/components/comopnents.dart';

import 'chatbot.dart';

class first_chaty extends StatelessWidget {
  const first_chaty({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: Icon(Icons.add,color: Colors.white,),
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text("           Healthara ",
                  style: TextStyle(color: defualtcolelr, fontSize: 25),
                ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 500,
                ),
                GestureDetector(
                  onTap:() {

                    Navigator.push(context, MaterialPageRoute(builder:(context)=>Chatbot()));
                  },
                  child: AvatarView(
                    radius: 150,
                    borderWidth: 8,
                    borderColor: defualtcolelr,
                    avatarType: AvatarType.CIRCLE,
                    backgroundColor: Colors.red,
                    imagePath: "asset/images/img_5.png",
                    placeHolder: Container(
                      child: Icon(Icons.person, size: 50,),
                    ),
                    errorWidget: Container(
                      child: Icon(Icons.error, size: 50,),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'whenever you need help we are ',
                  style: TextStyle(
                      color: Colors.black54,
                      fontSize: 22,
                      fontWeight: FontWeight.bold),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
