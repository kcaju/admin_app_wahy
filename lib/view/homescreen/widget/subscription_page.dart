import 'package:flutter/material.dart';

class SubscriptionPage extends StatelessWidget {
  const SubscriptionPage({super.key, this.onCreateEmailTap});
  final void Function()? onCreateEmailTap;

  @override
  Widget build(BuildContext context) {
    final List<Map> category = [
      {
        '#': '1',
        'email': 'daniel@gmail.com',
        'Action': '',
        'created': 'Nov 14, 2024,10:07 a.m.'
      },
      {
        '#': '2',
        'email': 'daniel@gmail.com',
        'Action': '',
        'created': 'Nov 14, 2024,10:07 a.m.'
      },
      {
        '#': '3',
        'email': 'daniel@gmail.com',
        'Action': '',
        'created': 'Nov 14, 2024,10:07 a.m.'
      },
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
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Subscriptions",
              style: TextStyle(
                  color: Colors.grey.shade800,
                  fontWeight: FontWeight.w500,
                  fontSize: 22),
            ),
            //button
            GestureDetector(
              onTap: onCreateEmailTap,
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
                        "Create Email",
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
                'Email',
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
              category.length,
              (index) {
                final brand = category[index];
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
                      brand['email']!,
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
