import 'Data.dart';

class photomemes {
  int total = 0;
  int count = 0;
  List<Data> data = [];

  photomemes({required this.total, required this.count, required this.data});

  photomemes.fromJson(Map<String, dynamic> json) {
    total = json['total'];
    count = json['count'];
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['total'] = this.total;
    data['count'] = this.count;
    
    if (this.data != null) {
      data['data'] = this.data.map((v) => v.toJson()).toList();
    }
    return data;
  }
}