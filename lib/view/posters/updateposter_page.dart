import 'package:admin_app_wahy/view/homescreen/widget/header_box.dart';
import 'package:admin_app_wahy/view/widget/customtextformfield.dart';
import 'package:flutter/material.dart';

class UpdateposterPage extends StatefulWidget {
  const UpdateposterPage({super.key, required this.posterNumbr});
  final String posterNumbr;

  @override
  State<UpdateposterPage> createState() => _UpdateposterPageState();
}

class _UpdateposterPageState extends State<UpdateposterPage> {
  String? dropValue;
  TextEditingController subtitle = TextEditingController();
  TextEditingController heading = TextEditingController();
  TextEditingController heading2 = TextEditingController();

  final List<String> categories = ["Beverages", "Fruits", "Powders"];
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
                              "${widget.posterNumbr}",
                              style: TextStyle(
                                  color: Colors.grey.shade600,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 25),
                            ),
                            SizedBox(
                              height: 15,
                            ), //table
                            Container(
                              padding: EdgeInsets.only(
                                  left: 10, right: 10, top: 15, bottom: 10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "#",
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Text(
                                        "Value",
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      )
                                    ],
                                  ),
                                  Divider(),
                                  //image
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "Image",
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Row(
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
                                    ],
                                  ),
                                  Divider(),
                                  //subtitle
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "Subtitle",
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 200,
                                        height: 40,
                                        child: Customtextformfield(
                                            hintText: "", controller: subtitle),
                                      )
                                    ],
                                  ),
                                  Divider(),
                                  //heading
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "Heading",
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 200,
                                        height: 40,
                                        child: Customtextformfield(
                                            hintText: "", controller: heading),
                                      )
                                    ],
                                  ),
                                  Divider(),
                                  //head2
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "Heading 2",
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 200,
                                        height: 40,
                                        child: Customtextformfield(
                                            hintText: "", controller: heading2),
                                      )
                                    ],
                                  ),
                                  Divider(),
                                  //categry
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Expanded(
                                        child: Text(
                                          "Link",
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                      DropdownButton(
                                        value: dropValue,
                                        items: categories
                                            .map<DropdownMenuItem<String>>(
                                                (String value) {
                                          return DropdownMenuItem<String>(
                                            value: value,
                                            child: Text(value),
                                          );
                                        }).toList(),
                                        onChanged: (value) {
                                          setState(() {
                                            dropValue = value;
                                          });
                                        },
                                      )
                                    ],
                                  ),
                                ],
                              ),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  border:
                                      Border.all(color: Colors.grey.shade200)),
                            ),
                            SizedBox(
                              height: 10,
                            ),

                            //BUTTON
                            GestureDetector(
                              onTap: () {
                                if (formKey.currentState!.validate()) {
                                  subtitle.clear();
                                  heading.clear();
                                  heading2.clear();
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(SnackBar(
                                          content: Text(
                                    "Poster Created Successfully !!!",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 35,
                                        fontWeight: FontWeight.bold),
                                  )));
                                }
                              },
                              child: Container(
                                height: 40,
                                width: 120,
                                child: Center(
                                  child: Text(
                                    "Create",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16),
                                  ),
                                ),
                                decoration: BoxDecoration(
                                    color: Colors.green,
                                    borderRadius: BorderRadius.circular(10)),
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
