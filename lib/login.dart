import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:fooddelivery/signup.dart';
import 'package:fooddelivery/wiget_support.dart';

import 'bottomnav.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  String email="",password="";
  TextEditingController usernameController=new  TextEditingController();
  TextEditingController userpasswordController=new  TextEditingController();
  final _formKey = GlobalKey<FormState>();

  userLogin()async{
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: email, password: password);
      Navigator.pushReplacement(context,MaterialPageRoute(builder: (context)=>BottomNav()));

    }

    on FirebaseException catch(e){
      if(e=='user-not-found'){
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
                backgroundColor: Colors.orangeAccent,
                content: Text("user not found",style: TextStyle(fontSize: 18.0),)));

      }
      else if(e.code=="wrong-password"){
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            backgroundColor: Colors.orangeAccent,
            content: Text("Wrong password",style: TextStyle(fontSize: 18.0),)));

      }
    }
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Stack(children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height/2,
            decoration: BoxDecoration(gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Color(0xFFff5c30),
                  Color(0xFFe74b1a),
                ])),
          ),
          Container(
            margin: EdgeInsets.only(top: MediaQuery.of(context).size.height/3),
            height: MediaQuery.of(context).size.height/3,
            width: MediaQuery.of(context).size.width,
            decoration:BoxDecoration(color: Colors.white,borderRadius: BorderRadius.only(topLeft:Radius.circular (40),topRight: Radius.circular(40))),
            child: Text(""),
          ),
          Container(
            margin: EdgeInsets.only(top: 20.0,left: 20.0,right: 20.0),
            child: Column(children: [
              Center(child: Image.network("https://upload.wikimedia.org/wikipedia/commons/thumb/2/2f/Logo_TV_2015.svg/400px-Logo_TV_2015.svg.png",width: MediaQuery.of(context).size.width/4,fit: BoxFit.cover,)),
              SizedBox(height: 50,),
              Material(
                elevation: 5.0,
                borderRadius: BorderRadius.circular(20),
                child: Container(
                  padding: EdgeInsets.only(left: 20.0,right: 20.0),
                  height: MediaQuery.of(context).size.width,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(20)),
                  child: Form(
                    key: _formKey,
                    child: Column(children: [
                      SizedBox(height: 30.0,),
                      Text("Login",style: AppWidget.semiBoldTextFieldStyle(),),
                      TextFormField(
                        controller: usernameController,
                        validator: (value){
                          if(value==null||value.isEmpty){
                            return "Please Enter email";
                          }
                          return null;
                        },
                        decoration: InputDecoration(hintText: 'Email',hintStyle: AppWidget.semiBoldTextFieldStyle(),prefixIcon:Icon(Icons.email_outlined) ),
                      ),
                      SizedBox(height: 30.0,),

                      TextFormField(
                          controller: userpasswordController,
                        validator: (value){
                          if(value==null||value.isEmpty){
                            return "Please Enter password";
                          }
                          return null;
                        },
                        obscureText: true,
                        decoration: InputDecoration(hintText: 'Password',hintStyle: AppWidget.semiBoldTextFieldStyle(),prefixIcon:Icon(Icons.password_outlined) ),
                      ),
                      SizedBox(height: 20.0,),
                      Container(
                          alignment: Alignment.topRight,
                          child: Text("Forget Password ?",style: AppWidget.semiBoldTextFieldStyle(),)),
                      SizedBox(height: 20.0,),

                      GestureDetector(
                        onTap: (){
                          if(_formKey.currentState!.validate()){
                            setState(() {
                              email=usernameController.text;
                              password=userpasswordController.text;
                            });
                          } userLogin();
                        },
                        child: Material(
                          elevation: 5.0,
                          borderRadius: BorderRadius.circular(20),
                          child: Container(
                            padding: EdgeInsets.symmetric(vertical: 8.0),
                            width: 200,
                            decoration: BoxDecoration(color: Color(0Xffff5722),borderRadius: BorderRadius.circular(20)),
                            child: Center(child: Text("Login",style:TextStyle(color: Colors.white ,fontSize: 18,fontWeight: FontWeight.bold),)),
                          ),
                        ),
                      )
                    ],

                    ),
                  ),

                ),
              ),
              SizedBox(height: 70.0,),

              GestureDetector(
                  onTap: (){
                    Navigator.push(context,MaterialPageRoute(builder: (context)=>SignUp()));
                  },
                  child: Text("Don't have an acount ? Sign up",style: AppWidget.semiBoldTextFieldStyle(),))
            ],),
          )
        ],),
      ),
    );
  }
}
