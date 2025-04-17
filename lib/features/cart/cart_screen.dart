import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:store_app/core/helpers/spacing.dart';
import 'package:store_app/core/theming/colors.dart';
import 'package:store_app/features/cart/constants/constants.dart';
import 'package:store_app/features/cart/cubit/cart_cubit.dart';
import 'package:store_app/features/home/data/models/products_response_model.dart';

// ignore: must_be_immutable
class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  List<ProductsData> vv = [];

  List<int> counter = [];

  @override
  Widget build(BuildContext context) {
   
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: const Text("My Cart"),
        centerTitle: true,
      ),
      body: BlocProvider.value(
        value: cubitCart,
        child: BlocBuilder<CartCubit, CartState>(
          builder: (context, state) {
            if (state is ProductsCart) {
              final cubit = context.read<CartCubit>();
            //  List<int> cc = cubit.producteCounter;
              return Scaffold(
                body: Padding(
                  padding:
                      EdgeInsets.symmetric(vertical: 0.h, horizontal: 8.0.w),
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
                                    margin:
                                        EdgeInsets.symmetric(vertical: 10.h),
                                    height: 100.h,
                                    decoration: BoxDecoration(
                                        color: ColorManager.white,
                                        borderRadius:
                                            BorderRadius.circular(15)),
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
                                                style: const TextStyle(
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
                                          borderRadius:
                                              BorderRadius.circular(8),
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
                                                  cubit.decrement(vv[index]);
                                                },
                                                child: const Icon(
                                                  Icons.remove,
                                                  size: 20,
                                                ),
                                              ),
                                            ),
                                            Positioned(
                                                top: 8,
                                                left: 35,
                                                child:
                                                    Text("${counter[index]}")),
                                            Positioned(
                                              right: 0,
                                              top: 0,
                                              child: GestureDetector(
                                                onTap: () {
                                                  cubit.increment(vv[index]);

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
                                                      gradient:
                                                          const LinearGradient(
                                                        colors: [
                                                          ColorManager
                                                              .royalBlue,
                                                          ColorManager
                                                              .darkPurple
                                                        ],
                                                        begin: Alignment
                                                            .centerLeft,
                                                        end: Alignment
                                                            .centerRight,
                                                      )),
                                                  child: const Icon(
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
                            borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(30),
                                topRight: Radius.circular(30))),
                      ),
                    ],
                  ),
                ),
              );
            } else {
              return const Center(child: Text("data"));
            }
          },
        ),
      ),
    );
  }
}

class BottomCounter extends StatelessWidget {
  const BottomCounter({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    //  final cubit = GetIt.I<CartCubit>();
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
              child: const Icon(
                Icons.remove,
                size: 20,
              ),
            ),
          ),
          BlocBuilder<CartCubit, CartState>(
            //  bloc: cubit,
            builder: (context, state) {
              return const Positioned(top: 8, left: 35, child: Text("${0}"));
            },
          ),
          Positioned(
            right: 0,
            top: 0,
            child: GestureDetector(
              onTap: () {},
              child: Container(
                height: 37.7.h,
                width: 36.w,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                    gradient: const LinearGradient(
                      colors: [ColorManager.royalBlue, ColorManager.darkPurple],
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                    )),
                child: const Icon(
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
