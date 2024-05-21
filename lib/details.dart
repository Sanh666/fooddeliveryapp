import 'package:flutter/material.dart';
import 'package:fooddelivery/wiget_support.dart';

class Details extends StatefulWidget {
  const Details({Key? key}) : super(key: key);

  @override
  State<Details> createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  int a=1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('Order'),
      //   leading: IconButton(
      //     icon: Icon(Icons.arrow_back_ios_new_outlined, color: Colors.black),
      //     onPressed: () {
      //       // Add your onPressed code here!
      //       Navigator.pop(context);
      //     },
      //   ),
      // ),
      //
      body: Container(
        margin: EdgeInsets.only(top: 50.0,left: 20.0,right: 20.0),
        child: Column(
          crossAxisAlignment:CrossAxisAlignment.start,
          children: [
            GestureDetector(
                onTap: (){
                  Navigator.pop(context);
                },
                child: Icon(Icons.arrow_back_ios_new_outlined, color: Colors.black)),
            Image.network("https://www.onceuponachef.com/images/2019/07/Big-Italian-Salad-1120x1449.jpg",width: MediaQuery.of(context).size.width,height: MediaQuery.of(context).size.height/2.5 ,fit:BoxFit.fill,),
            SizedBox(height: 15.0,),

            Row(

              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Geng Vo DICH",style:AppWidget.semiBoldTextFieldStyle(),),
                    Text("Geng Vo DICH",style: AppWidget.boldTextFieldStyle(),),

                  ],
                ),Spacer(),
                GestureDetector(
                  onTap: (){
                    if(a>1){--a;}
                    setState(() {

                    });
                  },
                  child: Container(
                    decoration: BoxDecoration(color: Colors.green,borderRadius: BorderRadius.circular(10)),
                    child: Icon(Icons.remove_sharp),

                  ),
                ),SizedBox(width: 20.0,),
                Text(a.toString(),style: AppWidget.boldTextFieldStyle(),),
                SizedBox(width: 20.0,),
                GestureDetector(
                  onTap: (){
                    ++a;
                    setState(() {

                    });
                  },
                  child: Container(
                    decoration: BoxDecoration(color: Colors.green,borderRadius: BorderRadius.circular(10)),
                    child: Icon(Icons.add),
                  ),
                ) ],
            ),
            SizedBox(height: 20.0),
            Text(
              "Lorem Ipsum is simply dummy text of the printing and typesetting",
              style: AppWidget.lightTextFieldStyle(),
            ),
            SizedBox(height: 30.0),
            Row(
              children: [
                Text("Delivery Time", style: AppWidget.semiBoldTextFieldStyle()),
                SizedBox(width: 25.0),
                Icon(Icons.alarm, color: Colors.black54),
                SizedBox(width: 5.0),
                Text("30 min", style: AppWidget.semiBoldTextFieldStyle()),
              ],
            ), // Row

            Spacer(),
            Padding(
              padding: const EdgeInsets.only(bottom: 40.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Total Price", style: AppWidget.semiBoldTextFieldStyle()),
                      Text("\$28", style: AppWidget.headlineTextFieldStyle()),
                    ],
                  ), // Column
                  GestureDetector(
                    onTap: () {
                      // Add your onTap logic here
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width/2,
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(color: Colors.black,borderRadius: BorderRadius.circular(10)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text("Add to cart", style: TextStyle(color: Colors.white,fontSize: 16.0),),
                          SizedBox(width: 30.0,),
                          Container(
                            padding: EdgeInsets.all(3),
                            decoration: BoxDecoration(color: Colors.green,borderRadius: BorderRadius.circular(10)),

                            child: Icon(Icons.shopping_cart_outlined,color: Colors.white,),
                          ),
                          SizedBox(width: 10.0,),

                        ],
                      ),
                    ),
                  ), // Container
                ], // children
              ), // Row
            ), // Padding




          ],),),


    );
  }
}
