class Category {
  String name;
  List<Contents> contents;

  Category.fromJson(Map json) {
    List _list = <Contents>[];
    json['contents'].forEach((item) {
      _list.add(Contents.fromJson(item));
    });
    this.name = json["name"];
    this.contents = _list;
  }
}

class Contents {
  String name;
  String price;
  String image;
  String subText;

  Contents.fromJson(Map json) {
    this.name = json['name'];
    this.price = json['price'];
    this.image = json['image'];
    this.subText = json['subText'];
  }
}
