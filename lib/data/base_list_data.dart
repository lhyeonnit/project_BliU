
class BaseListData<T> {
  final String? result;
  final String? msg;
  final String? count;
  final List<T>? data;

  BaseListData({
    required this.result,
    required this.msg,
    required this.count,
    required this.data,
  });

  factory BaseListData.fromJson(Map<String, dynamic> json) {
    return BaseListData(
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