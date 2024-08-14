
import '../constants/image_strings.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DummyData {

  // static final List<BannerModel> banners = [
  //   BannerModel(imageUrl: TImages.banner1, targetScreen: TRoutes.order, active: false),
  //   BannerModel(imageUrl: TImages.banner2, targetScreen: TRoutes.cart, active: true),
  //   BannerModel(imageUrl: TImages.banner3, targetScreen: TRoutes.favourites, active: true),
  //   BannerModel(imageUrl: TImages.banner4, targetScreen: TRoutes.search, active: true),
  //   BannerModel(imageUrl: TImages.banner5, targetScreen: TRoutes.settings, active: true),
  //   BannerModel(imageUrl: TImages.banner6, targetScreen: TRoutes.userAddress, active: true),
  //   BannerModel(imageUrl: TImages.banner8, targetScreen: TRoutes.checkout, active: false),
  // ];

  static final List<CategoryModel2>categories = [
    CategoryModel2(id: '1', name: 'Sports', imageUrl: TImages.sportIcon, isFeatured: true),
    CategoryModel2(id: '2', name: 'Furniture', imageUrl: TImages.furnitureIcon, isFeatured: true),
    CategoryModel2(id: '3', name: 'Electronics', imageUrl: TImages.electronicsIcon, isFeatured: true),
    CategoryModel2(id: '4', name: 'Cloths', imageUrl: TImages.clothIcon, isFeatured: true),
    CategoryModel2(id: '5', name: 'Animals', imageUrl: TImages.animalIcon, isFeatured: true),
    CategoryModel2(id: '6', name: 'Shoes', imageUrl: TImages.shoeIcon, isFeatured: true),
    CategoryModel2(id: '7', name: 'Cosmetics', imageUrl: TImages.cosmeticsIcon, isFeatured: true),
    CategoryModel2(id: '8', name: 'Jewelery', imageUrl: TImages.jeweleryIcon, isFeatured: true),

    //subCategories
    CategoryModel2(id: '9', name: 'Sport Shoes', imageUrl: TImages.sportIcon, isFeatured: false,parentId: '1'),
    CategoryModel2(id: '10', name: 'Track Suits', imageUrl: TImages.sportIcon, isFeatured: false,parentId: '1'),
    CategoryModel2(id: '11', name: 'Sports Equipments', imageUrl: TImages.sportIcon, isFeatured: false,parentId: '1'),
    //Furniture
    CategoryModel2(id: '12', name: 'BedRoom furniture', imageUrl: TImages.furnitureIcon, isFeatured: false,parentId: '2'),
    CategoryModel2(id: '13', name: 'Kitchen Furniture', imageUrl: TImages.furnitureIcon, isFeatured: false,parentId: '2'),
    CategoryModel2(id: '14', name: 'Office furniture', imageUrl: TImages.furnitureIcon, isFeatured: false,parentId: '2'),
    //Electronics
    CategoryModel2(id: '15', name: 'Laptops', imageUrl: TImages.sportIcon, isFeatured: false,parentId: '3'),
    CategoryModel2(id: '16', name: 'Mobile phones', imageUrl: TImages.sportIcon, isFeatured: false,parentId: '3'),
    CategoryModel2(id: '17', name: '', imageUrl: TImages.sportIcon, isFeatured: false,parentId: '3'),

  ];
  static final List<CategoryModel2>products = [
    CategoryModel2(id: '1', name: 'Sport', imageUrl: TImages.sportIcon, isFeatured: true,),
    CategoryModel2(id: '2', name: 'Furniture', imageUrl: TImages.furnitureIcon, isFeatured: true),
    CategoryModel2(id: '3', name: 'Electronic', imageUrl: TImages.electronicsIcon, isFeatured: true),
    CategoryModel2(id: '4', name: 'Cloths', imageUrl: TImages.clothIcon, isFeatured: true),
    CategoryModel2(id: '5', name: 'Animal', imageUrl: TImages.animalIcon, isFeatured: true),
    CategoryModel2(id: '6', name: 'Shoes', imageUrl: TImages.shoeIcon, isFeatured: true),
    CategoryModel2(id: '7', name: 'Cosmetic', imageUrl: TImages.cosmeticsIcon, isFeatured: true),
    CategoryModel2(id: '8', name: 'Jewelery', imageUrl: TImages.jeweleryIcon, isFeatured: true),

    //subCategories
    CategoryModel2(id: '9', name: 'Sport Shoes', imageUrl: TImages.sportIcon, isFeatured: false,parentId: '1'),
    CategoryModel2(id: '10', name: 'Track Suits', imageUrl: TImages.sportIcon, isFeatured: false,parentId: '1'),
    CategoryModel2(id: '11', name: 'Sports Equipments', imageUrl: TImages.sportIcon, isFeatured: false,parentId: '1'),
    //Furniture
    CategoryModel2(id: '12', name: 'BedRoom furniture', imageUrl: TImages.furnitureIcon, isFeatured: false,parentId: '2'),
    CategoryModel2(id: '13', name: 'Kitchen Furniture', imageUrl: TImages.furnitureIcon, isFeatured: false,parentId: '2'),
    CategoryModel2(id: '14', name: 'Office furniture', imageUrl: TImages.furnitureIcon, isFeatured: false,parentId: '2'),
    //Electronics
    CategoryModel2(id: '15', name: 'Laptops', imageUrl: TImages.sportIcon, isFeatured: false,parentId: '3'),
    CategoryModel2(id: '16', name: 'Mobile phones', imageUrl: TImages.sportIcon, isFeatured: false,parentId: '3'),
    CategoryModel2(id: '17', name: '', imageUrl: TImages.sportIcon, isFeatured: false,parentId: '3'),

  ];
}


class CategoryModel2 {
  String id;
  String name;
  String parentId;
  String imageUrl;
  bool isFeatured;

  CategoryModel2(
      {required this.id,
        required this.name,
        required this.imageUrl,
        required this.isFeatured,
        this.parentId = ''});

  //empty
  static CategoryModel2 empty() =>
      CategoryModel2(id: '', name: '', imageUrl: '', isFeatured: false);

  //from json to model
  factory CategoryModel2.fromDocumentSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    if (document.data() != null) {
      final data = document.data()!;
      return CategoryModel2(
        id: document.id??'',
        name: data['name']??'',
        imageUrl: data['imageUrl']??'',
        isFeatured: data['isFeatured']??false,
      );
    } else {
      return CategoryModel2.empty();
    }
  }

//model to json
  Map<String,dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'imageUrl': imageUrl,
      'isFeatured': isFeatured,
    };
  }
}

