import 'package:flutter/material.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final List<Map> customers = [
      {
        'Name': 'Vineetha',
        '#': '1',
        'Email': 'vineetha44@gmail.com',
        'Mobile': '7845169545',
        'Image': 'No image Uploaded',
        'Action': ''
      },
      {
        'Name': 'Ramesh',
        '#': '2',
        'Email': 'ramesh89@gmail.com',
        'Mobile': '9876543210',
        'Image': 'No image Uploaded',
        'Action': ''
      },
      {
        'Name': 'Priya',
        '#': '3',
        'Email': 'priya77@gmail.com',
        'Mobile': '8123456789',
        'Image': 'No image Uploaded',
        'Action': ''
      },
      {
        'Name': 'Arjun',
        '#': '4',
        'Email': 'arjun123@gmail.com',
        'Mobile': '9001234567',
        'Image': 'No image Uploaded',
        'Action': ''
      },
      {
        'Name': 'Meera',
        '#': '5',
        'Email': 'meera22@gmail.com',
        'Mobile': '9870123456',
        'Image': 'No image Uploaded',
        'Action': ''
      },
      {
        'Name': 'Rajesh',
        '#': '6',
        'Email': 'rajesh_kumar@gmail.com',
        'Mobile': '8098765432',
        'Image': 'No image Uploaded',
        'Action': ''
      },
      {
        'Name': 'Sneha',
        '#': '7',
        'Email': 'sneha88@gmail.com',
        'Mobile': '7012345678',
        'Image': 'No image Uploaded',
        'Action': ''
      },
      {
        'Name': 'Kiran',
        '#': '8',
        'Email': 'kiran45@gmail.com',
        'Mobile': '7894561230',
        'Image': 'No image Uploaded',
        'Action': ''
      }
    ];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Customers",
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
                'Mobile',
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
              customers.length,
              (index) {
                final customer = customers[index];
                return DataRow(
                  cells: [
                    DataCell(Text(
                      customer['#']!,
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                          fontSize: 14),
                    )),
                    DataCell(Text(
                      customer['Name']!,
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                          fontSize: 14),
                    )),
                    DataCell(Text(
                      customer['Email']!,
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                          fontSize: 14),
                    )),
                    DataCell(Text(
                      customer['Mobile']!,
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                          fontSize: 14),
                    )),
                    DataCell(Text(
                      customer['Image']!,
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
                          //delete customer
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
                                "Block",
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
