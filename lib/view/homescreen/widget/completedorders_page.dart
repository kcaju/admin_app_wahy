import 'package:admin_app_wahy/view/homescreen/widget/invoice_page.dart';
import 'package:admin_app_wahy/view/homescreen/widget/pendingorder_products.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class CompletedordersPage extends StatelessWidget {
  const CompletedordersPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Get Firestore instance
    final FirebaseFirestore firestore = FirebaseFirestore.instance;
    final List<Map<String, String>> products = [
      {
        'name': 'curry powder',
        'price': '3.5',
        'image': 'assets/images/currypowder.jpg'
      },
      {
        'name': 'curry powder',
        'price': '3.5',
        'image': 'assets/images/currypowder.jpg'
      },
      {
        'name': 'curry powder',
        'price': '3.5',
        'image': 'assets/images/currypowder.jpg'
      },
    ];
    final List orders = [
      {
        '#': '1',
        'Orderid': '525874',
        'address': 'puthiya vettil',
        'items': '1',
        'charge': '4.95',
        'price': '8.64',
        'method': 'COD',
        'status': '',
        'Action': ''
      },
      {
        '#': '2',
        'Orderid': '525854',
        'address': 'puthiya vettil',
        'items': '1',
        'charge': '4.95',
        'price': '8.64',
        'method': 'COD',
        'status': '',
        'Action': ''
      }
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Orders",
          style: TextStyle(
              color: Colors.grey.shade800,
              fontWeight: FontWeight.w500,
              fontSize: 22),
        ),
        SizedBox(
          height: 15,
        ),
        //table
        StreamBuilder<QuerySnapshot>(
          stream: firestore.collection("completedOrders").snapshots(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }

            if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
              return const Center(child: Text("No orders found."));
            }

            final List<QueryDocumentSnapshot> documents = snapshot.data!.docs;
            return SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: DataTable(
                dataRowHeight: 100,
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
                    'OrderId',
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w900,
                        fontSize: 18),
                  )),
                  DataColumn(
                      label: Text(
                    'Address',
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w900,
                        fontSize: 16),
                  )),
                  DataColumn(
                      label: Text(
                    'Total Items',
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w900,
                        fontSize: 16),
                  )),
                  DataColumn(
                      label: Text(
                    'Total Price',
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w900,
                        fontSize: 16),
                  )),
                  DataColumn(
                      label: Text(
                    'Payment Method',
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
                    // Correctly cast document data to a Map
                    final compltedOrders =
                        documents[index].data() as Map<String, dynamic>;

                    // Access 'products' safely
                    List products = compltedOrders['products'] ?? [];

                    List allItems = [];

// Loop through each product and extract 'items' array
                    for (var product in products) {
                      if (product is Map<String, dynamic> &&
                          product.containsKey('items')) {
                        allItems.addAll(product['items']);
                      }
                    }

                    print("Extracted Items: $allItems");

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
                          compltedOrders['orderId'],
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w600,
                              fontSize: 14),
                        )),
                        DataCell(Text(
                          compltedOrders['address'],
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w600,
                              fontSize: 14),
                        )),
                        DataCell(Text(
                          compltedOrders['totalItems'].toString(),
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w600,
                              fontSize: 14),
                        )),
                        DataCell(Text(
                          compltedOrders['totalPrice'].toString(),
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w600,
                              fontSize: 14),
                        )),
                        DataCell(Text(
                          compltedOrders['paymentMethod'],
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w600,
                              fontSize: 14),
                        )),
                        DataCell(Container(
                          height: 30,
                          width: 100,
                          child: Center(
                            child: Text(
                              "Completed",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 14),
                            ),
                          ),
                          decoration: BoxDecoration(
                              color: Colors.green,
                              borderRadius: BorderRadius.circular(8)),
                        )),
                        DataCell(PopupMenuButton<int>(
                          child: Icon(
                            Icons.more_vert,
                            color: Colors.grey.shade600,
                          ),
                          onSelected: (value) {
                            if (value == 1) {
                              //products
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          PendingorderProducts(
                                            products: allItems,
                                          )));
                            } else if (value == 2) {
                              //invoice
                              // Navigator.push(
                              //     context,
                              //     MaterialPageRoute(
                              //         builder: (context) => InvoicePage()));
                            }
                          },
                          itemBuilder: (context) => [
                            PopupMenuItem(
                              value: 1,
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.visibility,
                                    size: 18,
                                    color: Colors.black,
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    "Products",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.normal),
                                  ),
                                ],
                              ),
                            ),
                            // PopupMenuItem(
                            //   value: 2,
                            //   child: Row(
                            //     children: [
                            //       Icon(
                            //         Icons.download,
                            //         size: 18,
                            //         color: Colors.black,
                            //       ),
                            //       SizedBox(
                            //         width: 5,
                            //       ),
                            //       Text(
                            //         "Invoice",
                            //         style: TextStyle(
                            //             color: Colors.black,
                            //             fontWeight: FontWeight.normal),
                            //       ),
                            //     ],
                            //   ),
                            // ),
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
