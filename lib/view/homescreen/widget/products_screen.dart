import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ProductsScreen extends StatefulWidget {
  const ProductsScreen({super.key, this.onAddProductTap});
  final void Function()? onAddProductTap;

  @override
  State<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  TextEditingController searchController = TextEditingController();

  int? dropValue;
  String searchQuery = "";

  // Get Firestore instance
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
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
        // Header with Title and Add Product Button
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Products",
              style: TextStyle(
                  color: Colors.grey.shade800,
                  fontWeight: FontWeight.w500,
                  fontSize: 22),
            ),
            GestureDetector(
              onTap: widget.onAddProductTap,
              child: Container(
                padding: const EdgeInsets.only(left: 8),
                height: 40,
                width: isMobile ? 140 : 130,
                child: Center(
                  child: Row(
                    children: const [
                      Icon(Icons.add, color: Colors.white),
                      Text(
                        "Add Product",
                        style: TextStyle(
                            fontSize: 15,
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
        const SizedBox(height: 20),

        // Show Entries Dropdown
        Row(
          children: [
            const Text('Show ', style: TextStyle(fontSize: 16)),
            DropdownButton<int>(
              value: dropValue,
              items: <int>[5, 10, 15].map((int value) {
                return DropdownMenuItem<int>(
                  value: value,
                  child: Text(value.toString()),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  dropValue = value;
                });
              },
            ),
            const Text(' entries', style: TextStyle(fontSize: 16)),
          ],
        ),
        const SizedBox(height: 10),

        // Search Field
        Row(
          children: [
            const Text('Search: ', style: TextStyle(fontSize: 16)),
            SizedBox(
              width: 200,
              height: 40,
              child: TextFormField(
                controller: searchController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                ),
                onChanged: (text) {
                  setState(() {
                    searchQuery = text.toLowerCase();
                  });
                },
              ),
            ),
          ],
        ),
        const SizedBox(height: 15),

        // Table
        StreamBuilder<QuerySnapshot>(
          stream: firestore.collection("Products").snapshots(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }

            if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
              return const Center(child: Text("No Products found."));
            }

            final List<QueryDocumentSnapshot> allDocuments =
                snapshot.data!.docs;

            // Apply search filter
            final List<QueryDocumentSnapshot> filteredDocuments = allDocuments
                .where((doc) =>
                    doc['productName']
                        .toString()
                        .toLowerCase()
                        .contains(searchQuery) ||
                    doc['productCode']
                        .toString()
                        .toLowerCase()
                        .contains(searchQuery))
                .toList();

            // Apply "Show Entries" filter
            final int entriesToShow =
                dropValue != null ? dropValue! : filteredDocuments.length;
            final List<QueryDocumentSnapshot> displayedDocuments =
                filteredDocuments.take(entriesToShow).toList();

            if (displayedDocuments.isEmpty) {
              return const Center(child: Text("No matching products found."));
            }

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
                    'Product Image',
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w900,
                        fontSize: 18),
                  )),
                  DataColumn(
                      label: Text(
                    'Product Code',
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w900,
                        fontSize: 18),
                  )),
                  DataColumn(
                      label: Text(
                    'Product Name',
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w900,
                        fontSize: 18),
                  )),
                  DataColumn(
                      label: Text(
                    'Price',
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w900,
                        fontSize: 18),
                  )),
                  DataColumn(
                      label: Text(
                    'Total (Tax Incl.)',
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w900,
                        fontSize: 18),
                  )),
                  DataColumn(
                      label: Text(
                    'Brand',
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w900,
                        fontSize: 18),
                  )),
                  DataColumn(
                      label: Text(
                    'Category',
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w900,
                        fontSize: 18),
                  )),
                  DataColumn(
                      label: Text(
                    'Created At',
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w900,
                        fontSize: 18),
                  )),
                  DataColumn(
                      label: Text(
                    'Updated At',
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w900,
                        fontSize: 18),
                  )),
                  DataColumn(
                      label: Text(
                    'Opening Stock',
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w900,
                        fontSize: 18),
                  )),
                  DataColumn(
                      label: Text(
                    'Current Stock',
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w900,
                        fontSize: 18),
                  )),
                  DataColumn(
                      label: Text(
                    'Status',
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w900,
                        fontSize: 18),
                  )),
                  DataColumn(
                      label: Text(
                    'Action',
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w900,
                        fontSize: 18),
                  )),
                ],
                rows: List.generate(
                  displayedDocuments.length,
                  (index) {
                    final product = displayedDocuments[index];
                    return DataRow(
                      cells: [
                        DataCell(Text(
                          '${index + 1}',
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w600,
                              fontSize: 14),
                        )),
                        DataCell(Padding(
                          padding: const EdgeInsets.all(5),
                          child: Container(
                            height: 150,
                            width: 100,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    fit: BoxFit.fill,
                                    image:
                                        NetworkImage(product['productUrl']))),
                          ),
                        )),
                        DataCell(Text(
                          product['productCode'],
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w600,
                              fontSize: 14),
                        )),
                        DataCell(Text(
                          product['productName'],
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w600,
                              fontSize: 14),
                        )),
                        DataCell(Text(
                          product['ourPrice'].toString(),
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w600,
                              fontSize: 14),
                        )),
                        DataCell(Text(
                          product['originalPrice'],
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w600,
                              fontSize: 14),
                        )),
                        DataCell(Text(
                          product['brand'],
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w600,
                              fontSize: 14),
                        )),
                        DataCell(Text(
                          product['category'],
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w600,
                              fontSize: 14),
                        )),
                        DataCell(Text(
                          product['created'],
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w600,
                              fontSize: 14),
                        )),
                        DataCell(Text(
                          product['updated'],
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w600,
                              fontSize: 14),
                        )),
                        DataCell(Text(
                          product['openstock'],
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w600,
                              fontSize: 14),
                        )),
                        DataCell(Text(
                          product['currentstock'],
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w600,
                              fontSize: 14),
                        )),
                        DataCell(
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 8),
                            decoration: BoxDecoration(
                              color: product['status'] == 'Active'
                                  ? Colors.green.shade200
                                  : Colors.red.shade200,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Text(
                              product['status'],
                              style: TextStyle(
                                color: product['status'] == 'Active'
                                    ? Colors.green
                                    : Colors.red,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        DataCell(PopupMenuButton<int>(
                          onSelected: (value) async {
                            if (value == 1) {
                              // Edit logic
                              final newStatus = product['status'] == 'Active'
                                  ? 'Inactive'
                                  : 'Active';
                              await firestore
                                  .collection('Products')
                                  .doc(product.id)
                                  .update({'status': newStatus});
                            } else if (value == 2) {
                              // Delete logic
                              await firestore
                                  .collection('Products')
                                  .doc(product.id)
                                  .delete();
                            }
                          },
                          itemBuilder: (context) => [
                            const PopupMenuItem(
                              value: 1,
                              child: Row(
                                children: [
                                  Icon(Icons.edit, size: 18),
                                  SizedBox(width: 5),
                                  Text("Edit"),
                                ],
                              ),
                            ),
                            const PopupMenuItem(
                              value: 2,
                              child: Row(
                                children: [
                                  Icon(Icons.delete, size: 18),
                                  SizedBox(width: 5),
                                  Text("Delete"),
                                ],
                              ),
                            ),
                          ],
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
