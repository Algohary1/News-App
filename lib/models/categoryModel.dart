import 'dart:ui';

class CategoryModel {
  String id;
  String name;
  String image;
  Color color;

  CategoryModel(
      {required this.id,
      required this.name,
      required this.image,
      required this.color});

  static List<CategoryModel> getCategory() {
    return [
      CategoryModel(
          id: 'sports',
          name: 'Sports',
          image: 'assets/images/sports.png',
          color: Color(0xFFC91C22)),
      CategoryModel(
          id: 'politics',
          name: 'Politics',
          image: 'assets/images/Politics.png',
          color: Color(0xFF003E90)),
      CategoryModel(
          id: 'health',
          name: 'Health',
          image: 'assets/images/health.png',
          color: Color(0xFFED1E79)),
      CategoryModel(
          id: 'business',
          name: 'Business',
          image: 'assets/images/bussines.png',
          color: Color(0xFFCF7E48)),
      CategoryModel(
          id: 'environment',
          name: 'Environment',
          image: 'assets/images/environment.png',
          color: Color(0xFF4882CF)),
      CategoryModel(
          id: 'science',
          name: 'Science',
          image: 'assets/images/science.png',
          color: Color(0xFFF2D352)),
    ];
  }
}
