import 'package:flutter/material.dart';

import '../../../sheared/components/comopnents.dart';

class All_records extends StatelessWidget {
  const All_records({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            size: 20,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          'All Records',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
      body: Container(
        width: double.infinity,
        color: Colors.white,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                left: 10,
                right: 10,
                top: 40,
              ),
              child: Row(
                children: [
                  SizedBox(width: 15),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Expanded(
              child: ListView.separated(
                  itemBuilder: (context, index) =>
                      RecordItem(day: 16, month: 'FEB', docname: 'Ahmed Ali'),
                  separatorBuilder: (context, index) => SizedBox(height: 20),
                  itemCount: 29),
            ),
          ],
        ),
      ),
    );
  }
}
