import 'package:admin_app_wahy/view/homescreen/widget/assign_deliveryboy_page.dart';
import 'package:admin_app_wahy/view/homescreen/widget/invoice_page.dart';
import 'package:admin_app_wahy/view/homescreen/widget/pendingorder_products.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class PendingordersPage extends StatelessWidget {
  const PendingordersPage({super.key});

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
        'orderid': '849301',
        '#': '1',
        'address': 'Sunrise Villa',
        'shipping': '7.50',
        'total': '3',
        'price': '25.80',
        'payment': 'Online',
        'Status1': "Out For Delivery",
        'Status2': "Cancel",
        'Action': '',
      },
      {
        'orderid': '239847',
        '#': '2',
        'address': 'Palm Grove Residency',
        'shipping': '6.20',
        'total': '1',
        'price': '18.75',
        'payment': 'COD',
        'Status1': "Out For Delivery",
        'Status2': "Cancel",
        'Action': '',
      },
      {
        'orderid': '982451',
        '#': '3',
        'address': 'Maple Woods',
        'shipping': '5.95',
        'total': '4',
        'price': '40.00',
        'payment': 'Online',
        'Status1': "Out For Delivery",
        'Status2': "Cancel",
        'Action': '',
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
          stream: firestore.collection("orderedDetails").snapshots(),
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
                    final orderDetails =
                        documents[index].data() as Map<String, dynamic>;

                    // Access 'cartItems' using the correct string key
                    List cartItems = orderDetails['cartItems'] ?? [];
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
                          orderDetails['orderId'],
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w600,
                              fontSize: 14),
                        )),
                        DataCell(Text(
                          orderDetails['address'],
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w600,
                              fontSize: 14),
                        )),
                        DataCell(Text(
                          '$itemCount',
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w600,
                              fontSize: 14),
                        )),
                        DataCell(Text(
                          orderDetails['totalPrice'].toString(),
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w600,
                              fontSize: 14),
                        )),
                        DataCell(Text(
                          orderDetails['paymentMethod'],
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w600,
                              fontSize: 14),
                        )),
                        DataCell(
                          Row(
                            children: [
                              //outfor delivery button
                              GestureDetector(
                                onTap: () {
                                  String invoiceId =
                                      orderDetails['invoiceId'] ?? '';
                                  String orderId =
                                      orderDetails['orderId'] ?? '';
                                  String address =
                                      orderDetails['address'] ?? '';
                                  String paymentMethod =
                                      orderDetails['paymentMethod'] ?? '';
                                  num totalPrice = orderDetails['totalPrice'];
                                  String currentDate =
                                      DateTime.now().toIso8601String();
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            AssignDeliveryboyPage(
                                          address: address,
                                          currentDate: currentDate,
                                          invoiceId: invoiceId,
                                          orderId: orderId,
                                          paymentMethod: paymentMethod,
                                          totalPrice: totalPrice,
                                          cartItems: cartItems,
                                        ),
                                      ));
                                },
                                child: Container(
                                  height: 40,
                                  width: isDesktop ? 80 : 110,
                                  padding:
                                      EdgeInsets.only(left: isDesktop ? 5 : 0),
                                  child: Center(
                                      child: Text(
                                    'Out for Delivery',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 12),
                                  )),
                                  decoration: BoxDecoration(
                                      color: Colors.green,
                                      borderRadius: BorderRadius.circular(8)),
                                ),
                              ),
                              SizedBox(width: 4),
                              //cancel buton
                              GestureDetector(
                                onTap: () async {
                                  String invoiceId =
                                      orderDetails['invoiceId'] ?? '';
                                  String orderId =
                                      orderDetails['orderId'] ?? '';
                                  String address =
                                      orderDetails['address'] ?? '';
                                  String paymentMethod =
                                      orderDetails['paymentMethod'] ?? '';
                                  num totalPrice = orderDetails['totalPrice'];
                                  String currentDate =
                                      DateTime.now().toIso8601String();
                                  //to cancelled order colletn
                                  try {
                                    // Add order details to the cancelledOrders collection
                                    await firestore
                                        .collection("cancelledOrders")
                                        .add({
                                      'orderId': orderId,
                                      'invoiceId': invoiceId,
                                      'paymentMethod': paymentMethod,
                                      'totalPrice': totalPrice,
                                      'address': address,
                                      'currentDate': currentDate,
                                      'cartItems': cartItems,
                                    });

                                    // Delete the order from orderDetails collection
                                    var querySnapshot = await firestore
                                        .collection("orderedDetails")
                                        .where('orderId', isEqualTo: orderId)
                                        .get();

                                    for (var doc in querySnapshot.docs) {
                                      await doc.reference.delete();
                                    }

                                    // Show success message
                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(SnackBar(
                                      backgroundColor: Colors.green,
                                      content: Text(
                                        "Order Cancelled !!",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20,
                                        ),
                                      ),
                                    ));
                                  } catch (error) {
                                    // Show error message if either operation fails
                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(SnackBar(
                                      backgroundColor: Colors.red,
                                      content: Text(
                                        "Failed to cancel order: $error",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20,
                                        ),
                                      ),
                                    ));
                                  }
                                },
                                child: Container(
                                  height: 40,
                                  width: 80,
                                  child: Center(
                                      child: Text(
                                    'Cancel',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 12),
                                  )),
                                  decoration: BoxDecoration(
                                      color: Colors.red,
                                      borderRadius: BorderRadius.circular(8)),
                                ),
                              ),
                            ],
                          ),
                        ),
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
                                  orderDetails['invoiceId'] ?? '';
                              String orderId = orderDetails['orderId'] ?? '';
                              String address = orderDetails['address'] ?? '';
                              String paymentMethod =
                                  orderDetails['paymentMethod'] ?? '';
                              num totalPrice = orderDetails['totalPrice'];
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
