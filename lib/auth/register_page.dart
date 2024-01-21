import 'package:appfirebase/auth/login_page.dart';
import 'package:appfirebase/auth/service/controller.dart';
import 'package:appfirebase/pages/home_page.dart';
import 'package:appfirebase/widgets/my_textfild.dart';
import 'package:appfirebase/widgets/mytext.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:svg_flutter/svg.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  var auth = AuthService();
  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();
  bool? ischacked = false;
  final nameCtr = TextEditingController();
  final emialCtr = TextEditingController();
  final phonenumberCtr = TextEditingController();
  final passwordCtr = TextEditingController();
  final confirmpasswordCtr = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
            ),
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.015,
                  ),
                  child: Center(
                    child: Column(
                      children: [
                        SvgPicture.asset(
                          'assets/icons/logoo.svg',
                          height: MediaQuery.of(context).size.height * 0.14,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'P',
                              style: GoogleFonts.gabriela(
                                textStyle: const TextStyle(
                                  fontSize: 32,
                                  color: Colors.red,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                            Text(
                              'interest',
                              style: GoogleFonts.labrada(
                                textStyle: const TextStyle(
                                  fontSize: 30,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                const MyText(
                  text: 'Register',
                  fontSize: 30,
                ),
                const MyText(
                  text: 'Enter your details to register',
                  fontSize: 18,
                  textColor: Colors.black45,
                ),
                const Gap(15),
                //! form
                Form(
                  key: _globalKey,
                  child: Column(
                    children: [
                      MyTextfild(
                        controller: nameCtr,
                        hintText: 'Please enter your name',
                        height: 70,
                        radius: 10,
                        validator: (value) {
                          if (value != null && value.length > 2) {
                            return null;
                          } else {
                            return 'Enter your name';
                          }
                        },
                        onChanged: (_) {
                          _globalKey.currentState!.validate();
                        },
                      ),
                      const Gap(15),
                      MyTextfild(
                        controller: emialCtr,
                        hintText: 'Email Address',
                        height: 70,
                        radius: 10,
                        validator: (value) {
                          if (value != null &&
                              value.length > 11 &&
                              value.contains('@gmail.com')) {
                            return null;
                          } else {
                            return 'Please enter your email address';
                          }
                        },
                        onChanged: (_) {
                          _globalKey.currentState!.validate();
                        },
                      ),
                      const Gap(15),
                      MyTextfild(
                        controller: phonenumberCtr,
                        hintText: 'Mobile Number',
                        height: 70,
                        radius: 10,
                        keyboardType: TextInputType.phone,
                        validator: (value) {
                          if (value != null &&
                              value.length == 13 &&
                              value.startsWith('+998')) {
                            return null;
                          } else {
                            return 'Please enter your mobile number';
                          }
                        },
                        onChanged: (_) {
                          _globalKey.currentState!.validate();
                        },
                      ),
                      const Gap(15),
                      MyTextfild(
                        controller: passwordCtr,
                        hintText: 'Password',
                        height: 70,
                        radius: 10,
                        validator: (value) {
                          if (value != null &&
                              value.length >= 8 &&
                              value.contains(RegExp('[a-zA-Z0-9]')) &&
                              value.contains(
                                RegExp('[^a-zA-Z0-9]'),
                              )) {
                            return null;
                          } else {
                            return 'Must be 8 or more characters  and contain at least 1 number or special character';
                          }
                        },
                        onChanged: (p0) {
                          _globalKey.currentState!.validate();
                        },
                      ),
                      const Gap(15),
                      MyTextfild(
                        controller: confirmpasswordCtr,
                        hintText: 'Confirm Password',
                        height: 70,
                        radius: 10,
                        // validator: (value) {
                        //   if (confirmpasswordCtr.text == passwordCtr.text) {
                        //     return null;
                        //   } else {
                        //     return 'Error';
                        //   }
                        // },
                        // onChanged: (p0) {
                        //   _globalKey.currentState!.validate();
                        // },
                      ),
                    ],
                  ),
                ),

                Row(
                  children: [
                    Checkbox(
                      value: ischacked,
                      activeColor: colorbutton,
                      tristate: true,
                      onChanged: (onvsoff) {
                        setState(() {
                          ischacked = onvsoff;
                        });
                      },
                    ),
                    const MyText(
                      text: 'I agree with the terms and conditions',
                      fontSize: 16,
                    ),
                  ],
                ),
                MyElevatedButton(
                  text: 'Next',
                  color: ischacked == true
                      ? colorbutton
                      : const Color.fromARGB(65, 69, 75, 96),
                  onPressed: () async {
                    final validateresult = _globalKey.currentState!.validate();
                    if (validateresult && ischacked == true) {
                      //! Malumotlar kiritilishi talab qilish jarayoni
                      await auth.userRegister(nameCtr.text, emialCtr.text,
                          passwordCtr.text, context);
                      //! Keyin page
                      // ignore: use_build_context_synchronously
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const HomePage(),
                        ),
                      );
                      //! Malumotlar saqlanganligi to'grisidagi tasdiq
                      const SnackBar(
                        content: MyText(
                          text:
                              'Fill in the information and confirm the contract',
                          fontSize: 16,
                          textColor: Colors.green,
                        ),
                      );
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: MyText(
                            textAlign: TextAlign.center,
                            text:
                                'Fill in the information and confirm the contract',
                            fontSize: 16,
                            textColor: Colors.redAccent,
                          ),
                        ),
                      );
                    }
                  },
                ),
                Padding(
                  padding: const EdgeInsets.all(5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const MyText(
                        text: 'Need help? Visit our ',
                        fontSize: 18,
                        textColor: Colors.black45,
                      ),
                      MyText(
                        text: 'help center',
                        fontSize: 20,
                        textColor: colorbutton,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
