// var data = [
//   {
//     "id": 0,
//     "name": "Relaxed Fit",
//     "price": 90.0,
//     "fav": false,
//     "rating": 4.5,
//     "image": "assets/images/home_screen/shose.jpg",
//     "qta": 10,
//   },
//   {
//     "id": 1,
//     "name": "Q Mobile",
//     "price": 2000.0,
//     "fav": false,
//     "rating": 4.5,
//     "image": "assets/images/home_screen/mobile.jpg",
//     "qta": 10,
//   },
//   {
//     "id": 2,
//     "name": "Apple Watch",
//     "price": 299.0,
//     "fav": false,
//     "rating": 4.5,
//     "image": "assets/images/home_screen/watch.jpg",
//     "qta": 10,
//   },
//   {
//     "id": 3,
//     "name": "Red Wine",
//     "price": 3001.0,
//     "fav": false,
//     "rating": 3.5,
//     "image": "assets/images/home_screen/red_wine.png",
//     "qta": 10,
//   },
//   {
//     "id": 4,
//     "name": "J. Perfume",
//     "price": 400.0,
//     "fav": false,
//     "rating": 4.5,
//     "image": "assets/images/home_screen/pr.jpg",
//     "qta": 10,
//   }
// ];

class ShopItemModel {
  String? userId;
  String? name;
  double? price;
  double? total;
  bool? fav;
  int qta;
  double? rating;
  String? image;
  int? id;
  int? total_qta;
  int? shopId;

  ShopItemModel({
    this.userId,
    this.shopId,
    this.id,
    this.fav,
    this.rating,
    this.price,
    this.image,
    this.name,
    this.total,
    this.total_qta,
    required this.qta,
  });

  factory ShopItemModel.fromJson(Map<String, dynamic> json) {
    return ShopItemModel(
        userId: json['user_id'],
        id: json['id'],
        fav: json['fav'] == 1,
        rating: json['rating'],
        price: json['price'],
        image: json['image'],
        name: json['name'],
        total: json['total'],
        shopId: json['shop_id'] ?? 0,
        qta: json['qta'] ?? 0,
        total_qta: json['total_qta']);
  }
}
