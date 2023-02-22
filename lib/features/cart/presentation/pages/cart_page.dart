import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:order/core/drawer_menu.dart';
import 'package:order/features/cart/presentation/cubit/cart_cubit.dart';
import 'package:order/features/cart/presentation/cubit/cart_state.dart';
import 'package:order/features/cart/presentation/pages/cart_widget.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: const NavigationDrawerr(),
      appBar: AppBar(
        centerTitle: false,
        title: const Text(
          'Cart',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      body: BlocProvider<CartCubit>(
        create: (context) => CartCubit()..getAllCartItems(),
        child: BlocConsumer<CartCubit, CartState>(
          listener: (context, state) {
            if (state is CartError) {
              if (kDebugMode) {
                print(state.errorMessage);
              }
            }
          },
          builder: (context, state) {
            if (state is CartItemsLoadded) {
              return CartWidget(menuModel: state.menuModel);
            } else if (state is CartError) {
              if (kDebugMode) {
                print(state.errorMessage);
              }
            }
            return const Center(
              child: Text(
                'No items in the cart in the meantime..!',
                style: TextStyle(fontSize: 15),
              ),
            );
          },
        ),
      ),
    );
  }
}
