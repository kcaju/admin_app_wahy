import 'package:admin_app_wahy/view/homescreen/widget/header_box.dart';
import 'package:admin_app_wahy/view/widget/customtextformfield.dart';
import 'package:flutter/material.dart';

class CreareEmailPage extends StatefulWidget {
  const CreareEmailPage({super.key});

  @override
  State<CreareEmailPage> createState() => _CreareEmailPageState();
}

class _CreareEmailPageState extends State<CreareEmailPage> {
  TextEditingController subject = TextEditingController();
  TextEditingController message = TextEditingController();
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
    return SafeArea(
      child: Scaffold(
        body: Padding(
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
                              "Create Email",
                              style: TextStyle(
                                  color: Colors.grey.shade600,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 25),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Text(
                              "Subject",
                              style: TextStyle(
                                  color: Colors.grey.shade600,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 15),
                            ),
                            SizedBox(
                                width: 450,
                                child: Customtextformfield(
                                    hintText: "", controller: subject)),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              "Message",
                              style: TextStyle(
                                  color: Colors.grey.shade600,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 15),
                            ),
                            SizedBox(
                                width: 450,
                                child: Customtextformfield(
                                    isDescription: true,
                                    hintText: "",
                                    controller: message)),
                            SizedBox(
                              height: 15,
                            ),
                            //BUTTON
                            GestureDetector(
                              onTap: () {
                                if (formKey.currentState!.validate()) {
                                  subject.clear();
                                  message.clear();
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(SnackBar(
                                          content: Text(
                                    "Email Send Successfully !!!",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 35,
                                        fontWeight: FontWeight.bold),
                                  )));
                                }
                              },
                              child: Container(
                                height: 40,
                                width: 180,
                                child: Center(
                                  child: Text(
                                    "SEND EMAIL",
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
