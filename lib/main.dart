import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:salonbooking/Home/welcome_screen.dart';

void main(){
  runApp(myApp());
}


class myApp extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      theme: ThemeData(
        textTheme: GoogleFonts.poppinsTextTheme(
          Theme.of(context).textTheme,
        )
      ),
      title: 'Salon Booking',
      home: welcome(),
      debugShowCheckedModeBanner: false,
    );
  }
}