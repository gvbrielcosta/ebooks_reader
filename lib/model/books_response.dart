
class BooksResponse {
    int? id;
    String? title;
    String? author;
    String? coverUrl;
    String? downloadUrl;

    BooksResponse({this.id, this.title, this.author, this.coverUrl, this.downloadUrl});

    BooksResponse.fromJson(Map<String, dynamic> json) {
        id = json["id"];
        title = json["title"];
        author = json["author"];
        coverUrl = json["cover_url"];
        downloadUrl = json["download_url"];
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> _data = <String, dynamic>{};
        _data["id"] = id;
        _data["title"] = title;
        _data["author"] = author;
        _data["cover_url"] = coverUrl;
        _data["download_url"] = downloadUrl;
        return _data;
    }
}