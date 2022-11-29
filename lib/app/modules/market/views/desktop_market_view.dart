import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'dart:io';

import 'package:ltwcp/app/modules/market/views/tag_view.dart';

import 'package:firebase_storage/firebase_storage.dart';

import '../../../../palette.dart';
import '../../search/views/search_view.dart';
import 'item_add_view.dart';

class DesktopMarketView extends StatefulWidget {
  const DesktopMarketView({Key? key}) : super(key: key);

  @override
  State<DesktopMarketView> createState() => _DesktopMarketViewState();
}

class _DesktopMarketViewState extends State<DesktopMarketView> {
  CollectionReference product =
      FirebaseFirestore.instance.collection('product');

  final ref = FirebaseStorage.instance.ref('product').list(
        ListOptions(maxResults: 20),
      );

  final PageController pageController = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        heroTag: null,
        backgroundColor: britishRacingGreen,
        child: Icon(Icons.add),
        onPressed: () {
          Get.to(ItemAddView(), transition: Transition.downToUp);
        },
      ),
      backgroundColor: primaryLight,
      body: StreamBuilder(
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
                    margin:
                        EdgeInsets.only(left: 16, right: 16, top: 8, bottom: 8),
                    child: Row(
                      children: [
                        Expanded(
                          flex: 33,
                          child: Image(
                            height: 120,
                            image: NetworkImage(documentSnapshot['imageUrl']),
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
