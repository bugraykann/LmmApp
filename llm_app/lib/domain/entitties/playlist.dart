class SimplePlaylist {
  List<SimpleTrack>? tracks;

  SimplePlaylist({this.tracks});

  SimplePlaylist.fromJson(Map<String, dynamic> json) {
    if (json['items'] != null) {
      tracks = <SimpleTrack>[];
      json['items'].forEach((item) {
        // `item['track']` 'track' nesnesini alır
        tracks!.add(SimpleTrack.fromJson(item['track']));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (tracks != null) {
      data['items'] =
          tracks!.map((track) => {'track': track.toJson()}).toList();
    }
    return data;
  }
}

class SimpleTrack {
  String? name;
  List<String>? artistNames;

  SimpleTrack({this.name, this.artistNames});

  SimpleTrack.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    if (json['artists'] != null) {
      artistNames = <String>[];
      json['artists'].forEach((v) {
        artistNames!.add(v['name']);
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    if (artistNames != null) {
      data['artists'] = artistNames!.map((name) => {'name': name}).toList();
    }
    return data;
  }
}
