// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'site_config.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

SiteConfig _$SiteConfigFromJson(Map<String, dynamic> json) {
  return _SiteConfig.fromJson(json);
}

/// @nodoc
mixin _$SiteConfig {
  int get id => throw _privateConstructorUsedError;
  int get sort => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get host => throw _privateConstructorUsedError;
  bool get isSubscribed => throw _privateConstructorUsedError;
  int get delay => throw _privateConstructorUsedError;
  String get url => throw _privateConstructorUsedError;
  String get iconUrl => throw _privateConstructorUsedError;
  NewsXpath get newsXpath => throw _privateConstructorUsedError;

  /// Serializes this SiteConfig to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SiteConfig
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SiteConfigCopyWith<SiteConfig> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SiteConfigCopyWith<$Res> {
  factory $SiteConfigCopyWith(
    SiteConfig value,
    $Res Function(SiteConfig) then,
  ) = _$SiteConfigCopyWithImpl<$Res, SiteConfig>;
  @useResult
  $Res call({
    int id,
    int sort,
    String name,
    String host,
    bool isSubscribed,
    int delay,
    String url,
    String iconUrl,
    NewsXpath newsXpath,
  });

  $NewsXpathCopyWith<$Res> get newsXpath;
}

/// @nodoc
class _$SiteConfigCopyWithImpl<$Res, $Val extends SiteConfig>
    implements $SiteConfigCopyWith<$Res> {
  _$SiteConfigCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SiteConfig
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? sort = null,
    Object? name = null,
    Object? host = null,
    Object? isSubscribed = null,
    Object? delay = null,
    Object? url = null,
    Object? iconUrl = null,
    Object? newsXpath = null,
  }) {
    return _then(
      _value.copyWith(
            id:
                null == id
                    ? _value.id
                    : id // ignore: cast_nullable_to_non_nullable
                        as int,
            sort:
                null == sort
                    ? _value.sort
                    : sort // ignore: cast_nullable_to_non_nullable
                        as int,
            name:
                null == name
                    ? _value.name
                    : name // ignore: cast_nullable_to_non_nullable
                        as String,
            host:
                null == host
                    ? _value.host
                    : host // ignore: cast_nullable_to_non_nullable
                        as String,
            isSubscribed:
                null == isSubscribed
                    ? _value.isSubscribed
                    : isSubscribed // ignore: cast_nullable_to_non_nullable
                        as bool,
            delay:
                null == delay
                    ? _value.delay
                    : delay // ignore: cast_nullable_to_non_nullable
                        as int,
            url:
                null == url
                    ? _value.url
                    : url // ignore: cast_nullable_to_non_nullable
                        as String,
            iconUrl:
                null == iconUrl
                    ? _value.iconUrl
                    : iconUrl // ignore: cast_nullable_to_non_nullable
                        as String,
            newsXpath:
                null == newsXpath
                    ? _value.newsXpath
                    : newsXpath // ignore: cast_nullable_to_non_nullable
                        as NewsXpath,
          )
          as $Val,
    );
  }

  /// Create a copy of SiteConfig
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $NewsXpathCopyWith<$Res> get newsXpath {
    return $NewsXpathCopyWith<$Res>(_value.newsXpath, (value) {
      return _then(_value.copyWith(newsXpath: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$SiteConfigImplCopyWith<$Res>
    implements $SiteConfigCopyWith<$Res> {
  factory _$$SiteConfigImplCopyWith(
    _$SiteConfigImpl value,
    $Res Function(_$SiteConfigImpl) then,
  ) = __$$SiteConfigImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    int id,
    int sort,
    String name,
    String host,
    bool isSubscribed,
    int delay,
    String url,
    String iconUrl,
    NewsXpath newsXpath,
  });

  @override
  $NewsXpathCopyWith<$Res> get newsXpath;
}

/// @nodoc
class __$$SiteConfigImplCopyWithImpl<$Res>
    extends _$SiteConfigCopyWithImpl<$Res, _$SiteConfigImpl>
    implements _$$SiteConfigImplCopyWith<$Res> {
  __$$SiteConfigImplCopyWithImpl(
    _$SiteConfigImpl _value,
    $Res Function(_$SiteConfigImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of SiteConfig
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? sort = null,
    Object? name = null,
    Object? host = null,
    Object? isSubscribed = null,
    Object? delay = null,
    Object? url = null,
    Object? iconUrl = null,
    Object? newsXpath = null,
  }) {
    return _then(
      _$SiteConfigImpl(
        id:
            null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                    as int,
        sort:
            null == sort
                ? _value.sort
                : sort // ignore: cast_nullable_to_non_nullable
                    as int,
        name:
            null == name
                ? _value.name
                : name // ignore: cast_nullable_to_non_nullable
                    as String,
        host:
            null == host
                ? _value.host
                : host // ignore: cast_nullable_to_non_nullable
                    as String,
        isSubscribed:
            null == isSubscribed
                ? _value.isSubscribed
                : isSubscribed // ignore: cast_nullable_to_non_nullable
                    as bool,
        delay:
            null == delay
                ? _value.delay
                : delay // ignore: cast_nullable_to_non_nullable
                    as int,
        url:
            null == url
                ? _value.url
                : url // ignore: cast_nullable_to_non_nullable
                    as String,
        iconUrl:
            null == iconUrl
                ? _value.iconUrl
                : iconUrl // ignore: cast_nullable_to_non_nullable
                    as String,
        newsXpath:
            null == newsXpath
                ? _value.newsXpath
                : newsXpath // ignore: cast_nullable_to_non_nullable
                    as NewsXpath,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$SiteConfigImpl implements _SiteConfig {
  const _$SiteConfigImpl({
    required this.id,
    required this.sort,
    required this.name,
    required this.host,
    required this.isSubscribed,
    required this.delay,
    required this.url,
    required this.iconUrl,
    required this.newsXpath,
  });

  factory _$SiteConfigImpl.fromJson(Map<String, dynamic> json) =>
      _$$SiteConfigImplFromJson(json);

  @override
  final int id;
  @override
  final int sort;
  @override
  final String name;
  @override
  final String host;
  @override
  final bool isSubscribed;
  @override
  final int delay;
  @override
  final String url;
  @override
  final String iconUrl;
  @override
  final NewsXpath newsXpath;

  @override
  String toString() {
    return 'SiteConfig(id: $id, sort: $sort, name: $name, host: $host, isSubscribed: $isSubscribed, delay: $delay, url: $url, iconUrl: $iconUrl, newsXpath: $newsXpath)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SiteConfigImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.sort, sort) || other.sort == sort) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.host, host) || other.host == host) &&
            (identical(other.isSubscribed, isSubscribed) ||
                other.isSubscribed == isSubscribed) &&
            (identical(other.delay, delay) || other.delay == delay) &&
            (identical(other.url, url) || other.url == url) &&
            (identical(other.iconUrl, iconUrl) || other.iconUrl == iconUrl) &&
            (identical(other.newsXpath, newsXpath) ||
                other.newsXpath == newsXpath));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    sort,
    name,
    host,
    isSubscribed,
    delay,
    url,
    iconUrl,
    newsXpath,
  );

  /// Create a copy of SiteConfig
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SiteConfigImplCopyWith<_$SiteConfigImpl> get copyWith =>
      __$$SiteConfigImplCopyWithImpl<_$SiteConfigImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SiteConfigImplToJson(this);
  }
}

abstract class _SiteConfig implements SiteConfig {
  const factory _SiteConfig({
    required final int id,
    required final int sort,
    required final String name,
    required final String host,
    required final bool isSubscribed,
    required final int delay,
    required final String url,
    required final String iconUrl,
    required final NewsXpath newsXpath,
  }) = _$SiteConfigImpl;

  factory _SiteConfig.fromJson(Map<String, dynamic> json) =
      _$SiteConfigImpl.fromJson;

  @override
  int get id;
  @override
  int get sort;
  @override
  String get name;
  @override
  String get host;
  @override
  bool get isSubscribed;
  @override
  int get delay;
  @override
  String get url;
  @override
  String get iconUrl;
  @override
  NewsXpath get newsXpath;

  /// Create a copy of SiteConfig
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SiteConfigImplCopyWith<_$SiteConfigImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
