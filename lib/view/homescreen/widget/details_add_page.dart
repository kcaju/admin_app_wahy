import 'package:admin_app_wahy/view/homescreen/widget/header_box.dart';
import 'package:admin_app_wahy/view/widget/customtextformfield.dart';
import 'package:flutter/material.dart';

class DetailsAddPage extends StatefulWidget {
  const DetailsAddPage({super.key});

  @override
  State<DetailsAddPage> createState() => _DetailsAddPageState();
}

class _DetailsAddPageState extends State<DetailsAddPage> {
  String _selectedStatus = "Active";

  TextEditingController id = TextEditingController();
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController username = TextEditingController();
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
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 2, vertical: 2),
          child: Container(
            child: Column(
              children: [
                //header
                HeaderBox(
                  isNavigation: true,
                ),
                //fields
                Expanded(
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: isDesktop ? 200 : 15, vertical: 20),
                      child: Form(
                        key: formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Add Partner",
                              style: TextStyle(
                                  color: Colors.grey.shade600,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 25),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            //id
                            Text(
                              "Personal Id",
                              style: TextStyle(
                                  color: Colors.grey.shade600,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 15),
                            ),
                            SizedBox(
                                width: 450,
                                child: Customtextformfield(
                                    hintText: "", controller: id)),
                            //name
                            SizedBox(
                              height: 15,
                            ),
                            Text(
                              "Name",
                              style: TextStyle(
                                  color: Colors.grey.shade600,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 15),
                            ),
                            SizedBox(
                                width: 450,
                                child: Customtextformfield(
                                    hintText: "", controller: name)),
                            //email
                            SizedBox(
                              height: 15,
                            ),
                            Text(
                              "Email",
                              style: TextStyle(
                                  color: Colors.grey.shade600,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 15),
                            ),
                            SizedBox(
                                width: 450,
                                child: Customtextformfield(
                                    hintText: "", controller: email)),
                            //username
                            SizedBox(
                              height: 15,
                            ),
                            Text(
                              "Username",
                              style: TextStyle(
                                  color: Colors.grey.shade600,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 15),
                            ),
                            SizedBox(
                                width: 450,
                                child: Customtextformfield(
                                    hintText: "", controller: username)),
                            //password
                            SizedBox(
                              height: 15,
                            ),
                            Text(
                              "Password",
                              style: TextStyle(
                                  color: Colors.grey.shade600,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 15),
                            ),
                            SizedBox(
                                width: 450,
                                child: Customtextformfield(
                                    hintText: "", controller: password)),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              "Image",
                              style: TextStyle(
                                  color: Colors.grey.shade600,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 15),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            //choose file

                            Container(
                              padding: EdgeInsets.only(left: 12),
                              height: 45,
                              width: 450,
                              child: Row(
                                children: [
                                  Container(
                                    height: 20,
                                    width: 80,
                                    color: Colors.grey.shade400,
                                    child: Text("Choose File"),
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Text("No file chosen")
                                ],
                              ),
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey),
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              "Status",
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
                              onTap: () {
                                if (formKey.currentState!.validate()) {
                                  id.clear();
                                  name.clear();
                                  email.clear();
                                  password.clear();
                                  username.clear();
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(SnackBar(
                                          content: Text(
                                    "Category Added Successfully !!!",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 35,
                                        fontWeight: FontWeight.bold),
                                  )));
                                }
                              },
                              child: Container(
                                height: 50,
                                width: 200,
                                child: Center(
                                  child: Text(
                                    "CREATE PARTNER",
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
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
