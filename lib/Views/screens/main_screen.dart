import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_admin_scaffold/admin_scaffold.dart';
import 'package:webadmin/Views/screens/order_screen.dart';
import 'package:webadmin/Views/screens/sidescreen/categories_Screen.dart';
import 'dart:html';

import 'package:webadmin/Views/screens/sidescreen/dashbord.dart';
import 'package:webadmin/Views/screens/sidescreen/product_screen.dart';
import 'package:webadmin/Views/screens/sidescreen/upload_banners.dart';
import 'package:webadmin/Views/screens/sidescreen/vendor_screen.dart';
import 'package:webadmin/Views/screens/sidescreen/withdrawal_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget  _selectedItem=DashboardScreen();

  screenSelector(item){
    switch(item.route){
      case DashboardScreen.routeName:
      setState(() {
        _selectedItem=DashboardScreen();
      });
      break;
      case VendorScreen.routeName:
        setState(() {
          _selectedItem=VendorScreen();
        });
        break;
      case WithdrawScreen.routeName:
        setState(() {
          _selectedItem=WithdrawScreen();
        });
        break;
      case Categories.routeName:
        setState(() {
          _selectedItem=Categories();
        });
        break;
      case ProductScreen.routeName:
        setState(() {
          _selectedItem=ProductScreen();
        });
        break;
      case UploadBannerScreen.routeName:
        setState(() {
          _selectedItem=UploadBannerScreen();
        });
        break;

      case OrderScreen.routeName:
        setState(() {
          _selectedItem=OrderScreen();
        });
        break;
    }
  }
  Widget build(BuildContext context) {
    return AdminScaffold(
      appBar: AppBar(
        backgroundColor: Colors.yellow.shade900,
        title: Text("Managment"),
      ),
    sideBar:SideBar(
        items: [
          AdminMenuItem(title: "Dashboard",icon:Icons.dashboard, route: DashboardScreen.routeName,),
    AdminMenuItem(title: "vendors",icon:CupertinoIcons.person_3, route: VendorScreen.routeName,),
    AdminMenuItem(title: "Withdraw",icon:CupertinoIcons.money_dollar, route:WithdrawScreen.routeName,),
    AdminMenuItem(title: "Orders",icon:CupertinoIcons.shopping_cart, route:OrderScreen.routeName,),
    AdminMenuItem(title: "Categories",icon:Icons.category, route:Categories.routeName,),
          AdminMenuItem(title: "Products",icon:CupertinoIcons.shopping_cart, route:ProductScreen.routeName,),
          AdminMenuItem(title: "Upload Banner",icon:CupertinoIcons.add, route:UploadBannerScreen.routeName,),
        ], selectedRoute: '',onSelected:(item){
          screenSelector(item);
    },
        header: Container(
          height: 50,
          width: double.infinity,
          color: const Color(0xff444444),
          child: const Center(
            child: Text(
              'Agritech Pannel',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        ),
      footer: Container(
        height: 50,
        width: double.infinity,
        color: const Color(0xff444444),
        child: const Center(
          child: Text(
            'footer',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
      ),
    ),
    body: _selectedItem,
    );

  }
}
