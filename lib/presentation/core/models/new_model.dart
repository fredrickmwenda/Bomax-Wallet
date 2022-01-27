class News {
	String? id;
	String? guid;
	int? publishedOn;
	String? imageurl;
	String? title;
	String? url;
	String? source;
	String? body;
	String? tags;
	String? categories;
	String? upvotes;
	String? downvotes;
	String? lang;
	// SourceInfo? sourceInfo;

	News({
    this.id, this.guid, this.publishedOn, this.imageurl, 
    this.title, this.url, this.source, this.body, this.tags, 
    this.categories, this.upvotes, this.downvotes, this.lang, 
    // this.sourceInfo
  });

	News.fromJson(Map<String, dynamic> json) {
		id = json['id'];
		guid = json['guid'];
		publishedOn = json['published_on'];
		imageurl = json['imageurl'];
		title = json['title'];
		url = json['url'];
		source = json['source'];
		body = json['body'];
		tags = json['tags'];
		categories = json['categories'];
		upvotes = json['upvotes'];
		downvotes = json['downvotes'];
		lang = json['lang'];
		// sourceInfo = json['source_info'] != null ? 
    // new SourceInfo.fromJson(json['source_info']) : null;
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data =  Map<String, dynamic>();
		data['id'] = this.id;
		data['guid'] = this.guid;
		data['published_on'] = this.publishedOn;
		data['imageurl'] = this.imageurl;
		data['title'] = this.title;
		data['url'] = this.url;
		data['source'] = this.source;
		data['body'] = this.body;
		data['tags'] = this.tags;
		data['categories'] = this.categories;
		data['upvotes'] = this.upvotes;
		data['downvotes'] = this.downvotes;
		data['lang'] = this.lang;
		// if (this.sourceInfo != null) {
    //   data['source_info'] = this.sourceInfo!.toJson();
    // }
		return data;
	}
}





















































// class News {
//   String id;
//   String title;
//   String imageurl;
//   String body;
//   String source;
//   String url;
//   int published_on;

//   News({
//     required this.id,
//     required this.title,
//     required this.imageurl,
//     required this.body,
//     required this.source,
//     required this.url,
//     required this.published_on,
//   });

//   factory News.fromJson(Map<String, dynamic> json) {
//     return News(
//         id: json['id'] as String,
//         title: json['title'] as String,
//         imageurl: json['imageurl'] as String,
//         body: json['body'] as String,
//         source: json['source'] as String,
//         url: json['url'] as String,
//         published_on: json['published_on'] as int);
//   }

//     Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
    
//     data['id'] = id;
//     data['title'] = title;
//     data['imageurl'] = imageurl;
//     data['body'] = body;
//     data['source'] = source;
//     data['url'] = url;
//     data['published_on'] = published_on;
//     return data;
//   }

//   // Future<dynamic> getGlobalData() async {
//   //   await NetworkHelper.getGlobalData().then((data) {
//   //     print('Data: ${data.length}');
//   //   });
//   // }
//   // return News(
//   //   id: map['id'] as String,
//   //   title: map['title'] as String,
//   //   imageurl: map['imageurl'] as String,
//   //   body: map['body'] as String,
//   //   source: map['source'] as String,
//   //   url: map['url'] as String,
//   //   published_on: map['published_on'] as int
//   // );

// }
