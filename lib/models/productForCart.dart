class productForCart {
  Product? product;
  int? quantity;

  productForCart({this.product, this.quantity});

  productForCart.fromJson(Map<String, dynamic> json) {
    product =
        json['product'] != null ? new Product.fromJson(json['product']) : null;
    quantity = json['quantity'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.product != null) {
      data['product'] = this.product!.toJson();
    }
    data['quantity'] = this.quantity;
    return data;
  }
}

class Product {
  String? sId;
  String? productName;
  String? seller;
  String? productCategory;
  String? stock;
  String? description;
  String? price;
  String? productImage;
  String? image;

  Product(
      {this.sId,
      this.productName,
      this.seller,
      this.productCategory,
      this.stock,
      this.description,
      this.price,
      this.productImage,
      this.image});

  Product.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    productName = json['productName'];
    seller = json['seller'];
    productCategory = json['productCategory'];
    stock = json['stock'];
    description = json['description'];
    price = json['price'];
    productImage = json['productImage'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['productName'] = this.productName;
    data['seller'] = this.seller;
    data['productCategory'] = this.productCategory;
    data['stock'] = this.stock;
    data['description'] = this.description;
    data['price'] = this.price;
    data['productImage'] = this.productImage;
    data['image'] = this.image;
    return data;
  }
}
