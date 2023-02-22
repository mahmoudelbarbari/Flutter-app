import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:order/core/drawer_menu.dart';
import 'package:order/features/cart/presentation/cubit/cart_data_cubit.dart';
import 'package:order/features/cart/presentation/cubit/cart_data_state.dart';
import 'package:order/features/cart/presentation/pages/checkout_widget.dart';

class CheckoutPage extends StatefulWidget {
  const CheckoutPage({super.key});

  @override
  State<CheckoutPage> createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: SizedBox(
        height: 60,
        width: 100,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                minimumSize: const Size(327, 56),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15))),
            onPressed: () {
              // Navigator.of(context).push(MaterialPageRoute(
              //   builder: (context) => const CheckoutPage(),
              // ));
              /* 
                this buttom should save in orders collection and the user should able to see his past 
                see his/her past orders
              */
            },
            child: const Text('Checkout'),
          ),
        ),
      ),
      endDrawer: const NavigationDrawerr(),
      appBar: AppBar(
        centerTitle: false,
        title: const Text(
          'CheckOut Page',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      body: BlocProvider<CartDataCubit>(
        create: (context) => CartDataCubit()..getData(),
        child: BlocConsumer<CartDataCubit, CartDataState>(
          listener: (context, state) {
            if (state is CartDataError) {
              if (kDebugMode) {
                print(state.errorMessage);
              }
            }
          },
          builder: (context, state) {
            if (state is CartDataloaded) {
              return CheckOutWidget(cartItemModel: state.cartModel);
            } else if (state is CartDataError) {
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
