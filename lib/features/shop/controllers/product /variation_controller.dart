import 'package:get/get.dart';
import 'package:t_store/features/shop/controllers/product%20/image_controller.dart';
import 'package:t_store/features/shop/models/product_model.dart';
import 'package:t_store/features/shop/models/product_variation_model.dart';

import 'cart_controller.dart';

class VariationController extends GetxController {
  static VariationController get instance => Get.find();

  RxMap selectedAttributes = {}.obs;
  RxString variationStackStatus = ''.obs;
  Rx<ProductVariationModel> selectedVariation = ProductVariationModel.empty().obs;

  void onAttributeSelected(ProductModel product, attributeName, attributeValue) {
    final selectedAttributes = Map<String, dynamic>.from(this.selectedAttributes);
    selectedAttributes[attributeName] = attributeValue;
    this.selectedAttributes[attributeName] = attributeValue;

    final selectedVariation = product.productVariations!.firstWhere(
        (variation) => _isSameAttributeValues(variation.attributeValues, selectedAttributes),
        orElse: () => ProductVariationModel.empty());

    if (selectedVariation.id.isNotEmpty) {
      final cartController = CartController.instance;
      cartController.productQuantityInCart.value =
          cartController.getVariationQuantityInCart(product.id, selectedVariation.id);
    }

    if (selectedVariation.image.isNotEmpty) {
      ImageController.instance.selectedProductImage.value = selectedVariation.image;
    } else {
      // ImageController.instance.selectedProductImage.value =
    }
    this.selectedVariation.value = selectedVariation;
  }

  bool _isSameAttributeValues(Map<String, dynamic> variationAttributes, Map<String, dynamic> selectedAttributes) {
    if (variationAttributes.length != selectedAttributes.length) return false;

    for (final key in variationAttributes.keys) {
      if (variationAttributes[key] != selectedAttributes[key]) return false;
    }
    return true;
  }

  Set<String?> getAttributesAvailabilityInVariation(List<ProductVariationModel> variations, String attributeName) {
    final availableVariationAttributeValues = variations
        .where((variation) => variation.attributeValues[attributeName]!.isNotEmpty && variation.stock > 0)
        .map((variation) => variation.attributeValues[attributeName])
        .toSet();

    return availableVariationAttributeValues;
  }

  void getProductVariationStockStatus() {
    variationStackStatus.value = selectedVariation.value.stock > 0 ? 'In Stock' : 'Out of Stock';
  }

  String getVariationPrice() {
    return (selectedVariation.value.salePrice > 0 ? selectedVariation.value.salePrice : selectedVariation.value.price)
        .toString();
  }

  void resetSelectedAttributes() {
    selectedAttributes.clear();
    variationStackStatus.value = '';
    selectedVariation.value = ProductVariationModel.empty();
  }
}
