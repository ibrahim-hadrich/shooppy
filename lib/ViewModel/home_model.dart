import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:food_delivery/model/categorie.dart';
import 'package:food_delivery/model/product.dart';
import 'package:get/get.dart';

class HomeModel extends GetxController{
  List<Categorie> get categories=>_categories;
  List <Categorie> _categories=[];
  List<ProductModel> get product=>_product;
  List <ProductModel> _product=[];
final CollectionReference _categorieCollectionReference= FirebaseFirestore.instance.collection('Categories');
final CollectionReference _productCollectionReference= FirebaseFirestore.instance.collection('Products');
HomeModel(){
  getCategorie();
  getBestSell();
}
getCategorie() async{
  await _categorieCollectionReference.get().then((value){
    for(int i=0;i<value.docs.length;i++){
      _categories.add(Categorie.fromJson(value.docs[i].data() as Map<dynamic, dynamic>));
     // print(_categories.length);
    }
    update();
  });
}getBestSell() async{
  await _productCollectionReference.get().then((value){
    for(int i=0;i<value.docs.length;i++){
      _product.add(ProductModel.fromJson(value.docs[i].data() as Map<dynamic, dynamic>));
      //(_categories.length);
    }
    update();
  });
}

}