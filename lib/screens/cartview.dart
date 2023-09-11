import 'package:addtocarttask/addeditems.dart';
import 'package:flutter/material.dart';

class CartView extends StatefulWidget {
  const CartView({super.key});

  @override
  State<CartView> createState() => _CartViewState();
}

class _CartViewState extends State<CartView> {
  void increaseQuantity(int index) {
    setState(() {
      cartaddeditems[index]["productquantity"] += 1;
    });
  }

  void decreaseQuantity(int index) {
    
      if (cartaddeditems[index]["productquantity"] == 0) {
  //       showDialog(context: context, builder: (context) {
  //          Widget cancelButton = TextButton(
  //   child: const Text("Cancel"),
  //   onPressed:  () {
     
  //     Navigator.pop(context);
  //   },
  // );
  // Widget continueButton = TextButton(
  //   child: const Text("Continue"),
  //   onPressed:  () {
    
  //      cartaddeditems.removeAt(index);
  //   },
  // );
  //         return  AlertDialog(title: const Text("Do You Want to remove"),
  //           actions: [
  //             cancelButton,
  //     continueButton,
  //           ],
  //         );
  //       },);

      setState(() {
          cartaddeditems.removeAt(index);
      });
      } else {
        setState(() {
          cartaddeditems[index]["productquantity"] -= 1;
        });
      }
    
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Cart View"),),
      body:
        cartaddeditems.isEmpty?const Center(child: Text("There is no items in cart")) :
       ListView.builder(
      itemCount: cartaddeditems.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(cartaddeditems[index]["productname"]),
          subtitle: Text(
              'Price: \$${cartaddeditems[index]["productprice"].toStringAsFixed(2)}'),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              
               IconButton(
                icon: const Icon(Icons.minimize),
                onPressed: () {
                  decreaseQuantity(index);
                },
              ),
              Text(cartaddeditems[index]["productquantity"].toString()),
             IconButton(
                icon: const Icon(Icons.add),
                onPressed: () {
                  increaseQuantity(index);
                },
              ),
            ],
          ),
        );
      },
    )
    );
  }
}