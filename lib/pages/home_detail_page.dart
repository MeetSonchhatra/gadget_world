import 'package:gadget_world/widgets/addtocart.dart';
import 'package:flutter/material.dart';
import 'package:gadget_world/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';
import '../models/catalog.dart';

class HomeDetailPage extends StatelessWidget {
  final Item catalog;

  const HomeDetailPage({Key? key, required this.catalog})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      backgroundColor: MyTheme.creamColor,
      bottomNavigationBar: Container(
        color: context.backgroundColor,
        child: ButtonBar(
          alignment: MainAxisAlignment.spaceBetween,
          buttonPadding: EdgeInsets.zero,
          children: [
            "\$${catalog.price}".text.bold.xl4.red500.make(),
      addtocart(Catalog: catalog, key: Key(""),),
          ],
        ).p32(),
      ),
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            Hero(
                    tag: Key(catalog.id.toString()),
                    child: Image.network(catalog.image))
                .h32(context),
            Expanded(
              child: VxArc(
                height: 30,
                arcType: VxArcType.convex,
                edge: VxEdge.top,
                child: Container(
                  color: context.backgroundColor,
                  width: context.screenWidth,
                  child: Column(
                    children: [
                      catalog.name.text.xl4
                          .color(context.textTheme.bodyLarge?.color)
                          .bold
                          .make(),
                      catalog.desc.text.xl.color(context.textTheme.bodyLarge?.color).make(),
                      10.heightBox,
                       
                    ],
                  ).p64(),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
