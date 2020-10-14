import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterstudy/storage/Sqflite/helpers/dbhelper.dart';
import 'package:flutterstudy/storage/Sqflite/models/product.dart';

class ProductAdd extends StatefulWidget {
  String data;
  ProductAdd({Key key, @required this.data}) : super(key: key);

  @override
  _ProductAddState createState() => _ProductAddState();
}

class _ProductAddState extends State<ProductAdd> {
  var dbHelper=DbHelper();
  var txtName = TextEditingController();
  var txtDescription = TextEditingController();
  var txtUnitPrice = TextEditingController();
  bool _nameValidate = false;
  bool _descriptionValidate = false;
  bool _unitPriceValidate = false;
  String _name;
  String _description;
  int _unitPrice;

  @override
  void dispose() {
    // TODO: implement dispose
    txtName.dispose();
    txtDescription.dispose();
    txtUnitPrice.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Product"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        tooltip: 'Add Product',
        child: Icon(Icons.add),
      ),
      body: ListView(
        children: [
          Container(
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: buildNameField(),
            ),
          ),
          Container(
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: buildDescriptionField(),
            ),
          ),
          Container(
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: buildUnitPriceField(),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: SaveButton(),
          ),
        ],
      ),
    );
  }

  FlatButton SaveButton() {
    return FlatButton(
      onPressed: () {
        setState(() {
         if(fieldValidate()){
           addProduct();
         }
        });
      },
      child: Text(
        "Save",
        style: TextStyle(color: Colors.white),
      ),
      color: Colors.cyan,
    );
  }

  bool fieldValidate() {
    txtName.text.isEmpty ? _nameValidate = true : _nameValidate = false;
    txtDescription.text.isEmpty ? _descriptionValidate = true : _descriptionValidate = false;
    txtUnitPrice.text.isEmpty ? _unitPriceValidate = true : _unitPriceValidate = false;
    if((_nameValidate==true) || (_descriptionValidate==true) || (_unitPriceValidate==true)){
      debugPrint("Opps Validation Error!");
      return false;
    }else{
      debugPrint("Process Completed!");
      return true;
    }
  }

  buildNameField() {
    return TextField(
      keyboardType: TextInputType.text,
      textInputAction: TextInputAction.done,
      textAlign: TextAlign.start,
      controller: txtName,
      textDirection: TextDirection.ltr,
      autofocus: false,
      autocorrect: true,
      maxLines: 1,
      decoration: InputDecoration(
        errorText: _nameValidate ? 'Name not be empty' : null,
        hintText: "Enter a name",
        labelText: "Name",
        border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10))),
        icon: Icon(
          Icons.person_outline,
          color: Colors.orange,
        ),
        prefixIcon: Icon(
          Icons.short_text,
          color: Colors.pink,
        ),
        suffixIcon: Icon(
          Icons.mode_edit,
          color: Colors.purple,
        ),
        filled: true,
        fillColor: Colors.white,
      ),
      maxLength: 20,
      maxLengthEnforced: true,
      onChanged: (String e) {
        _name=e;
      },
      onSubmitted: (String e) {
        setState(() {
          debugPrint("On change : $e");
        });
      },
      cursorColor: Colors.pink,
    );
  }

  buildDescriptionField() {
    return TextField(
      keyboardType: TextInputType.text,
      textInputAction: TextInputAction.done,
      textAlign: TextAlign.start,
      controller: txtDescription,
      textDirection: TextDirection.ltr,
      autofocus: false,
      autocorrect: true,
      maxLines: 1,
      decoration: InputDecoration(
        errorText: _descriptionValidate ? 'Description not be empty' : null,
        hintText: "Enter a Description",
        labelText: "Description",
        border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10))),
        icon: Icon(
          Icons.text_fields,
          color: Colors.orange,
        ),
        prefixIcon: Icon(
          Icons.short_text,
          color: Colors.pink,
        ),
        suffixIcon: Icon(
          Icons.mode_edit,
          color: Colors.purple,
        ),
        filled: true,
        fillColor: Colors.white,
      ),
      maxLength: 20,
      maxLengthEnforced: true,
      onChanged: (String e) {
        _description=e;
      },
      onSubmitted: (String e) {
        setState(() {});
      },
      cursorColor: Colors.pink,
    );
  }

  buildUnitPriceField() {
    return TextField(
      keyboardType: TextInputType.number,
      textInputAction: TextInputAction.done,
      textAlign: TextAlign.start,
      controller: txtUnitPrice,
      textDirection: TextDirection.ltr,
      autofocus: false,
      autocorrect: true,
      maxLines: 1,
      decoration: InputDecoration(
        errorText: _unitPriceValidate ? 'Unit Price not be empty' : null,
        hintText: "Enter a Unit Price",
        labelText: "Price",
        border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10))),
        icon: Icon(
          Icons.attach_money,
          color: Colors.orange,
        ),
        prefixIcon: Icon(
          Icons.short_text,
          color: Colors.pink,
        ),
        suffixIcon: Icon(
          Icons.mode_edit,
          color: Colors.purple,
        ),
        filled: true,
        fillColor: Colors.white,
      ),
      maxLength: 20,
      maxLengthEnforced: true,
      onChanged: (String e) {
        _unitPrice=int.parse(e);
      },
      onSubmitted: (String e) {
        setState(() {});
      },
      cursorColor: Colors.pink,
    );
  }

  void addProduct() async{
    await dbHelper.insert(Product(name: txtName.text,description: txtDescription.text,unitPrice: double.tryParse(txtUnitPrice.text)));
    Navigator.pop(context,true);
  }

}
