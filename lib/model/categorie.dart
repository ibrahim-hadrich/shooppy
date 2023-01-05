class Categorie{
  String name='',image='';
  Categorie({ required this.name, required this.image});
  Categorie.fromJson(Map<dynamic,dynamic>map){
    if(map==null){
      return;
    }
    image=map['image'];
    name=map['name'];

  }
  toJson(){
    return{
      'image':image,
      'name':name,
  };
  }
}