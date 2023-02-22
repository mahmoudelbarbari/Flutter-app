import 'package:flutter/material.dart';
import 'package:order/features/cart/data/models/cart_items_model.dart';

class CheckOutWidget extends StatefulWidget {
  final List<CartItemModel> cartItemModel;
  const CheckOutWidget({
    super.key,
    required this.cartItemModel,
  });

  @override
  State<CheckOutWidget> createState() => _CheckOutWidgetState();
}

class _CheckOutWidgetState extends State<CheckOutWidget> {
  int count = 1;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Expanded(
          flex: 2,
          child: ListView.separated(
            itemCount: widget.cartItemModel.length,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8),
                    child: Container(
                      height: 100,
                      decoration: BoxDecoration(
                        color: const Color(0xFFEDECF2),
                        boxShadow: const [
                          BoxShadow(
                            blurRadius: 3,
                            blurStyle: BlurStyle.normal,
                          ),
                        ],
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: ListTile(
                        title: Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                widget.cartItemModel[index].name,
                                style: const TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                              Text(
                                "EGP: ${widget.cartItemModel[index].price.toString()}",
                                style: const TextStyle(fontSize: 16),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  height: 25,
                                  width: 100,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(20),
                                    boxShadow: const [
                                      BoxShadow(
                                        color: Colors.grey,
                                        spreadRadius: 1,
                                        blurRadius: 10,
                                      ),
                                    ],
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: <Widget>[
                                      GestureDetector(
                                        child: const Icon(
                                          Icons.remove,
                                        ),
                                        onTap: () {
                                          setState(() {
                                            if (count > 1) {
                                              count--;
                                            }
                                          });
                                        },
                                      ),
                                      Text(
                                        count.toString(),
                                        style: const TextStyle(
                                          fontSize: 18,
                                        ),
                                      ),
                                      GestureDetector(
                                        child: const Icon(
                                          Icons.add,
                                        ),
                                        onTap: () {
                                          setState(() {
                                            count++;
                                          });
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              );
            },
            separatorBuilder: (context, index) => const Divider(thickness: 1),
          ),
        ),
        Column(
          children: <Widget>[
            const Text(
              "Payment summary",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Divider(
                thickness: 1,
              ),
            ),
            _paymentSummary(
              startName: "Basket Total",
              endName: "EGP: 10.00",
            ),
            _paymentSummary(
              startName: "Delivary Fee",
              endName: "EGP: 25.00",
            ),
            _paymentSummary(
              startName: "Service Fee",
              endName: "EGP: 12.00",
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  "Total amount",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Text(
                  "vh",
                  style: TextStyle(fontSize: 15),
                ),
              ],
            )
          ],
        ),
      ],
    );
  }
}

Widget _paymentSummary({required String startName, required String endName}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: <Widget>[
      Text(
        startName,
        style: const TextStyle(fontSize: 25, color: Colors.black54),
      ),
      Text(
        endName,
        style: const TextStyle(fontSize: 15),
      ),
    ],
  );
}
