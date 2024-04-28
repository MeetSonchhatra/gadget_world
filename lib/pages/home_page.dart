import 'package:gadget_world/core/store.dart';
import 'package:gadget_world/models/cart.dart';
import 'package:gadget_world/pages/home_detail_page.dart';
import 'package:gadget_world/utils/routes.dart';
import 'package:gadget_world/widgets/drawer.dart';
import 'package:gadget_world/widgets/themes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:convert';
import '../models/catalog.dart';
import '../widgets/addtocart.dart';
import 'package:velocity_x/velocity_x.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final url = "https://api.jsonbin.io/b/604dbddb683e7e079c4eefd3";
  @override
  void initState() {
    super.initState();
    loaddata();
  }

  loaddata() async {
    var catalogJson = await rootBundle.loadString("assets/files/catalog.json");
        // var response = await http.get(Uri.parse(url));
        // var catalogJson = response.body;
    final decodedData = jsonDecode(catalogJson);
    var productsData = decodedData["products"];
    CatalogModel.items = List.from(productsData)
        .map<Item>((item) => Item.fromMap(item))
        .toList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final _cart = (VxState.store as MyStore).cart;
    return Scaffold(
        backgroundColor: context.canvasColor,
        floatingActionButton: VxBuilder(
          mutations: {AddMutation,RemoveMutation},
          builder: (ctx,_,status) =>FloatingActionButton(
            onPressed: () => Navigator.pushNamed(context, MyRoutes.cartroute),
            backgroundColor: context.theme.floatingActionButtonTheme.backgroundColor,
            child: Icon(CupertinoIcons.cart),
          ).badge(color: Vx.red700,
          size: 20,
          count: _cart.items.length,
          textStyle: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          )
          
          ),
        ),
        body: SafeArea(
          child: Container(
            padding: Vx.m32,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CatalogHeader(),
                if (CatalogModel.items.isNotEmpty)
                  CatalogList().py16().expand()
                else
                  Center(
                    child: CircularProgressIndicator().centered().expand(),
                  )
              ],
            ),
          ),
        ),
        drawer: Mydrawer(),
         );
        
  
  }
}

class CatalogHeader extends StatelessWidget {
  const CatalogHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        "Catalog App"
            .text
            .xl5
            .bold
            .color(context.theme.textTheme.bodyLarge?.color)
            .make(),
        "Trending Products"
            .text
            .xl2
            .color(context.theme.textTheme.bodyLarge?.color)
            .make()
      ],
    );
  }
}

class CatalogList extends StatelessWidget {
  const CatalogList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        itemCount: CatalogModel.items.length,
        itemBuilder: (context, index) {
          final catalog = CatalogModel.items[index];
          return InkWell(
              onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => HomeDetailPage(catalog: catalog))),
              child: CatalogItem(Catalog: catalog));
        });
  }
}

class CatalogItem extends StatelessWidget {
  final Item Catalog;

  const CatalogItem({Key? key, required this.Catalog})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return VxBox(
        child: Row(
      children: [
        Hero(
            tag: Key(Catalog.id.toString()),
            child: CatalogImage(image: Catalog.image)),
        Expanded(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Catalog.name.text.lg.color(context.textTheme.bodyLarge?.color).bold.make(),
            Catalog.desc.text.color(context.textTheme.bodyLarge?.color).make(),
            10.heightBox,
            ButtonBar(
              alignment: MainAxisAlignment.spaceBetween,
              buttonPadding: Vx.mH0,
              children: [
                "\$${Catalog.price}".text.bold.xl.color(context.textTheme.bodyLarge?.color).make(),
                addtocart(Catalog: Catalog, key: Key(""),),
              ],
            ).pOnly(right: 8.0)
          ],
        ))
      ],
    )).color(context.cardColor).rounded.square(150).make().py16();
  }
}



class CatalogImage extends StatelessWidget {
  final String image;
  const CatalogImage({Key? key, required this.image}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.network(image)
        .box
        .rounded
        .p8
        .color(MyTheme.creamColor)
        .make()
        .p16()
        .w40(context);
  }
}
