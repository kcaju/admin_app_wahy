import 'package:admin_app_wahy/view/homescreen/widget/header_box.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';

class AssignDeliveryboyPage extends StatefulWidget {
  const AssignDeliveryboyPage({super.key});

  @override
  State<AssignDeliveryboyPage> createState() => _AssignDeliveryboyPageState();
}

class _AssignDeliveryboyPageState extends State<AssignDeliveryboyPage> {
  List deliveryBoys = [];
  TextEditingController boy = TextEditingController();
  final formKey = GlobalKey<FormState>();
  String? selectedEmail;
  // Firestore instance
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  // Fetch partners from Firestore
  Future<void> fetchPartners() async {
    try {
      QuerySnapshot snapshot = await firestore
          .collection('Partners')
          .where('status', isEqualTo: 'Active')
          .get();

      setState(() {
        deliveryBoys = snapshot.docs
            .map((doc) => {
                  'name': doc['name'] as String,
                  'email': doc['email'] as String,
                })
            .toList();
      });
    } catch (e) {
      print("Error fetching partners: $e");
    }
  }

  // // Send email using share_plus
  // void sendEmail(String recipientEmail) {
  //   final emailUri = Uri(
  //     scheme: 'mailto',
  //     path: recipientEmail,
  //     query: Uri.encodeQueryComponent(
  //         'subject=New Delivery Assignment&body=You have been assigned a new delivery task.'),
  //   ).toString();

  //   Share.share(emailUri);
  // }

  @override
  void initState() {
    fetchPartners();
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
          padding: EdgeInsets.symmetric(horizontal: 2, vertical: 2),
          child: Container(
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(15)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
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
                              "Assign",
                              style: TextStyle(
                                  color: Colors.grey.shade600,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 25),
                            ),
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
                              child: TextField(
                                controller: boy,
                                readOnly: true,
                                decoration: InputDecoration(
                                  hintText: 'Select Delivery Boy',
                                  border: OutlineInputBorder(),
                                  suffixIcon: PopupMenuButton<String>(
                                    child: Icon(
                                      Icons.arrow_drop_down,
                                      size: isDesktop ? 25 : 30,
                                      color: Colors.black,
                                    ),
                                    onSelected: (value) {
                                      final selectedBoy =
                                          deliveryBoys.firstWhere(
                                              (boy) => boy['name'] == value);
                                      boy.text = selectedBoy['name']!;
                                      selectedEmail = selectedBoy['email'];
                                      setState(() {});
                                    },
                                    itemBuilder: (context) {
                                      return deliveryBoys
                                          .map((category) =>
                                              PopupMenuItem<String>(
                                                value: category['name']!,
                                                child: Text(category['name']!),
                                              ))
                                          .toList();
                                    },
                                    offset: Offset(
                                        0, 50), // Adjusts the popup position
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            //BUTTON
                            GestureDetector(
                              onTap: () {
                                if (formKey.currentState!.validate() &&
                                    selectedEmail != null) {
                                  Share.share(
                                      "You have been assigned a new delivery task.Please collect it from our office");
                                  boy.clear();
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(SnackBar(
                                          content: Text(
                                    "Delivery Boy Assigned Successfully !!!",
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
                                    "ASSIGN",
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
