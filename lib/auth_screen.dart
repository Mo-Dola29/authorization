import 'dart:math';

import 'package:auth/constants.dart';
import 'package:auth/widgets/login_form.dart';
import 'package:auth/widgets/sign_up_form.dart';
import 'package:auth/widgets/social_buttons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen>with SingleTickerProviderStateMixin {
  bool _isShowSignUp = false;
  late AnimationController _animationController;
  late Animation<double>_animationTextRotate;
  void setUpAnimation(){
    _animationController=AnimationController(vsync: this,duration: defaultDuration);
    _animationTextRotate=Tween<double>(begin: 0,end: 90).animate(_animationController);
  }
@override
void initState(){
    setUpAnimation();
    super.initState();
}
void dispose(){
    _animationController.dispose();
    super.dispose();
}
  @override

  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          //login
          AnimatedPositioned(
            duration: defaultDuration,
            width: _size.width * 0.88,
            height: _size.height,
            left: _isShowSignUp ? -_size.width * 0.76 : 0,
            child: GestureDetector(
              onTap: () {
                setState(() {
                  _isShowSignUp = !_isShowSignUp;
                });
              },
              child: Container(
                color: login_bg,
                child: LoginForm(),
              ),
            ),
          ),
          //signup
          AnimatedPositioned(
              duration: defaultDuration,
              height: _size.height,
              width: _size.width * 0.88,
              left: _isShowSignUp ? _size.width * 0.12 : _size.width * 0.88,
              child: Container(
                color: signup_bg,
                child: SignUpForm(),
              )),
          AnimatedPositioned(
            duration: defaultDuration,
            left: 0,
            top: _size.height * 0.1,
            right: _isShowSignUp ? -_size.width * 0.06 : _size.width * 0.06,
            child: CircleAvatar(
                backgroundColor: Colors.white60,
                radius: 25,
                child: _isShowSignUp
                    ? SvgPicture.asset(
                        "assets/animation_logo.svg",
                        color: signup_bg,
                      )
                    : SvgPicture.asset(
                        "assets/animation_logo.svg",
                        color: login_bg,
                      )),
          ),
          AnimatedPositioned(
            duration: defaultDuration,
            child: SocalButtns(),
            bottom: _size.height * 0.1,
            width: _size.width,
            right: _isShowSignUp ? -_size.width * 0.06 : _size.width * 0.06,
          )
          //loginText
          ,
          AnimatedPositioned(
            duration: defaultDuration,
            bottom: _isShowSignUp?_size.height/2:_size.height*0.3,
              left:  _size.width*0.44-80   ,
              child: Container(
                width: 160,
                // color: Colors.red,
                child: AnimatedDefaultTextStyle(

                  duration: defaultDuration,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize:_isShowSignUp?20: 32, fontWeight: FontWeight.bold,color: Colors.white70),
                  child: Transform.rotate(
                    angle: -0*pi/180,
                    child: Text(

            'Log In'.toUpperCase(),
                      

          ),
                  ),
                ),
              ))
        ],
      ),
    );
  }
}
