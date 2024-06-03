import 'package:flutter/material.dart';
class OTPButtom extends StatelessWidget {
  final String text;
  final int fillcolor;
  final int textcolor;
  final double textSize;
  final Function callback;
  const OTPButtom({super.key, required this.text, required this.fillcolor, required this.textcolor, required this.textSize, required this.callback});
  @override
  Widget build(BuildContext context) {

    return Container(
      margin: const EdgeInsets.all(10.0),
      child: SizedBox(
        width: 70,
        height: 70,
        child:TextButton(
          style: ButtonStyle(
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0),
                )),
            backgroundColor: MaterialStateProperty.all<Color>(Color(fillcolor)),
          ),
          onPressed: (){
            callback(text);
          },
          child: Text(text,style: TextStyle(fontSize: textSize
              ,color: Color(textcolor)
          ),
          ),
        ),
      ),
    );
  }
}