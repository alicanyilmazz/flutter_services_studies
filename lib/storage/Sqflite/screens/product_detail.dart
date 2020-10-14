import 'package:flutter/material.dart';
import 'package:flutterstudy/storage/Sqflite/components/chips.dart';
import 'package:flutterstudy/storage/Sqflite/models/product.dart';

class ProductDetail extends StatefulWidget {

  Product product;
  ProductDetail({Key key, @required this.product}) : super(key: key);

  @override
  _ProductDetailState createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.product.name),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        tooltip: 'Add Product',
        child: Icon(Icons.add),
      ),
      body: buildProductDetail(widget.product),
    );
  }

  buildProductDetail(Product product) {
    return Center(
      child: Card(
        color: Colors.orange.shade200,
        child: ListTile(
          leading: CircleAvatar(backgroundColor: Colors.grey.shade200,child:Icon(Icons.shopping_basket),),
          title: Text(product.name,style: TextStyle(color: Colors.white),),
          subtitle: Text(product.description,style:TextStyle(color: Colors.white),),
          trailing: createAdvanceChip(label: "Add Product",color: Color(0xFFF6F4D4),text: product.unitPrice.toString()),
          onTap: (){},
        ),
      ),
    );
  }


}
