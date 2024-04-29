import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hosptial_project/patient/patient_ui/medicalscreen/MydoctorScreen.dart';

import '../../../sheared/components/comopnents.dart';
import 'Medical_redcords.dart';

class MedicaScreen extends StatelessWidget {
  const MedicaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 80.0),
      child: Container(
        width: double.infinity,
        color: Colors.white,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                  left: 30.0, right: 30, top: 50, bottom: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => MydoctorScreen()),
                        );
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: defualtcolelr,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.8),
                              blurRadius: 4,
                              offset: Offset(5, 8),
                            ),
                          ],
                        ),
                        child: Column(
                          children: [
                            IconButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => MydoctorScreen()),
                                  );
                                },
                                icon: Icon(
                                  Icons.group,
                                  size: 80,
                                  color: Colors.white,
                                )),
                            Text(
                              'My Doctors',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                              ),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Medical_redcords()));
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: defualtcolelr,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.8),
                              blurRadius: 4,
                              offset: Offset(5, 8),
                            ),
                          ],
                        ),
                        child: Column(
                          children: [
                            IconButton(
                                onPressed: () {},
                                icon: IconButton(
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                Medical_redcords()));
                                  },
                                  icon: Icon(
                                    Icons.edit_note_rounded,
                                    size: 65,
                                    color: Colors.white,
                                  ),
                                )),
                            Text(
                              'Medical Records',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                              ),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 30.0, right: 30, top: 0, bottom: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: defualtcolelr,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.8),
                            blurRadius: 4,
                            offset: Offset(5, 8),
                          ),
                        ],
                      ),
                      child: Column(
                        children: [
                          IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.file_copy_sharp,
                                size: 80,
                                color: Colors.white,
                              )),
                          Text(
                            'Tests',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                            ),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: defualtcolelr,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.8),
                            blurRadius: 4,
                            offset: Offset(5, 8),
                          ),
                        ],
                      ),
                      child: Column(
                        children: [
                          IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.payment,
                                size: 80,
                                color: Colors.white,
                              )),
                          Text(
                            'Payment&Refound',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                            ),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
