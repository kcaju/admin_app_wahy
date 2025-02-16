import 'package:flutter/material.dart';

class CustomDrawer extends StatefulWidget {
  const CustomDrawer(
      {super.key,
      this.onDashboardTap,
      this.onProductsTap,
      this.onCountryTap,
      this.onBrandTap,
      this.onCategroryTap,
      this.onPendingorderTap,
      this.onCancelledorderTap,
      this.onOutforDeliveryTap,
      this.onCompletedOrdersTap,
      this.onDetailsTap,
      this.onLoginInfoTap,
      this.onDealsTap,
      this.onPoster1Tap,
      this.onPoster2Tap,
      this.onPoster3Tap,
      this.onPoster5Tap,
      this.onPoster6Tap,
      this.onPoster7Tap,
      this.onProductFeedbackTap,
      this.onSiteFeedbackTap,
      this.onEnquiryTap,
      this.onSubscriptionTap,
      this.onPoster4Tap,
      this.onRegistredcustomerTap,
      this.onBackupdataTap});
  final void Function()? onDashboardTap;
  final void Function()? onProductsTap;
  final void Function()? onCountryTap;
  final void Function()? onBrandTap;
  final void Function()? onCategroryTap;
  final void Function()? onPendingorderTap;
  final void Function()? onCancelledorderTap;
  final void Function()? onOutforDeliveryTap;
  final void Function()? onCompletedOrdersTap;
  final void Function()? onDetailsTap;
  final void Function()? onLoginInfoTap;
  final void Function()? onDealsTap;
  final void Function()? onPoster1Tap;
  final void Function()? onPoster2Tap;
  final void Function()? onPoster3Tap;
  final void Function()? onPoster4Tap;
  final void Function()? onPoster5Tap;
  final void Function()? onPoster6Tap;
  final void Function()? onPoster7Tap;
  final void Function()? onProductFeedbackTap;
  final void Function()? onSiteFeedbackTap;
  final void Function()? onEnquiryTap;
  final void Function()? onSubscriptionTap;
  final void Function()? onRegistredcustomerTap;
  final void Function()? onBackupdataTap;

  @override
  State<CustomDrawer> createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Main",
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 18),
              ),
              SizedBox(
                height: 15,
              ),
              //dashboard
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: GestureDetector(
                  onTap: widget.onDashboardTap,
                  child: Row(
                    children: [
                      Icon(
                        Icons.speed,
                        color: Colors.grey.shade700,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        "Dashboard",
                        style: TextStyle(
                            color: Colors.grey,
                            fontWeight: FontWeight.bold,
                            fontSize: 14),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              //product management
              ExpansionTile(
                leading: Icon(
                  Icons.person,
                  color: Colors.grey.shade600,
                ),
                trailing: Icon(
                  Icons.keyboard_arrow_right,
                  color: Colors.grey,
                ),
                title: Text(
                  "Product Management",
                  style: TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.bold,
                      fontSize: 14),
                ),
                children: [
                  SizedBox(
                    height: 5,
                  ),
                  //country
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 50),
                      child: GestureDetector(
                        onTap: widget.onCountryTap,
                        child: Text(
                          "Country",
                          style: TextStyle(
                              color: Colors.grey, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  //brands
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 50),
                      child: GestureDetector(
                        onTap: widget.onBrandTap,
                        child: Text(
                          "Brands",
                          style: TextStyle(
                              color: Colors.grey, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  //category
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 50),
                      child: GestureDetector(
                        onTap: widget.onCategroryTap,
                        child: Text(
                          "Category",
                          style: TextStyle(
                              color: Colors.grey, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  //products
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 50),
                      child: GestureDetector(
                        onTap: widget.onProductsTap,
                        child: Text(
                          "Products",
                          style: TextStyle(
                              color: Colors.grey, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                ],
              ),
              //order management
              ExpansionTile(
                leading: Icon(
                  Icons.person,
                  color: Colors.grey.shade600,
                ),
                trailing: Icon(
                  Icons.keyboard_arrow_right,
                  color: Colors.grey,
                ),
                title: Text(
                  "Order Management",
                  style: TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.bold,
                      fontSize: 14),
                ),
                children: [
                  SizedBox(
                    height: 5,
                  ),
                  //pending orders
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 50),
                      child: GestureDetector(
                        onTap: widget.onPendingorderTap,
                        child: Text(
                          "Pending Orders",
                          style: TextStyle(
                              color: Colors.grey, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  //cancelledorders
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 50),
                      child: GestureDetector(
                        onTap: widget.onCancelledorderTap,
                        child: Text(
                          "Cancelled Orders",
                          style: TextStyle(
                              color: Colors.grey, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),

                  SizedBox(
                    height: 5,
                  ),
                ],
              ),
              //shipping management
              ExpansionTile(
                leading: Icon(
                  Icons.person,
                  color: Colors.grey.shade600,
                ),
                trailing: Icon(
                  Icons.keyboard_arrow_right,
                  color: Colors.grey,
                ),
                title: Text(
                  "Shipping Management",
                  style: TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.bold,
                      fontSize: 14),
                ),
                children: [
                  SizedBox(
                    height: 5,
                  ),
                  //out for
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 50),
                      child: GestureDetector(
                        onTap: widget.onOutforDeliveryTap,
                        child: Text(
                          "Out For Delivery",
                          style: TextStyle(
                              color: Colors.grey, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  //completed
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 50),
                      child: GestureDetector(
                        onTap: widget.onCompletedOrdersTap,
                        child: Text(
                          "Completed Orders",
                          style: TextStyle(
                              color: Colors.grey, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                ],
              ),
              //delivery partners
              ExpansionTile(
                leading: Icon(
                  Icons.person,
                  color: Colors.grey.shade600,
                ),
                trailing: Icon(
                  Icons.keyboard_arrow_right,
                  color: Colors.grey,
                ),
                title: Text(
                  "Delivery Partners",
                  style: TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.bold,
                      fontSize: 14),
                ),
                children: [
                  SizedBox(
                    height: 5,
                  ),
                  //details
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 50),
                      child: GestureDetector(
                        onTap: widget.onDetailsTap,
                        child: Text(
                          "Details",
                          style: TextStyle(
                              color: Colors.grey, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  //info
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 50),
                      child: GestureDetector(
                        onTap: widget.onLoginInfoTap,
                        child: Text(
                          "Log in/out info",
                          style: TextStyle(
                              color: Colors.grey, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                ],
              ),
              //daily deals
              ExpansionTile(
                leading: Icon(
                  Icons.person,
                  color: Colors.grey.shade600,
                ),
                trailing: Icon(
                  Icons.keyboard_arrow_right,
                  color: Colors.grey,
                ),
                title: Text(
                  "Daily % Weekly Deals",
                  style: TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.bold,
                      fontSize: 14),
                ),
                children: [
                  SizedBox(
                    height: 5,
                  ),
                  //deal
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 50),
                      child: GestureDetector(
                        onTap: widget.onDealsTap,
                        child: Text(
                          "Deals",
                          style: TextStyle(
                              color: Colors.grey, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                ],
              ),
              //posters
              ExpansionTile(
                leading: Icon(
                  Icons.person,
                  color: Colors.grey.shade600,
                ),
                trailing: Icon(
                  Icons.keyboard_arrow_right,
                  color: Colors.grey,
                ),
                title: Text(
                  "Posters",
                  style: TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.bold,
                      fontSize: 14),
                ),
                children: [
                  SizedBox(
                    height: 5,
                  ),
                  //poster1
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 50),
                      child: GestureDetector(
                        onTap: widget.onPoster1Tap,
                        child: Text(
                          "Poster 1",
                          style: TextStyle(
                              color: Colors.grey, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  //2
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 50),
                      child: GestureDetector(
                        onTap: widget.onPoster2Tap,
                        child: Text(
                          "Poster 2",
                          style: TextStyle(
                              color: Colors.grey, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  //3
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 50),
                      child: GestureDetector(
                        onTap: widget.onPoster3Tap,
                        child: Text(
                          "Poster 3",
                          style: TextStyle(
                              color: Colors.grey, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  //4
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 50),
                      child: GestureDetector(
                        onTap: widget.onPoster4Tap,
                        child: Text(
                          "Poster 4",
                          style: TextStyle(
                              color: Colors.grey, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  //5
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 50),
                      child: GestureDetector(
                        onTap: widget.onPoster5Tap,
                        child: Text(
                          "Poster 5",
                          style: TextStyle(
                              color: Colors.grey, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  //6
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 50),
                      child: GestureDetector(
                        onTap: widget.onPoster6Tap,
                        child: Text(
                          "Poster 6",
                          style: TextStyle(
                              color: Colors.grey, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  //7
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 50),
                      child: GestureDetector(
                        onTap: widget.onPoster7Tap,
                        child: Text(
                          "Poster 7",
                          style: TextStyle(
                              color: Colors.grey, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                ],
              ),
              //feedback
              // ExpansionTile(
              //   leading: Icon(
              //     Icons.person,
              //     color: Colors.grey.shade600,
              //   ),
              //   trailing: Icon(
              //     Icons.keyboard_arrow_right,
              //     color: Colors.grey,
              //   ),
              //   title: Text(
              //     "Feedback",
              //     style: TextStyle(
              //         color: Colors.grey,
              //         fontWeight: FontWeight.bold,
              //         fontSize: 14),
              //   ),
              //   children: [
              //     SizedBox(
              //       height: 5,
              //     ),
              //     //product
              //     Align(
              //       alignment: Alignment.centerLeft,
              //       child: Padding(
              //         padding: const EdgeInsets.symmetric(horizontal: 50),
              //         child: GestureDetector(
              //           onTap: widget.onProductFeedbackTap,
              //           child: Text(
              //             "Product Feedback",
              //             style: TextStyle(
              //                 color: Colors.grey, fontWeight: FontWeight.bold),
              //           ),
              //         ),
              //       ),
              //     ),
              //     SizedBox(
              //       height: 10,
              //     ),
              //     //site
              //     Align(
              //       alignment: Alignment.centerLeft,
              //       child: Padding(
              //         padding: const EdgeInsets.symmetric(horizontal: 50),
              //         child: GestureDetector(
              //           onTap: widget.onSiteFeedbackTap,
              //           child: Text(
              //             "Site Feedback",
              //             style: TextStyle(
              //                 color: Colors.grey, fontWeight: FontWeight.bold),
              //           ),
              //         ),
              //       ),
              //     ),
              //     SizedBox(
              //       height: 5,
              //     ),
              //   ],
              // ),
              // SizedBox(
              //   height: 15,
              // ),
              //enquiry
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: GestureDetector(
                  onTap: widget.onEnquiryTap,
                  child: Row(
                    children: [
                      Icon(
                        Icons.person,
                        color: Colors.grey.shade700,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        "Enquiries",
                        style: TextStyle(
                            color: Colors.grey,
                            fontWeight: FontWeight.bold,
                            fontSize: 14),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              //subscription
              // Padding(
              //   padding: const EdgeInsets.symmetric(horizontal: 15),
              //   child: GestureDetector(
              //     onTap: widget.onSubscriptionTap,
              //     child: Row(
              //       children: [
              //         Icon(
              //           Icons.person,
              //           color: Colors.grey.shade700,
              //         ),
              //         SizedBox(
              //           width: 10,
              //         ),
              //         Text(
              //           "Subscription",
              //           style: TextStyle(
              //               color: Colors.grey,
              //               fontWeight: FontWeight.bold,
              //               fontSize: 14),
              //         )
              //       ],
              //     ),
              //   ),
              // ),
              // SizedBox(
              //   height: 15,
              // ),
              //registerdcustomers
              // Padding(
              //   padding: const EdgeInsets.symmetric(horizontal: 15),
              //   child: GestureDetector(
              //     onTap: widget.onRegistredcustomerTap,
              //     child: Row(
              //       children: [
              //         Icon(
              //           Icons.person,
              //           color: Colors.grey.shade700,
              //         ),
              //         SizedBox(
              //           width: 10,
              //         ),
              //         Text(
              //           "Registered Customers",
              //           style: TextStyle(
              //               color: Colors.grey,
              //               fontWeight: FontWeight.bold,
              //               fontSize: 14),
              //         )
              //       ],
              //     ),
              //   ),
              // ),
              SizedBox(
                height: 15,
              ),
              //backup
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: GestureDetector(
                  onTap: widget.onBackupdataTap,
                  child: Row(
                    children: [
                      Icon(
                        Icons.person,
                        color: Colors.grey.shade700,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        "Backup Data & media",
                        style: TextStyle(
                            color: Colors.grey,
                            fontWeight: FontWeight.bold,
                            fontSize: 14),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
