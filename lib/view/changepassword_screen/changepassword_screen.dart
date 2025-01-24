import 'package:admin_app_wahy/view/widget/customtextformfield.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ChangepasswordScreen extends StatefulWidget {
  const ChangepasswordScreen({super.key});

  @override
  State<ChangepasswordScreen> createState() => _ChangepasswordScreenState();
}

class _ChangepasswordScreenState extends State<ChangepasswordScreen> {
  TextEditingController oldPassword = TextEditingController();
  TextEditingController newPassword = TextEditingController();
  TextEditingController confirmnewPassword = TextEditingController();
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

    Future<void> handleChangePassword() async {
      if (formKey.currentState!.validate()) {
        try {
          // Query to validate old password
          QuerySnapshot querySnapshot = await firestore
              .collection('adminCredentials')
              .where('password', isEqualTo: oldPassword.text)
              .get();

          if (querySnapshot.docs.isNotEmpty) {
            // Old password matches, proceed to update
            String docId = querySnapshot.docs.first.id;

            await firestore.collection('adminCredentials').doc(docId).update({
              'password': newPassword.text.trim(),
            });

            // Clear text fields and show success message
            oldPassword.clear();
            newPassword.clear();
            confirmnewPassword.clear();

            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text(
                "Password Changed Successfully!",
                style: TextStyle(color: Colors.white),
              ),
              backgroundColor: Colors.green,
            ));
          } else {
            // Old password is incorrect
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text(
                "Old password is incorrect.",
                style: TextStyle(color: Colors.white),
              ),
              backgroundColor: Colors.red,
            ));
          }
        } catch (e) {
          // Handle errors
          print("Error changing password: $e");
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(
              "An error occurred. Please try again.",
              style: TextStyle(color: Colors.white),
            ),
            backgroundColor: Colors.red,
          ));
        }
      }
    }

    return SingleChildScrollView(
      child: Form(
        key: formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Change Password",
              style: TextStyle(
                  color: Colors.grey.shade600,
                  fontWeight: FontWeight.bold,
                  fontSize: 25),
            ),
            SizedBox(
              height: 15,
            ),
            Text(
              "Old Password",
              style: TextStyle(
                  color: Colors.grey.shade600,
                  fontWeight: FontWeight.w600,
                  fontSize: 15),
            ),
            SizedBox(
                width: 450,
                child:
                    Customtextformfield(hintText: "", controller: oldPassword)),
            SizedBox(
              height: 10,
            ),
            Text(
              "New Password",
              style: TextStyle(
                  color: Colors.grey.shade600,
                  fontWeight: FontWeight.w600,
                  fontSize: 15),
            ),
            SizedBox(
                width: 450,
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(color: Colors.grey.shade200)),
                  child: TextFormField(
                    validator: (value) {
                      if (value != null && value.length >= 8) {
                        return null;
                      } else {
                        return "enter password with atleast 8 charaters";
                      }
                    },
                    controller: newPassword,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                    )),
                  ),
                )),
            SizedBox(
              height: 10,
            ),
            Text(
              "Confirm New Password",
              style: TextStyle(
                  color: Colors.grey.shade600,
                  fontWeight: FontWeight.w600,
                  fontSize: 15),
            ),
            SizedBox(
                width: 450,
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(color: Colors.grey.shade200)),
                  child: TextFormField(
                    validator: (value) {
                      if (value != null &&
                          newPassword.text == confirmnewPassword.text) {
                        return null;
                      } else {
                        return "Password doesn't match";
                      }
                    },
                    controller: confirmnewPassword,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                    )),
                  ),
                )),
            SizedBox(
              height: 15,
            ),
            //BUTTON
            GestureDetector(
              onTap: handleChangePassword,
              child: Container(
                height: 50,
                width: 200,
                child: Center(
                  child: Text(
                    "UPDATE PASSWORD",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 16),
                  ),
                ),
                decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(30)),
              ),
            )
          ],
        ),
      ),
    );
  }
}
