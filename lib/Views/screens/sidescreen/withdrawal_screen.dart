import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WithdrawScreen extends StatelessWidget {
static const String routeName='withdrawScreen';
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
              'Withdrawal',
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 36,
              ),
            ),
          ),
         Row(
           children: [
             _rowHeader("Name", 1),
             _rowHeader("Amount", 3),
             _rowHeader("Bank Name",2 ),
             _rowHeader("Bank Account", 2),
             _rowHeader("Email", 1),
             _rowHeader("Phone", 1),
           ],
         )
        ],
      ),
    );
  }
}
