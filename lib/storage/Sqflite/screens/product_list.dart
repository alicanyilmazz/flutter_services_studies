import 'dart:math';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutterstudy/storage/Sqflite/components/alert_dialog.dart';
import 'package:flutterstudy/storage/Sqflite/components/chips.dart';
import 'package:flutterstudy/storage/Sqflite/helpers/dbhelper.dart';
import 'package:flutterstudy/storage/Sqflite/models/product.dart';

class ProductList extends StatefulWidget {

  String data;
  ProductList({Key key, @required this.data}) : super(key: key);

  @override
  _ProductListState createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  var dbHelper = DbHelper();
   List<Product> products;
  int productCount = 0;

  @override
  void initState() {
    // TODO: implement initState
    getProducts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: Text("Product List"),
        actions: [
          IconButton(
            icon: Icon(Icons.edit),
            onPressed: (){
            },
            color: Colors.white54,
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          gotoAddProduct();
        },
        tooltip: 'Add Product',
        child: Icon(Icons.add),
      ),
      body:productCount!=0 ? buildProductList() : contentWarning(),
    );
  }



  Widget contentWarning() {
    return Center(child: createBasicChip(label: "Add Product",color: Color(0xFFff8a65),text: "P"));
  }



  ListView buildProductList() {
    return ListView.builder(
      itemBuilder: (BuildContext context,int position){
          return Dismissible(
            key: Key(products[position].toString()),
            confirmDismiss: (DismissDirection direction) async {
              //return await showAlertDialog(context);
              return await showCustomDesignAlertDialog(context: context,title: "Confirm",description: "Do you want to delete this item?",buttonText: "Yes",image: "pencil.gif");
            },
            onDismissed: (direction){

              if(direction==DismissDirection.endToStart){
                 deleteItem(this.products[position].id);
              }
              if(direction==DismissDirection.startToEnd){
                 deleteItem(this.products[position].id);
              }
            },
            background: Container(
              color: Colors.orange.shade400,
              child: Row(children: [
                SizedBox(width: 20,),
                Icon(Icons.edit,color: Colors.white,),
                SizedBox(width: 15,),
                Text("Edit Product",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
              ],
                mainAxisAlignment: MainAxisAlignment.start,
              ),
            ),
            secondaryBackground: Container(
              color: Colors.red.shade400,
              child: Row(children: [
                Text("Delete Product",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
                SizedBox(width: 15,),
                Icon(Icons.delete_outline,color: Colors.white,),
                SizedBox(width: 20,),
              ],
                mainAxisAlignment: MainAxisAlignment.end,
              ),
            ),
            child: Card(
              color: randomColor(),
              elevation: 2,
              child: ListTile(
                leading: CircleAvatar(backgroundColor: Colors.grey.shade200,child:Icon(Icons.shopping_basket),),
                title: Text(this.products[position].name,style: TextStyle(color: Colors.white),),
                subtitle: Text(this.products[position].description,style:TextStyle(color: Colors.white),),
                trailing: createAdvanceChip(label: "Add Product",color: Color(0xFFF6F4D4),text: products[position].unitPrice.toString()),
                onTap: (){
                  goToDetail(this.products[position]);
                },
                onLongPress: (){
                  editProduct(context, this.products[position]);
                },
              ),
            ),
          );
      },
      itemCount: productCount,
    );
  }

  Future deleteItem(int id) async {
    await dbHelper.delete(id);
  }

  Future editProduct(BuildContext context,Product product) async {
    bool result= await Navigator.pushNamed(context, "/productedit",arguments: product);
    if(result!=null){
      if(result){
        setState(() {
          getProducts();
        });
      }
    }
  }

  Color randomColor() {
    var rnd = new Random();
    return Color.fromARGB(100, rnd.nextInt(255), rnd.nextInt(255), rnd.nextInt(255));
  }

  void getProducts() async {
    var productsFuture= dbHelper.getProducts();
    productsFuture.then((data){
      setState(() {
        this.products=data;
        this.productCount=data.length;
      });
    });
  /*  this.products.forEach((element) {
      debugPrint(element.name + element.description + element.unitPrice.toString()+'\n');
    });*/
  debugPrint(productCount.toString());
  }

  void gotoAddProduct() async{
   bool result= await Navigator.pushNamed(context, "/addproduct",arguments: "");
   if(result!=null){
     if(result)
     {
        getProducts();
     }
   }
  }

  void goToDetail(Product product) async {
    bool result=await Navigator.pushNamed(context, "/productdetail", arguments: product);
    if(result!=null)
    {
      if(result)
      {
        getProducts();
      }
    }
  }

}
