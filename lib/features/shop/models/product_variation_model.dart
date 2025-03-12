class ProductVariationModel {
  final String id;
  String sku;
  String image;
  String? description;
  double price;
  double salePrice;
  int stock;
  Map<String, String> attributeValues;

  ProductVariationModel({
    required this.id,
    this.sku = '',
    this.image = '',
    this.description = '',
    this.price = 0.0,
    this.salePrice = 0.0,
    this.stock = 0,
    required this.attributeValues,
  });

  static ProductVariationModel empty() => ProductVariationModel(id: '', attributeValues: {});

  toJson() {
    return {
      'Id': id,
      'Image': image,
      'Description': description,
      'SKU': sku,
      'Price': price,
      'SalePrice': salePrice,
      'Stock': stock,
      'AttributeValues': attributeValues
    };
  }

  factory ProductVariationModel.fromJson(Map<String, dynamic> document) {
    final data = document;

    if (data.isEmpty) return ProductVariationModel.empty();

    return ProductVariationModel(
      id: data['Id'],
      attributeValues: Map<String, String>.from(data['AttributeValues']),
      price: double.parse((data['Price'] ?? 0.0).toString()),
      sku: data['SKU'] ?? '',
      stock: data['Stock'] ?? 0,
      salePrice: double.parse((data['SalePrice'] ?? 0.0).toString()),
      image: data['Image'] ?? '',
    );
  }
}
