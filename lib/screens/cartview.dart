import 'package:addtocarttask/addeditems.dart';
import 'package:flutter/material.dart';

class CartView extends StatefulWidget {
  const CartView({super.key});

  @override
  State<CartView> createState() => _CartViewState();
}

class _CartViewState extends State<CartView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(title: const Text("Cart View"),),
      body:
        cartaddeditems.isEmpty?const Center(child: Text("There is no items in cart")):
       ListView.builder(
        itemCount: cartaddeditems.length
        ,itemBuilder: (context, index) {
       return ListTile(
        title: Text(cartaddeditems[index]["productname"]),
        subtitle: Text(cartaddeditems[index]["productprice"].toString()),
       trailing: Wrap(
         children: [
           IconButton(onPressed: (){
            setState(() {
              cartaddeditems.removeAt(index);
            });

           }, icon: const Icon(Icons.minimize)),
           Text(cartaddeditems[index]["productquantity"].toString()),
            IconButton(onPressed: (){
            setState(() {
              cartaddeditems[index]["productquantity"]+1;
            });

           }, icon: const Icon(Icons.add)),
         ],
       ),
       ); 
      },),
    );
  }
}