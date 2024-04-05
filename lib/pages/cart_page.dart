import 'package:gadget_world/core/store.dart';
import 'package:gadget_world/models/cart.dart';
import 'package:gadget_world/widgets/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:velocity_x/velocity_x.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyTheme.creamColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: "Cart".text.make(),
      ),
      body: Column(
        children: [_cartList().p32().expand(), Divider(), _carttotal()],
      ),
    );
  }
}

class _carttotal extends StatelessWidget {

  // final  _cart = CartModel();
  @override
  Widget build(BuildContext context) {
    final CartModel _cart = (VxState.store as MyStore).cart;
    return SizedBox(
      height: 150,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          VxConsumer(
            notifications: {},
            mutations: {RemoveMutation},
            builder: (context , _ , status) {
              return   "\$${_cart.totalPrice}"
              .text
              .xl4
              .make();
          }, ),
          30.widthBox,
          Container(
            width: 100,
            height: 50,
            child: ElevatedButton(
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: "Buying not supported yet ".text.make()));
                    },
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                            context.theme.primaryColorLight),
                        shape: MaterialStateProperty.all(StadiumBorder())),
                    child: "Buy".text.make())
                .w32(context),
          )
        ],
      ),
    );
  }
}

class _cartList extends StatelessWidget {
// final _cart = CartModel();
  @override
  Widget build(BuildContext context) {
        VxState.watch(context, on : [RemoveMutation]);
    final CartModel _cart = (VxState.store as MyStore).cart;
    return _cart.items.isEmpty
    ? "Nothing to show ".text.xl3.makeCentered()
    : ListView.builder(
      itemCount: _cart.items.length,
      itemBuilder: (context, index) => ListTile(
        leading: Icon(Icons.done),
        trailing: IconButton(
          icon: Icon(Icons.remove_circle_outline),
          onPressed: () {
            RemoveMutation(_cart.items[index]);
          },
        ),
        title: _cart.items[index].name.text.make(),
      ),
    );
  }
}
