import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hosptial_project/sheared/components/comopnents.dart';

import 'chatbot.dart';

class first_chaty extends StatelessWidget {
  const first_chaty({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Center(
            child: Text(
          "Healthara ",
          style: TextStyle(color: defualtcolelr, fontSize: 25),
        )),
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
                Container(
                  child: InkWell(
                    onTap: () {
                      navigator(Chatbot(), context);
                    },
                    child: CircleAvatar(
                      radius: 150,
                      backgroundImage: NetworkImage(
                          'https://thumbs.dreamstime.com/b/cute-robot-character-chatbot-social-media-chat-cute-robot-character-chatbot-social-media-chat-distinct-generative-ai-image-274779496.jpg'),
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
