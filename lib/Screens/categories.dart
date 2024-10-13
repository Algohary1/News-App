import 'package:flutter/material.dart';
import 'package:news_app/Screens/category_item.dart';
import 'package:news_app/models/categoryModel.dart';

class CategoriesTab extends StatelessWidget {

  Function onClick;
  CategoriesTab({required this.onClick,super.key});

  List<CategoryModel> categories = CategoryModel.getCategory();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Pick your category of interest',style: TextStyle(
            fontSize: 33
          ),),
          SizedBox(
            height: 18,
          ),
          Expanded(
            child: GridView.builder(
              gridDelegate:
                  SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,
                  crossAxisSpacing: 12,
                    mainAxisSpacing: 12
                  ),
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    onClick(categories[index]);

                  },
                  child: CategoryItem(model: categories[index],
                  isOdd: index.isOdd,
                  ),
                );
              },
              itemCount: categories.length,
            ),
          )
        ],
      ),
    );
  }
}
