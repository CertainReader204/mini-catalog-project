import 'package:software_persona_mobile/models/products_model.dart';
import 'package:flutter/material.dart';

// Bu ekran seçilen ürünün ayrıntılarını gösterir ve ürünü sepete ekler.
class ProductDetailScreen extends StatefulWidget {
  final Data findProduct;
  final Set<int> cartIds;
  const ProductDetailScreen({super.key, required this.findProduct, required this.cartIds});

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("Back"),
        backgroundColor: Colors.white),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.network(
                widget.findProduct.image!,
                width: double.infinity,
                height: 350,
                fit: BoxFit.cover,
              ),
          
              Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
          
                    Text(
                      widget.findProduct.name!,
                      style: const TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
          
                    const SizedBox(height: 4),
          
                    Text(
                      widget.findProduct.tagline!,
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey.shade600,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
          
                    const SizedBox(height: 10),
          
                    const Text(
                      "Description",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
          
                    const SizedBox(height: 4),
          
                    Text(
                      widget.findProduct.description!,
                      style: TextStyle(
                        height: 1.5,
                        color: Colors.grey.shade800),                   
                        textAlign: TextAlign.justify,
                    ),
          
                    SizedBox(height: 10),
          
                    Text(widget.findProduct.price!,
                      style: TextStyle(
                        fontSize: 22,
                        color: Colors.blue.shade800,
                      ),
                    ),
          
                    SizedBox(height: 10),
          
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                        minimumSize: Size(double.infinity, 55),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        )
                      ),
          
                      onPressed: () {

                        setState(() {
                          widget.cartIds.add(widget.findProduct.id!);
                        });

                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text("Added to cart"),
                            behavior: SnackBarBehavior.floating,
                            backgroundColor: Colors.green,
                            margin: EdgeInsets.only(
                              bottom: 80,
                              left: 20,
                              right: 20,
                            ),
                          ),
                        );

                      },
                      child: Text("Buy Now",
                        style: TextStyle(
                          fontSize: 16, 
                          color: Colors.white),
                      ),
                    ),
          
          
          
          
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}