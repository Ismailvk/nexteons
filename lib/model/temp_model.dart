class TempData {
  String id;
  String name;
  dynamic globalGalleryCategoryId;
  int docType;
  int uid;
  int type;
  String url;
  String createdUserId;
  int createdAt;
  dynamic updatedUserId;
  int updatedAt;
  int status;
  int v;

  TempData({
    required this.id,
    required this.name,
    required this.globalGalleryCategoryId,
    required this.docType,
    required this.uid,
    required this.type,
    required this.url,
    required this.createdUserId,
    required this.createdAt,
    required this.updatedUserId,
    required this.updatedAt,
    required this.status,
    required this.v,
  });

  factory TempData.fromJson(Map<String, dynamic> json) {
    return TempData(
      id: json['_id'] as String,
      name: json['_name'] as String,
      globalGalleryCategoryId: json['_globalGalleryCategoryId'],
      docType: json['_docType'] as int,
      uid: json['_uid'] as int,
      type: json['_type'] as int,
      url: json['_url'] as String,
      createdUserId: json['_createdUserId'] as String,
      createdAt: json['_createdAt'] as int,
      updatedUserId: json['_updatedUserId'],
      updatedAt: json['_updatedAt'] as int,
      status: json['_status'] as int,
      v: json['__v'] as int,
    );
  }
}
