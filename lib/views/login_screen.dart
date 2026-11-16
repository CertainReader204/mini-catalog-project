import 'package:software_persona_mobile/services/local_storage_service.dart';
import 'package:software_persona_mobile/views/home_screen.dart';
import 'package:flutter/material.dart';

// Bu ekran kullanıcı bilgilerini alır ve ana sayfaya yönlendirir.
class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController surnameController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  LocalStorageService lsServie = LocalStorageService(); 


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,

      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Form(
            key: formKey,
            child: Column(
              children: [                    
                Text("Welcome Back",
                style:TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
            
                SizedBox(height: 6),
            
                Text(
                  "Please login to your account",
                  style: TextStyle(fontSize: 14, color: Colors.grey),
                
                ),
            
                SizedBox(height: 40),
            
                TextFormField(
                  controller: nameController,
                  decoration: InputDecoration( 
                    labelText: "Name",
                    prefixIcon: Icon(Icons.person_outline),
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(color: Colors.grey, width: 1),
                    )
                  ),

                  validator:(value) {
                    if(value == null || value.trim().isEmpty) {
                      return "İsim alanı boş geçilemez.";
                    }

                    return null;
                  },



                ),
            
                SizedBox(height: 20),
            
                TextFormField(
                  controller: surnameController,
                  decoration: InputDecoration( 
                    labelText: "Surname",
                    prefixIcon: Icon(Icons.person_outline),
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(color: Colors.grey, width: 1),
                    )
                  ),

                  validator:(value) {
                    if(value == null || value.trim().isEmpty) {
                      return "Soyisim alanı boş geçilemez.";
                    }

                    return null;
                  },

                ),
            
                SizedBox(height: 20),
            
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    minimumSize: Size(double.infinity, 50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    )
                  ),
            
                  onPressed: () {

                    if(formKey.currentState!.validate()) {                      
                      lsServie.saveData(nameController.text);

                      Navigator.push(
                        context, 
                        MaterialPageRoute(builder: (context) => HomeScreen()),
                      );
                    }

                    // Hata durumu yönetimi
                  }, 
                  child: Text(
                    "Login",
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                ),
            
                SizedBox(height: 20),
            
                Center(
                  child: Text(
                    "2026",
                    style: TextStyle(fontSize: 12, color: Colors.grey),
                  ),)
            
            
            
              ],
            ),
          ),
        ),
      )
    );
  }
}