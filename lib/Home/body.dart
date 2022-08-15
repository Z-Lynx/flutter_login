import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:salonbooking/Home/appbar.dart';


class bodyScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height,
      width: size.width,
      child: Column(
        children: <Widget> [
          CustomAppBar(),
          Text(
            "WELCOME TO SALON",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
      ],
      )
    );
  }
}

class body2 extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height,
      width:  size.width,
      child: Stack(
        alignment: Alignment.center,
        children: <Widget> [
          Positioned(
            top: 0, 
            left:0,
            child: Image.asset(
              "assets/images/logo.png",
              width: size.width*0.3,
            ),
          )
        ]
      ),
    );
  }
}

