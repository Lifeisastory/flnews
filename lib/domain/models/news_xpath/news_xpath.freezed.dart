// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'news_xpath.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

NewsXpath _$NewsXpathFromJson(Map<String, dynamic> json) {
  return _NewsXpath.fromJson(json);
}

/// @nodoc
mixin _$NewsXpath {
  String? get position => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get url => throw _privateConstructorUsedError;
  String get popularity => throw _privateConstructorUsedError;
  String? get imageUrl => throw _privateConstructorUsedError;
  String? get parameter => throw _privateConstructorUsedError;

  /// Serializes this NewsXpath to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of NewsXpath
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $NewsXpathCopyWith<NewsXpath> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NewsXpathCopyWith<$Res> {
  factory $NewsXpathCopyWith(NewsXpath value, $Res Function(NewsXpath) then) =
      _$NewsXpathCopyWithImpl<$Res, NewsXpath>;
  @useResult
  $Res call({
    String? position,
    String title,
    String url,
    String popularity,
    String? imageUrl,
    String? parameter,
  });
}

/// @nodoc
class _$NewsXpathCopyWithImpl<$Res, $Val extends NewsXpath>
    implements $NewsXpathCopyWith<$Res> {
  _$NewsXpathCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of NewsXpath
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? position = freezed,
    Object? title = null,
    Object? url = null,
    Object? popularity = null,
    Object? imageUrl = freezed,
    Object? parameter = freezed,
  }) {
    return _then(
      _value.copyWith(
            position:
                freezed == position
                    ? _value.position
                    : position // ignore: cast_nullable_to_non_nullable
                        as String?,
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
            popularity:
                null == popularity
                    ? _value.popularity
                    : popularity // ignore: cast_nullable_to_non_nullable
                        as String,
            imageUrl:
                freezed == imageUrl
                    ? _value.imageUrl
                    : imageUrl // ignore: cast_nullable_to_non_nullable
                        as String?,
            parameter:
                freezed == parameter
                    ? _value.parameter
                    : parameter // ignore: cast_nullable_to_non_nullable
                        as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$NewsXpathImplCopyWith<$Res>
    implements $NewsXpathCopyWith<$Res> {
  factory _$$NewsXpathImplCopyWith(
    _$NewsXpathImpl value,
    $Res Function(_$NewsXpathImpl) then,
  ) = __$$NewsXpathImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String? position,
    String title,
    String url,
    String popularity,
    String? imageUrl,
    String? parameter,
  });
}

/// @nodoc
class __$$NewsXpathImplCopyWithImpl<$Res>
    extends _$NewsXpathCopyWithImpl<$Res, _$NewsXpathImpl>
    implements _$$NewsXpathImplCopyWith<$Res> {
  __$$NewsXpathImplCopyWithImpl(
    _$NewsXpathImpl _value,
    $Res Function(_$NewsXpathImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of NewsXpath
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? position = freezed,
    Object? title = null,
    Object? url = null,
    Object? popularity = null,
    Object? imageUrl = freezed,
    Object? parameter = freezed,
  }) {
    return _then(
      _$NewsXpathImpl(
        position:
            freezed == position
                ? _value.position
                : position // ignore: cast_nullable_to_non_nullable
                    as String?,
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
        popularity:
            null == popularity
                ? _value.popularity
                : popularity // ignore: cast_nullable_to_non_nullable
                    as String,
        imageUrl:
            freezed == imageUrl
                ? _value.imageUrl
                : imageUrl // ignore: cast_nullable_to_non_nullable
                    as String?,
        parameter:
            freezed == parameter
                ? _value.parameter
                : parameter // ignore: cast_nullable_to_non_nullable
                    as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$NewsXpathImpl implements _NewsXpath {
  const _$NewsXpathImpl({
    required this.position,
    required this.title,
    required this.url,
    required this.popularity,
    required this.imageUrl,
    required this.parameter,
  });

  factory _$NewsXpathImpl.fromJson(Map<String, dynamic> json) =>
      _$$NewsXpathImplFromJson(json);

  @override
  final String? position;
  @override
  final String title;
  @override
  final String url;
  @override
  final String popularity;
  @override
  final String? imageUrl;
  @override
  final String? parameter;

  @override
  String toString() {
    return 'NewsXpath(position: $position, title: $title, url: $url, popularity: $popularity, imageUrl: $imageUrl, parameter: $parameter)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NewsXpathImpl &&
            (identical(other.position, position) ||
                other.position == position) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.url, url) || other.url == url) &&
            (identical(other.popularity, popularity) ||
                other.popularity == popularity) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl) &&
            (identical(other.parameter, parameter) ||
                other.parameter == parameter));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    position,
    title,
    url,
    popularity,
    imageUrl,
    parameter,
  );

  /// Create a copy of NewsXpath
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$NewsXpathImplCopyWith<_$NewsXpathImpl> get copyWith =>
      __$$NewsXpathImplCopyWithImpl<_$NewsXpathImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$NewsXpathImplToJson(this);
  }
}

abstract class _NewsXpath implements NewsXpath {
  const factory _NewsXpath({
    required final String? position,
    required final String title,
    required final String url,
    required final String popularity,
    required final String? imageUrl,
    required final String? parameter,
  }) = _$NewsXpathImpl;

  factory _NewsXpath.fromJson(Map<String, dynamic> json) =
      _$NewsXpathImpl.fromJson;

  @override
  String? get position;
  @override
  String get title;
  @override
  String get url;
  @override
  String get popularity;
  @override
  String? get imageUrl;
  @override
  String? get parameter;

  /// Create a copy of NewsXpath
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$NewsXpathImplCopyWith<_$NewsXpathImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
