import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bkash/flutter_bkash.dart';

class ButtonPage extends StatefulWidget {
  const ButtonPage({super.key});

  @override
  State<ButtonPage> createState() => _ButtonPageState();
}

class _ButtonPageState extends State<ButtonPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink,
      appBar: AppBar(
        backgroundColor: Colors.pink,
        title: Text("Bikash Payment",style: TextStyle(fontSize: 30,color: Colors.white,fontWeight: FontWeight.bold),),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InkWell(
                onTap: () async {
                  var bks = FlutterBkash();

                  try {
                    final result = await bks.pay(
                      context: context, // BuildContext context
                      amount: 500.0, // amount as double
                      merchantInvoiceNumber: "12",
                    );
                  } on BkashFailure catch (e) {
                    // Handle the error
                    print(e.message);
                  }
                },
                child: Container(
                  padding: EdgeInsets.only(
                    top: 20,
                    left: 5,
                    right: 5,
                    bottom: 20

                  ),

                    decoration: BoxDecoration(
                        color: Colors.white,
                      borderRadius: BorderRadius.circular(20)
                    ),
                    child:Column(
                      children: [
                        ClipRRect(
                    borderRadius:BorderRadius.circular(20),
                          child: Image(image: AssetImage("images/yes.png",),
                            height: 150,

                          ),

                        ),
                        SizedBox(height: 15,),
                        Text(
                          "Payment",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 35,
                              color: Colors.black,
                          shadows: [
                            Shadow(
                              color: Colors.grey,
                              blurRadius: 5,
                              offset: Offset(5, 5),
                            )
                          ]),
                        ),

                      ],
                    )

                )
            ),
            SizedBox(height: 80,),
            CircularProgressIndicator(
              color: Colors.black,
            ),
          ],
        ),
      ),
    );
  }
}
