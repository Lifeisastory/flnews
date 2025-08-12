// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'news.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

News _$NewsFromJson(Map<String, dynamic> json) {
  return _News.fromJson(json);
}

/// @nodoc
mixin _$News {
  int get siteId => throw _privateConstructorUsedError;
  String get siteName => throw _privateConstructorUsedError;
  String get siteIconUrl => throw _privateConstructorUsedError;
  int get position => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get url => throw _privateConstructorUsedError;
  String? get imageUrl => throw _privateConstructorUsedError;
  String get popularity => throw _privateConstructorUsedError;

  /// Serializes this News to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of News
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $NewsCopyWith<News> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NewsCopyWith<$Res> {
  factory $NewsCopyWith(News value, $Res Function(News) then) =
      _$NewsCopyWithImpl<$Res, News>;
  @useResult
  $Res call({
    int siteId,
    String siteName,
    String siteIconUrl,
    int position,
    String title,
    String url,
    String? imageUrl,
    String popularity,
  });
}

/// @nodoc
class _$NewsCopyWithImpl<$Res, $Val extends News>
    implements $NewsCopyWith<$Res> {
  _$NewsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of News
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? siteId = null,
    Object? siteName = null,
    Object? siteIconUrl = null,
    Object? position = null,
    Object? title = null,
    Object? url = null,
    Object? imageUrl = freezed,
    Object? popularity = null,
  }) {
    return _then(
      _value.copyWith(
            siteId:
                null == siteId
                    ? _value.siteId
                    : siteId // ignore: cast_nullable_to_non_nullable
                        as int,
            siteName:
                null == siteName
                    ? _value.siteName
                    : siteName // ignore: cast_nullable_to_non_nullable
                        as String,
            siteIconUrl:
                null == siteIconUrl
                    ? _value.siteIconUrl
                    : siteIconUrl // ignore: cast_nullable_to_non_nullable
                        as String,
            position:
                null == position
                    ? _value.position
                    : position // ignore: cast_nullable_to_non_nullable
                        as int,
            title:
                null == title
                    ? _value.title
                    : title // ignore: cast_nullable_to_non_nullable
                        as String,
            url:
                null == url
                    ? _value.url
                    : url // ignore: cast_nullable_to_non_nullable
                        as String,
            imageUrl:
                freezed == imageUrl
                    ? _value.imageUrl
                    : imageUrl // ignore: cast_nullable_to_non_nullable
                        as String?,
            popularity:
                null == popularity
                    ? _value.popularity
                    : popularity // ignore: cast_nullable_to_non_nullable
                        as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$NewsImplCopyWith<$Res> implements $NewsCopyWith<$Res> {
  factory _$$NewsImplCopyWith(
    _$NewsImpl value,
    $Res Function(_$NewsImpl) then,
  ) = __$$NewsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    int siteId,
    String siteName,
    String siteIconUrl,
    int position,
    String title,
    String url,
    String? imageUrl,
    String popularity,
  });
}

/// @nodoc
class __$$NewsImplCopyWithImpl<$Res>
    extends _$NewsCopyWithImpl<$Res, _$NewsImpl>
    implements _$$NewsImplCopyWith<$Res> {
  __$$NewsImplCopyWithImpl(_$NewsImpl _value, $Res Function(_$NewsImpl) _then)
    : super(_value, _then);

  /// Create a copy of News
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? siteId = null,
    Object? siteName = null,
    Object? siteIconUrl = null,
    Object? position = null,
    Object? title = null,
    Object? url = null,
    Object? imageUrl = freezed,
    Object? popularity = null,
  }) {
    return _then(
      _$NewsImpl(
        siteId:
            null == siteId
                ? _value.siteId
                : siteId // ignore: cast_nullable_to_non_nullable
                    as int,
        siteName:
            null == siteName
                ? _value.siteName
                : siteName // ignore: cast_nullable_to_non_nullable
                    as String,
        siteIconUrl:
            null == siteIconUrl
                ? _value.siteIconUrl
                : siteIconUrl // ignore: cast_nullable_to_non_nullable
                    as String,
        position:
            null == position
                ? _value.position
                : position // ignore: cast_nullable_to_non_nullable
                    as int,
        title:
            null == title
                ? _value.title
                : title // ignore: cast_nullable_to_non_nullable
                    as String,
        url:
            null == url
                ? _value.url
                : url // ignore: cast_nullable_to_non_nullable
                    as String,
        imageUrl:
            freezed == imageUrl
                ? _value.imageUrl
                : imageUrl // ignore: cast_nullable_to_non_nullable
                    as String?,
        popularity:
            null == popularity
                ? _value.popularity
                : popularity // ignore: cast_nullable_to_non_nullable
                    as String,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$NewsImpl implements _News {
  const _$NewsImpl({
    required this.siteId,
    required this.siteName,
    required this.siteIconUrl,
    required this.position,
    required this.title,
    required this.url,
    required this.imageUrl,
    required this.popularity,
  });

  factory _$NewsImpl.fromJson(Map<String, dynamic> json) =>
      _$$NewsImplFromJson(json);

  @override
  final int siteId;
  @override
  final String siteName;
  @override
  final String siteIconUrl;
  @override
  final int position;
  @override
  final String title;
  @override
  final String url;
  @override
  final String? imageUrl;
  @override
  final String popularity;

  @override
  String toString() {
    return 'News(siteId: $siteId, siteName: $siteName, siteIconUrl: $siteIconUrl, position: $position, title: $title, url: $url, imageUrl: $imageUrl, popularity: $popularity)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NewsImpl &&
            (identical(other.siteId, siteId) || other.siteId == siteId) &&
            (identical(other.siteName, siteName) ||
                other.siteName == siteName) &&
            (identical(other.siteIconUrl, siteIconUrl) ||
                other.siteIconUrl == siteIconUrl) &&
            (identical(other.position, position) ||
                other.position == position) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.url, url) || other.url == url) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl) &&
            (identical(other.popularity, popularity) ||
                other.popularity == popularity));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    siteId,
    siteName,
    siteIconUrl,
    position,
    title,
    url,
    imageUrl,
    popularity,
  );

  /// Create a copy of News
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$NewsImplCopyWith<_$NewsImpl> get copyWith =>
      __$$NewsImplCopyWithImpl<_$NewsImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$NewsImplToJson(this);
  }
}

abstract class _News implements News {
  const factory _News({
    required final int siteId,
    required final String siteName,
    required final String siteIconUrl,
    required final int position,
    required final String title,
    required final String url,
    required final String? imageUrl,
    required final String popularity,
  }) = _$NewsImpl;

  factory _News.fromJson(Map<String, dynamic> json) = _$NewsImpl.fromJson;

  @override
  int get siteId;
  @override
  String get siteName;
  @override
  String get siteIconUrl;
  @override
  int get position;
  @override
  String get title;
  @override
  String get url;
  @override
  String? get imageUrl;
  @override
  String get popularity;

  /// Create a copy of News
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$NewsImplCopyWith<_$NewsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
