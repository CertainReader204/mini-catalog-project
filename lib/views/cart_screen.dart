import 'package:software_persona_mobile/components/card_tile.dart';
import 'package:software_persona_mobile/models/products_model.dart';
import 'package:flutter/material.dart';

// Bu ekran sepete eklenen ürünleri listeler ve ürünlerin çıkarılmasını sağlar.
class CartScreen extends StatefulWidget {
  final List<Data> allProducts;
  final Set<int> cartIds;

  const CartScreen({super.key, required this.allProducts, required this.cartIds});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    final cartProducts = widget.allProducts
      .where((element) => widget.cartIds.contains(element.id))
      .toList();

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Cart"),
        backgroundColor: Colors.white,
      ), 

      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [


              Expanded(
                child:cartProducts.isEmpty
                ? Center(child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [

                  Icon(
                    Icons.shopping_bag_outlined,
                    size: 64,
                    color: Colors.grey,
                  ),

                  SizedBox(height: 12),

                  Text("Your cart is empty", 
                  style: TextStyle(
                    fontSize: 16, 
                    color: Colors.grey),
                  ),

                  Text("Add items to start shopping", 
                  style: TextStyle(
                    fontSize: 16, 
                    color: Colors.grey),
                  ),



                ]))
                : ListView.builder(
                    itemCount: cartProducts.length, 
                    itemBuilder: (context, index) {
                      final item = cartProducts[index];

                      return MiniCardTile(
                        name: item.name!, 
                        tagline: item.tagline!, 
                        price: item.price!, 
                        imageUrl: item.image!,
                        onRemove:() {
                          setState(() {
                            widget.cartIds.remove(item.id);
                          });
                        },
                      );
                    }
                ),

              ),

              SizedBox(height: 14),

              ElevatedButton(
                onPressed: () {
                  // Handle checkout action
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  minimumSize: Size(double.infinity, 55),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: Text(
                  "Checkout",
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
              ),



            ]
          ),
        ),
      ),   
    );
  }
}