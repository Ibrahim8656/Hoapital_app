import 'package:flutter/material.dart';

import 'package:hosptial_project/sheared/shearedpref/shearedprefrances.dart';
import 'package:hosptial_project/users/patient_ui/smooth-page/page1.dart';
import 'package:hosptial_project/users/patient_ui/smooth-page/page2.dart';
import 'package:hosptial_project/users/patient_ui/smooth-page/page3.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../auth_pages/sign_in.dart';



class SmoothPage extends StatefulWidget {

  @override
  State<SmoothPage> createState() => _SmoothPageState();
}

class _SmoothPageState extends State<SmoothPage> {
  final _controllor=PageController();
  bool onLastPage=false;
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 500,
            child: PageView(
              controller: _controllor,
              onPageChanged: (index){
                setState(() {
                  onLastPage=(index==2);
                });
              },
              children: [
                Page1(),
                Page2(),
                Page3(),
              ],
            ),
          ),
          SmoothPageIndicator(
            controller: _controllor,
            count:  3,
            effect:  SlideEffect(
                dotWidth:  20.0,
                dotHeight:  20.0,
                dotColor:  Colors.grey,
                activeDotColor:  Colors.blueGrey
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Padding(
                  padding:  const EdgeInsetsDirectional.fromSTEB(
                      0.0, 0.0, 0.0, 16.0),
                  child:  Container(
                    child: OutlinedButton(
                      onPressed: (){
                        _controllor.jumpToPage(2);
                      },
                      style: ElevatedButton.styleFrom(shape: const StadiumBorder(),backgroundColor: Colors.blueGrey),
                      child: const Text("Skip",
                        style:TextStyle(fontWeight:FontWeight.w200,
                          color: Colors.white,
                          fontFamily: 'Readex Pro',
                          fontSize: 13.0,
                        ),
                      ),
                    ),
                  )
              ),
              onLastPage?
              Padding(
                  padding:  const EdgeInsetsDirectional.fromSTEB(
                      0.0, 0.0, 0.0, 16.0),
                  child:  Container(
                    child: OutlinedButton(
                      onPressed: (){
                       CacheHelper.saveData(key: 'onbording', value: true).then((value) {
                         if (value) {
                           Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => SignIn()));
                         } else {
                           // Handle error if saving data failed
                           print('Failed to save onboarding state.');
                         }

                       });
                      },
                      style: ElevatedButton.styleFrom(shape: const StadiumBorder(),backgroundColor: Colors.blueGrey),
                      child: const Text(" done",
                        style:TextStyle(fontWeight:FontWeight.w200,
                          color: Colors.white,
                          fontFamily: 'Readex Pro',
                          fontSize: 13.0,
                        ),
                      ),
                    ),
                  )
              ):
              Padding(
                  padding:  const EdgeInsetsDirectional.fromSTEB(
                      0.0, 0.0, 0.0, 16.0),
                  child:  Container(

                    child: OutlinedButton(
                      onPressed: (){
                        _controllor.nextPage(duration: Duration(milliseconds: 500), curve: Curves.easeIn);
                      },
                      style: ElevatedButton.styleFrom(shape: const StadiumBorder(),backgroundColor: Colors.blueGrey),
                      child: const Text(" Next",
                        style:TextStyle(fontWeight:FontWeight.w200,
                          color: Colors.white,
                          fontFamily: 'Readex Pro',
                          fontSize: 13.0,
                        ),
                      ),
                    ),
                  )
              ),
            ],
          ),

        ],
      ),
    );
  }
}