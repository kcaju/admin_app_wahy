import 'package:admin_app_wahy/view/homescreen/widget/header_box.dart';
import 'package:flutter/material.dart';

class PendingorderProducts extends StatelessWidget {
  const PendingorderProducts({super.key, required this.products});
  final List<dynamic> products;

  @override
  Widget build(BuildContext context) {
    // Use MediaQuery to get screen width and height
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    // Determine screen type based on width
    bool isMobile = screenWidth < 600;
    bool isTablet = screenWidth >= 600 && screenWidth <= 1024;
    bool isDesktop = screenWidth > 1024;
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 2, vertical: 2),
          child: Container(
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(15)),
            child: Column(
              children: [
                //header
                HeaderBox(
                  isNavigation: true,
                ),
                Expanded(
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: isDesktop ? 200 : 15,
                        vertical: 20,
                      ),
                      child: Column(
                        children: [
                          GridView.builder(
                            shrinkWrap: true,
                            itemCount: products.length,
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: isMobile
                                        ? 2
                                        : isTablet
                                            ? 3
                                            : 4,
                                    crossAxisSpacing: 10,
                                    mainAxisExtent: 340,
                                    mainAxisSpacing: 10),
                            itemBuilder: (context, index) {
                              return Container(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      height: 200,
                                      decoration: BoxDecoration(
                                          image: DecorationImage(
                                              fit: BoxFit.fill,
                                              image: NetworkImage(
                                                  products[index]
                                                          ['productUrl'] ??
                                                      "")),
                                          borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(15),
                                              topRight: Radius.circular(15))),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 12, vertical: 10),
                                      child: Column(
                                        children: [
                                          Text(
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                            "${products[index]['productName']}",
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.w600,
                                                fontSize: 18),
                                          ),
                                          SizedBox(
                                            height: 15,
                                          ),
                                          Text(
                                            "Price:${products[index]['ourPrice'].toString()}",
                                            style: TextStyle(
                                                color: Colors.grey.shade600,
                                                fontWeight: FontWeight.w600,
                                                fontSize: 23),
                                          )
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    border:
                                        Border.all(color: Colors.grey.shade200),
                                    borderRadius: BorderRadius.circular(15)),
                              );
                            },
                          )
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
