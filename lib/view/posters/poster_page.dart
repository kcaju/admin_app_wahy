import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class PosterPage extends StatelessWidget {
  const PosterPage(
      {super.key,
      this.onUpdateTap,
      this.onDeleteTap,
      required this.posterNumbr});
  final void Function()? onUpdateTap;
  final void Function()? onDeleteTap;
  final String posterNumbr;

  // Stream<DocumentSnapshot<Map<String, dynamic>>> fetchPosterDetails(
  //     String collectionName) {
  //   return FirebaseFirestore.instance
  //       .collection(collectionName)
  //       .doc(posterNumbr)
  //       .snapshots();
  // }

  Future<void> deletePosterCollection(String collectionName) async {
    try {
      final collectionRef =
          FirebaseFirestore.instance.collection(collectionName);

      // Fetch all documents in the collection
      final snapshot = await collectionRef.get();

      // Delete each document in the collection
      for (var doc in snapshot.docs) {
        await doc.reference.delete();
      }

      // Optionally, you can delete the collection reference itself (if needed).
      debugPrint('$collectionName collection deleted successfully.');
    } catch (e) {
      debugPrint('Error deleting collection $collectionName: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    // Firestore instance
    final FirebaseFirestore firestore = FirebaseFirestore.instance;

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
              "${posterNumbr}",
              style: TextStyle(
                  color: Colors.grey.shade800,
                  fontWeight: FontWeight.w500,
                  fontSize: 22),
            ),
            //button
            Row(
              children: [
                //update
                GestureDetector(
                  onTap: onUpdateTap,
                  child: Container(
                    padding: EdgeInsets.only(left: 8),
                    height: 40,
                    width: isMobile ? 120 : 140,
                    child: Center(
                      child: Row(
                        children: [
                          isMobile
                              ? SizedBox()
                              : Icon(
                                  Icons.add,
                                  color: Colors.white,
                                ),
                          Text(
                            "Update Poster",
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
                  width: 10,
                ),
                //delete
                GestureDetector(
                  onTap: () async {
                    String collectionName;
                    if (posterNumbr == 'Poster1') {
                      collectionName = 'Poster1';
                    } else {
                      collectionName = posterNumbr;
                    }

                    await deletePosterCollection(collectionName);

                    // Optionally, you can display a confirmation message to the user
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text(
                        '$collectionName deleted successfully.',
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold),
                      ),
                      backgroundColor: Colors.red,
                    ));
                  },
                  child: Container(
                    padding: EdgeInsets.only(left: 8),
                    height: 40,
                    width: isMobile ? 110 : 140,
                    child: Center(
                      child: Row(
                        children: [
                          isMobile
                              ? SizedBox()
                              : Icon(
                                  Icons.delete_outline,
                                  size: 20,
                                  color: Colors.white,
                                ),
                          Text(
                            "Delete Poster",
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
        StreamBuilder<QuerySnapshot>(
          stream: firestore.collection(posterNumbr).snapshots(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }

            if (snapshot.hasError || snapshot.data == null) {
              return const Center(
                child: Text(
                  "No data available",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              );
            }

            final posterDocs = snapshot.data!.docs;
            return ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: posterDocs.length,
              itemBuilder: (context, index) {
                final posterData =
                    posterDocs[index].data() as Map<String, dynamic>;

                return Container(
                  padding:
                      EdgeInsets.only(left: 10, right: 10, top: 15, bottom: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "#",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            "Value",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          )
                        ],
                      ),
                      Divider(),
                      //image
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Image",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Image.network(
                            posterData['posterUrl'],
                            height: 100,
                          )
                        ],
                      ),
                      Divider(),
                      //subtitle
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Subtitle",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            posterData['subtitle'] ?? "",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ],
                      ),
                      Divider(),
                      //heading
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Heading",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            posterData['heading1'] ?? '',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ],
                      ),
                      Divider(),
                      //head2
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Heading 2",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            posterData['heading2'] ?? '',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ],
                      ),
                      Divider(),
                      //categry
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Text(
                              "Category for redirecting the link",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Text(
                            posterData['category'] ?? '',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Colors.grey.shade200)),
                );
              },
            );
          },
        )
      ],
    );
  }
}
