import 'package:get/get.dart';
import 'package:saholatkar/controller/RemoveFromCart/remove_from_cart.dart';
import 'package:saholatkar/model/product_model/Product_Model.dart';

class Product_Controller extends GetxController {
  // ItemServices itemServices = ItemServices();
  List<ShopItemModel> items = [];
  List<ShopItemModel> cartItems = [];
  double? _ac_price = 0;
  double? get ac_price => _ac_price;
  int product_count = 0;
  int detailProductCount = 0;

  double updateIndivualPrice(int index) {
    final price = _ac_price = cartItems[index].price;
    _ac_price = cartItems[index].qta * price!;
    return _ac_price!;
  }

  int checkIndivualQuantity(int id) {
    for (var item in cartItems) {
      print(id);
      if (item.id == id) {
        return item.qta;
      }
    }
    return 0;
  }

  increment(int index) {
    final qt = cartItems[index].qta;

    final total_qta = cartItems[index].total_qta;
    print(total_qta);
    final qta = cartItems[index].qta += 1;


      print('here $qta');
      final price = cartItems[index].price;
      double total = cartItems[index].qta * price!;
      _ac_price = cartItems[index].qta * price;
      final id = cartItems[index].id;
      final data = ShopItemModel(
        qta: qta,
        total: total,
        id: id,
      );

      //loadDB();
      update();

      // itemServices.update_qta(data);
    //increse_update(id,in_total);
  }
  incrementPro() {
    detailProductCount++;
    update();
  }

  decrement(int index) {
    if (cartItems[index].qta <= 1) {
      //remove

      // ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      //     content: Text(
      //         "Item removed from cart successfully")));
    } else {
      final qt = cartItems[index].qta;
      print(qt);
      final qta = cartItems[index].qta -= 1;
      final price = cartItems[index].price;
      double total = cartItems[index].total! - price!;
      final id = cartItems[index].id;
      final data = ShopItemModel(
        qta: qta,
        total: total,
        id: id,
      );

      print(total);
      //loadDB();
      update();
    }
  }

  decrementPro() {
    if(detailProductCount>1) {
      detailProductCount--;
    }
    update();
  }

  productDetailIncrement(int index) {
    final qt = cartItems[index].qta;

    final total_qta = cartItems[index].total_qta;
    print(total_qta);
    final qta = cartItems[index].qta += 1;
    if (total_qta! >= qta) {
      final price = cartItems[index].price;
      double total = cartItems[index].qta * price!;
      _ac_price = cartItems[index].qta * price;
      final id = cartItems[index].id;
      final data = ShopItemModel(
        qta: qta,
        total: total,
        id: id,
      );

      //loadDB();
      update();

    }


    //increse_update(id,in_total);
  }
  clear(){
    cartItems.clear();
    update();
  }
  productDetailDecrement(int index) {
    if (cartItems[index].qta <= 1) {
      //remove

      // ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      //     content: Text(
      //         "Item removed from cart successfully")));
    } else {
      final qt = cartItems[index].qta;
      print(qt);
      final qta = cartItems[index].qta -= 1;
      final price = cartItems[index].price;
      double total = cartItems[index].total! - price!;
      final id = cartItems[index].id;
      final data = ShopItemModel(
        qta: qta,
        total: total,
        id: id,
      );

      print(total);
      //loadDB();
      update();
    }
  }

  RxDouble _total = 0.0.obs;

  RxDouble? get total => _total;
  double totalC = 0.0;
  bool isLoading = true;

  @override
  void onInit() {
    detailProductCount = 0;

    super.onInit();

  }


  setTotal(double val){
    totalC = val;
    update();
  }
  getItem(int id) {
    return items.singleWhere((element) => element.id == id);
  }

  bool isAlreadyInCart(id) {
    return cartItems.indexWhere((element) => element.shopId == id) > -1;
  }

  // getCardList() async {
  //   try {
  //     List list = await itemServices.getCartList();
  //     cartItems.clear();
  //     list.forEach((element) {
  //       cartItems.add(ShopItemModel.fromJson(element));
  //     });
  //     update();
  //   } catch (e) {
  //     print(e);
  //   }
  // }

  // loadItems() async {
  //   try {
  //     isLoading = true;
  //     update();
  //
  //     List list = await itemServices.loadItems();
  //     list.forEach((element) {
  //       items.add(ShopItemModel.fromJson(element));
  //     });
  //
  //     isLoading = false;
  //     update();
  //   } catch (e) {
  //     print(e);
  //   }
  // }

  // setToFav(int id, bool flag) async {
  //   int index = items.indexWhere((element) => element.id == id);
  //
  //   items[index].fav = flag;
  //   update();
  //   try {
  //     await itemServices.setItemAsFavourite(id, flag);
  //   } catch (e) {
  //     print(e);
  //   }
  // }

  // Future addToCart(ShopItemModel item) async {
  //   isLoading = true;
  //   update();
  //   var result = await itemServices.addToCart(item);
  //   isLoading = false;
  //   update();
  //   return result;
  // }

  removeFromAdmin(int shopId)async{
    await RemoveFromCartController().removeFromCart(shopId);
  }
  // removeFromCart(int productId) async {
  //   itemServices.removeFromCart(productId);
  //   int index = cartItems.indexWhere((element) => element.id == productId);
  //   cartItems.removeAt(index);
  //   update();
  // }
  // empty(int productId) async {
  //   print('empty');
  //   itemServices.removeFromCart(productId);
  //   update();
  // }
}
