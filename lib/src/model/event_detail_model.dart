class EventDetails {
  Content? content;
  bool? status;

  EventDetails({this.content, this.status});

  EventDetails.fromJson(Map<String, dynamic> json) {
    content =
    json['content'] != null ? Content.fromJson(json['content']) : null;
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (content != null) {
      data['content'] = content!.toJson();
    }
    data['status'] = status;
    return data;
  }
}

class Content {
  Data? data;

  Content({this.data});

  Content.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  int? id;
  String? title;
  String? description;
  String? bannerImage;
  String? dateTime;
  String? organiserName;
  String? organiserIcon;
  String? venueName;
  String? venueCity;
  String? venueCountry;

  Data(
      {this.id,
        this.title,
        this.description,
        this.bannerImage,
        this.dateTime,
        this.organiserName,
        this.organiserIcon,
        this.venueName,
        this.venueCity,
        this.venueCountry});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    description = json['description'];
    bannerImage = json['banner_image'];
    dateTime = json['date_time'];
    organiserName = json['organiser_name'];
    organiserIcon = json['organiser_icon'];
    venueName = json['venue_name'];
    venueCity = json['venue_city'];
    venueCountry = json['venue_country'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['description'] = description;
    data['banner_image'] = bannerImage;
    data['date_time'] = dateTime;
    data['organiser_name'] = organiserName;
    data['organiser_icon'] = organiserIcon;
    data['venue_name'] = venueName;
    data['venue_city'] = venueCity;
    data['venue_country'] = venueCountry;
    return data;
  }
}