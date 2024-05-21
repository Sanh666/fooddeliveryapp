import 'package:flutter/material.dart';
import 'package:fooddelivery/wiget_support.dart';

class Wallet extends StatefulWidget {
  const Wallet({Key? key}) : super(key: key);

  @override
  State<Wallet> createState() => _WalletState();
}

class _WalletState extends State<Wallet> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.only(top: 60.0),
        child: Column(
          children: [
            Material(
              elevation: 2.0,
              child: Container(
                padding: const EdgeInsets.only(bottom: 10.0),
                child: Center(
                  child: Text(
                    "Wallet",
                    style: AppWidget.headlineTextFieldStyle(),
                  ),
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(20.0),
              decoration: BoxDecoration(color: Colors.white),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Image.network(
                        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR_nvu3gkYgZKRNPbh3rrh0NaetFpLRHLTsrHm3kJHAjw&s",
                        height: 60,
                        width: 60,
                        fit: BoxFit.cover,
                      ),
                      const SizedBox(width: 40.0),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Your Wallet",
                            style: AppWidget.semiBoldTextFieldStyle(),
                          ),
                          const SizedBox(height: 5.0),
                          Text(
                            "VND 100",
                            style: AppWidget.boldTextFieldStyle(),
                          ),
                        ],
                      ),
                      const Spacer(),
                      Padding(
                        padding: const EdgeInsets.only(left: 20.0),
                        child: Text(
                          "Add money",
                          style: AppWidget.semiBoldTextFieldStyle(),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          border: Border.all(color: const Color(0xFFE8E2E2)),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Text(
                          " 100",
                          style: AppWidget.semiBoldTextFieldStyle(),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          border: Border.all(color: const Color(0xFFE8E2E2)),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Text(
                          "500",
                          style: AppWidget.semiBoldTextFieldStyle(),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          border: Border.all(color: const Color(0xFFE8E2E2)),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Text(
                          " 1000",
                          style: AppWidget.semiBoldTextFieldStyle(),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          border: Border.all(color: const Color(0xFFE8E2E2)),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Text(
                          " 2000",
                          style: AppWidget.semiBoldTextFieldStyle(),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 50.0,),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 20.0),
                    padding: EdgeInsets.symmetric(vertical: 12.0),
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(color: Colors.green,borderRadius: BorderRadius.circular(8))
                    , child: Center(child: Text("Add money",style: TextStyle(color: Colors.white,fontSize: 14.0,fontWeight: FontWeight.bold),),),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
