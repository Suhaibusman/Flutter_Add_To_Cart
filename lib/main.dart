import 'package:addtocarttask/addeditems.dart';
import 'package:addtocarttask/productitem.dart';
import 'package:addtocarttask/screens/cartview.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
     debugShowCheckedModeBanner: false,
     home: HomeView(),
    
    );
  }
}

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(cartaddeditems.length.toString()),),
      body: ListView.builder(
        itemCount: productitems.length,
        itemBuilder: (context, index) {
        return ListTile(
          title: Text(productitems[index]["productname"]),
          subtitle: Text(productitems[index]["productprice"].toString()),
          trailing: IconButton(onPressed: (){
             
                
                 setState(()  {
            cartaddeditems.add(productitems[index]);
            });
              
            
           
          }, icon: const Icon(Icons.add)),
        );
      },),

      floatingActionButton: FloatingActionButton(onPressed: () async{
      await  Navigator.push(context, MaterialPageRoute(builder: (context) => const CartView(),));
      } ,child: const Icon(Icons.view_agenda),),
    );
  }
}