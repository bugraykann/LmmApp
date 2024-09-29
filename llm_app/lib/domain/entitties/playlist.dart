class PlaylistModel {
  List<PlaylistData>? playlists;
  String? nextUrl;

  PlaylistModel({this.playlists, this.nextUrl});

  PlaylistModel.fromJson(Map<String, dynamic> json) {
    if (json['items'] != null) {
      playlists = <PlaylistData>[];
      json['items'].forEach((item) {
        playlists!.add(PlaylistData.fromJson(item));
      });
    }
    nextUrl = json['next'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (playlists != null) {
      data['items'] = playlists!.map((playlist) => playlist.toJson()).toList();
    }
    data['next'] = nextUrl;
    return data;
  }
}

class PlaylistData {
  String? name;
  List<String>? imageUrls;
  String? id;

  PlaylistData({this.name, this.imageUrls, this.id});

  PlaylistData.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    id = json['id'];
    if (json['images'] != null) {
      imageUrls = <String>[];
      json['images'].forEach((image) {
        imageUrls!.add(image['url']);
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['id'] = id;
    if (imageUrls != null) {
      data['images'] = imageUrls!.map((url) => {'url': url}).toList();
    }
    return data;
  }
}
