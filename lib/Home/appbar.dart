import 'package:flutter/material.dart';
import 'package:salonbooking/Login/login_screen.dart';


class CustomAppBar extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(20,10 ,20 ,20),
      padding: EdgeInsets.fromLTRB(60,20,20,20),
      decoration: BoxDecoration(
        color: Color.fromRGBO(6, 173, 239, 1),
        borderRadius: BorderRadius.circular(40),
        boxShadow:[
          BoxShadow(
            offset: Offset(0, -2),
            blurRadius: 30,
            color: Colors.black.withOpacity(0.16),
          )
        ]
      ),
      child: Row(
        children: <Widget>[
          Text(
            "catchybeauty".toUpperCase(),
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Color(0xFF3528EB)),
            
          ),
          Text(
            ".com".toUpperCase(),
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          Spacer(),
          MenuItem(
            title: "Home",
            press: () {},
            ),
          MenuItem(
            title: "Salon",
            press: () {},
            ),
          MenuItem(
            title: "Booking",
            press: () {},
            ),
          MenuItem(
            title: "Login",
            press: () {},
            ),
          MenuItem(
            title: "Register",
            press: () {},
            ),
          DefaultButton(
            title: "Sign Up",
            press: () {Navigator.push(context, MaterialPageRoute(builder: (context){return MyHomePage();},),);},
          ),
        ],
      ),
    );
  }
}

class DefaultButton extends StatelessWidget {
  final String title;
  final VoidCallback press;
  const DefaultButton({
    Key? key,
    required this.title, 
    required this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: FlatButton(
        padding: const EdgeInsets.symmetric(horizontal: 40,vertical: 15),
        color: Color.fromRGBO(255, 187, 0, 1),
        onPressed: press,
        child: Text(
          title.toUpperCase(),
          style: TextStyle(
            fontSize: 22
          ),
        ),
      ),
    );
  }
}

class MenuItem extends StatelessWidget {
  final String title;
  final VoidCallback press; 
  const MenuItem({
    Key? key,
    required this.title,
    required this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: press,
      child:Padding(
        padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
        child: Text(
          title.toUpperCase(),
          style: TextStyle(
            color: Color.fromARGB(0, 0, 0, 0).withOpacity(0.5),
            fontWeight: FontWeight.bold,
            fontSize: 18
          ),
        ),
      )
    );
  }
}