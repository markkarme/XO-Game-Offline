import 'package:flutter/material.dart';

class HolderContainer extends StatelessWidget {
  VoidCallback onTap = (){};
  String X ="";
  HolderContainer({required this.X,required this.onTap});
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(0.0),
      child: InkWell(
        onTap: onTap,
        child: Container(
          color: Color(0xff00d49d),
          child: Stack(
            children: [
              Column(
                children: [
                  Container(height: 2,width: double.infinity,color: Color(0xfffedf03),),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(height: size.height*.155,width: 5,color: Color(0xfffedf03),),
                      Container(height: size.height*.155,width: 5,color: Color(0xfffedf03),),
                    ],

                  ),

                ],
              ),
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      X,
                      style: TextStyle(fontSize: 100,color: Color(0xffff005d)),
                    ),
                  ],
                ),
              ),
            ],
          )
        ),
      ),
    );
  }
}
