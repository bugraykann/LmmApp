import 'package:hive/hive.dart';

part 'music.g.dart';

class MusicModel {
  List<MusicData>? tracks;
  String? nextUrl;

  MusicModel({this.tracks, this.nextUrl});

  MusicModel.fromJson(Map<String, dynamic> json) {
    if (json['items'] != null) {
      tracks = <MusicData>[];
      json['items'].forEach((item) {
        tracks!.add(MusicData.fromJson(item['track']));
      });
    }
    nextUrl = json['next'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (tracks != null) {
      data['items'] =
          tracks!.map((track) => {'track': track.toJson()}).toList();
    }
    data['next'] = nextUrl;
    return data;
  }
}

@HiveType(typeId: 0)
class MusicData {
  @HiveField(0)
  String? name;
  @HiveField(1)
  List<String>? artistNames;
  @HiveField(2)
  List<String>? imageUrls;

  MusicData({this.name, this.artistNames, this.imageUrls});

  MusicData.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    if (json['artists'] != null) {
      artistNames = <String>[];
      json['artists'].forEach((v) {
        artistNames!.add(v['name']);
      });
    }
    if (json['album'] != null && json['album']['images'] != null) {
      imageUrls = <String>[];
      json['album']['images'].forEach((image) {
        imageUrls!.add(image['url']);
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    if (artistNames != null) {
      data['artists'] = artistNames!.map((name) => {'name': name}).toList();
    }
    if (imageUrls != null) {
      data['album'] = {
        'images': imageUrls!.map((url) => {'url': url}).toList()
      };
    }
    return data;
  }
}
