import 'package:flutter/material.dart';

class InvoicePage extends StatelessWidget {
  const InvoicePage(
      {super.key,
      required this.cartItems,
      required this.orderid,
      required this.invoiceId,
      required this.paymentMethod,
      required this.address,
      required this.currentDate,
      required this.totalPrice});
  final List<dynamic> cartItems;
  final String orderid, invoiceId, paymentMethod, address, currentDate;
  final num totalPrice;

  @override
  Widget build(BuildContext context) {
    // Use MediaQuery to get screen width and height
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    // Determine screen type based on width
    bool isMobile = screenWidth < 600;
    bool isTablet = screenWidth >= 600 && screenWidth <= 1024;
    bool isDesktop = screenWidth > 1024;

    final List purchase = [
      {
        'sr': '1',
        'image': 'assets/images/currypowder.jpg',
        'product': 'sambar powder',
        'qty': '1',
        'price': '3.0',
        'amount': '3.69'
      },
      {
        'sr': '2',
        'image': 'assets/images/currypowder.jpg',
        'product': 'rasam powder',
        'qty': '1',
        'price': '4.0',
        'amount': '4.92'
      },
    ];
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: isDesktop ? 150 : 10,
          ),
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 12, vertical: 15),
            decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.grey.shade200)),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //title
                  isMobile
                      ? Column(
                          children: [
                            //logo
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "Go",
                                      style: TextStyle(
                                          color: Colors.orange,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 50),
                                    ),
                                    Text(
                                      "mart",
                                      style: TextStyle(
                                          color: Colors.green,
                                          fontWeight: FontWeight.normal,
                                          fontSize: 50),
                                    ),
                                  ],
                                ),
                                Text(
                                  "LetterKenny ,Co.Donegal, Ireland",
                                  style: TextStyle(
                                      color: Colors.grey.shade800,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            //title
                            Row(
                              children: [
                                Text(
                                  "Invoice",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 25),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Container(
                                  height: 25,
                                  width: 150,
                                  child: Center(
                                      child: Text(
                                    "Placed Order",
                                    style: TextStyle(
                                        color: Colors.grey,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15),
                                  )),
                                  decoration: BoxDecoration(
                                      color: Colors.green,
                                      borderRadius: BorderRadius.circular(20)),
                                )
                              ],
                            ),
                            //details
                            //numbr
                            Row(
                              children: [
                                Text(
                                  "Invoice No",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18),
                                ),
                                SizedBox(
                                  width: 11,
                                ),
                                Text(
                                  invoiceId,
                                  style: TextStyle(
                                      color: Colors.grey.shade700,
                                      fontWeight: FontWeight.normal,
                                      fontSize: 18),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            //id
                            Row(
                              children: [
                                Text(
                                  "Order ID",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18),
                                ),
                                SizedBox(
                                  width: 30,
                                ),
                                Text(
                                  orderid,
                                  style: TextStyle(
                                      color: Colors.grey.shade700,
                                      fontWeight: FontWeight.normal,
                                      fontSize: 18),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            //date
                            Row(
                              children: [
                                Text(
                                  "Date",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18),
                                ),
                                SizedBox(
                                  width: 55,
                                ),
                                Text(
                                  currentDate,
                                  style: TextStyle(
                                      color: Colors.grey.shade700,
                                      fontWeight: FontWeight.normal,
                                      fontSize: 18),
                                ),
                              ],
                            )
                          ],
                        )
                      //other devices
                      : Column(
                          children: [
                            Row(
                              children: [
                                Text(
                                  "Invoice",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 25),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Container(
                                  height: 25,
                                  width: 150,
                                  child: Center(
                                      child: Text(
                                    "Placed Order",
                                    style: TextStyle(
                                        color: Colors.grey,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15),
                                  )),
                                  decoration: BoxDecoration(
                                      color: Colors.green,
                                      borderRadius: BorderRadius.circular(20)),
                                )
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            //details
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    //numbr
                                    Row(
                                      children: [
                                        Text(
                                          "Invoice No",
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 18),
                                        ),
                                        SizedBox(
                                          width: 11,
                                        ),
                                        Text(
                                          invoiceId,
                                          style: TextStyle(
                                              color: Colors.grey.shade700,
                                              fontWeight: FontWeight.normal,
                                              fontSize: 18),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    //id
                                    Row(
                                      children: [
                                        Text(
                                          "Order ID",
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 18),
                                        ),
                                        SizedBox(
                                          width: 30,
                                        ),
                                        Text(
                                          orderid,
                                          style: TextStyle(
                                              color: Colors.grey.shade700,
                                              fontWeight: FontWeight.normal,
                                              fontSize: 18),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    //date
                                    Row(
                                      children: [
                                        Text(
                                          "Date",
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 18),
                                        ),
                                        SizedBox(
                                          width: 55,
                                        ),
                                        Text(
                                          currentDate,
                                          style: TextStyle(
                                              color: Colors.grey.shade700,
                                              fontWeight: FontWeight.normal,
                                              fontSize: 18),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                                //gomart logo
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                          "Go",
                                          style: TextStyle(
                                              color: Colors.orange,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 50),
                                        ),
                                        Text(
                                          "mart",
                                          style: TextStyle(
                                              color: Colors.green,
                                              fontWeight: FontWeight.normal,
                                              fontSize: 50),
                                        ),
                                      ],
                                    ),
                                    Text(
                                      "LetterKenny ,Co.Donegal, Ireland",
                                      style: TextStyle(
                                          color: Colors.grey.shade800,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ],
                        ),
                  Divider(),
                  SizedBox(
                    height: 20,
                  ),
                  //address
                  isMobile
                      ? Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Here are your order details.We thank you for your purchase.",
                              style: TextStyle(
                                  color: Colors.grey.shade700,
                                  fontWeight: FontWeight.normal,
                                  fontSize: 18),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              "Shipping Address",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Text(
                              address,
                              style: TextStyle(
                                  color: Colors.grey.shade700,
                                  fontWeight: FontWeight.normal,
                                  fontSize: 18),
                            ),
                          ],
                        )
                      :
                      //other devices
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Text(
                                "Here are your order details.We thank you for your purchase.",
                                style: TextStyle(
                                    color: Colors.grey.shade700,
                                    fontWeight: FontWeight.normal,
                                    fontSize: 18),
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Shipping Address",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18),
                                  ),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  Text(
                                    address,
                                    style: TextStyle(
                                        color: Colors.grey.shade700,
                                        fontWeight: FontWeight.normal,
                                        fontSize: 18),
                                  ),
                                ],
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
                      dataRowHeight: 80,
                      columns: const [
                        DataColumn(
                            label: Text(
                          'SR',
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w900,
                              fontSize: 18),
                        )),
                        DataColumn(
                            label: Text(
                          'Products',
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w900,
                              fontSize: 18),
                        )),
                        DataColumn(
                            label: Text(
                          'QTY',
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w900,
                              fontSize: 16),
                        )),
                        DataColumn(
                            label: Text(
                          'Item Price',
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w900,
                              fontSize: 16),
                        )),
                        DataColumn(
                            label: Text(
                          'Amount',
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w900,
                              fontSize: 16),
                        )),
                      ],
                      rows: List.generate(
                        cartItems.length,
                        (index) {
                          final item = cartItems[index];
                          return DataRow(
                            cells: [
                              DataCell(Text(
                                '${index + 1}',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 14),
                              )),
                              DataCell(Row(
                                children: [
                                  CircleAvatar(
                                    backgroundColor: Colors.grey.shade300,
                                    radius: 20,
                                    child: Image.network(
                                      item['productUrl'],
                                      height: 20,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 8,
                                  ),
                                  Text(
                                    item['productName'],
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 14),
                                  )
                                ],
                              )),
                              DataCell(Text(
                                item['quantity'].toString(),
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 14),
                              )),
                              DataCell(Text(
                                item['originalPrice'],
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 14),
                              )),
                              DataCell(Text(
                                item['ourPrice'].toString(),
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
                  //method cost
                  SizedBox(
                    height: 15,
                  ),
                  isMobile
                      ? Container(
                          width: double.infinity,
                          color: Colors.grey.shade300,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Payment Method",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                paymentMethod,
                                style: TextStyle(
                                    color: Colors.grey.shade700,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 16),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                "Shipping Cost",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                "4.95",
                                style: TextStyle(
                                    color: Colors.grey.shade700,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 16),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                "Total Amount",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                totalPrice.toString(),
                                style: TextStyle(
                                    color: Colors.green,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16),
                              ),
                            ],
                          ),
                        )
                      :
                      //other devices
                      Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Payment Method",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    paymentMethod,
                                    style: TextStyle(
                                        color: Colors.grey.shade700,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 16),
                                  ),
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Shipping Cost",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    "4.95",
                                    style: TextStyle(
                                        color: Colors.grey.shade700,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 16),
                                  ),
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Total Amount",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    totalPrice.toString(),
                                    style: TextStyle(
                                        color: Colors.green,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          decoration: BoxDecoration(
                            color: Colors.grey.shade300,
                          ),
                        ),
                  SizedBox(
                    height: 20,
                  ),

                  //download button
                  Container(
                    height: 45,
                    width: 150,
                    child: Center(
                      child: Text(
                        "Download Invoice",
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    ),
                    decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(10)),
                  )

                  //end
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
