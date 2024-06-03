import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../sheared/components/comopnents.dart';

class addmedical_record extends StatelessWidget {
  const addmedical_record({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Center(child: Text('  Add medical record')),),
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Container(height: double.infinity
          ,width: double.infinity,color: CupertinoColors.white,
        child:Column(children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text("Write the diagnosis of the condition ",style: TextStyle(color: Colors.black54,fontSize: 18),),
            ],
          ),
          TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey.shade300, width: 1.5),
                borderRadius: BorderRadius.circular(10),

            ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: defualtcolelr,
                  width: 2.0,
                ),
                borderRadius: BorderRadius.circular(10.0),
              ),
              errorBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.red,
                  width: 2.0,
                ),
                borderRadius: BorderRadius.circular(10.0),
              ),
          ),

          ),


        ],),
        ),
      ),
    );
  }
}
