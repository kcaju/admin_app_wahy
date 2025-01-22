import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class CountryPage extends StatelessWidget {
  const CountryPage({super.key, this.onAddCountryTap});
  final void Function()? onAddCountryTap;

  @override
  Widget build(BuildContext context) {
    final List<Map> country = [
      {'CountryName': 'Ireland', '#': '1', 'Status': '', 'Action': ''},
      {'CountryName': 'India', '#': '2', 'Status': '', 'Action': ''},
    ];

    // Use MediaQuery to get screen width and height
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    // Determine screen type based on width
    bool isMobile = screenWidth < 600;
    bool isTablet = screenWidth >= 600 && screenWidth <= 1024;
    bool isDesktop = screenWidth > 1024;

    // Get Firestore instance
    final FirebaseFirestore firestore = FirebaseFirestore.instance;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Countries",
              style: TextStyle(
                  color: Colors.grey.shade800,
                  fontWeight: FontWeight.w500,
                  fontSize: 22),
            ),
            GestureDetector(
              onTap: onAddCountryTap,
              child: Container(
                padding: EdgeInsets.only(left: 8),
                height: 40,
                width: isMobile ? 120 : 140,
                child: Center(
                  child: Row(
                    children: [
                      Icon(
                        Icons.add,
                        color: Colors.white,
                      ),
                      Text(
                        "Add Country",
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
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
        //table with firestore data
        StreamBuilder<QuerySnapshot>(
          stream: firestore.collection("Countries").snapshots(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }

            if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
              return const Center(child: Text("No countries found."));
            }

            final List<QueryDocumentSnapshot> documents = snapshot.data!.docs;

            return SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: DataTable(
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
                    'CountryName',
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w900,
                        fontSize: 16),
                  )),
                  DataColumn(
                      label: Text(
                    'Status',
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
                    final country = documents[index];
                    final String countryName = country['countryName'];
                    final String status = country['status'];
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
                          countryName,
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w600,
                              fontSize: 14),
                        )),
                        DataCell(
                          Container(
                            height: 20,
                            width: isDesktop ? 80 : 110,
                            padding: EdgeInsets.only(left: isDesktop ? 5 : 0),
                            child: Center(
                                child: Text(
                              status,
                              style: TextStyle(
                                  color: status == 'Active'
                                      ? Colors.green.shade700
                                      : Colors.red.shade700,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12),
                            )),
                            decoration: BoxDecoration(
                                color: status == 'Active'
                                    ? Colors.green.shade200
                                    : Colors.red.shade200,
                                border: Border.all(
                                  color: status == 'Active'
                                      ? Colors.green.shade700
                                      : Colors.red.shade700,
                                ),
                                borderRadius: BorderRadius.circular(8)),
                          ),
                        ),
                        DataCell(PopupMenuButton<int>(
                          child: Icon(
                            Icons.more_vert,
                            color: Colors.grey.shade600,
                          ),
                          onSelected: (value) async {
                            if (value == 1) {
                              // Edit logic
                              final newStatus =
                                  status == "Active" ? "Inactive" : "Active";
                              await firestore
                                  .collection('Countries')
                                  .doc(country.id)
                                  .update({'status': newStatus});
                            } else if (value == 2) {
                              // Delete logic
                              await firestore
                                  .collection('Countries')
                                  .doc(country.id)
                                  .delete();
                            }
                          }, //dropdown selection press
                          itemBuilder: (context) => [
                            PopupMenuItem(
                              value: 1,
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.edit,
                                    size: 18,
                                    color: Colors.black,
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    "Edit",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.normal),
                                  ),
                                ],
                              ),
                            ),
                            PopupMenuItem(
                              value: 2,
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
