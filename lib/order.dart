import 'package:flutter/material.dart';
import 'package:fooddelivery/wiget_support.dart';

class Order extends StatefulWidget {
  const Order({Key? key}) : super(key: key);

  @override
  State<Order> createState() => _OrderState();
}

class _OrderState extends State<Order> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
        padding: EdgeInsets.only(top:60.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Material(
              elevation: 2.0,
              child: Container(
                padding: EdgeInsets.only(bottom: 10.0),
                child: Center(
                  child: Text("Food Cart",style: AppWidget.headlineTextFieldStyle(),),
                ),
              ),
            ),
            SizedBox( height: 20.0),
            Container(
              margin: EdgeInsets.only(left: 20.0,),

              child: Material(
                elevation: 8.0,
                borderRadius:BorderRadius.circular(10),
                child: Container(
                  decoration:BoxDecoration(border:Border.all(),borderRadius:BorderRadius.circular(10)),

                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(

                          height: 90,
                          width: 40,
                          decoration:BoxDecoration(border:Border.all(),borderRadius:BorderRadius.circular(10)),
                          child:Center(child: Text("2"))
                      ),
                      ClipRRect(
                          borderRadius: BorderRadius.circular(60),
                          child: Image.network("https://www.onceuponachef.com/images/2019/07/Big-Italian-Salad-1120x1449.jpg",height: 90,width: 90,fit:BoxFit.cover,)),
                      SizedBox(width: 20.0,),
                      Column(children: [
                        Text("Pizza",style: AppWidget.semiBoldTextFieldStyle(),),
                        Text("40 VND",style: AppWidget.semiBoldTextFieldStyle(),),

                      ],)
                    ],),
                ),
              ),
            ),
            Spacer(),
            Divider(),
            Padding(
              padding: const EdgeInsets.only(left: 10.0 , right: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Total Price",style: AppWidget.boldTextFieldStyle(),),
                ],
              ),
            ) ,
            SizedBox(height: 20.0,),
            Container(
              padding: EdgeInsets.symmetric(vertical: 10.0),
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.only(left: 20.0,right: 20.0,bottom: 20.0),
              decoration:BoxDecoration(color:Colors.black,borderRadius:BorderRadius.circular(10)),
              child: Center(child: Text("Check Out ",style: TextStyle(color: Colors.white),),),
            )
          ],),
      ),

    );
  }
}
