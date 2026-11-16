import 'package:software_persona_mobile/components/product_card.dart';
import 'package:software_persona_mobile/models/products_model.dart';
import 'package:software_persona_mobile/services/api_service.dart';
import 'package:software_persona_mobile/views/cart_screen.dart';
import 'package:software_persona_mobile/views/product_detail_screen.dart';
import 'package:flutter/material.dart';
import 'dart:developer';

// Bu ekran ürünleri listeler ve ürün detayları ile sepete yönlendirme sağlar.
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  ApiService apiService = ApiService();
  List<Data> allProducts = [];
  bool isLoading = true;
  String errorMessage = "";
  Set<int> cartIds = {};

  Future<void> loadProducts() async {
    try {
      setState(() {
        isLoading = false;
      });

      final productsModel = await apiService.fetchProducts();

      log("Ürünler getirildi.");

      setState(() {
        allProducts = productsModel.data!;
      });
    } catch (e) {
      setState(() {
        errorMessage = "Failed to load products: $e";
      });
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  void initState() {
    loadProducts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Discover",
                    style: TextStyle(fontSize: 34, fontWeight: FontWeight.bold),
                  ),

                  IconButton(
                    onPressed: () {
                      Navigator.push(
                        context,                      
                        MaterialPageRoute(
                          builder: (context) => CartScreen(
                            allProducts: allProducts, 
                            cartIds: cartIds,
                          ),
                        ),
                      );
                    }, 
                    iconSize: 32,
                    icon: Icon(Icons.shopping_bag_outlined),
                  ),
                ],
              ),

              SizedBox(height: 8),

              Text(
                "Find your perfect device.",
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),

              SizedBox(height: 14),

              Container(
                decoration: BoxDecoration(
                  color: Color(0xFFF5F5F5),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: "Search products",
                    hintStyle: TextStyle(color: Colors.grey),
                    border: InputBorder.none,
                    prefixIcon: Icon(Icons.search, color: Colors.grey),
                    contentPadding: EdgeInsets.symmetric(vertical: 14),
                  ),
                ),
              ),

              SizedBox(height: 16),

              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.network(
                  "https://wantapi.com/assets/banner.png",

                  height: 80,
                  width: double.infinity,
                  fit: BoxFit.fitWidth,
                ),
              ),

              SizedBox(height: 16),

              Expanded(
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    childAspectRatio: 0.7,
                  ),

                  itemCount: allProducts.length,
                  itemBuilder: (context, index) {
                    final findProduct = allProducts[index];

                    return GestureDetector(
                      
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder:(context) => ProductDetailScreen(
                              findProduct: findProduct,
                              cartIds: cartIds,
                            ),
                          ),
                        );
                      },
                      child: ProductCard(findProduct: findProduct));
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
