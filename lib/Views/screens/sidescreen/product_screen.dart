import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProductScreen extends StatelessWidget {
  static const String routeName='\productScreen';
  Widget _rowHeader(String text,int flex){
    return Expanded(
      flex: 2,
      child: Container(
        decoration: BoxDecoration(
            border:Border.all(color: Colors.grey),
            color: Colors.yellow.shade900
        ),
        child:Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(text,style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
              color: CupertinoColors.white
          ),),
        ),
      ),
    );

  }
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SingleChildScrollView(
          child: Container(
            alignment: Alignment.topLeft,
            padding: const EdgeInsets.all(10),
            child: const Text(
              'Products Screen',
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 36,
              ),
            ),
          ),
        ),
        Row(
          children: [
            _rowHeader("Image", 1),
            _rowHeader(" Name", 3),
            _rowHeader("Price",2 ),
            _rowHeader("Quantity", 2),
            _rowHeader("Action", 1),
            _rowHeader("view More", 1),
          ],
        )
      ],
    );
  }
}
