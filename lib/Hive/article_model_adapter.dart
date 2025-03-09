import 'package:hive/hive.dart';
import 'package:news/models/articles_model.dart';

class ArticleModelAdapter extends TypeAdapter<ArticleModel> {
  @override
  final int typeId = 0;

  @override
  ArticleModel read(BinaryReader reader) {
    final fieldsCount = reader.readByte();
    final fields = <int, dynamic>{};
    for (var i = 0; i < fieldsCount; i++) {
      final fieldKey = reader.readByte();
      final fieldValue = reader.read();
      fields[fieldKey] = fieldValue;
    }
    return ArticleModel(
      author: fields[0] as String?,
      image: fields[1] as String?,
      title: fields[2] as String?,
      description: fields[3] as String?,
      urlImage: fields[4] as String,
      publishedAt: fields[5] as DateTime,
      source: fields[6] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, ArticleModel obj) {
    writer.writeByte(7); // Number of fields in the ArticleModel class
    writer.writeByte(0);
    writer.write(obj.author);
    writer.writeByte(1);
    writer.write(obj.image);
    writer.writeByte(2);
    writer.write(obj.title);
    writer.writeByte(3);
    writer.write(obj.description);
    writer.writeByte(4);
    writer.write(obj.urlImage);
    writer.writeByte(5);
    writer.write(obj.publishedAt);
    writer.writeByte(6);
    writer.write(obj.author);
  }
}
