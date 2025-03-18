import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get_it/get_it.dart';
import 'package:store_app/core/di/dependency_injection.dart';
import 'package:store_app/core/helpers/spacing.dart';
import 'package:store_app/core/theming/colors.dart';
import 'package:store_app/features/cart/constants/constants.dart';
import 'package:store_app/features/cart/cubit/cart_cubit.dart';
import 'package:store_app/features/home/data/models/products_response_model.dart';

// ignore: must_be_immutable
class CartScreen extends StatefulWidget {
  CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  List<ProductsData> vv = [];

  List<int> counter = [];

  @override
  Widget build(BuildContext context) {
    // final cubit = GetIt.I<CartCubit>();
    //final cubit = getIt<CartCubit>();
    return BlocProvider.value(
      value: cubitCart,
      //create: (context) => getIt<CartCubit>(),
      child: BlocBuilder<CartCubit, CartState>(
        // bloc: GetIt.I<CartCubit>(),
        // bloc: cubitCart,
        builder: (context, state) {
          if (state is ProductsCart) {
            return Scaffold(
              body: Padding(
                padding: EdgeInsets.symmetric(vertical: 0.h, horizontal: 8.0.w),
                child: Column(
                  children: [
                    //   Text("Cart"),
                    Expanded(
                      child: ListView.builder(
                          itemCount: state.cart.length,
                          itemBuilder: (context, index) {
                            vv = state.cart.keys
                                .map((convert) => convert)
                                .toList();
                            counter = state.cart.values
                                .map((toElement) => toElement)
                                .toList();
                            return Stack(
                              children: [
                                Container(
                                  margin: EdgeInsets.symmetric(vertical: 10.h),
                                  height: 100.h,
                                  decoration: BoxDecoration(
                                      color: ColorManager.white,
                                      borderRadius: BorderRadius.circular(15)),
                                  child: Row(
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.symmetric(
                                          horizontal: 15.w,
                                        ),
                                        child: Container(
                                          // height: 70.h,
                                          width: 80.w,
                                          decoration: BoxDecoration(
                                              // color: Colors.amber,
                                              borderRadius:
                                                  BorderRadius.circular(15)),
                                          child: Image.network(
                                            "${vv[index].image}",
                                            height: 60.h,
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "${vv[index].title}",
                                              maxLines: 1,
                                              style: TextStyle(
                                                  overflow:
                                                      TextOverflow.ellipsis),
                                            ),
                                            Text("${vv[index].category}"),
                                            Row(
                                              children: [
                                                SvgPicture.asset(
                                                  "assets/svgs/star.svg",
                                                  width: 15,
                                                ),
                                                horizontalSpace(2),
                                                Text(
                                                    "${vv[index].rating!.rate}"),
                                              ],
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text("\$${vv[index].price}"),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Positioned(
                                    top: 60,
                                    right: 20,
                                    child: Container(
                                      height: 40.h,
                                      width: 95.w,
                                      decoration: BoxDecoration(
                                        //  color: Colors.grey.shade300,
                                        borderRadius: BorderRadius.circular(8),
                                        border: Border.all(
                                            color: Colors.black26, width: 1),
                                      ),
                                      child: Stack(
                                        children: [
                                          Positioned(
                                            top: 8,
                                            left: 5,
                                            child: GestureDetector(
                                              onTap: () {
                                                // cubit.decrement(
                                                //     cubit.cartProductes[index]);
                                              },
                                              child: Icon(
                                                Icons.remove,
                                                size: 20,
                                              ),
                                            ),
                                          ),
                                          Positioned(
                                              top: 8,
                                              left: 35,
                                              child: Text("${counter[index]}")),
                                          Positioned(
                                            right: 0,
                                            top: 0,
                                            child: GestureDetector(
                                              onTap: () {
                                                // cubit.increment(
                                                //     cubit.cartProductes[index]);
                                              },
                                              child: Container(
                                                height: 37.7.h,
                                                width: 36.w,
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                    gradient: LinearGradient(
                                                      colors: [
                                                        ColorManager.royalBlue,
                                                        ColorManager.darkPurple
                                                      ],
                                                      begin:
                                                          Alignment.centerLeft,
                                                      end:
                                                          Alignment.centerRight,
                                                    )),
                                                child: Icon(
                                                  color: Colors.white,
                                                  Icons.add,
                                                  size: 20,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    )
                                    //  BottomCounter(
                                    //   d: state.cart.keys,
                                    // ),
                                    ),
                              ],
                            );
                          }),
                    ),
                    Container(
                      height: 250.h,
                      decoration: BoxDecoration(
                          color: Colors.grey.withOpacity(0.4),
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(30),
                              topRight: Radius.circular(30))),
                    ),
                  ],
                ),
              ),
            );
          } else {
            return Center(child: Text("data"));
          }
        },
      ),
    );
  }

  // @override
  // void dispose() {
  //   cubitCart.close(); // أغلقه هنا
  //   super.dispose();
  // }
}

class BottomCounter extends StatelessWidget {
  final d;
  const BottomCounter({
    super.key,
    this.d,
  });

  @override
  Widget build(BuildContext context) {
    final cubit = GetIt.I<CartCubit>();
    return Container(
      height: 40.h,
      width: 95.w,
      decoration: BoxDecoration(
        //  color: Colors.grey.shade300,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.black26, width: 1),
      ),
      child: Stack(
        children: [
          Positioned(
            top: 8,
            left: 5,
            child: GestureDetector(
              onTap: () {
                // context.read<CartCubit>().increment();
                //  getIt<CartCubit>().increment(d);
              },
              child: Icon(
                Icons.remove,
                size: 20,
              ),
            ),
          ),
          BlocBuilder<CartCubit, CartState>(
            bloc: cubit,
            builder: (context, state) {
              return Positioned(top: 8, left: 35, child: Text("${cubit}"));
            },
          ),
          Positioned(
            right: 0,
            top: 0,
            child: GestureDetector(
              onTap: () {
                //getIt<CartCubit>().increment();
                // cubit.increment();
              },
              child: Container(
                height: 37.7.h,
                width: 36.w,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                    gradient: LinearGradient(
                      colors: [ColorManager.royalBlue, ColorManager.darkPurple],
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                    )),
                child: Icon(
                  color: Colors.white,
                  Icons.add,
                  size: 20,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
