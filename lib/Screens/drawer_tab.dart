import 'package:flutter/material.dart';

class DrawerTab extends StatelessWidget {
  Function onCLick;
    DrawerTab({required this.onCLick,super.key});
  static const int CATEGORY_ID=1;
  static const int SETTINGS_ID=2;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * .7,
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: MediaQuery.of(context).size.height * .2,
            decoration: BoxDecoration(color: Colors.green),
            child: Center(
                child: Text(
              'News App',
              style: TextStyle(fontSize: 30, color: Colors.white),
            )),
          ),
          InkWell(
           onTap: () {
             onCLick(CATEGORY_ID);
           },
            child: Text(
              'Categories',
              style: TextStyle(fontSize: 30),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          InkWell(
            onTap:() {
              onCLick(SETTINGS_ID);

            } ,
            child: Text('Settings', style: TextStyle(fontSize: 30)),
          )
        ],
      ),
    );
  }
}
