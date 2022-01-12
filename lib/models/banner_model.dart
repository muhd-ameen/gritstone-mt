// To parse this JSON data, do
//
//     final bannerModel = bannerModelFromJson(jsonString);

// ignore_for_file: unnecessary_null_comparison, prefer_if_null_operators

// import 'package:meta/meta.dart';
import 'dart:convert';

List<BannerModel> bannerModelFromJson(String str) => List<BannerModel>.from(json.decode(str).map((x) => BannerModel.fromJson(x)));

String bannerModelToJson(List<BannerModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class BannerModel {
    BannerModel({
        required this.offerId,
        required this.pictureName,
        required this.path,
        required this.x,
        required this.y,
        required this.width,
        required this.height,
        required this.isActive,
        required this.lastModificationTime,
        required this.lastModifierUserId,
        required this.creationTime,
        required this.creatorUserId,
        required this.id,
    });

    final int offerId;
    final String pictureName;
    final String path;
    final int x;
    final int y;
    final int width;
    final int height;
    final bool isActive;
    final dynamic lastModificationTime;
    final dynamic lastModifierUserId;
    final String creationTime;
    final int creatorUserId;
    final int id;

    factory BannerModel.fromJson(Map<String, dynamic> json) => BannerModel(
        offerId: json["offerId"] == null ? null : json["offerId"],
        pictureName: json["pictureName"] == null ? null : json["pictureName"],
        path: json["path"] == null ? null : json["path"],
        x: json["x"] == null ? null : json["x"],
        y: json["y"] == null ? null : json["y"],
        width: json["width"] == null ? null : json["width"],
        height: json["height"] == null ? null : json["height"],
        isActive: json["isActive"] == null ? null : json["isActive"],
        lastModificationTime: json["lastModificationTime"],
        lastModifierUserId: json["lastModifierUserId"],
        creationTime: json["creationTime"] == null ? null : json["creationTime"],
        creatorUserId: json["creatorUserId"] == null ? null : json["creatorUserId"],
        id: json["id"] == null ? null : json["id"],
    );

    Map<String, dynamic> toJson() => {
        "offerId": offerId == null ? null : offerId,
        "pictureName": pictureName == null ? null : pictureName,
        "path": path == null ? null : path,
        "x": x == null ? null : x,
        "y": y == null ? null : y,
        "width": width == null ? null : width,
        "height": height == null ? null : height,
        "isActive": isActive == null ? null : isActive,
        "lastModificationTime": lastModificationTime,
        "lastModifierUserId": lastModifierUserId,
        "creationTime": creationTime == null ? null : creationTime,
        "creatorUserId": creatorUserId == null ? null : creatorUserId,
        "id": id == null ? null : id,
    };
}
