import 'package:flutter/material.dart';

class LoginfoPage extends StatelessWidget {
  const LoginfoPage({super.key, this.onAllTap, this.onTodayTap});
  final void Function()? onAllTap;
  final void Function()? onTodayTap;

  @override
  Widget build(BuildContext context) {
    // Use MediaQuery to get screen width and height
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    // Determine screen type based on width
    bool isMobile = screenWidth < 600;
    bool isTablet = screenWidth >= 600 && screenWidth <= 1024;
    bool isDesktop = screenWidth > 1024;

    final List brands = [
      {
        '#': '1',
        "name": '',
        'user': 'daniel@123',
        'password': 'dani123',
        'login': 'June 25, 2024,5:08 p.m.',
        'Action': ''
      },
      {
        '#': '2',
        "name": '',
        'user': 'daniel@123',
        'password': 'dani123',
        'login': 'June 25, 2024,5:08 p.m.',
        'Action': ''
      },
      {
        '#': '3',
        "name": '',
        'user': 'daniel@123',
        'password': 'dani123',
        'login': 'June 25, 2024,5:08 p.m.',
        'Action': ''
      },
      {
        '#': '4',
        "name": '',
        'user': 'daniel@123',
        'password': 'dani123',
        'login': 'June 25, 2024,5:08 p.m.',
        'Action': ''
      }
    ];
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
            Row(
              children: [
                //all
                GestureDetector(
                  onTap: onAllTap,
                  child: Container(
                    padding: EdgeInsets.only(left: 8),
                    height: 40,
                    width: isMobile ? 70 : 80,
                    child: Center(
                      child: Row(
                        children: [
                          Icon(
                            Icons.add,
                            color: Colors.white,
                          ),
                          Text(
                            "All",
                            style: TextStyle(
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
                ),
                SizedBox(
                  width: 5,
                ),
                //today
                GestureDetector(
                  onTap: onTodayTap,
                  child: Container(
                    padding: EdgeInsets.only(left: 8),
                    height: 40,
                    width: isMobile ? 80 : 90,
                    child: Center(
                      child: Row(
                        children: [
                          Icon(
                            Icons.add,
                            color: Colors.white,
                          ),
                          Text(
                            "Today",
                            style: TextStyle(
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
                ),
              ],
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
                'Name',
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w900,
                    fontSize: 18),
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
                'Login At',
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
                      brand['name']!,
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                          fontSize: 14),
                    )),
                    DataCell(Text(
                      brand['user']!,
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                          fontSize: 14),
                    )),
                    DataCell(Text(
                      brand['password']!,
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                          fontSize: 14),
                    )),
                    DataCell(Text(
                      brand['login']!,
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                          fontSize: 14),
                    )),
                    DataCell(Text(
                      brand['Action']!,
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                          fontSize: 14),
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
