import 'package:flutter/material.dart';
import 'package:news_app/models/categoryModel.dart';

class CategoryItem extends StatelessWidget {
  CategoryItem({required this.model, required this.isOdd, super.key});

  CategoryModel model;
  bool isOdd;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(18),
      decoration: BoxDecoration(
          color: model.color,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(25),
            topLeft: Radius.circular(25),
            bottomRight: isOdd ? Radius.circular(25) : Radius.zero,
            bottomLeft: !isOdd ? Radius.circular(25) : Radius.zero,
          )),
      child: Column(
        children: [
          Expanded(child: Image.asset(model.image)),
          Text(
            model.name,
            style: TextStyle(
              fontSize: 20,
              color: Colors.white,
            ),
          )
        ],
      ),
    );
  }
}