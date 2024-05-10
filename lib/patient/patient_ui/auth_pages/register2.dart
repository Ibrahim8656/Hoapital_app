import 'dart:io';

import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hosptial_project/patient/patient_ui/auth_pages/sign_in.dart';
import 'package:hosptial_project/sheared/constant/constant.dart';
import 'package:image_picker/image_picker.dart';

import '../../../class/cubit/patient_cubit.dart';
import '../../../class/cubit/patient_states.dart';
import '../../../sheared/components/comopnents.dart';
import 'package:hosptial_project/sheared/constant/constant.dart';

class Register2 extends StatefulWidget {
  const Register2({super.key});

  @override
  State<Register2> createState() => _RegisterState();
}

class _RegisterState extends State<Register2> {
  File? imageFile;
  final picker = ImagePicker();

  Future pickImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        imageFile = File(pickedFile.path);
        Constants.imagepath = pickedFile.path;
      });
    }
  }

  bool obscureText = true;
  bool obscureText1 = true;
  var formky = GlobalKey<FormState>();

    String? selectedGender = 'Male'; // Default or initial value
    String? selectedBloodType = 'A+'; // Default or initial value

  var FirstnameController = TextEditingController();
  var agecontroller = TextEditingController();
  final emailController = TextEditingController();
  final BloodController = TextEditingController();
  final PhonenumberController = TextEditingController();
  final AddressController = TextEditingController();
  var GenderController = TextEditingController();
  final passwordController = TextEditingController();
  var LastnameController = TextEditingController();
  final UsernameController = TextEditingController();
  final password_confirmationController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => CubitPatientHosptial(),
      child: BlocConsumer<CubitPatientHosptial, PatientStates>(
        listener: (BuildContext context, Object? state) {
          if (state is PatientSignUPSuccess) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text('ٍSccessfully Registered'),
              duration: Duration(seconds: 2),
              backgroundColor: Colors.green.shade300,
            ));
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => SignIn()));
          } else if (state is PatientSignUPFailure) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text('${state.errorMassage}'),
              duration: Duration(seconds: 2),
              backgroundColor: Colors.red.shade300,
            ));
            return null;
          }
        },
        builder: (BuildContext context, state) {
          return Scaffold(
            backgroundColor: defualtcolelr,
            body: Container(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 50.0, bottom: 3),
                          child: Text(
                            "Welcome to",
                            style: TextStyle(
                                fontSize: 20.0,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Barajil Healthera Hospital",
                          style: TextStyle(
                              fontSize: 15.0,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(30)),
                      width: double.infinity,
                      height: 750,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 25.0, vertical: 15),
                        child: Form(
                          key: formky,
                          child: SingleChildScrollView(
                            child: Column(
                              children: [
                                SizedBox(height: 20),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "Get Started",
                                      style: TextStyle(
                                          fontSize: 23.0,
                                          color: Colors.black87,
                                          fontWeight: FontWeight.bold),
                                    )
                                  ],
                                ),
                                SizedBox(height: 5),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      " Let's get Start by filling out the form below",
                                      style: TextStyle(
                                        fontSize: 13.0,
                                        color: Colors.black,
                                      ),
                                    )
                                  ],
                                ),
                                SizedBox(height: 20),
                                defolttextformfild(
                                    validate: (String? value) {
                                      if (value!.isEmpty) {
                                        return " firstname is required";
                                      }
                                      return null;
                                    },
                                    typekey: TextInputType.name,
                                    controller: FirstnameController,
                                    prefexicon: Icons.person,
                                    labletext: 'firstname '),
                                SizedBox(
                                  height: 25,
                                ),
                                defolttextformfild(
                                    validate: (String? value) {
                                      if (value!.isEmpty) {
                                        return " lastname is required";
                                      }
                                      return null;
                                    },
                                    typekey: TextInputType.name,
                                    controller: LastnameController,
                                    prefexicon: Icons.person,
                                    labletext: 'lastname '),
                                SizedBox(
                                  height: 25,
                                ),
                                defolttextformfild(
                                    validate: (String? value) {
                                      if (value!.isEmpty) {
                                        return "age is required";
                                      }
                                      return null;
                                    },
                                    typekey: TextInputType.number,
                                    controller: agecontroller,
                                    prefexicon: Icons.email,
                                    labletext: 'age '),
                                SizedBox(
                                  height: 25,
                                ),
                                defolttextformfild(
                                    validate: (String? value) {
                                      if (value!.isEmpty) {
                                        return "phone number is required";
                                      }
                                      return null;
                                    },
                                    typekey: TextInputType.number,
                                    controller: PhonenumberController,
                                    prefexicon: Icons.phone,
                                    labletext: 'phone number '),
                                SizedBox(
                                  height: 25,
                                ),
                                defolttextformfild(
                                    validate: (String? value) {
                                      if (value!.isEmpty) {
                                        return "Address is required";
                                      }
                                      return null;
                                    },
                                    typekey: TextInputType.name,
                                    controller: AddressController,
                                    prefexicon: Icons.home,
                                    labletext: 'Address '),
                                SizedBox(
                                  height: 25,
                                ),
                                DropdownButtonFormField<String>(
                                  value: selectedGender,
                                  decoration:  InputDecoration(
                                    contentPadding: const EdgeInsets.symmetric(
                                        vertical: 17.0, horizontal: 10.0),
                                    labelText: 'select your Gender',
                                    border: OutlineInputBorder(),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.grey.shade300,
                                          width: 1.5),
                                      borderRadius: BorderRadius.circular(30),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: defualtcolelr,
                                        width: 2.0,
                                      ),
                                      borderRadius: BorderRadius.circular(30.0),
                                    ),
                                    errorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Colors.red,
                                        width: 2.0,
                                      ),
                                      borderRadius: BorderRadius.circular(30.0),
                                    ),
                                    prefixIcon: Icon(
                                      Icons.transgender,
                                      color: Colors.black26,
                                    ),
                                    filled: true,
                                    fillColor: const Color(0xFFF1F4F8),
                                  ),
                                  onChanged: (String? newValue) {
                                    setState(() {
                                      selectedGender = newValue;
                                    });
                                  },
                                  items: <String>['Male', 'Female'].map<DropdownMenuItem<String>>((String value) {
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: Text(value),
                                    );
                                  }).toList(),
                                ),
                                SizedBox(
                                  height: 25,
                                ),
                                DropdownButtonFormField<String>(
                                  value: selectedBloodType,
                                  decoration:   InputDecoration(
                                    contentPadding: const EdgeInsets.symmetric(
                                        vertical: 17.0, horizontal: 10.0),
                                    labelText: 'select your blood type',
                                    border: OutlineInputBorder(),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.grey.shade300,
                                          width: 1.5),
                                      borderRadius: BorderRadius.circular(30),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: defualtcolelr,
                                        width: 2.0,
                                      ),
                                      borderRadius: BorderRadius.circular(30.0),
                                    ),
                                    errorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Colors.red,
                                        width: 2.0,
                                      ),
                                      borderRadius: BorderRadius.circular(30.0),
                                    ),
                                    prefixIcon: Icon(
                                      Icons.bloodtype,
                                      color: Colors.black26,
                                    ),
                                    filled: true,
                                    fillColor: const Color(0xFFF1F4F8),
                                  ),
                                  onChanged: (String? newValue) {
                                    setState(() {
                                      selectedBloodType =
                                          newValue; /////constant variable
                                    });
                                  },

                                  items: <String>['A+', 'A-', 'B+', 'B-', 'AB+', 'AB-', 'O+', 'O-']
                                      .map<DropdownMenuItem<String>>((String value) {
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: Text(value),
                                    );
                                  }).toList(),
                                ),
                                SizedBox(
                                  height: 25,
                                ),
                                SizedBox(
                                  height: 30,
                                ),

                                // Add a widget to show selected image
                                if (imageFile != null) Image.file(imageFile!),
                                InkWell(
                                  onTap: pickImage,
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(25),
                                      color: Color(0xFFF1F4F8),
                                      border: Border(
                                        left: BorderSide(
                                          color: Colors.grey.shade300,
                                          width: 2,
                                        ),
                                        right: BorderSide(
                                          color: Colors.grey.shade300,
                                          width: 2,
                                        ),
                                        bottom: BorderSide(
                                          color: Colors.grey.shade300,
                                          width: 2,
                                        ),
                                        top: BorderSide(
                                          color: Colors.grey.shade300,
                                          width: 2,
                                        ),
                                      ),
                                    ),
                                    child: Row(
                                      children: [
                                        IconButton(
                                          onPressed: pickImage,
                                          icon: Icon(Icons.image,
                                              color: Colors.black26),
                                        ),
                                        SizedBox(
                                          width: 1,
                                        ),
                                        Text('select image',
                                            style: TextStyle(
                                                color: Colors.black54,
                                                fontSize: 16)),
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(height: 40),

                                ConditionalBuilder(
                                    condition: state is! PatientSignUPLoading,
                                    builder: (context) => Defultbotom(
                                        onPressed: () {
                                          print(
                                              '************************${imageFile}');
                                          if (formky.currentState!.validate()) ;
                                          CubitPatientHosptial.get(context)
                                              .Regoster2(
                                            age: int.parse(agecontroller.text),
                                            firstName: FirstnameController.text,
                                            gender: selectedGender,
                                            lastName: LastnameController.text,
                                            phone: PhonenumberController.text,
                                            address: AddressController.text,
                                            blood: selectedBloodType,
                                            photo: imageFile,
                                          );
                                          if (state is PatientSignUPSuccess) {
                                            navigator(SignIn(), context);
                                          }
                                        },
                                        text: 'Create account'),
                                    fallback: (context) =>
                                        CircularProgressIndicator()),
                                SizedBox(
                                  height: 300,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
