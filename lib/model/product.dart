class ProductModel{
  late String  name,image,description,color,sized,price,shDesc,productID;
  late int rate;
  ProductModel({required this.name,required this.image,required this.color,
    required this.description,required this.sized,required this.price,required this.shDesc,required this.rate,required this.productID
  });
  ProductModel.fromJson(Map<dynamic,dynamic>map){
    if(map==null){
      return;
    }
    else{
      name=map['name'];
      image=map['image'];
      description=map['description'];
      color=map['color'];
      sized=map['sized'];
      price=map['price'];
      shDesc=map['shortDesc'];
      rate=map['rate'];
      productID=map['productID'];
    }
  }
  toJson(){
    return {
    'name':name,
    'image':image,
    'description':description,
    'color':color,
    'sized':sized,
    'price':price,
    'shortDesc':shDesc,
    'rate':rate,
    'productID':productID,
  };
  }
}