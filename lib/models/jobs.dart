class jobModel {
  String? jobtitle;
  String? company;
  String? jobcategory;
  String? description;
  Map? details;

  jobModel(
      {this.jobtitle,
      this.company,
      this.jobcategory,
      this.description,
      this.details});

  jobModel.fromJson(Map<String, dynamic> json) {
    jobtitle = json['jobtitle'];
    company = json['company'];
    jobcategory = json['jobcategory'];
    description = json['description'];
    details = json['details'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['jobtitle'] = this.jobtitle;
    data['company'] = this.company;
    data['jobcategory'] = this.jobcategory;
    data['description'] = this.description;
    data['details'] = this.details;
    return data;
  }
}
