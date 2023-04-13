const String collection= 'img';
const String path = 'path';
const String fid = 'id';
class image{
  String imagepath;
  String? id;

  image({required this.imagepath, this.id});
  Map<String, dynamic> toMap() {
    return <String,dynamic>{
      fid : id,
      path : imagepath,
    };}
  factory image.fromMap(Map<String,dynamic> map) => image(id: map[fid],
    imagepath:map[path]
  );
}