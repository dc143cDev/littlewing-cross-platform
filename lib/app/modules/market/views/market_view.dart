import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ltwcp/app/modules/login/views/desktop_login_view.dart';
import 'package:ltwcp/app/modules/market/views/desktop_market_view.dart';
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                //데이터를 가지고 있을 시, 리턴해주는 위젯에 데이터를 표기.
                if (streamSnapshot.hasData) {
                  return ListView.builder(
                    //docs의 갯수 값을 찾아와서 뿌려주기에, 데이터가 널 값이면 안됨.
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
                  //아니라면, 프로그레스 인디케이터 표시.
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
