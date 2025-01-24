import 'package:admin_app_wahy/view/homescreen/home_screen.dart';
import 'package:admin_app_wahy/view/widget/customtextformfield.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController uname = TextEditingController();
  TextEditingController password = TextEditingController();
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    // Use MediaQuery to get screen width and height
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    // Determine screen type based on width
    bool isMobile = screenWidth < 600;
    bool isTablet = screenWidth >= 600 && screenWidth <= 1024;
    bool isDesktop = screenWidth > 1024;
    // Get Firestore instance
    final FirebaseFirestore firestore = FirebaseFirestore.instance;

    // Handle login
    Future<void> handleLogin() async {
      if (formKey.currentState!.validate()) {
        try {
          // Query Firestore to check if the credentials match
          QuerySnapshot querySnapshot = await firestore
              .collection('adminCredentials')
              .where('username', isEqualTo: uname.text.trim())
              .where('password', isEqualTo: password.text)
              .get();

          if (querySnapshot.docs.isNotEmpty) {
            // Credentials are valid
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => HomeScreen(),
              ),
            );
          } else {
            // Credentials are invalid
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text("Invalid username or password."),
                backgroundColor: Colors.red,
              ),
            );
          }
        } catch (e) {
          print("Error during login: $e");
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text("An error occurred. Please try again."),
              backgroundColor: Colors.red,
            ),
          );
        }
      }
    }

    return Scaffold(
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: isMobile ? 8 : 0),
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 15),
            height: 430,
            width: 500,
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //title
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Go",
                        style: TextStyle(
                            color: Colors.orange,
                            fontSize: 80,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "mart",
                        style: TextStyle(
                            color: Color(0xFF03AC13),
                            fontSize: 80,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                    "Username:",
                    style: TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.w600,
                        fontSize: 16),
                  ),
                  Customtextformfield(hintText: "", controller: uname),
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                    "Password:",
                    style: TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.w600,
                        fontSize: 16),
                  ),
                  Customtextformfield(
                    hintText: "",
                    controller: password,
                    isPassword: true,
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  //login button
                  Center(
                    child: GestureDetector(
                      onTap: handleLogin,
                      child: Container(
                        height: 50,
                        width: 80,
                        child: Center(
                          child: Text(
                            "Log in",
                            style: TextStyle(color: Colors.white, fontSize: 18),
                          ),
                        ),
                        decoration: BoxDecoration(
                            color: Colors.orange,
                            borderRadius: BorderRadius.circular(10)),
                      ),
                    ),
                  )
                ],
              ),
            ),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(5),
                border: Border.all(color: Colors.grey.shade200)),
          ),
        ),
      ),
    );
  }
}
