// part of 'products_bloc.dart';

// abstract class ProductsEvent extends Equatable {
//   const ProductsEvent();

//   @override
//   List<Object> get props => [];
// }

// class ProductEventGetAllProduts extends ProductsEvent {}

// class UploadDataToOnlineDataBase extends ProductsEvent {}

// class ProductEventDeleteProduct extends ProductsEvent {
//   final int id;
//   const ProductEventDeleteProduct({required this.id});
//   @override
//   List<Object> get props => [id];
// }

// class ProductEventGetSingProduct extends ProductsEvent {
//   final int id;
//   const ProductEventGetSingProduct({required this.id});
//   @override
//   List<Object> get props => [id];
// }

// class ProductEventCreateProduct extends ProductsEvent {
//   final String customer;
//   final String product;
//   final String brand;
//   final String category;
//   final String brandCategory;
//   final int quantity;
//   final String type;
//   final String image;
//   const ProductEventCreateProduct(
//       {required this.customer,
//       required this.product,
//       required this.brand,
//       required this.category,
//       required this.brandCategory,
//       required this.quantity,
//       required this.type,
//       required this.image});

//   @override
//   List<Object> get props =>
//       [customer, product, brand, category, brand, quantity, type, image];
// }

// class ProductEventUpdateProduct extends ProductsEvent {
//   final String? customer;
//   final String? product;
//   final String? brand;
//   final String? category;
//   final String? brandCategory;
//   final int? quantity;
//   final String? type;
//   final int id;
//   final String? image;
//   const ProductEventUpdateProduct({
//     required this.id,
//     this.customer,
//     this.product,
//     this.brand,
//     this.category,
//     this.brandCategory,
//     this.quantity,
//     this.type,
//     this.image,
//   });
// }
