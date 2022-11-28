import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ltwcp/app/modules/market/views/tag_view.dart';
import '../../../../palette.dart';
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
        ],
      ),
      body: Container(
        color: primaryLight,
        child: SingleChildScrollView(
          child: Column(
            children: [
              //스트림 빌더로 파이어스토어 db를 감지. 스냅샷의 값에 맞는 데이터를 가져옴.
              StreamBuilder(
                stream: product.snapshots(),
                builder: (BuildContext context,
                    AsyncSnapshot<QuerySnapshot> streamSnapshot) {
                  //데이터를 가지고 있을 시, 리턴해주는 위젯에 데이터를 표기.
                  if (streamSnapshot.hasData) {
                    return Container(
                      height: 240,
                      width: 70,
                      child: ListView.builder(
                        //docs의 갯수 값을 찾아와서 뿌려주기에, 데이터가 널 값이면 안됨.
                        itemCount: streamSnapshot.data!.docs.length,
                        itemBuilder: (context, index) {
                          final DocumentSnapshot documentSnapshot =
                              streamSnapshot.data!.docs[index];
                          return Card(
                            child: ListTile(
                              title: Text(documentSnapshot['brand']),
                            ),
                          );
                        },
                      ),
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
            ],
          ),
        ),
      ),
    );
  }
}
