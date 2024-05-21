import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fooddelivery/wiget_support.dart';
import 'package:fooddelivery/login.dart';

import 'bottomnav.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {


  String email="",password="",name="";
  TextEditingController nameController=new  TextEditingController();

  TextEditingController passwordController=new  TextEditingController();
  TextEditingController emailController=new  TextEditingController();
  final _formKey = GlobalKey<FormState>();
  registration() async{
  if(password!=null){
    try{
      UserCredential userCredential =await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password)
      ;
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          backgroundColor: Colors.orangeAccent,
          content: Text(" Registered Successfully",style:TextStyle(fontSize: 20.0),)));
        // ignore: use_build_context_synchronously
      Navigator.pushReplacement(context,MaterialPageRoute(builder: (context)=>BottomNav()));


} on FirebaseException catch(e){
      if(e=='weak-password'){
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
                backgroundColor: Colors.orangeAccent,
                content: Text("Password Provided is too weak",style: TextStyle(fontSize: 18.0),)));

      }
      else if(e.code=="email-already-in-use"){
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            backgroundColor: Colors.orangeAccent,
            content: Text("Account Already exsists",style: TextStyle(fontSize: 18.0),)));

      }
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
            height: MediaQuery.of(context).size.height/1.5,
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
                      Text("Sign Up",style: AppWidget.semiBoldTextFieldStyle(),),
                      SizedBox(height: 20.0,),
                      TextFormField(
                        controller: nameController,
                        validator: (value){
                          if(value==null||value.isEmpty){
                            return "Please Enter Name";
                          }
                          return null;
                        },
                        decoration: InputDecoration(hintText: 'Name',hintStyle: AppWidget.semiBoldTextFieldStyle(),prefixIcon:Icon(Icons.person_outline) ),
                      ), SizedBox(height: 20.0,),
                      TextFormField(
                        controller: emailController,
                        validator: (value){
                          if(value==null||value.isEmpty){
                            return "Please Enter E-mail";
                          }
                          return null;
                        },
                        decoration: InputDecoration(hintText: 'Email',hintStyle: AppWidget.semiBoldTextFieldStyle(),prefixIcon:Icon(Icons.email_outlined) ),
                      ),
                      SizedBox(height: 20.0,),

                      TextFormField(
                        controller: passwordController,
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

                      GestureDetector(
                        onTap: (){
                          if(_formKey.currentState!.validate()){
                            setState(() {
                              email=emailController.text;
                              name=nameController.text;
                              password=passwordController.text;
                            });
                          }
                          registration();
                        },
                        child: Material(
                          elevation: 5.0,
                          borderRadius: BorderRadius.circular(20),
                          child: Container(
                            padding: EdgeInsets.symmetric(vertical: 8.0),
                            width: 200,
                            decoration: BoxDecoration(color: Color(0Xffff5722),borderRadius: BorderRadius.circular(20)),
                            child: Center(child: Text("Sign up",style:TextStyle(color: Colors.white ,fontSize: 18,fontWeight: FontWeight.bold),)),
                          ),
                        ),
                      ),
                      SizedBox(height: 20.0,),
                      GestureDetector(
                        onTap: (){
                          Navigator.push(context,MaterialPageRoute(builder: (context)=>Login()));
                        },child: Text("Already have an account? Login",style: AppWidget.semiBoldTextFieldStyle(),),
                      )
                    ],

                    ),
                  ),

                ),
              ),

            ],),
          )
        ],),
      ),
    );
  }
}
