import 'package:admin_app_wahy/view/homescreen/widget/invoice_page.dart';
import 'package:admin_app_wahy/view/homescreen/widget/pendingorder_products.dart';
import 'package:flutter/material.dart';

class OutforDeliveryPage extends StatelessWidget {
  const OutforDeliveryPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Use MediaQuery to get screen width and height
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    // Determine screen type based on width
    bool isMobile = screenWidth < 600;
    bool isTablet = screenWidth >= 600 && screenWidth <= 1024;
    bool isDesktop = screenWidth > 1024;

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

    final List brands = [
      {
        '#': '1',
        'id': '123456',
        'address': 'puthiya veettil',
        'items': '1',
        'action': '',
        'charge': '4.95',
        'price': '15.95',
        'method': 'COD',
        'status': 'Delivery'
      },
      {
        '#': '2',
        'id': '123456',
        'address': 'puthiya veed',
        'items': '1',
        'action': '',
        'charge': '4.95',
        'price': '15.95',
        'method': 'COD',
        'status': 'Delivery'
      },
    ];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Orders For Delivery",
          style: TextStyle(
              color: Colors.grey.shade800,
              fontWeight: FontWeight.w500,
              fontSize: 22),
        ),
        SizedBox(
          height: 15,
        ),
        //table
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: DataTable(
            // dataRowHeight: 200,
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
                'Adress',
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
                'Shipping Charge',
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
              brands.length,
              (index) {
                final brand = brands[index];
                return DataRow(
                  cells: [
                    DataCell(Text(
                      brand['#']!,
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                          fontSize: 14),
                    )),
                    DataCell(Text(
                      brand['id']!,
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                          fontSize: 14),
                    )),
                    DataCell(Text(
                      brand['address']!,
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                          fontSize: 14),
                    )),
                    DataCell(Text(
                      brand['items']!,
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                          fontSize: 14),
                    )),
                    DataCell(Text(
                      brand['charge']!,
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                          fontSize: 14),
                    )),
                    DataCell(Text(
                      brand['price']!,
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                          fontSize: 14),
                    )),
                    DataCell(Text(
                      brand['method']!,
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                          fontSize: 14),
                    )),
                    DataCell(Text(
                      brand['status']!,
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
                                builder: (context) => PendingorderProducts(
                                  products: products,
                                ),
                              ));
                        } else if (value == 2) {
                          //invoice
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => InvoicePage(),
                              ));
                        }
                      }, //dropdown selection press
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
        ),
      ],
    );
  }
}
