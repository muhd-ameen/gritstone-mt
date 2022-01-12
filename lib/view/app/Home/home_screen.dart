// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, use_key_in_widget_constructors, sized_box_for_whitespace, avoid_unnecessary_containers

import 'package:ecommerceapiqa/controllers/data_provider.dart';
import 'package:ecommerceapiqa/view/auth/login_screen.dart';
import 'package:ecommerceapiqa/view/constants/colors_theme.dart';
import 'package:ecommerceapiqa/view/constants/url_consts.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var isFavaorite = false;

  @override
  void initState() {
    super.initState();
    Provider.of<DataProvider>(context, listen: false).getBannerData(context);
    Provider.of<DataProvider>(context, listen: false).getProductsData(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.menu, color: kGrey),
          onPressed: () {},
        ),
        title: const Text(
          'Dimos',
          style: TextStyle(
            color: kBlack,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          Row(
            children: [
                IconButton(
                icon: Icon(Icons.search, color: kGrey),
                onPressed: () {
                     Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => LoginScreen(),
          ));
                },
              ),
              IconButton(
                icon: Icon(Icons.favorite_border_rounded, color: kGrey),
                onPressed: () {},
              ),
              IconButton(
                icon: Icon(Icons.shopping_cart_outlined, color: kGrey),
                onPressed: () {},
              ),
            
            ],
          )
        ],
        bottom: PreferredSize(
            child: Container(
              margin: EdgeInsets.only(
                left: 15,
                right: 15,
              ),
              padding: EdgeInsets.all(10),
              color: Colors.white,
              height: 65.0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  TopSlider( title:'Beds',icon:  Icons.chair_outlined,),
                  TopSlider( title:'Sofas',icon:  Icons.weekend_outlined,),
                  TopSlider( title:'Chair',icon:  Icons.event_seat_outlined,),
                  TopSlider( title:'Wardobes',icon:  Icons.meeting_room_outlined ,),
                  TopSlider( title:'Dinning',icon:  Icons.rice_bowl,),
                
                ],
              ),
            ),
            preferredSize: Size.fromHeight(65.0)),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Consumer<DataProvider>(
              builder: (context, data, child) => data.isLoading
                  ? Container(
                      width: double.infinity,
                      height: 200,
                      child: Center(
                        child: CircularProgressIndicator(),
                      ),
                    )
                  : Container(
                      margin: const EdgeInsets.symmetric(vertical: 20.0),
                      height: 200.0,
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          shrinkWrap: true,
                          itemCount: data.bannerModel.length,
                          itemBuilder: (context, index) {
                            return BannerWidget(data: data, index: index,);
                          }),
                    ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Column(children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'New Arrivals',
                      style: TextStyle(
                        fontSize: 14,
                        color: kBlack,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      'View All',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: kGrey,
                      ),
                    ),
                  ],
                ),
                Consumer<DataProvider>(
                  builder: (context, value, child) => value.isLoadings
                      ? Container(
                          width: double.infinity,
                          height: 200,
                          child: Center(
                            child: CircularProgressIndicator(),
                          ),
                        )
                      : Container(
                          margin: EdgeInsets.symmetric(vertical: 10.0),
                          height: 240.0,
                          padding: EdgeInsets.all(0),
                          child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              shrinkWrap: true,
                              itemCount: value.productModel.length,
                              itemBuilder: (context, index) {
                                return Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.white,
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0.1),
                                        spreadRadius: 4,
                                        blurRadius: 2,
                                        offset: Offset(
                                            0, 3), // changes position of shadow
                                      ),
                                    ],
                                  ),
                                  margin: EdgeInsets.symmetric(
                                      horizontal: 5, vertical: 3),
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Stack(
                                        children: [
                                          Container(
                                            width: 160.0,
                                            height: 125.0,
                                            color: Colors.grey[200],
                                            child: Center(
                                              child: Image.network(
                                                value.productModel[index].path,
                                                fit: BoxFit.fitHeight,
                                              ),
                                            ),
                                          ),
                                          Positioned(
                                            right: 0,
                                            top: 0,
                                            child: IconButton(
                                              padding: EdgeInsets.all(0),
                                              onPressed: () {},
                                              icon: value.productModel[index]
                                                      .isWishList
                                                  ? Icon(
                                                      Icons.favorite,
                                                      color: kGrey,
                                                    )
                                                  : Icon(
                                                      Icons
                                                          .favorite_border_rounded,
                                                      color: kGrey,
                                                    ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Container(
                                        width: 160.0,
                                        padding: EdgeInsets.symmetric(
                                            vertical: 3, horizontal: 8),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              value.productModel[index]
                                                  .productProfileName,
                                              style: TextStyle(
                                                fontSize: 15,
                                                color: kBlack,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                            SizedBox(
                                              height: 4,
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  '\$' +
                                                      value.productModel[index]
                                                          .rate
                                                          .toString(),
                                                  style: TextStyle(
                                                    fontSize: 12,
                                                    color: kBlack,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                                Text(
                                                    '\$${value.productModel[index].mrp}',
                                                    style: TextStyle(
                                                        fontSize: 12,
                                                        color: Colors.grey[500],
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        decoration:
                                                            TextDecoration
                                                                .lineThrough)),
                                                Text(
                                                  value.productModel[index]
                                                          .discount
                                                          .toString() +
                                                      ' Off',
                                                  style: TextStyle(
                                                    fontSize: 12,
                                                    color: Colors.red,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: 1,
                                                )
                                              ],
                                            ),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Container(
                                                  padding: EdgeInsets.symmetric(
                                                      horizontal: 4,
                                                      vertical: 2),
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            4),
                                                    color: Colors.green,
                                                  ),
                                                  child: Row(
                                                    children: [
                                                      Text(
                                                        '2.6',
                                                        style: TextStyle(
                                                          fontSize: 11,
                                                          color: Colors.white,
                                                        ),
                                                      ),
                                                      Icon(
                                                        Icons.star,
                                                        size: 10,
                                                      )
                                                    ],
                                                  ),
                                                ),
                                                Text(
                                                  '(200 Reviews)',
                                                  style: TextStyle(
                                                    fontSize: 10,
                                                    color: Colors.grey[600],
                                                  ),
                                                ),
                                                Container(
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                            horizontal: 09,
                                                            vertical: 2),
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              4),
                                                      color:
                                                          Colors.orangeAccent,
                                                    ),
                                                    child: Icon(
                                                      Icons
                                                          .shopping_cart_outlined,
                                                      size: 15,
                                                    ))
                                              ],
                                            )
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              }),
                        ),
                ),
              ]),
            ),
            SizedBox(height: 20),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Column(children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Most Popular',
                      style: TextStyle(
                        fontSize: 14,
                        color: kBlack,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      'View All',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: kGrey,
                      ),
                    ),
                  ],
                ),
                Consumer<DataProvider>(
                  builder: (context, value, child) => value.isLoadings
                      ? Container(
                          width: double.infinity,
                          height: 200,
                          child: Center(
                            child: CircularProgressIndicator(),
                          ),
                        )
                      : Container(
                          margin: EdgeInsets.symmetric(vertical: 10.0),
                          height: 240.0,
                          padding: EdgeInsets.all(0),
                          child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              shrinkWrap: true,
                              itemCount: value.productModel.length,
                              itemBuilder: (context, index) {
                                return Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.white,
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0.1),
                                        spreadRadius: 4,
                                        blurRadius: 2,
                                        offset: Offset(
                                            0, 3), // changes position of shadow
                                      ),
                                    ],
                                  ),
                                  margin: EdgeInsets.symmetric(
                                      horizontal: 5, vertical: 3),
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Stack(
                                        children: [
                                          Container(
                                            width: 160.0,
                                            height: 125.0,
                                            color: Colors.grey[200],
                                            child: Center(
                                              child: Image.network(
                                                value.productModel[index].path,
                                                fit: BoxFit.fitHeight,
                                              ),
                                            ),
                                          ),
                                          Positioned(
                                            right: 0,
                                            top: 0,
                                            child: IconButton(
                                              padding: EdgeInsets.all(0),
                                              onPressed: () {},
                                              icon: value.productModel[index]
                                                      .isWishList
                                                  ? Icon(
                                                      Icons.favorite,
                                                      color: kGrey,
                                                    )
                                                  : Icon(
                                                      Icons
                                                          .favorite_border_rounded,
                                                      color: kGrey,
                                                    ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Container(
                                        width: 160.0,
                                        padding: EdgeInsets.symmetric(
                                            vertical: 3, horizontal: 8),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              value.productModel[index]
                                                  .productProfileName,
                                              style: TextStyle(
                                                fontSize: 15,
                                                color: kBlack,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                            SizedBox(
                                              height: 4,
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  '\$' +
                                                      value.productModel[index]
                                                          .rate
                                                          .toString(),
                                                  style: TextStyle(
                                                    fontSize: 12,
                                                    color: kBlack,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                                Text(
                                                    '\$${value.productModel[index].mrp}',
                                                    style: TextStyle(
                                                        fontSize: 12,
                                                        color: Colors.grey[500],
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        decoration:
                                                            TextDecoration
                                                                .lineThrough)),
                                                Text(
                                                  value.productModel[index]
                                                          .discount
                                                          .toString() +
                                                      ' Off',
                                                  style: TextStyle(
                                                    fontSize: 12,
                                                    color: Colors.red,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: 1,
                                                )
                                              ],
                                            ),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Container(
                                                  padding: EdgeInsets.symmetric(
                                                      horizontal: 4,
                                                      vertical: 2),
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            4),
                                                    color: Colors.green,
                                                  ),
                                                  child: Row(
                                                    children: [
                                                      Text(
                                                        '2.6',
                                                        style: TextStyle(
                                                          fontSize: 11,
                                                          color: Colors.white,
                                                        ),
                                                      ),
                                                      Icon(
                                                        Icons.star,
                                                        size: 10,
                                                      )
                                                    ],
                                                  ),
                                                ),
                                                Text(
                                                  '(200 Reviews)',
                                                  style: TextStyle(
                                                    fontSize: 10,
                                                    color: Colors.grey[600],
                                                  ),
                                                ),
                                                Container(
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                            horizontal: 09,
                                                            vertical: 2),
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              4),
                                                      color:
                                                          Colors.orangeAccent,
                                                    ),
                                                    child: Icon(
                                                      Icons
                                                          .shopping_cart_outlined,
                                                      size: 15,
                                                    ))
                                              ],
                                            )
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              }),
                        ),
                ),
              ]),
            ),
          ],
        ),
      ),
    );
  }
}

class BannerWidget extends StatelessWidget {
final DataProvider data;
final int index;
  const BannerWidget({
    Key? key, required this.data, required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.symmetric(
            horizontal: 10.0),
        width: MediaQuery.of(context).size.width,
        height: 200.0,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(assetUrl +
                data.bannerModel[index].pictureName),
            fit: BoxFit.cover,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.01),
              spreadRadius: 5,
              blurRadius: 7,
              offset: Offset(
                  0, 3), // changes position of shadow
            ),
          ],
        ));
  }
}

class TopSlider extends StatelessWidget {
  final IconData icon;
  final String title;
  const TopSlider({
    required this.icon,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Icon(icon, color: Colors.orange[300], size: 30),
          Text(
            title,
            style: TextStyle(
              color: kGrey,
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
}
