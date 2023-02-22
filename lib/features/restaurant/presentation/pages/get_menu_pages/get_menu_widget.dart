import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:order/features/cart/presentation/cubit/cart_cubit.dart';
import 'package:order/features/restaurant/data/model/restaurant_model.dart';

class AllMenuWidget extends StatefulWidget {
  final List<MenuModel> menuModel;
  const AllMenuWidget({
    super.key,
    required this.menuModel,
  });

  @override
  State<AllMenuWidget> createState() => _AllMenuWidgetState();
}

class _AllMenuWidgetState extends State<AllMenuWidget> {
  //

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.menuModel.length,
      itemBuilder: (_, index) {
        return ListTile(
          trailing: const Icon(Icons.add_shopping_cart),
          title: Text(widget.menuModel[index].name),
          subtitle: Text(widget.menuModel[index].price.toString()),
          onTap: () {
            context.read<CartCubit>().addProductToCart(widget.menuModel[index]);
          },
        );
      },
    );
  }
}
