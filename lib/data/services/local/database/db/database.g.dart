// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
class $SitesTableTable extends SitesTable
    with TableInfo<$SitesTableTable, SitesTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $SitesTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _iconUrlMeta = const VerificationMeta(
    'iconUrl',
  );
  @override
  late final GeneratedColumn<String> iconUrl = GeneratedColumn<String>(
    'icon_url',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _updateTimeMeta = const VerificationMeta(
    'updateTime',
  );
  @override
  late final GeneratedColumn<DateTime> updateTime = GeneratedColumn<DateTime>(
    'update_time',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  @override
  late final GeneratedColumnWithTypeConverter<List<News>, String> news =
      GeneratedColumn<String>(
        'news',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: true,
      ).withConverter<List<News>>($SitesTableTable.$converternews);
  @override
  List<GeneratedColumn> get $columns => [id, name, iconUrl, updateTime, news];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'sites_table';
  @override
  VerificationContext validateIntegrity(
    Insertable<SitesTableData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('icon_url')) {
      context.handle(
        _iconUrlMeta,
        iconUrl.isAcceptableOrUnknown(data['icon_url']!, _iconUrlMeta),
      );
    } else if (isInserting) {
      context.missing(_iconUrlMeta);
    }
    if (data.containsKey('update_time')) {
      context.handle(
        _updateTimeMeta,
        updateTime.isAcceptableOrUnknown(data['update_time']!, _updateTimeMeta),
      );
    } else if (isInserting) {
      context.missing(_updateTimeMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  SitesTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return SitesTableData(
      id:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}id'],
          )!,
      name:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}name'],
          )!,
      iconUrl:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}icon_url'],
          )!,
      updateTime:
          attachedDatabase.typeMapping.read(
            DriftSqlType.dateTime,
            data['${effectivePrefix}update_time'],
          )!,
      news: $SitesTableTable.$converternews.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}news'],
        )!,
      ),
    );
  }

  @override
  $SitesTableTable createAlias(String alias) {
    return $SitesTableTable(attachedDatabase, alias);
  }

  static TypeConverter<List<News>, String> $converternews =
      const NewsListConverter();
}

class SitesTableData extends DataClass implements Insertable<SitesTableData> {
  final int id;
  final String name;
  final String iconUrl;
  final DateTime updateTime;
  final List<News> news;
  const SitesTableData({
    required this.id,
    required this.name,
    required this.iconUrl,
    required this.updateTime,
    required this.news,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    map['icon_url'] = Variable<String>(iconUrl);
    map['update_time'] = Variable<DateTime>(updateTime);
    {
      map['news'] = Variable<String>(
        $SitesTableTable.$converternews.toSql(news),
      );
    }
    return map;
  }

  SitesTableCompanion toCompanion(bool nullToAbsent) {
    return SitesTableCompanion(
      id: Value(id),
      name: Value(name),
      iconUrl: Value(iconUrl),
      updateTime: Value(updateTime),
      news: Value(news),
    );
  }

  factory SitesTableData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return SitesTableData(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      iconUrl: serializer.fromJson<String>(json['iconUrl']),
      updateTime: serializer.fromJson<DateTime>(json['updateTime']),
      news: serializer.fromJson<List<News>>(json['news']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'iconUrl': serializer.toJson<String>(iconUrl),
      'updateTime': serializer.toJson<DateTime>(updateTime),
      'news': serializer.toJson<List<News>>(news),
    };
  }

  SitesTableData copyWith({
    int? id,
    String? name,
    String? iconUrl,
    DateTime? updateTime,
    List<News>? news,
  }) => SitesTableData(
    id: id ?? this.id,
    name: name ?? this.name,
    iconUrl: iconUrl ?? this.iconUrl,
    updateTime: updateTime ?? this.updateTime,
    news: news ?? this.news,
  );
  SitesTableData copyWithCompanion(SitesTableCompanion data) {
    return SitesTableData(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      iconUrl: data.iconUrl.present ? data.iconUrl.value : this.iconUrl,
      updateTime:
          data.updateTime.present ? data.updateTime.value : this.updateTime,
      news: data.news.present ? data.news.value : this.news,
    );
  }

  @override
  String toString() {
    return (StringBuffer('SitesTableData(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('iconUrl: $iconUrl, ')
          ..write('updateTime: $updateTime, ')
          ..write('news: $news')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, iconUrl, updateTime, news);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is SitesTableData &&
          other.id == this.id &&
          other.name == this.name &&
          other.iconUrl == this.iconUrl &&
          other.updateTime == this.updateTime &&
          other.news == this.news);
}

class SitesTableCompanion extends UpdateCompanion<SitesTableData> {
  final Value<int> id;
  final Value<String> name;
  final Value<String> iconUrl;
  final Value<DateTime> updateTime;
  final Value<List<News>> news;
  const SitesTableCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.iconUrl = const Value.absent(),
    this.updateTime = const Value.absent(),
    this.news = const Value.absent(),
  });
  SitesTableCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    required String iconUrl,
    required DateTime updateTime,
    required List<News> news,
  }) : name = Value(name),
       iconUrl = Value(iconUrl),
       updateTime = Value(updateTime),
       news = Value(news);
  static Insertable<SitesTableData> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<String>? iconUrl,
    Expression<DateTime>? updateTime,
    Expression<String>? news,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (iconUrl != null) 'icon_url': iconUrl,
      if (updateTime != null) 'update_time': updateTime,
      if (news != null) 'news': news,
    });
  }

  SitesTableCompanion copyWith({
    Value<int>? id,
    Value<String>? name,
    Value<String>? iconUrl,
    Value<DateTime>? updateTime,
    Value<List<News>>? news,
  }) {
    return SitesTableCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      iconUrl: iconUrl ?? this.iconUrl,
      updateTime: updateTime ?? this.updateTime,
      news: news ?? this.news,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (iconUrl.present) {
      map['icon_url'] = Variable<String>(iconUrl.value);
    }
    if (updateTime.present) {
      map['update_time'] = Variable<DateTime>(updateTime.value);
    }
    if (news.present) {
      map['news'] = Variable<String>(
        $SitesTableTable.$converternews.toSql(news.value),
      );
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SitesTableCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('iconUrl: $iconUrl, ')
          ..write('updateTime: $updateTime, ')
          ..write('news: $news')
          ..write(')'))
        .toString();
  }
}

class $SitesConfigTableTable extends SitesConfigTable
    with TableInfo<$SitesConfigTableTable, SitesConfigTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $SitesConfigTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _sortMeta = const VerificationMeta('sort');
  @override
  late final GeneratedColumn<int> sort = GeneratedColumn<int>(
    'sort',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _hostMeta = const VerificationMeta('host');
  @override
  late final GeneratedColumn<String> host = GeneratedColumn<String>(
    'host',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _isSubscribedMeta = const VerificationMeta(
    'isSubscribed',
  );
  @override
  late final GeneratedColumn<bool> isSubscribed = GeneratedColumn<bool>(
    'is_subscribed',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_subscribed" IN (0, 1))',
    ),
  );
  static const VerificationMeta _delayMeta = const VerificationMeta('delay');
  @override
  late final GeneratedColumn<int> delay = GeneratedColumn<int>(
    'delay',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _urlMeta = const VerificationMeta('url');
  @override
  late final GeneratedColumn<String> url = GeneratedColumn<String>(
    'url',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _iconUrlMeta = const VerificationMeta(
    'iconUrl',
  );
  @override
  late final GeneratedColumn<String> iconUrl = GeneratedColumn<String>(
    'icon_url',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  late final GeneratedColumnWithTypeConverter<NewsXpath, String> newsXpath =
      GeneratedColumn<String>(
        'news_xpath',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: true,
      ).withConverter<NewsXpath>($SitesConfigTableTable.$converternewsXpath);
  @override
  List<GeneratedColumn> get $columns => [
    id,
    sort,
    name,
    host,
    isSubscribed,
    delay,
    url,
    iconUrl,
    newsXpath,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'sites_config_table';
  @override
  VerificationContext validateIntegrity(
    Insertable<SitesConfigTableData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('sort')) {
      context.handle(
        _sortMeta,
        sort.isAcceptableOrUnknown(data['sort']!, _sortMeta),
      );
    } else if (isInserting) {
      context.missing(_sortMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('host')) {
      context.handle(
        _hostMeta,
        host.isAcceptableOrUnknown(data['host']!, _hostMeta),
      );
    } else if (isInserting) {
      context.missing(_hostMeta);
    }
    if (data.containsKey('is_subscribed')) {
      context.handle(
        _isSubscribedMeta,
        isSubscribed.isAcceptableOrUnknown(
          data['is_subscribed']!,
          _isSubscribedMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_isSubscribedMeta);
    }
    if (data.containsKey('delay')) {
      context.handle(
        _delayMeta,
        delay.isAcceptableOrUnknown(data['delay']!, _delayMeta),
      );
    } else if (isInserting) {
      context.missing(_delayMeta);
    }
    if (data.containsKey('url')) {
      context.handle(
        _urlMeta,
        url.isAcceptableOrUnknown(data['url']!, _urlMeta),
      );
    } else if (isInserting) {
      context.missing(_urlMeta);
    }
    if (data.containsKey('icon_url')) {
      context.handle(
        _iconUrlMeta,
        iconUrl.isAcceptableOrUnknown(data['icon_url']!, _iconUrlMeta),
      );
    } else if (isInserting) {
      context.missing(_iconUrlMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  SitesConfigTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return SitesConfigTableData(
      id:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}id'],
          )!,
      sort:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}sort'],
          )!,
      name:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}name'],
          )!,
      host:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}host'],
          )!,
      isSubscribed:
          attachedDatabase.typeMapping.read(
            DriftSqlType.bool,
            data['${effectivePrefix}is_subscribed'],
          )!,
      delay:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}delay'],
          )!,
      url:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}url'],
          )!,
      iconUrl:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}icon_url'],
          )!,
      newsXpath: $SitesConfigTableTable.$converternewsXpath.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}news_xpath'],
        )!,
      ),
    );
  }

  @override
  $SitesConfigTableTable createAlias(String alias) {
    return $SitesConfigTableTable(attachedDatabase, alias);
  }

  static TypeConverter<NewsXpath, String> $converternewsXpath =
      const NewsXpathConverter();
}

class SitesConfigTableData extends DataClass
    implements Insertable<SitesConfigTableData> {
  final int id;
  final int sort;
  final String name;
  final String host;
  final bool isSubscribed;
  final int delay;
  final String url;
  final String iconUrl;
  final NewsXpath newsXpath;
  const SitesConfigTableData({
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
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['sort'] = Variable<int>(sort);
    map['name'] = Variable<String>(name);
    map['host'] = Variable<String>(host);
    map['is_subscribed'] = Variable<bool>(isSubscribed);
    map['delay'] = Variable<int>(delay);
    map['url'] = Variable<String>(url);
    map['icon_url'] = Variable<String>(iconUrl);
    {
      map['news_xpath'] = Variable<String>(
        $SitesConfigTableTable.$converternewsXpath.toSql(newsXpath),
      );
    }
    return map;
  }

  SitesConfigTableCompanion toCompanion(bool nullToAbsent) {
    return SitesConfigTableCompanion(
      id: Value(id),
      sort: Value(sort),
      name: Value(name),
      host: Value(host),
      isSubscribed: Value(isSubscribed),
      delay: Value(delay),
      url: Value(url),
      iconUrl: Value(iconUrl),
      newsXpath: Value(newsXpath),
    );
  }

  factory SitesConfigTableData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return SitesConfigTableData(
      id: serializer.fromJson<int>(json['id']),
      sort: serializer.fromJson<int>(json['sort']),
      name: serializer.fromJson<String>(json['name']),
      host: serializer.fromJson<String>(json['host']),
      isSubscribed: serializer.fromJson<bool>(json['isSubscribed']),
      delay: serializer.fromJson<int>(json['delay']),
      url: serializer.fromJson<String>(json['url']),
      iconUrl: serializer.fromJson<String>(json['iconUrl']),
      newsXpath: serializer.fromJson<NewsXpath>(json['newsXpath']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'sort': serializer.toJson<int>(sort),
      'name': serializer.toJson<String>(name),
      'host': serializer.toJson<String>(host),
      'isSubscribed': serializer.toJson<bool>(isSubscribed),
      'delay': serializer.toJson<int>(delay),
      'url': serializer.toJson<String>(url),
      'iconUrl': serializer.toJson<String>(iconUrl),
      'newsXpath': serializer.toJson<NewsXpath>(newsXpath),
    };
  }

  SitesConfigTableData copyWith({
    int? id,
    int? sort,
    String? name,
    String? host,
    bool? isSubscribed,
    int? delay,
    String? url,
    String? iconUrl,
    NewsXpath? newsXpath,
  }) => SitesConfigTableData(
    id: id ?? this.id,
    sort: sort ?? this.sort,
    name: name ?? this.name,
    host: host ?? this.host,
    isSubscribed: isSubscribed ?? this.isSubscribed,
    delay: delay ?? this.delay,
    url: url ?? this.url,
    iconUrl: iconUrl ?? this.iconUrl,
    newsXpath: newsXpath ?? this.newsXpath,
  );
  SitesConfigTableData copyWithCompanion(SitesConfigTableCompanion data) {
    return SitesConfigTableData(
      id: data.id.present ? data.id.value : this.id,
      sort: data.sort.present ? data.sort.value : this.sort,
      name: data.name.present ? data.name.value : this.name,
      host: data.host.present ? data.host.value : this.host,
      isSubscribed:
          data.isSubscribed.present
              ? data.isSubscribed.value
              : this.isSubscribed,
      delay: data.delay.present ? data.delay.value : this.delay,
      url: data.url.present ? data.url.value : this.url,
      iconUrl: data.iconUrl.present ? data.iconUrl.value : this.iconUrl,
      newsXpath: data.newsXpath.present ? data.newsXpath.value : this.newsXpath,
    );
  }

  @override
  String toString() {
    return (StringBuffer('SitesConfigTableData(')
          ..write('id: $id, ')
          ..write('sort: $sort, ')
          ..write('name: $name, ')
          ..write('host: $host, ')
          ..write('isSubscribed: $isSubscribed, ')
          ..write('delay: $delay, ')
          ..write('url: $url, ')
          ..write('iconUrl: $iconUrl, ')
          ..write('newsXpath: $newsXpath')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
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
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is SitesConfigTableData &&
          other.id == this.id &&
          other.sort == this.sort &&
          other.name == this.name &&
          other.host == this.host &&
          other.isSubscribed == this.isSubscribed &&
          other.delay == this.delay &&
          other.url == this.url &&
          other.iconUrl == this.iconUrl &&
          other.newsXpath == this.newsXpath);
}

class SitesConfigTableCompanion extends UpdateCompanion<SitesConfigTableData> {
  final Value<int> id;
  final Value<int> sort;
  final Value<String> name;
  final Value<String> host;
  final Value<bool> isSubscribed;
  final Value<int> delay;
  final Value<String> url;
  final Value<String> iconUrl;
  final Value<NewsXpath> newsXpath;
  const SitesConfigTableCompanion({
    this.id = const Value.absent(),
    this.sort = const Value.absent(),
    this.name = const Value.absent(),
    this.host = const Value.absent(),
    this.isSubscribed = const Value.absent(),
    this.delay = const Value.absent(),
    this.url = const Value.absent(),
    this.iconUrl = const Value.absent(),
    this.newsXpath = const Value.absent(),
  });
  SitesConfigTableCompanion.insert({
    this.id = const Value.absent(),
    required int sort,
    required String name,
    required String host,
    required bool isSubscribed,
    required int delay,
    required String url,
    required String iconUrl,
    required NewsXpath newsXpath,
  }) : sort = Value(sort),
       name = Value(name),
       host = Value(host),
       isSubscribed = Value(isSubscribed),
       delay = Value(delay),
       url = Value(url),
       iconUrl = Value(iconUrl),
       newsXpath = Value(newsXpath);
  static Insertable<SitesConfigTableData> custom({
    Expression<int>? id,
    Expression<int>? sort,
    Expression<String>? name,
    Expression<String>? host,
    Expression<bool>? isSubscribed,
    Expression<int>? delay,
    Expression<String>? url,
    Expression<String>? iconUrl,
    Expression<String>? newsXpath,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (sort != null) 'sort': sort,
      if (name != null) 'name': name,
      if (host != null) 'host': host,
      if (isSubscribed != null) 'is_subscribed': isSubscribed,
      if (delay != null) 'delay': delay,
      if (url != null) 'url': url,
      if (iconUrl != null) 'icon_url': iconUrl,
      if (newsXpath != null) 'news_xpath': newsXpath,
    });
  }

  SitesConfigTableCompanion copyWith({
    Value<int>? id,
    Value<int>? sort,
    Value<String>? name,
    Value<String>? host,
    Value<bool>? isSubscribed,
    Value<int>? delay,
    Value<String>? url,
    Value<String>? iconUrl,
    Value<NewsXpath>? newsXpath,
  }) {
    return SitesConfigTableCompanion(
      id: id ?? this.id,
      sort: sort ?? this.sort,
      name: name ?? this.name,
      host: host ?? this.host,
      isSubscribed: isSubscribed ?? this.isSubscribed,
      delay: delay ?? this.delay,
      url: url ?? this.url,
      iconUrl: iconUrl ?? this.iconUrl,
      newsXpath: newsXpath ?? this.newsXpath,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (sort.present) {
      map['sort'] = Variable<int>(sort.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (host.present) {
      map['host'] = Variable<String>(host.value);
    }
    if (isSubscribed.present) {
      map['is_subscribed'] = Variable<bool>(isSubscribed.value);
    }
    if (delay.present) {
      map['delay'] = Variable<int>(delay.value);
    }
    if (url.present) {
      map['url'] = Variable<String>(url.value);
    }
    if (iconUrl.present) {
      map['icon_url'] = Variable<String>(iconUrl.value);
    }
    if (newsXpath.present) {
      map['news_xpath'] = Variable<String>(
        $SitesConfigTableTable.$converternewsXpath.toSql(newsXpath.value),
      );
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SitesConfigTableCompanion(')
          ..write('id: $id, ')
          ..write('sort: $sort, ')
          ..write('name: $name, ')
          ..write('host: $host, ')
          ..write('isSubscribed: $isSubscribed, ')
          ..write('delay: $delay, ')
          ..write('url: $url, ')
          ..write('iconUrl: $iconUrl, ')
          ..write('newsXpath: $newsXpath')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $SitesTableTable sitesTable = $SitesTableTable(this);
  late final $SitesConfigTableTable sitesConfigTable = $SitesConfigTableTable(
    this,
  );
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    sitesTable,
    sitesConfigTable,
  ];
}

typedef $$SitesTableTableCreateCompanionBuilder =
    SitesTableCompanion Function({
      Value<int> id,
      required String name,
      required String iconUrl,
      required DateTime updateTime,
      required List<News> news,
    });
typedef $$SitesTableTableUpdateCompanionBuilder =
    SitesTableCompanion Function({
      Value<int> id,
      Value<String> name,
      Value<String> iconUrl,
      Value<DateTime> updateTime,
      Value<List<News>> news,
    });

class $$SitesTableTableFilterComposer
    extends Composer<_$AppDatabase, $SitesTableTable> {
  $$SitesTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get iconUrl => $composableBuilder(
    column: $table.iconUrl,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updateTime => $composableBuilder(
    column: $table.updateTime,
    builder: (column) => ColumnFilters(column),
  );

  ColumnWithTypeConverterFilters<List<News>, List<News>, String> get news =>
      $composableBuilder(
        column: $table.news,
        builder: (column) => ColumnWithTypeConverterFilters(column),
      );
}

class $$SitesTableTableOrderingComposer
    extends Composer<_$AppDatabase, $SitesTableTable> {
  $$SitesTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get iconUrl => $composableBuilder(
    column: $table.iconUrl,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updateTime => $composableBuilder(
    column: $table.updateTime,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get news => $composableBuilder(
    column: $table.news,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$SitesTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $SitesTableTable> {
  $$SitesTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get iconUrl =>
      $composableBuilder(column: $table.iconUrl, builder: (column) => column);

  GeneratedColumn<DateTime> get updateTime => $composableBuilder(
    column: $table.updateTime,
    builder: (column) => column,
  );

  GeneratedColumnWithTypeConverter<List<News>, String> get news =>
      $composableBuilder(column: $table.news, builder: (column) => column);
}

class $$SitesTableTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $SitesTableTable,
          SitesTableData,
          $$SitesTableTableFilterComposer,
          $$SitesTableTableOrderingComposer,
          $$SitesTableTableAnnotationComposer,
          $$SitesTableTableCreateCompanionBuilder,
          $$SitesTableTableUpdateCompanionBuilder,
          (
            SitesTableData,
            BaseReferences<_$AppDatabase, $SitesTableTable, SitesTableData>,
          ),
          SitesTableData,
          PrefetchHooks Function()
        > {
  $$SitesTableTableTableManager(_$AppDatabase db, $SitesTableTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer:
              () => $$SitesTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer:
              () => $$SitesTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer:
              () => $$SitesTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String> iconUrl = const Value.absent(),
                Value<DateTime> updateTime = const Value.absent(),
                Value<List<News>> news = const Value.absent(),
              }) => SitesTableCompanion(
                id: id,
                name: name,
                iconUrl: iconUrl,
                updateTime: updateTime,
                news: news,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String name,
                required String iconUrl,
                required DateTime updateTime,
                required List<News> news,
              }) => SitesTableCompanion.insert(
                id: id,
                name: name,
                iconUrl: iconUrl,
                updateTime: updateTime,
                news: news,
              ),
          withReferenceMapper:
              (p0) =>
                  p0
                      .map(
                        (e) => (
                          e.readTable(table),
                          BaseReferences(db, table, e),
                        ),
                      )
                      .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$SitesTableTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $SitesTableTable,
      SitesTableData,
      $$SitesTableTableFilterComposer,
      $$SitesTableTableOrderingComposer,
      $$SitesTableTableAnnotationComposer,
      $$SitesTableTableCreateCompanionBuilder,
      $$SitesTableTableUpdateCompanionBuilder,
      (
        SitesTableData,
        BaseReferences<_$AppDatabase, $SitesTableTable, SitesTableData>,
      ),
      SitesTableData,
      PrefetchHooks Function()
    >;
typedef $$SitesConfigTableTableCreateCompanionBuilder =
    SitesConfigTableCompanion Function({
      Value<int> id,
      required int sort,
      required String name,
      required String host,
      required bool isSubscribed,
      required int delay,
      required String url,
      required String iconUrl,
      required NewsXpath newsXpath,
    });
typedef $$SitesConfigTableTableUpdateCompanionBuilder =
    SitesConfigTableCompanion Function({
      Value<int> id,
      Value<int> sort,
      Value<String> name,
      Value<String> host,
      Value<bool> isSubscribed,
      Value<int> delay,
      Value<String> url,
      Value<String> iconUrl,
      Value<NewsXpath> newsXpath,
    });

class $$SitesConfigTableTableFilterComposer
    extends Composer<_$AppDatabase, $SitesConfigTableTable> {
  $$SitesConfigTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get sort => $composableBuilder(
    column: $table.sort,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get host => $composableBuilder(
    column: $table.host,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isSubscribed => $composableBuilder(
    column: $table.isSubscribed,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get delay => $composableBuilder(
    column: $table.delay,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get url => $composableBuilder(
    column: $table.url,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get iconUrl => $composableBuilder(
    column: $table.iconUrl,
    builder: (column) => ColumnFilters(column),
  );

  ColumnWithTypeConverterFilters<NewsXpath, NewsXpath, String> get newsXpath =>
      $composableBuilder(
        column: $table.newsXpath,
        builder: (column) => ColumnWithTypeConverterFilters(column),
      );
}

class $$SitesConfigTableTableOrderingComposer
    extends Composer<_$AppDatabase, $SitesConfigTableTable> {
  $$SitesConfigTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get sort => $composableBuilder(
    column: $table.sort,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get host => $composableBuilder(
    column: $table.host,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isSubscribed => $composableBuilder(
    column: $table.isSubscribed,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get delay => $composableBuilder(
    column: $table.delay,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get url => $composableBuilder(
    column: $table.url,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get iconUrl => $composableBuilder(
    column: $table.iconUrl,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get newsXpath => $composableBuilder(
    column: $table.newsXpath,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$SitesConfigTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $SitesConfigTableTable> {
  $$SitesConfigTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get sort =>
      $composableBuilder(column: $table.sort, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get host =>
      $composableBuilder(column: $table.host, builder: (column) => column);

  GeneratedColumn<bool> get isSubscribed => $composableBuilder(
    column: $table.isSubscribed,
    builder: (column) => column,
  );

  GeneratedColumn<int> get delay =>
      $composableBuilder(column: $table.delay, builder: (column) => column);

  GeneratedColumn<String> get url =>
      $composableBuilder(column: $table.url, builder: (column) => column);

  GeneratedColumn<String> get iconUrl =>
      $composableBuilder(column: $table.iconUrl, builder: (column) => column);

  GeneratedColumnWithTypeConverter<NewsXpath, String> get newsXpath =>
      $composableBuilder(column: $table.newsXpath, builder: (column) => column);
}

class $$SitesConfigTableTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $SitesConfigTableTable,
          SitesConfigTableData,
          $$SitesConfigTableTableFilterComposer,
          $$SitesConfigTableTableOrderingComposer,
          $$SitesConfigTableTableAnnotationComposer,
          $$SitesConfigTableTableCreateCompanionBuilder,
          $$SitesConfigTableTableUpdateCompanionBuilder,
          (
            SitesConfigTableData,
            BaseReferences<
              _$AppDatabase,
              $SitesConfigTableTable,
              SitesConfigTableData
            >,
          ),
          SitesConfigTableData,
          PrefetchHooks Function()
        > {
  $$SitesConfigTableTableTableManager(
    _$AppDatabase db,
    $SitesConfigTableTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer:
              () =>
                  $$SitesConfigTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer:
              () => $$SitesConfigTableTableOrderingComposer(
                $db: db,
                $table: table,
              ),
          createComputedFieldComposer:
              () => $$SitesConfigTableTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> sort = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String> host = const Value.absent(),
                Value<bool> isSubscribed = const Value.absent(),
                Value<int> delay = const Value.absent(),
                Value<String> url = const Value.absent(),
                Value<String> iconUrl = const Value.absent(),
                Value<NewsXpath> newsXpath = const Value.absent(),
              }) => SitesConfigTableCompanion(
                id: id,
                sort: sort,
                name: name,
                host: host,
                isSubscribed: isSubscribed,
                delay: delay,
                url: url,
                iconUrl: iconUrl,
                newsXpath: newsXpath,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int sort,
                required String name,
                required String host,
                required bool isSubscribed,
                required int delay,
                required String url,
                required String iconUrl,
                required NewsXpath newsXpath,
              }) => SitesConfigTableCompanion.insert(
                id: id,
                sort: sort,
                name: name,
                host: host,
                isSubscribed: isSubscribed,
                delay: delay,
                url: url,
                iconUrl: iconUrl,
                newsXpath: newsXpath,
              ),
          withReferenceMapper:
              (p0) =>
                  p0
                      .map(
                        (e) => (
                          e.readTable(table),
                          BaseReferences(db, table, e),
                        ),
                      )
                      .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$SitesConfigTableTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $SitesConfigTableTable,
      SitesConfigTableData,
      $$SitesConfigTableTableFilterComposer,
      $$SitesConfigTableTableOrderingComposer,
      $$SitesConfigTableTableAnnotationComposer,
      $$SitesConfigTableTableCreateCompanionBuilder,
      $$SitesConfigTableTableUpdateCompanionBuilder,
      (
        SitesConfigTableData,
        BaseReferences<
          _$AppDatabase,
          $SitesConfigTableTable,
          SitesConfigTableData
        >,
      ),
      SitesConfigTableData,
      PrefetchHooks Function()
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$SitesTableTableTableManager get sitesTable =>
      $$SitesTableTableTableManager(_db, _db.sitesTable);
  $$SitesConfigTableTableTableManager get sitesConfigTable =>
      $$SitesConfigTableTableTableManager(_db, _db.sitesConfigTable);
}
