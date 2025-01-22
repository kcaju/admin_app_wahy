import 'package:flutter/material.dart';

class ProductsScreen extends StatefulWidget {
  const ProductsScreen({super.key, this.onAddProductTap});
  final void Function()? onAddProductTap;

  @override
  State<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  TextEditingController search = TextEditingController();

  int? dropvalue;

  final List<Map> brands = [
    {
      'code': 'GM/PD0014',
      '#': '1',
      'name': 'Sambar Mix',
      'price': '5.0',
      'total': '6.15',
      'brand': 'Jacme',
      'category': 'Frozen Foods',
      'created': '2024-07-03',
      'updated': '2024-07-03',
      'opening': '5',
      'current': '5',
      'Status': '',
      'Action': '',
      'image': 'assets/images/eastern.png'
    },
    {
      'code': 'GM/PD0014',
      '#': '2',
      'name': 'Masala Tea Mix',
      'price': '3.5',
      'total': '4.3',
      'brand': 'GMC',
      'category': 'Beverages',
      'created': '2024-06-15',
      'updated': '2024-06-20',
      'opening': '10',
      'current': '8',
      'Status': '',
      'Action': '',
      'image': 'assets/images/eastern.png'
    },
    {
      'code': 'GM/PD0014',
      '#': '3',
      'name': 'Rasam Powder',
      'price': '4.2',
      'total': '5.25',
      'brand': 'AMX',
      'category': 'Spices',
      'created': '2024-05-10',
      'updated': '2024-05-15',
      'opening': '7',
      'current': '6',
      'Status': '',
      'Action': '',
      'image': 'assets/images/eastern.png'
    },
    {
      'code': 'GM/PD0014',
      '#': '4',
      'name': 'Garam Masala',
      'price': '6.0',
      'total': '7.8',
      'brand': 'EverSp',
      'category': 'Spices',
      'created': '2024-03-20',
      'updated': '2024-03-25',
      'opening': '12',
      'current': '9',
      'Status': '',
      'Action': '',
      'image': 'assets/images/eastern.png'
    }
  ];
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
            //button
            GestureDetector(
              onTap: widget.onAddProductTap,
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
                        "Add Product",
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
        //show entries
        SizedBox(
          height: 20,
        ),
        Row(
          children: [
            // "Show Entries" Dropdown
            Text(
              'Show ',
              style: TextStyle(fontSize: 16),
            ),
            DropdownButton<int>(
              value: dropvalue,
              items: <int>[5, 10, 15].map((int value) {
                return DropdownMenuItem<int>(
                  value: value,
                  child: Text(value.toString()),
                );
              }).toList(),
              onChanged: (value) {
                // Handle dropdown value change
                setState(() {
                  dropvalue = value;
                });
              },
            ),
            Text(
              ' entries',
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
        //searchfield
        Row(
          children: [
            Text(
              'Search: ',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(
              width: 200,
              height: 40,
              child: TextFormField(
                controller: search,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                ),
                onChanged: (text) {
                  // Handle search input change
                },
              ),
            ),
          ],
        ),
        SizedBox(
          height: 15,
        ),
        //table
        SingleChildScrollView(
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
                    fontSize: 16),
              )),
              DataColumn(
                  label: Text(
                'Product Name',
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w900,
                    fontSize: 16),
              )),
              DataColumn(
                  label: Text(
                'Price',
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w900,
                    fontSize: 16),
              )),
              DataColumn(
                  label: Text(
                'Total(Include Tax)',
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w900,
                    fontSize: 16),
              )),
              DataColumn(
                  label: Text(
                'Brand',
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w900,
                    fontSize: 16),
              )),
              DataColumn(
                  label: Text(
                'Category',
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
                'Updated At',
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w900,
                    fontSize: 16),
              )),
              DataColumn(
                  label: Text(
                'Opening Stock',
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w900,
                    fontSize: 16),
              )),
              DataColumn(
                  label: Text(
                'Current Stock',
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
                    DataCell(Padding(
                      padding: const EdgeInsets.all(5),
                      child: Container(
                        height: 150,
                        width: 80,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                fit: BoxFit.fill,
                                image: AssetImage(brand['image']!))),
                      ),
                    )),
                    DataCell(Text(
                      brand['code']!,
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                          fontSize: 14),
                    )),
                    DataCell(Text(
                      brand['name']!,
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
                      brand['total']!,
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                          fontSize: 14),
                    )),
                    DataCell(Text(
                      brand['brand']!,
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                          fontSize: 14),
                    )),
                    DataCell(Text(
                      brand['category']!,
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                          fontSize: 14),
                    )),
                    DataCell(Text(
                      brand['created']!,
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                          fontSize: 14),
                    )),
                    DataCell(Text(
                      brand['updated']!,
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                          fontSize: 14),
                    )),
                    DataCell(Text(
                      brand['opening']!,
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                          fontSize: 14),
                    )),
                    DataCell(Text(
                      brand['current']!,
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                          fontSize: 14),
                    )),
                    //status
                    DataCell(
                      Container(
                        height: 20,
                        width: isDesktop ? 80 : 110,
                        padding: EdgeInsets.only(left: isDesktop ? 5 : 0),
                        child: Center(
                            child: Text(
                          'Active',
                          style: TextStyle(
                              color: Colors.green.shade700,
                              fontWeight: FontWeight.bold,
                              fontSize: 12),
                        )),
                        decoration: BoxDecoration(
                            color: Colors.green.shade200,
                            border: Border.all(color: Colors.green.shade700),
                            borderRadius: BorderRadius.circular(8)),
                      ),
                    ),
                    //action
                    DataCell(PopupMenuButton<int>(
                      child: Icon(
                        Icons.more_vert,
                        color: Colors.grey.shade600,
                      ),
                      onSelected: (value) {
                        if (value == 1) {
                          //edit
                        } else if (value == 2) {
                          //delete
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
        ),
      ],
    );
  }
}
