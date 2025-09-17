import '../../features/shop/models/banner_model.dart';
import '../../features/shop/models/brand_model.dart';
import '../../features/shop/models/category_model.dart';
import '../../features/shop/models/product_attribute_model.dart';
import '../../features/shop/models/product_model.dart';
import '../../features/shop/models/product_variation_model.dart';
import '../../routes/routes.dart';
import '../../utils/constants/image_strings.dart';

class DummyData {
  static final List<BannerModel> banners = [
    BannerModel(imageUrl: TImages.banner1, targetScreen: TRoutes.order, active: false),
    BannerModel(imageUrl: TImages.banner2, targetScreen: TRoutes.cart, active: true),
    BannerModel(imageUrl: TImages.banner3, targetScreen: TRoutes.favourites, active: true),
    BannerModel(imageUrl: TImages.banner4, targetScreen: TRoutes.search, active: true),
    BannerModel(imageUrl: TImages.banner5, targetScreen: TRoutes.settings, active: true),
    BannerModel(imageUrl: TImages.banner6, targetScreen: TRoutes.userAddress, active: true),
    BannerModel(imageUrl: TImages.banner8, targetScreen: TRoutes.checkout, active: false),
  ];

  static final List<ProductModel> products = [
    ProductModel(
        id: '001',
        title: 'Green Nike sports shoe',
        stock: 15,
        price: 135,
        isFeatured: true,
        thumbnail: TImages.productImage1,
        description: 'Green Nike sports shoe',
        brand: BrandModel(
          id: '1',
          image: TImages.nikeLogo,
          name: 'Nike',
          productsCount: 265,
          isFeatured: true,
        ),
        images: [
          TImages.productImage1,
          TImages.productImage23,
          TImages.productImage21,
          TImages.productImage9,
        ],
        salePrice: 30,
        sku: 'ABR4568',
        categoryId: '1',
        productAttributes: [
          ProductAttributeModel(name: 'Color', values: ['Green', 'Black', 'Red']),
          ProductAttributeModel(name: 'Size', values: ['EU 30', 'EU 32', 'EU 34']),
        ],
        productVariations: [
          ProductVariationModel(
            id: '1',
            stock: 34,
            price: 134,
            salePrice: 122.6,
            image: TImages.productImage1,
            description: 'This is a Product description for Green Nike sports shoe.',
            attributeValues: {'Color': 'Green', 'Size': 'EU 34'},
          ),
          ProductVariationModel(
            id: '3',
            stock: 12,
            price: 234,
            image: TImages.productImage23,
            attributeValues: {'Color': 'Black', 'Size': 'EU 34'},
          ),
          ProductVariationModel(
            id: '5',
            stock: 10,
            price: 334,
            salePrice: 200,
            image: TImages.productImage21,
            attributeValues: {'Color': 'Red', 'Size': 'EU 34'},
          ),
          ProductVariationModel(
            id: '6',
            stock: 11,
            price: 332,
            image: TImages.productImage9,
            attributeValues: {'Color': 'Red', 'Size': 'EU 32'},
          ),
        ],
        productType: 'ProductType.variable'),
    ProductModel(
        id: '002',
        title: 'Adidas Ultraboost 22',
        stock: 20,
        price: 150,
        isFeatured: true,
        thumbnail: TImages.productImage2,
        description: 'High-performance Adidas Ultraboost running shoes.',
        brand: BrandModel(
          id: '2',
          image: TImages.adidasLogo,
          name: 'Adidas',
          productsCount: 320,
          isFeatured: true,
        ),
        images: [
          TImages.productImage2,
          TImages.productImage24,
          TImages.productImage22,
          TImages.productImage10,
        ],
        salePrice: 40,
        sku: 'ABD1234',
        categoryId: '2',
        productAttributes: [
          ProductAttributeModel(name: 'Color', values: ['Blue', 'White', 'Black']),
          ProductAttributeModel(name: 'Size', values: ['EU 40', 'EU 42', 'EU 44']),
        ],
        productVariations: [
          ProductVariationModel(
            id: '7',
            stock: 50,
            price: 140,
            salePrice: 130,
            image: TImages.productImage2,
            description: 'Comfortable Adidas Ultraboost shoes for running.',
            attributeValues: {'Color': 'Blue', 'Size': 'EU 42'},
          ),
          ProductVariationModel(
            id: '8',
            stock: 10,
            price: 160,
            image: TImages.productImage24,
            attributeValues: {'Color': 'Black', 'Size': 'EU 44'},
          ),
        ],
        productType: 'ProductType.variable'),
    ProductModel(
        id: '003',
        title: 'Puma RS-X',
        stock: 25,
        price: 120,
        isFeatured: true,
        thumbnail: TImages.productImage3,
        description: 'Stylish Puma RS-X sneakers for casual wear.',
        brand: BrandModel(
          id: '3',
          image: TImages.pumaLogo,
          name: 'Puma',
          productsCount: 210,
          isFeatured: false,
        ),
        images: [
          TImages.productImage3,
          TImages.productImage25,
          TImages.productImage23,
        ],
        salePrice: 35,
        sku: 'PUM5678',
        categoryId: '3',
        productAttributes: [
          ProductAttributeModel(name: 'Color', values: ['Red', 'Yellow', 'Grey']),
          ProductAttributeModel(name: 'Size', values: ['EU 39', 'EU 41', 'EU 43']),
        ],
        productVariations: [
          ProductVariationModel(
            id: '9',
            stock: 30,
            price: 110,
            salePrice: 100,
            image: TImages.productImage3,
            description: 'Trendy Puma RS-X sneakers with modern design.',
            attributeValues: {'Color': 'Red', 'Size': 'EU 41'},
          ),
          ProductVariationModel(
            id: '10',
            stock: 15,
            price: 130,
            image: TImages.productImage25,
            attributeValues: {'Color': 'Grey', 'Size': 'EU 43'},
          ),
        ],
        productType: 'ProductType.variable'),
    ProductModel(
        id: '004',
        title: 'New Balance 574',
        stock: 18,
        price: 100,
        isFeatured: true,
        thumbnail: TImages.productImage4,
        description: 'Classic New Balance 574 shoes for all-day comfort.',
        brand: BrandModel(
          id: '4',
          image: TImages.productImage6,
          name: 'New Balance',
          productsCount: 180,
          isFeatured: true,
        ),
        images: [
          TImages.productImage4,
          TImages.productImage26,
        ],
        salePrice: 25,
        sku: 'NB574',
        categoryId: '4',
        productAttributes: [
          ProductAttributeModel(name: 'Color', values: ['Grey', 'White', 'Blue']),
          ProductAttributeModel(name: 'Size', values: ['EU 38', 'EU 40', 'EU 42']),
        ],
        productVariations: [
          ProductVariationModel(
            id: '11',
            stock: 25,
            price: 95,
            salePrice: 85,
            image: TImages.productImage4,
            description: 'Lightweight and stylish New Balance 574 sneakers.',
            attributeValues: {'Color': 'White', 'Size': 'EU 40'},
          ),
          ProductVariationModel(
            id: '12',
            stock: 12,
            price: 105,
            image: TImages.productImage26,
            attributeValues: {'Color': 'Grey', 'Size': 'EU 42'},
          ),
        ],
        productType: 'ProductType.variable'),
    ProductModel(
        id: '005',
        title: 'Reebok Club C 85',
        stock: 12,
        price: 90,
        isFeatured: true,
        thumbnail: TImages.productImage5,
        description: 'Timeless Reebok Club C 85 sneakers for a classic look.',
        brand: BrandModel(
          id: '5',
          image: TImages.lightAppLogo,
          name: 'Reebok',
          productsCount: 140,
          isFeatured: false,
        ),
        images: [
          TImages.productImage5,
          TImages.productImage27,
        ],
        salePrice: 20,
        sku: 'RBK85',
        categoryId: '5',
        productAttributes: [
          ProductAttributeModel(name: 'Color', values: ['White', 'Green']),
          ProductAttributeModel(name: 'Size', values: ['EU 41', 'EU 43']),
        ],
        productVariations: [
          ProductVariationModel(
            id: '13',
            stock: 10,
            price: 85,
            salePrice: 75,
            image: TImages.productImage5,
            description: 'Minimalist Reebok Club C 85 with premium comfort.',
            attributeValues: {'Color': 'White', 'Size': 'EU 41'},
          ),
          ProductVariationModel(
            id: '14',
            stock: 8,
            price: 95,
            image: TImages.productImage27,
            attributeValues: {'Color': 'Green', 'Size': 'EU 43'},
          ),
        ],
        productType: 'ProductType.variable'),
    ProductModel(
        id: '006',
        title: 'Nike Air Max Plus',
        stock: 10,
        price: 500,
        isFeatured: true,
        thumbnail: 'assets/images/products/nike/air_max_plus/nike_plus_1.png',
        description: 'Timeless Reebok Club C 85 sneakers for a classic look.',
        brand: BrandModel(
          id: '1',
          image: TImages.nikeLogo,
          name: 'Nike',
          productsCount: 50,
          isFeatured: true,
        ),
        images: [
          'assets/images/products/nike/air_max_plus/nike_plus_1.png',
          'assets/images/products/nike/air_max_plus/nike_plus_2.png',
          'assets/images/products/nike/air_max_plus/nike_plus_3.png',
          'assets/images/products/nike/air_max_plus/nike_plus_4.png',
          'assets/images/products/nike/air_max_plus/nike_plus_5.png',
          'assets/images/products/nike/air_max_plus/nike_plus_6.png',
        ],
        salePrice: 350,
        sku: 'RBK85',
        categoryId: '5',
        productAttributes: [
          ProductAttributeModel(name: 'Color', values: ['Black', 'Blue', 'Red', 'White', 'Yellow']),
          ProductAttributeModel(name: 'Size', values: ['EU 41', 'EU 43']),
        ],
        productVariations: [
          ProductVariationModel(
            id: '1',
            stock: 10,
            price: 85,
            salePrice: 75,
            image: 'assets/images/products/nike/air_max_plus/nike_plus_1.png',
            description:
                'Let your attitude have the edge in the Air Max Plus. Its iconic caging adds heat to your look while airy mesh keeps you cool. And the visible cushioning lets you celebrate your defiant style in comfort.',
            attributeValues: {'Color': 'White', 'Size': 'EU 41'},
          ),
          ProductVariationModel(
            id: '2',
            stock: 8,
            price: 100,
            image: 'assets/images/products/nike/air_max_plus/nike_plus_2.png',
            attributeValues: {'Color': 'Yellow', 'Size': 'EU 43'},
          ),
          ProductVariationModel(
            id: '3',
            stock: 4,
            price: 120,
            image: 'assets/images/products/nike/air_max_plus/nike_plus_3.png',
            attributeValues: {'Color': 'Black', 'Size': 'EU 43'},
          ),
          ProductVariationModel(
            id: '4',
            stock: 10,
            price: 90,
            image: 'assets/images/products/nike/air_max_plus/nike_plus_4.png',
            attributeValues: {'Color': 'Blue', 'Size': 'EU 41'},
          ),
          ProductVariationModel(
            id: '5',
            stock: 30,
            price: 200,
            image: 'assets/images/products/nike/air_max_plus/nike_plus_5.png',
            attributeValues: {'Color': 'Black', 'Size': 'EU 43'},
          ),
          ProductVariationModel(
            id: '6',
            stock: 30,
            price: 200,
            image: 'assets/images/products/nike/air_max_plus/nike_plus_6.png',
            attributeValues: {'Color': 'White', 'Size': 'EU 41s'},
          ),
        ],
        productType: 'ProductType.variable'),
  ];

  static final List<CategoryModel> categories = [
    CategoryModel(id: '1', image: TImages.sportIcon, name: 'Sports', isFeatured: true),
    CategoryModel(id: '2', image: TImages.furnitureIcon, name: 'Furniture', isFeatured: true),
    CategoryModel(id: '3', image: TImages.electronicsIcon, name: 'Electronics', isFeatured: true),
    CategoryModel(id: '4', image: TImages.clothIcon, name: 'Clothes', isFeatured: true),
    CategoryModel(id: '5', image: TImages.animalIcon, name: 'Animals', isFeatured: true),
    CategoryModel(id: '6', image: TImages.shoeIcon, name: 'Shoes', isFeatured: true),
    CategoryModel(id: '7', image: TImages.cosmeticsIcon, name: 'Cosmetics', isFeatured: true),
    CategoryModel(id: '14', image: TImages.jeweleryIcon, name: 'Jewelry', isFeatured: true),

    /// Subcategories
    CategoryModel(id: '8', image: TImages.sportIcon, name: 'Sport Shoes', parentId: '1', isFeatured: false),
    CategoryModel(id: '9', image: TImages.sportIcon, name: 'Track suits', parentId: '1', isFeatured: false),
    CategoryModel(id: '10', image: TImages.sportIcon, name: 'Tracks Equipments', parentId: '1', isFeatured: false),

    /// Furniture
    CategoryModel(id: '11', image: TImages.furnitureIcon, name: 'Bedroom furniture', parentId: '5', isFeatured: false),
    CategoryModel(id: '12', image: TImages.furnitureIcon, name: 'Kitchen furniture', parentId: '5', isFeatured: false),
    CategoryModel(id: '13', image: TImages.furnitureIcon, name: 'Office furniture', parentId: '5', isFeatured: false),

    /// Electronics
    CategoryModel(id: '15', image: TImages.electronicsIcon, name: 'Laptop', parentId: '2', isFeatured: false),
    CategoryModel(id: '16', image: TImages.electronicsIcon, name: 'Mobile', parentId: '2', isFeatured: false),
  ];
}
