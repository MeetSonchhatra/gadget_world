import 'package:gadget_world/core/store.dart';
import 'package:gadget_world/models/catalog.dart';
import 'package:gadget_world/widgets/themes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import '../models/cart.dart';


class addtocart extends StatelessWidget {
  final Item Catalog;
   addtocart({
     required Key key,required this.Catalog,
  }):super(key: key);

//  final _cart = CartModel();
  @override

  Widget build(BuildContext context) {
    VxState.watch(context, on : [AddMutation,RemoveMutation]);
    final CartModel _cart = (VxState.store as MyStore).cart;
   bool isInCart = _cart.items.contains(Catalog) ;
    return ElevatedButton(

        onPressed: () {
          
          
          if(!isInCart)
          {
              AddMutation(Catalog);
          }
        },
        style: ButtonStyle(
            backgroundColor:
                MaterialStateProperty.all(context.theme.floatingActionButtonTheme.backgroundColor),
            shape: MaterialStateProperty.all(StadiumBorder())),
//        child:isInCart? Icon(Icons.done) : "Buy".text.make());
        child:isInCart? Icon(Icons.done,color: Colors.white,) : Text('Buy' ,style: TextStyle(color: Colors.white),));
  }
}
