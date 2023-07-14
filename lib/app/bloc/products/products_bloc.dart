// import 'package:bloc/bloc.dart';
// import 'package:equatable/equatable.dart';
// import 'package:netapp/utilities/db_helper.dart';

// part 'products_event.dart';
// part 'products_state.dart';

// class ProductsBloc extends Bloc<ProductsEvent, ProductsState> {
//   ProductsBloc(SQLHelper sqlHelper) : super(ProductsInitial()) {
//     on<ProductEventGetAllProduts>((event, emit) async {
//       emit(ProductStateIsLoading());

//       try {
//         // final products = await sqlHelper.getData();
//         // emit(ProductStateAllProductsRetrieved(products: products));
//       } catch (e) {
//         emit(ProductStateError());
//       }
//     });

//     on<ProductEventDeleteProduct>((event, emit) async {
//       emit(ProductStateIsLoading());

//       try {
//         final int id = event.id;
//         final deletedProduct = await sqlHelper.deleteData(id);

//         emit(ProductStateProductDeleted());
//       } catch (e) {
//         emit(ProductStateError());
//       }
//     });

//     on<ProductEventCreateProduct>((event, emit) async {
//       emit(ProductStateIsLoading());

//       try {
//         final productId = await sqlHelper.createData(
//             product: event.product,
//             brand: event.brand,
//             customer: event.customer,
//             category: event.category,
//             brandCategory: event.brandCategory,
//             quantity: event.quantity,
//             type: event.type,
//             image: event.image);
//         // final products = await sqlHelper.getData();
//         emit(ProductStateAllProductsRetrieved(products: products));
//       } catch (e) {
//         emit(ProductStateError());
//       }
//     });
//     on<ProductEventUpdateProduct>((event, emit) async {
//       emit(ProductStateIsLoading());

//       try {
//         final productId = await sqlHelper.updateData(
//             id: event.id,
//             product: event.product!,
//             brand: event.brand!,
//             customer: event.customer!,
//             category: event.category!,
//             brandCategory: event.brandCategory!,
//             quantity: event.quantity!,
//             type: event.type!);
//         // final products = await sqlHelper.getData();
//         emit(ProductStateAllProductsRetrieved(products: products));
//       } catch (e) {
//         emit(ProductStateError());
//       }
//     });
//     // on<ProductEventDeleteItem>((event, emit) async {
//     //   emit(ProductStateIsLoading());

//     //   try {
//     //     final productId = await sqlHelper.deleteData(event.id);
//     //     final products = await sqlHelper.getData();
//     //     emit(ProductStateAllProductsRetrieved(products: products));
//     //   } catch (e) {
//     //     emit(ProductStateError());
//     //   }
//     // });
//   }
// }
