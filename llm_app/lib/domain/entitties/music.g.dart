// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'music.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MusicDataAdapter extends TypeAdapter<MusicData> {
  @override
  final int typeId = 0;

  @override
  MusicData read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return MusicData(
      name: fields[0] as String?,
      artistNames: (fields[1] as List?)?.cast<String>(),
      imageUrls: (fields[2] as List?)?.cast<String>(),
    );
  }

  @override
  void write(BinaryWriter writer, MusicData obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.artistNames)
      ..writeByte(2)
      ..write(obj.imageUrls);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MusicDataAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
