import 'package:admin_app_wahy/view/homescreen/widget/invoice_page.dart';
import 'package:admin_app_wahy/view/homescreen/widget/pendingorder_products.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class CancelledorderPage extends StatelessWidget {
  const CancelledorderPage({super.key});

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
        'address': 'letterkenny',
        'items': '1',
        'charge': '4.95',
        'price': '8.64',
        'method': 'COD',
        'status': 'Cancel',
        'Action': ''
      },
      {
        '#': '2',
        'Orderid': '525854',
        'address': 'letterkenny',
        'items': '1',
        'charge': '4.95',
        'price': '8.64',
        'method': 'COD',
        'status': 'Cancel',
        'Action': ''
      }
    ];

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
          stream: firestore.collection("cancelledOrders").snapshots(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }

            if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
              return const Center(child: Text("No cancelled orders found."));
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
                    final cancelDetails =
                        documents[index].data() as Map<String, dynamic>;

                    // Access 'cartItems' using the correct string key
                    List cartItems = cancelDetails['cartItems'] ?? [];
                    int itemCount = cartItems.length;
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
                          cancelDetails['orderId'],
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w600,
                              fontSize: 14),
                        )),
                        DataCell(Text(
                          cancelDetails['address'],
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w600,
                              fontSize: 14),
                        )),
                        DataCell(Text(
                          itemCount.toString(),
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w600,
                              fontSize: 14),
                        )),
                        DataCell(Text(
                          cancelDetails['totalPrice'].toString(),
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w600,
                              fontSize: 14),
                        )),
                        DataCell(Text(
                          cancelDetails['paymentMethod'],
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w600,
                              fontSize: 14),
                        )),
                        DataCell(Text(
                          "Cancel",
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
                          onSelected: (value) {
                            if (value == 1) {
                              //products
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          PendingorderProducts(
                                            products: cartItems,
                                          )));
                            } else if (value == 2) {
                              // Prepare data for the invoice page
                              String invoiceId =
                                  cancelDetails['invoiceId'] ?? '';
                              String orderId = cancelDetails['orderId'] ?? '';
                              String address = cancelDetails['address'] ?? '';
                              String paymentMethod =
                                  cancelDetails['paymentMethod'] ?? '';
                              num totalPrice = cancelDetails['totalPrice'];
                              String currentDate =
                                  DateTime.now().toIso8601String();
                              //invoice
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => InvoicePage(
                                            address: address,
                                            cartItems: cartItems,
                                            currentDate: currentDate,
                                            invoiceId: invoiceId,
                                            orderid: orderId,
                                            paymentMethod: paymentMethod,
                                            totalPrice: totalPrice,
                                          )));
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
                            PopupMenuItem(
                              value: 2,
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.download,
                                    size: 18,
                                    color: Colors.black,
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    "Invoice",
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
        ),
      ],
    );
  }
}
