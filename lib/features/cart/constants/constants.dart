// import 'package:store_app/core/di/dependency_injection.dart';
// import 'package:store_app/features/cart/cubit/cart_cubit.dart';

// class GetItCubit {
// static final getItAddCart = getIt<CartCubit>();
// }

import 'package:get_it/get_it.dart';
import 'package:store_app/core/di/dependency_injection.dart';
import 'package:store_app/features/cart/cubit/cart_cubit.dart';

// final cubitCart = getIt<CartCubit>();
final cubitCart = CartCubit();
