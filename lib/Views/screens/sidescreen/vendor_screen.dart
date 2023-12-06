import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class VendorScreen extends StatelessWidget {
  static const String routeName='\VendorScreen';


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
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            alignment: Alignment.topLeft,
            padding: const EdgeInsets.all(10),
            child: const Text(
              'Manage Vendors',
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 36,
              ),
            ),
          ),
          Row(
            children: [
              _rowHeader('Logo', 1),
              _rowHeader("BusinessName", 3),
              _rowHeader("City", 2),
              _rowHeader("state", 2),
              _rowHeader("Action", 1),
              _rowHeader('View More', 1)
              
            ],
          )
        ],
      ),
    );
  }
}
