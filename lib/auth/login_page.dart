import 'package:appfirebase/auth/register_page.dart';
import 'package:appfirebase/auth/service/controller.dart';
import 'package:appfirebase/pages/home_page.dart';
import 'package:appfirebase/widgets/my_textfild.dart';
import 'package:appfirebase/widgets/mytext.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:svg_flutter/svg.dart';

Color colorbutton = const Color(0xFF454B60);
Color white = Colors.white;

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var auth = AuthService();

  final emailcontroller = TextEditingController();
  final passwordcontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 18,
          ),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.08,
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
              const SizedBox(
                height: 14,
              ),
              //! body
              const MyText(
                fontSize: 28,
                text: 'Login',
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 30),
                child: MyText(
                  text: 'Enter your username and password to login',
                  textAlign: TextAlign.center,
                  fontSize: 18,
                  textColor: Colors.black54,
                ),
              ),
              MyTextfild(
                controller: emailcontroller,
                hintText: 'User Name or Email',
                counter: const MyText(
                  text: 'Forgot Username?',
                  fontSize: 18,
                  textColor: Colors.black38,
                ),
              ),
              MyTextfild(
                controller: passwordcontroller,
                hintText: 'Password',
                counter: const MyText(
                  text: 'Forgot Password?',
                  fontSize: 18,
                  textColor: Colors.black38,
                ),
              ),
              MyElevatedButton(
                onPressed: () async {
                  await auth.userLogin(
                    context,
                    passwordcontroller.text,
                    emailcontroller.text,
                  );

                  // ScaffoldMessenger.of(context).showSnackBar(
                  //   const SnackBar(
                  //     content: MyText(
                  //       text: 'Error in email and password',
                  //       fontSize: 16,
                  //       textColor: Colors.redAccent,
                  //     ),
                  //   ),
                  // );
                },
                text: 'Login',
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Stack(
                  children: [
                    Align(
                      child: Divider(
                        indent: MediaQuery.of(context).size.width * 0.66,
                        color: Colors.black,
                      ),
                    ),
                    const Align(
                      alignment: Alignment.center,
                      child: MyText(
                        text: 'Or login in with',
                        fontSize: 14,
                      ),
                    ),
                    Divider(
                      endIndent: MediaQuery.of(context).size.width * 0.66,
                      color: Colors.black,
                    ),
                  ],
                ),
              ),
              //! or long in with
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 18),
                child: Row(
                  children: [
                    Expanded(
                      child: MyOutlineButton(),
                    ),
                    Gap(10),
                    Expanded(
                      child: MyElevatedButtonIcon(),
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const MyText(
                    text: 'Dont have an account?  ',
                    fontSize: 18,
                    textColor: Colors.black45,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (contex) => const RegisterPage(),
                        ),
                      );
                    },
                    child: MyText(
                      text: 'Register',
                      fontSize: 20,
                      textColor: colorbutton,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
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
    );
  }
}

class MyOutlineButton extends StatelessWidget {
  const MyOutlineButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: MediaQuery.of(context).size.height * 0.06,
      child: OutlinedButton.icon(
        onPressed: () {},
        icon: SvgPicture.asset('assets/icons/google.svg'),
        label: MyText(
          text: 'Google',
          fontSize: 18,
          textColor: colorbutton,
        ),
        style: ElevatedButton.styleFrom(
          foregroundColor: white,
          backgroundColor: white,
          side: BorderSide(color: colorbutton, width: 2),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              14,
            ),
          ),
        ),
      ),
    );
  }
}

class MyElevatedButtonIcon extends StatelessWidget {
  const MyElevatedButtonIcon({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: MediaQuery.of(context).size.height * 0.06,
      child: ElevatedButton.icon(
        onPressed: () {},
        icon: SvgPicture.asset('assets/icons/facebook.svg'),
        label: MyText(
          text: 'Google',
          fontSize: 18,
          textColor: white,
        ),
        style: ElevatedButton.styleFrom(
          backgroundColor: colorbutton,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              14,
            ),
          ),
        ),
      ),
    );
  }
}

class MyElevatedButton extends StatelessWidget {
  final String text;
  final Color? color;
  final void Function()? onPressed;
  const MyElevatedButton({
    super.key,
    required this.text,
    this.onPressed,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: MediaQuery.of(context).size.height * 0.075,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: color ?? const Color(0xFF454B60),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14),
          ),
        ),
        onPressed: onPressed,
        child: MyText(
          text: text,
          fontSize: 20,
          textColor: Colors.white,
        ),
      ),
    );
  }
}
