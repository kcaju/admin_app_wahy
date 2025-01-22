import 'package:admin_app_wahy/view/homescreen/widget/header_box.dart';
import 'package:admin_app_wahy/view/widget/customtextformfield.dart';
import 'package:flutter/material.dart';

class AddDealsPage extends StatefulWidget {
  const AddDealsPage({super.key});

  @override
  State<AddDealsPage> createState() => _AddDealsPageState();
}

class _AddDealsPageState extends State<AddDealsPage> {
  TextEditingController type = TextEditingController();
  TextEditingController product = TextEditingController();
  TextEditingController price = TextEditingController();
  TextEditingController offer = TextEditingController();
  TextEditingController sdate = TextEditingController();
  TextEditingController stime = TextEditingController();
  TextEditingController edate = TextEditingController();
  TextEditingController etime = TextEditingController();
  final formKey = GlobalKey<FormState>();

  final List types = ['type1', 'type2', 'type3'];
  final List products = ['oil', 'dairy products'];

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
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                //header
                HeaderBox(
                  isNavigation: true,
                ),
                //fields

                Expanded(
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: isDesktop ? 200 : 15, vertical: 20),
                      child: Form(
                        key: formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Add New Deals",
                              style: TextStyle(
                                  color: Colors.grey.shade600,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 25),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            //type
                            Text(
                              "Type",
                              style: TextStyle(
                                  color: Colors.grey.shade600,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 15),
                            ),
                            SizedBox(
                              width: 450,
                              child: TextField(
                                controller: type,
                                readOnly: true,
                                decoration: InputDecoration(
                                  hintText: '---- Select a Type ----',
                                  border: OutlineInputBorder(),
                                  suffixIcon: PopupMenuButton<String>(
                                    child: Icon(
                                      Icons.arrow_drop_down,
                                      size: isDesktop ? 25 : 30,
                                      color: Colors.black,
                                    ),
                                    onSelected: (value) {
                                      // Handle dropdown selection
                                      type.text = value;
                                      setState(() {});
                                    },
                                    itemBuilder: (context) {
                                      return types
                                          .map((category) =>
                                              PopupMenuItem<String>(
                                                value: category,
                                                child: Text(category),
                                              ))
                                          .toList();
                                    },
                                    offset: Offset(
                                        0, 50), // Adjusts the popup position
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            //product
                            Text(
                              "Product",
                              style: TextStyle(
                                  color: Colors.grey.shade600,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 15),
                            ),
                            SizedBox(
                              width: 450,
                              child: TextField(
                                controller: product,
                                readOnly: true,
                                decoration: InputDecoration(
                                  hintText: 'Select product',
                                  border: OutlineInputBorder(),
                                  suffixIcon: PopupMenuButton<String>(
                                    child: Icon(
                                      Icons.arrow_drop_down,
                                      size: isDesktop ? 25 : 30,
                                      color: Colors.black,
                                    ),
                                    onSelected: (value) {
                                      // Handle dropdown selection
                                      product.text = value;
                                      setState(() {});
                                    },
                                    itemBuilder: (context) {
                                      return products
                                          .map((category) =>
                                              PopupMenuItem<String>(
                                                value: category,
                                                child: Text(category),
                                              ))
                                          .toList();
                                    },
                                    offset: Offset(
                                        0, 50), // Adjusts the popup position
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            //actualprice
                            Text(
                              "Actual Price",
                              style: TextStyle(
                                  color: Colors.grey.shade600,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 15),
                            ),
                            SizedBox(
                                width: 450,
                                child: Customtextformfield(
                                    hintText: "", controller: price)),
                            SizedBox(
                              height: 10,
                            ),
                            //offerprice
                            Text(
                              "Offer Price",
                              style: TextStyle(
                                  color: Colors.grey.shade600,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 15),
                            ),
                            SizedBox(
                                width: 450,
                                child: Customtextformfield(
                                    hintText: "", controller: offer)),
                            SizedBox(
                              height: 10,
                            ),
                            //start date
                            Text(
                              "Start Date",
                              style: TextStyle(
                                  color: Colors.grey.shade600,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 15),
                            ),
                            SizedBox(
                              width: 450,
                              child: TextField(
                                controller: sdate,
                                readOnly: true,
                                decoration: InputDecoration(
                                  hintText: 'dd-mm-yyyy',
                                  border: OutlineInputBorder(),
                                  suffixIcon: GestureDetector(
                                    onTap: () async {
                                      DateTime? selectedDate =
                                          await showDatePicker(
                                        context: context,
                                        initialDate: DateTime.now(),
                                        firstDate:
                                            DateTime(2000), // Adjust as needed
                                        lastDate:
                                            DateTime(2050), // Adjust as needed
                                      );

                                      if (selectedDate != null) {
                                        // Format the selected date
                                        String formattedDate =
                                            "${selectedDate.day}-${selectedDate.month}-${selectedDate.year}";

                                        // Assign the date to the controller
                                        sdate.text = formattedDate;
                                      }
                                    },
                                    child: Icon(
                                      Icons.calendar_month_outlined,
                                      size: isDesktop ? 25 : 30,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            //starttime
                            Text(
                              "Start Time",
                              style: TextStyle(
                                  color: Colors.grey.shade600,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 15),
                            ),
                            SizedBox(
                              width: 450,
                              child: TextField(
                                controller: stime,
                                readOnly: true,
                                decoration: InputDecoration(
                                  hintText: '--:--',
                                  border: OutlineInputBorder(),
                                  suffixIcon: GestureDetector(
                                    onTap: () async {
                                      TimeOfDay? selectedTime =
                                          await showTimePicker(
                                        context: context,
                                        initialTime: TimeOfDay.now(),
                                      );

                                      if (selectedTime != null) {
                                        // Format the selected time
                                        String formattedTime =
                                            "${selectedTime.hour}:${selectedTime.minute}";

                                        // Assign the time to the controller
                                        stime.text = formattedTime;
                                      }
                                    },
                                    child: Icon(
                                      Icons.schedule_outlined,
                                      size: isDesktop ? 25 : 30,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            //enddate

                            Text(
                              "End Date",
                              style: TextStyle(
                                  color: Colors.grey.shade600,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 15),
                            ),
                            SizedBox(
                              width: 450,
                              child: TextField(
                                controller: edate,
                                readOnly: true,
                                decoration: InputDecoration(
                                  hintText: 'dd-mm-yyyy',
                                  border: OutlineInputBorder(),
                                  suffixIcon: GestureDetector(
                                    onTap: () async {
                                      DateTime? endDate = await showDatePicker(
                                        context: context,
                                        initialDate: DateTime.now(),
                                        firstDate:
                                            DateTime(2000), // Adjust as needed
                                        lastDate:
                                            DateTime(2050), // Adjust as needed
                                      );

                                      if (endDate != null) {
                                        // Format the selected date
                                        String formattedDate =
                                            "${endDate.day}-${endDate.month}-${endDate.year}";

                                        // Assign the date to the controller
                                        edate.text = formattedDate;
                                      }
                                    },
                                    child: Icon(
                                      Icons.calendar_month_outlined,
                                      size: isDesktop ? 25 : 30,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            //starttime
                            Text(
                              "End Time",
                              style: TextStyle(
                                  color: Colors.grey.shade600,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 15),
                            ),
                            SizedBox(
                              width: 450,
                              child: TextField(
                                controller: etime,
                                readOnly: true,
                                decoration: InputDecoration(
                                  hintText: '--:--',
                                  border: OutlineInputBorder(),
                                  suffixIcon: GestureDetector(
                                    onTap: () async {
                                      TimeOfDay? endTime = await showTimePicker(
                                        context: context,
                                        initialTime: TimeOfDay.now(),
                                      );

                                      if (endTime != null) {
                                        // Format the selected time
                                        String formattedTime =
                                            "${endTime.hour}:${endTime.minute}";

                                        // Assign the time to the controller
                                        etime.text = formattedTime;
                                      }
                                    },
                                    child: Icon(
                                      Icons.schedule_outlined,
                                      size: isDesktop ? 25 : 30,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                              ),
                            ),

                            SizedBox(
                              height: 15,
                            ),
                            //BUTTON
                            GestureDetector(
                              onTap: () {
                                if (formKey.currentState!.validate()) {
                                  type.clear();
                                  price.clear();
                                  product.clear();
                                  offer.clear();
                                  sdate.clear();
                                  stime.clear();
                                  edate.clear();
                                  stime.clear();
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(SnackBar(
                                          content: Text(
                                    "Deal Added Successfully !!!",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 35,
                                        fontWeight: FontWeight.bold),
                                  )));
                                }
                              },
                              child: Container(
                                height: 50,
                                width: 200,
                                child: Center(
                                  child: Text(
                                    "CREATE DEAL",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16),
                                  ),
                                ),
                                decoration: BoxDecoration(
                                    color: Colors.green,
                                    borderRadius: BorderRadius.circular(30)),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
