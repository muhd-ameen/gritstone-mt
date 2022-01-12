// To parse this JSON data, do
//
//     final productModel = productModelFromJson(jsonString);

// ignore_for_file: unnecessary_null_comparison, prefer_if_null_operators

// import 'package:meta/meta.dart';
import 'dart:convert';

List<ProductModel> productModelFromJson(String str) => List<ProductModel>.from(json.decode(str).map((x) => ProductModel.fromJson(x)));

String productModelToJson(List<ProductModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ProductModel {
    ProductModel({
        required this.rate,
        required this.qty,
        required this.discount,
        required this.totalProductTax,
        required this.isWishList,
        required this.productProfileId,
        required this.productProfileName,
        required this.productVarientLinksId,
        required this.productVarientLinksName,
        required this.unitId,
        required this.path,
        required this.unitName,
        required this.description1,
        required this.description2,
        required this.description3,
        required this.description4,
        required this.pathList,
        required this.mrp,
    });

    final dynamic rate;
    final dynamic qty;
    final dynamic discount;
    final dynamic totalProductTax;
    final bool isWishList;
    final dynamic productProfileId;
    final String productProfileName;
    final dynamic productVarientLinksId;
    final dynamic productVarientLinksName;
    final dynamic unitId;
    final String path;
    final String unitName;
    final dynamic description1;
    final dynamic description2;
    final dynamic description3;
    final dynamic description4;
    final dynamic pathList;
    final dynamic mrp;

    factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
        rate: json["rate"] == null ? null : json["rate"],
        qty: json["qty"] == null ? null : json["qty"],
        discount: json["discount"] == null ? null : json["discount"],
        totalProductTax: json["totalProductTax"] == null ? null : json["totalProductTax"],
        isWishList: json["isWishList"] == null ? null : json["isWishList"],
        productProfileId: json["productProfileId"] == null ? null : json["productProfileId"],
        productProfileName: json["productProfileName"] == null ? null : json["productProfileName"],
        productVarientLinksId: json["productVarientLinksId"] == null ? null : json["productVarientLinksId"],
        productVarientLinksName: json["productVarientLinksName"],
        unitId: json["unitId"] == null ? null : json["unitId"],
        path: json["path"] == null ? null : json["path"],
        unitName: json["unitName"] == null ? null : json["unitName"],
        description1: json["description1"],
        description2: json["description2"],
        description3: json["description3"],
        description4: json["description4"],
        pathList: json["pathList"],
        mrp: json["mrp"] == null ? null : json["mrp"],
    );

    Map<String, dynamic> toJson() => {
        "rate": rate == null ? null : rate,
        "qty": qty == null ? null : qty,
        "discount": discount == null ? null : discount,
        "totalProductTax": totalProductTax == null ? null : totalProductTax,
        "isWishList": isWishList == null ? null : isWishList,
        "productProfileId": productProfileId == null ? null : productProfileId,
        "productProfileName": productProfileName == null ? null : productProfileName,
        "productVarientLinksId": productVarientLinksId == null ? null : productVarientLinksId,
        "productVarientLinksName": productVarientLinksName,
        "unitId": unitId == null ? null : unitId,
        "path": path == null ? null : path,
        "unitName": unitName == null ? null : unitName,
        "description1": description1,
        "description2": description2,
        "description3": description3,
        "description4": description4,
        "pathList": pathList,
        "mrp": mrp == null ? null : mrp,
    };
}
