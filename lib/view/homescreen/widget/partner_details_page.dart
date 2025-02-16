import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class PartnerDetailsPage extends StatelessWidget {
  const PartnerDetailsPage({super.key, this.onAddNewTap});
  final void Function()? onAddNewTap;

  @override
  Widget build(BuildContext context) {
    final List<Map> category = [
      {
        'id': 'GM0003/DP',
        '#': '1',
        'created': 'May 16 2024, 9:57 a.m.',
        'Action': '',
        'Image': 'assets/images/boy.jpg',
        'name': 'daniel',
        'email': 'daniel@gmail.com',
        'user': 'daniel@123',
        'password': 'dani123',
      },
      {
        'id': 'GM0003/DP',
        '#': '2',
        'created': 'May 16 2024, 9:57 a.m.',
        'Action': '',
        'Image': 'assets/images/boy.jpg',
        'name': 'daniel',
        'email': 'daniel@gmail.com',
        'user': 'daniel@123',
        'password': 'dani123',
      },
      {
        'id': 'GM0003/DP',
        '#': '3',
        'created': 'May 16 2024, 9:57 a.m.',
        'Action': '',
        'Image': 'assets/images/boy.jpg',
        'name': 'daniel',
        'email': 'daniel@gmail.com',
        'user': 'daniel@123',
        'password': 'dani123',
      },
    ];

    // Get Firestore instance
    final FirebaseFirestore firestore = FirebaseFirestore.instance;

    // Use MediaQuery to get screen width and height
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    // Determine screen type based on width
    bool isMobile = screenWidth < 600;
    bool isTablet = screenWidth >= 600 && screenWidth <= 1024;
    bool isDesktop = screenWidth > 1024;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Category",
              style: TextStyle(
                  color: Colors.grey.shade800,
                  fontWeight: FontWeight.w500,
                  fontSize: 22),
            ),
            //button
            GestureDetector(
              onTap: onAddNewTap,
              child: Container(
                padding: EdgeInsets.only(left: 8),
                height: 40,
                width: isMobile ? 110 : 130,
                child: Center(
                  child: Row(
                    children: [
                      Icon(
                        Icons.add,
                        color: Colors.white,
                      ),
                      Text(
                        "Add New",
                        style: TextStyle(
                            fontSize: isMobile ? 12 : 15,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(20)),
              ),
            )
          ],
        ),
        SizedBox(
          height: 15,
        ),
        //table
        StreamBuilder<QuerySnapshot>(
          stream: firestore.collection("Partners").snapshots(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }

            if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
              return const Center(child: Text("No Partners found."));
            }

            final List<QueryDocumentSnapshot> documents = snapshot.data!.docs;
            return SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: DataTable(
                dataRowHeight: 200,
                columns: const [
                  DataColumn(
                      label: Text(
                    '#',
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w900,
                        fontSize: 18),
                  )),
                  DataColumn(
                      label: Text(
                    'Personal Id',
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w900,
                        fontSize: 16),
                  )),
                  DataColumn(
                      label: Text(
                    'Image',
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w900,
                        fontSize: 18),
                  )),
                  DataColumn(
                      label: Text(
                    'Name',
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w900,
                        fontSize: 16),
                  )),
                  DataColumn(
                      label: Text(
                    'Email',
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w900,
                        fontSize: 16),
                  )),
                  DataColumn(
                      label: Text(
                    'Username',
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w900,
                        fontSize: 16),
                  )),
                  DataColumn(
                      label: Text(
                    'Password',
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w900,
                        fontSize: 16),
                  )),
                  DataColumn(
                      label: Text(
                    'Created At',
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w900,
                        fontSize: 16),
                  )),
                  DataColumn(
                      label: Text(
                    'Action',
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w900,
                        fontSize: 16),
                  )),
                ],
                rows: List.generate(
                  documents.length,
                  (index) {
                    final partners = documents[index];
                    final String id = partners['id'];

                    return DataRow(
                      cells: [
                        DataCell(Text(
                          '${index + 1}',
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w600,
                              fontSize: 14),
                        )),
                        DataCell(Text(
                          partners['id']!,
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w600,
                              fontSize: 14),
                        )),
                        DataCell(Padding(
                          padding: const EdgeInsets.all(5),
                          child: Container(
                            height: 150,
                            width: 150,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    fit: BoxFit.fill,
                                    image: NetworkImage(partners['url']!))),
                          ),
                        )),
                        DataCell(Text(
                          partners['name']!,
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w600,
                              fontSize: 14),
                        )),
                        DataCell(Text(
                          partners['email']!,
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w600,
                              fontSize: 14),
                        )),
                        DataCell(Text(
                          partners['username']!,
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w600,
                              fontSize: 14),
                        )),
                        DataCell(Text(
                          partners['password']!,
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w600,
                              fontSize: 14),
                        )),
                        DataCell(Text(
                          partners['created']!,
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w600,
                              fontSize: 14),
                        )),
                        DataCell(PopupMenuButton<int>(
                          child: Icon(
                            Icons.more_vert,
                            color: Colors.grey.shade600,
                          ),
                          onSelected: (value) async {
                            if (value == 1) {
                              // Delete from Firestore
                              await firestore
                                  .collection('Partners')
                                  .doc(id)
                                  .delete();
                            }
                          }, //dropdown selection press
                          itemBuilder: (context) => [
                            PopupMenuItem(
                              value: 1,
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.delete_outline,
                                    size: 18,
                                    color: Colors.black,
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    "Delete",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.normal),
                                  ),
                                ],
                              ),
                            ),
                          ],
                          offset: Offset(0, 50), // Adjusts the popup position
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        )),
                      ],
                    );
                  },
                ),
              ),
            );
          },
        )
      ],
    );
  }
}
