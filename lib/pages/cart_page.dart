import 'package:fluttertoast/fluttertoast.dart';
import 'package:gadget_world/core/store.dart';
import 'package:gadget_world/models/cart.dart';
import 'package:gadget_world/pages/payment.dart';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:slider_button/slider_button.dart';
import 'package:velocity_x/velocity_x.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.canvasColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: "Cart".text.color(context.textTheme.bodyLarge?.color).make(),
      ),
      body: Column(
        children: [_cartList().p32().expand(), _carttotal()],
      ),
    );
  }
}

class _carttotal extends StatelessWidget {

  // final  _cart = CartModel();
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final CartModel _cart = (VxState.store as MyStore).cart;
    return SizedBox(
      height: 200,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          VxConsumer(
            notifications: {},
            mutations: {RemoveMutation},
            builder: (context , _ , status) {
              return   "\$${_cart.totalPrice}"
              .text
              .xl4
              .color(Colors.red)
              .make();
          }, ),
          30.widthBox,
          Container(
                    margin: EdgeInsets.symmetric(horizontal: 10,vertical: 1),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: SliderButton(
                            action: () async{
                              await Navigator.pushReplacement(
                                  context, MaterialPageRoute(builder: (_) => PaymentPage()));
                              Fluttertoast.showToast(
                                  msg: 'Payment Successful',
                                  toastLength: Toast.LENGTH_SHORT,
                                  gravity: ToastGravity.BOTTOM,
                                  timeInSecForIosWeb: 1,
                                  backgroundColor: Colors.red,
                                  textColor: Colors.yellow);
                            },
                            label: Text(
                              "Swipe to Pay\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 17),
                            ),
                            icon: Center(
                                child: Icon(
                                  Icons.currency_rupee,
                                  color: Colors.white,
                                  size: 40.0,
                                  semanticLabel:
                                  'Text to announce in accessibility modes',
                                )),
                            height: size.height * 0.08,
                            radius: 12,
                            buttonSize: 60,
                            buttonColor: context.theme.floatingActionButtonTheme.backgroundColor ?? Colors.transparent,
                            backgroundColor:
                           context.theme.floatingActionButtonTheme.backgroundColor ?? Colors.transparent,
                            highlightedColor: Color.fromARGB(255, 64, 59, 88),
                            baseColor: Colors.white,
                          ),
                        )
                      ],
                    ),
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
    ? "Nothing to show ".text.xl3.color(context.textTheme.bodyLarge?.color).makeCentered()
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
        title: _cart.items[index].name.text.color(context.textTheme.bodyLarge?.color).make(),
      ),
    );
  }
}
