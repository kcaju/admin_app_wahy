import 'package:admin_app_wahy/view/homescreen/widget/header_box.dart';
import 'package:admin_app_wahy/view/widget/customtextformfield.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class AddCountryPage extends StatefulWidget {
  const AddCountryPage({super.key});

  @override
  State<AddCountryPage> createState() => _AddCountryPageState();
}

class _AddCountryPageState extends State<AddCountryPage> {
  String _selectedStatus = "Active";
  TextEditingController country = TextEditingController();
  final formKey = GlobalKey<FormState>();
  // Firebase Firestore instance
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    // Use MediaQuery to get screen width and height
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    // Determine screen type based on width
    bool isMobile = screenWidth < 600;
    bool isTablet = screenWidth >= 600 && screenWidth <= 1024;
    bool isDesktop = screenWidth > 1024;
    return Builder(builder: (context) {
      return SafeArea(
          child: Scaffold(
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 2, vertical: 2),
          child: Container(
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(15)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //header
                HeaderBox(
                  isNavigation: true,
                ),
                //fields
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: isDesktop ? 200 : 15, vertical: 20),
                  child: Form(
                    key: formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Add Country",
                          style: TextStyle(
                              color: Colors.grey.shade600,
                              fontWeight: FontWeight.bold,
                              fontSize: 25),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Text(
                          "Country Name",
                          style: TextStyle(
                              color: Colors.grey.shade600,
                              fontWeight: FontWeight.w600,
                              fontSize: 15),
                        ),
                        SizedBox(
                            width: 450,
                            child: Customtextformfield(
                                hintText: "", controller: country)),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "Country Status",
                          style: TextStyle(
                              color: Colors.grey.shade600,
                              fontWeight: FontWeight.w600,
                              fontSize: 15),
                        ),
                        SizedBox(height: 8),
                        Row(
                          children: [
                            Row(
                              children: [
                                Radio<String>(
                                  activeColor: Colors.grey.shade600,
                                  value: "Active",
                                  groupValue: _selectedStatus,
                                  onChanged: (value) {
                                    setState(() {
                                      _selectedStatus = value!;
                                    });
                                  },
                                ),
                                Text('Active'),
                              ],
                            ),
                            SizedBox(width: 16),
                            Row(
                              children: [
                                Radio<String>(
                                  activeColor: Colors.grey.shade600,
                                  value: "Inactive",
                                  groupValue: _selectedStatus,
                                  onChanged: (value) {
                                    setState(() {
                                      _selectedStatus = value!;
                                    });
                                  },
                                ),
                                Text('Inactive'),
                              ],
                            ),
                          ],
                        ),

                        SizedBox(
                          height: 15,
                        ),
                        //BUTTON
                        GestureDetector(
                          onTap: () async {
                            if (formKey.currentState!.validate()) {
                              try {
                                await firestore.collection("Countries").add({
                                  "countryName": country.text,
                                  "status": _selectedStatus
                                });

                                country.clear();
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(SnackBar(
                                  content: Text(
                                    "Country Added Successfully!",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  backgroundColor: Colors.green,
                                ));
                              } catch (e) {
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(SnackBar(
                                  content: Text(
                                    "Failed to add country: $e",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  backgroundColor: Colors.red,
                                ));
                              }
                            }
                          },
                          child: Container(
                            height: 50,
                            width: 200,
                            child: Center(
                              child: Text(
                                "CREATE COUNTRY",
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
                ),
              ],
            ),
          ),
        ),
      ));
    });
  }
}
