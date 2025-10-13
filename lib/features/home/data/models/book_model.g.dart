// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'book_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BookModel _$BookModelFromJson(Map<String, dynamic> json) => BookModel(
      error: json['error'] as String,
      total: json['total'] as String,
      books: (json['books'] as List<dynamic>)
          .map((e) => BookItem.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$BookModelToJson(BookModel instance) => <String, dynamic>{
      'error': instance.error,
      'total': instance.total,
      'books': instance.books,
    };

BookItem _$BookItemFromJson(Map<String, dynamic> json) => BookItem(
      title: json['title'] as String,
      subtitle: json['subtitle'] as String,
      isbn13: json['isbn13'] as String,
      price: json['price'] as String,
      image: json['image'] as String,
      url: json['url'] as String,
    );

Map<String, dynamic> _$BookItemToJson(BookItem instance) => <String, dynamic>{
      'title': instance.title,
      'subtitle': instance.subtitle,
      'isbn13': instance.isbn13,
      'price': instance.price,
      'image': instance.image,
      'url': instance.url,
    };
