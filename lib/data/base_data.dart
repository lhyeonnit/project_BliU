
class BaseData<T> {
  final String? result;
  final String? msg;
  final String? count;
  final T? data;

  BaseData({
    required this.result,
    required this.msg,
    required this.count,
    required this.data
  });

  factory BaseData.fromJson(Map<String, dynamic> json) {
    return BaseData(
        result: json['result'],
        msg: json['msg'],
        count: json['count'],
        data: json['data']);
  }

  Map<String, dynamic> toJson() => {
    'result' : result,
    'msg' : msg,
    'count' : count,
    'data' : data
  };
}