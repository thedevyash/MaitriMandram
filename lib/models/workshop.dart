class workshopModel {
  String? organization;
  String? location;
  String? workshopName;
  String? workshopDescription;
  String? dateTime;
  String? venue;
  String? icon;

  workshopModel(
      {this.organization,
      this.location,
      this.workshopName,
      this.workshopDescription,
      this.dateTime,
      this.venue,
      this.icon});

  workshopModel.fromJson(Map<String, dynamic> json) {
    organization = json['organization'];
    location = json['location'];
    workshopName = json['workshop_name'];
    workshopDescription = json['workshop_description'];
    dateTime = json['Date_time'];
    venue = json['venue'];
    icon = json['icon'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['organization'] = this.organization;
    data['location'] = this.location;
    data['workshop_name'] = this.workshopName;
    data['workshop_description'] = this.workshopDescription;
    data['Date_time'] = this.dateTime;
    data['venue'] = this.venue;
    data['icon'] = this.icon;
    return data;
  }
}
