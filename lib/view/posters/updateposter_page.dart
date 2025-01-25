import 'package:admin_app_wahy/view/homescreen/widget/header_box.dart';
import 'package:admin_app_wahy/view/widget/customtextformfield.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
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
  TextEditingController posterUrl = TextEditingController();

  List<String> _categories = [];
  // Firebase Firestore instance
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  final formKey = GlobalKey<FormState>();

  // Fetch categories from Firestore
  Future<void> fetchCategories() async {
    try {
      QuerySnapshot snapshot = await firestore
          .collection('Categories')
          .where('status', isEqualTo: 'Active') // Only fetch active categories
          .get();

      setState(() {
        _categories = snapshot.docs
            .map((doc) =>
                doc['categoryName'] as String) // Extract the 'name' field
            .toList();
      });
    } catch (e) {
      print("Error fetching categories: $e");
    }
  }

  @override
  void initState() {
    fetchCategories();
    super.initState();
  }

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
                                      SizedBox(
                                        width: 250,
                                        child: TextFormField(
                                          controller: posterUrl,
                                          validator: (value) {
                                            if (value != null &&
                                                value.isNotEmpty) {
                                              return null;
                                            } else {
                                              return "You must fill the field";
                                            }
                                          },
                                          decoration: InputDecoration(
                                              label: Text("Paste poster Url"),
                                              border: OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          5))),
                                        ),
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
                                        items: _categories
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
                              onTap: () async {
                                if (formKey.currentState!.validate()) {
                                  if (widget.posterNumbr == 'Poster1') {
                                    try {
                                      await firestore
                                          .collection("Poster1")
                                          .add({
                                        "subtitle": subtitle.text,
                                        "heading1": heading.text,
                                        "heading2": heading2.text,
                                        "posterUrl": posterUrl.text,
                                        'category': dropValue,
                                        "posterNumbr": widget.posterNumbr
                                      });

                                      posterUrl.clear();
                                      heading2.clear();
                                      subtitle.clear();
                                      heading.clear();

                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(SnackBar(
                                        content: Text(
                                          "Poster1 Added Successfully!",
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
                                          "Failed to add Poster1: $e",
                                          style: TextStyle(color: Colors.white),
                                        ),
                                        backgroundColor: Colors.red,
                                      ));
                                    }
                                  } else if (widget.posterNumbr == 'Poster2') {
                                    try {
                                      await firestore
                                          .collection("Poster2")
                                          .add({
                                        "subtitle": subtitle.text,
                                        "heading1": heading.text,
                                        "heading2": heading2.text,
                                        "posterUrl": posterUrl.text,
                                        'category': dropValue,
                                        "posterNumbr": widget.posterNumbr
                                      });

                                      posterUrl.clear();
                                      heading2.clear();
                                      subtitle.clear();
                                      heading.clear();
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(SnackBar(
                                        content: Text(
                                          "Poster2 Added Successfully!",
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
                                          "Failed to add Poster2: $e",
                                          style: TextStyle(color: Colors.white),
                                        ),
                                        backgroundColor: Colors.red,
                                      ));
                                    }
                                  } else if (widget.posterNumbr == 'Poster3') {
                                    try {
                                      await firestore
                                          .collection("Poster3")
                                          .add({
                                        "subtitle": subtitle.text,
                                        "heading1": heading.text,
                                        "heading2": heading2.text,
                                        "posterUrl": posterUrl.text,
                                        'category': dropValue,
                                        "posterNumbr": widget.posterNumbr
                                      });

                                      posterUrl.clear();
                                      heading2.clear();
                                      subtitle.clear();
                                      heading.clear();
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(SnackBar(
                                        content: Text(
                                          "Poster3 Added Successfully!",
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
                                          "Failed to add Poster3: $e",
                                          style: TextStyle(color: Colors.white),
                                        ),
                                        backgroundColor: Colors.red,
                                      ));
                                    }
                                  } else if (widget.posterNumbr == 'Poster4') {
                                    try {
                                      await firestore
                                          .collection("Poster4")
                                          .add({
                                        "subtitle": subtitle.text,
                                        "heading1": heading.text,
                                        "heading2": heading2.text,
                                        "posterUrl": posterUrl.text,
                                        'category': dropValue,
                                        "posterNumbr": widget.posterNumbr
                                      });

                                      posterUrl.clear();
                                      heading2.clear();
                                      subtitle.clear();
                                      heading.clear();
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(SnackBar(
                                        content: Text(
                                          "Poster4 Added Successfully!",
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
                                          "Failed to add Poster4: $e",
                                          style: TextStyle(color: Colors.white),
                                        ),
                                        backgroundColor: Colors.red,
                                      ));
                                    }
                                  } else if (widget.posterNumbr == 'Poster5') {
                                    try {
                                      await firestore
                                          .collection("Poster5")
                                          .add({
                                        "subtitle": subtitle.text,
                                        "heading1": heading.text,
                                        "heading2": heading2.text,
                                        "posterUrl": posterUrl.text,
                                        'category': dropValue,
                                        "posterNumbr": widget.posterNumbr
                                      });

                                      posterUrl.clear();
                                      heading2.clear();
                                      subtitle.clear();
                                      heading.clear();
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(SnackBar(
                                        content: Text(
                                          "Poster5 Added Successfully!",
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
                                          "Failed to add Poster5: $e",
                                          style: TextStyle(color: Colors.white),
                                        ),
                                        backgroundColor: Colors.red,
                                      ));
                                    }
                                  } else if (widget.posterNumbr == 'Poster6') {
                                    try {
                                      await firestore
                                          .collection("Poster6")
                                          .add({
                                        "subtitle": subtitle.text,
                                        "heading1": heading.text,
                                        "heading2": heading2.text,
                                        "posterUrl": posterUrl.text,
                                        'category': dropValue,
                                        "posterNumbr": widget.posterNumbr
                                      });

                                      posterUrl.clear();
                                      heading2.clear();
                                      subtitle.clear();
                                      heading.clear();
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(SnackBar(
                                        content: Text(
                                          "Poster6 Added Successfully!",
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
                                          "Failed to add Poster6: $e",
                                          style: TextStyle(color: Colors.white),
                                        ),
                                        backgroundColor: Colors.red,
                                      ));
                                    }
                                  } else if (widget.posterNumbr == 'Poster7') {
                                    try {
                                      await firestore
                                          .collection("Poster7")
                                          .add({
                                        "subtitle": subtitle.text,
                                        "heading1": heading.text,
                                        "heading2": heading2.text,
                                        "posterUrl": posterUrl.text,
                                        'category': dropValue,
                                        "posterNumbr": widget.posterNumbr
                                      });

                                      posterUrl.clear();
                                      heading2.clear();
                                      subtitle.clear();
                                      heading.clear();
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(SnackBar(
                                        content: Text(
                                          "Poster7 Added Successfully!",
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
                                          "Failed to add Poster7: $e",
                                          style: TextStyle(color: Colors.white),
                                        ),
                                        backgroundColor: Colors.red,
                                      ));
                                    }
                                  } else {
                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(SnackBar(
                                      content: Text(
                                        "Invalid poster number. Data not added.",
                                        style: TextStyle(color: Colors.white),
                                      ),
                                      backgroundColor: Colors.orange,
                                    ));
                                  }
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
