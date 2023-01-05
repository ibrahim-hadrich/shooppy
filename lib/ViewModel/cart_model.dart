import 'package:food_delivery/dataBase/cart_database.dart';
import 'package:food_delivery/model/cart_product.dart';
import 'package:get/get.dart';

class CartModel extends GetxController{
  List<CartProduct> _cartProduct=[];
  List<CartProduct> get cartProduct=>_cartProduct;
  double get totalPrice=>_totalPrice;
  double _totalPrice=0.0;
  var dbHelper=CartDataBase.db;

  CartModel(){
    getAllProduct();
  }
  getAllProduct()async{
    _cartProduct= await dbHelper.getAllProduct();
    getTotalPrice();
    update();
  }
  getTotalPrice(){
    for(int i=0;i<_cartProduct.length;i++){
      _totalPrice+=(double.parse(_cartProduct[i].price)*_cartProduct[i].quantity);
      print(_totalPrice);
      update();
    }
  }
  addProduct(CartProduct cartProduct) async {
    if(_cartProduct.length==0){
      await dbHelper.insert(cartProduct);
      _cartProduct.add(cartProduct);
    }else{
      for(int i=0;i<_cartProduct.length;i++){
        if(_cartProduct[i].productID==cartProduct.productID){
          return;
        }
          await dbHelper.insert(cartProduct);
          _cartProduct.add(cartProduct);
        _totalPrice+=(double.parse(cartProduct.price)*cartProduct.quantity);
      }
    }
    update();
  }
  increaseQuantity(int index)async{
    _cartProduct[index].quantity++;
    _totalPrice+=(double.parse(_cartProduct[index].price));
    await dbHelper.updateProduct(_cartProduct[index]);
    update();
  }
  decreaseQuantity(int index)async{
    _cartProduct[index].quantity--;
    _totalPrice-=(double.parse(_cartProduct[index].price));
    await dbHelper.updateProduct(_cartProduct[index]);
    update();
  }
}