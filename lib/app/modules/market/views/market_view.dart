import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ltwcp/app/modules/login/controllers/auth_controller.dart';
import 'package:ltwcp/app/modules/login/views/desktop_login_view.dart';
import 'package:ltwcp/app/modules/market/views/desktop_market_view.dart';
import 'package:ltwcp/app/modules/market/views/item_add_view.dart';
import 'package:ltwcp/app/modules/market/views/tag_view.dart';
import '../../../../palette.dart';
import '../../../../reponsive.dart';
import '../../search/views/search_view.dart';

class MarketView extends StatefulWidget {
  const MarketView({Key? key}) : super(key: key);

  @override
  State<MarketView> createState() => _MarketViewState();
}

class _MarketViewState extends State<MarketView> {
  CollectionReference product =
      FirebaseFirestore.instance.collection('product');

  final PageController pageController = PageController();

  final ref = FirebaseStorage.instance.ref('product').list(
        ListOptions(maxResults: 20),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        heroTag: null,
        backgroundColor: britishRacingGreen,
        child: Icon(Icons.add),
        onPressed: () {
          AuthController().logOut();
        },
      ),
      backgroundColor: primaryLight,
      appBar: AppBar(
        backgroundColor: primaryLight,
        title: Ltw(),
        centerTitle: false,
        elevation: 0,
        actions: [
          FloatingActionButton(
              heroTag: null,
              elevation: 0,
              backgroundColor: primaryLight,
              child: Icon(
                Icons.search_rounded,
                color: britishRacingGreen,
              ),
              onPressed: () {
                Get.to(SearchView());
              }),
          FloatingActionButton(
              elevation: 0,
              backgroundColor: primaryLight,
              child: Icon(
                Icons.tag,
                color: britishRacingGreen,
              ),
              onPressed: () {
                Get.to(TagView());
              }),
          SizedBox(
            width: 20,
          ),
        ],
      ),
      body: Responsive.isDesktop(context)
          ? DesktopMarketView()
          : StreamBuilder(
              stream: product.snapshots(),
              builder: (BuildContext context,
                  AsyncSnapshot<QuerySnapshot> streamSnapshot) {
                //???????????? ????????? ?????? ???, ??????????????? ????????? ???????????? ??????.
                if (streamSnapshot.hasData) {
                  return ListView.builder(
                    //docs??? ?????? ?????? ???????????? ???????????????, ???????????? ??? ????????? ??????.
                    itemCount: streamSnapshot.data!.docs.length,
                    itemBuilder: (context, index) {
                      final DocumentSnapshot documentSnapshot =
                          streamSnapshot.data!.docs[index];
                      return Container(
                        height: 150,
                        child: Card(
                          color: primaryLight,
                          elevation: 10,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16.0),
                          ),
                          margin: EdgeInsets.only(
                              left: 16, right: 16, top: 8, bottom: 8),
                          child: Row(
                            children: [
                              Expanded(
                                flex: 33,
                                child: Image(
                                  height: 120,
                                  image: NetworkImage(
                                      documentSnapshot['imageUrl']),
                                ),
                              ),
                              Expanded(
                                flex: 66,
                                child: Column(
                                  children: [
                                    Expanded(
                                      flex: 50,
                                      child: Center(
                                        child: Text(
                                          documentSnapshot['price'],
                                          style: TextStyle(
                                            fontWeight: FontWeight.w800,
                                            fontFamily: 'JS',
                                            fontSize: 20,
                                            color: britishRacingGreen,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 25,
                                      child: Text(
                                        documentSnapshot['brand'],
                                        style: TextStyle(
                                          fontWeight: FontWeight.w800,
                                          fontFamily: 'JS',
                                          fontSize: 18,
                                          color: primaryDark,
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 25,
                                      child: Text(
                                        documentSnapshot['model'],
                                        style: TextStyle(
                                          fontWeight: FontWeight.w800,
                                          fontFamily: 'JS',
                                          fontSize: 18,
                                          color: primaryDark,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                // child: ListTile(
                                //   title: Text(documentSnapshot['brand']),
                                //   subtitle: Text(documentSnapshot['model']),
                                //   trailing: SizedBox(
                                //     width: 90,
                                //     child: Text(
                                //       documentSnapshot['price'],
                                //     ),
                                //   ),
                                // ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                } else {
                  //????????????, ??????????????? ??????????????? ??????.
                  return Center(
                    child: CircularProgressIndicator(
                      color: britishRacingGreen,
                    ),
                  );
                }
              },
            ),
    );
  }
}
