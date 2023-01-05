class CartProduct{
  late String  name,image,price,productID;
  late int quantity;
  CartProduct({required this.name,required this.image,required this.price,required this.quantity,required this.productID});
  CartProduct.fromJson(Map<dynamic,dynamic>map){
    if(map==null){
      return;
    }
    else{
      name=map['name'];
      image=map['image'];
      price=map['price'];
      quantity=map['quantity'];
      productID=map['productID'];
    }
  }
  toJson(){
    return {
      'name':name,
      'image':image,
      'price':price,
      'quantity':quantity,
      'productID':productID,
    };
  }
}