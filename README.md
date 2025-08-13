# flnews--新闻聚合应用 简介

## 简介

这是一个基于[Flutter](https://flutter.cn/)框架的新闻聚合应用。应用使用[XPath](https://baike.baidu.com/item/XPath/5574064)获取多个网站热门信息。灵感来源：[nowinnews](https://github.com/QCuncle/nowinnews)。

* [X] 获取主流网站热榜新闻
* [X] 沉浸式浏览（隐藏导航栏）
* [X] 支持国际化（中英文）
* [X] 深色模式切换
* [X] 多种主题可选
* [X] 自定义热榜显示条数
* [X] 自定义字体大小
* [X] 重置订阅配置
* [ ] 查看新闻详情
* [ ] 查看站点更多新闻
* [ ] 搜索订阅站点新闻
* [ ] 自动开启WebView

## 项目目录介绍

```cmd
lib
│   main.dart
│
├───config
│       assets.dart
│       dependencies.dart
│
├───data
│   ├───repositories
│   │   ├───site
│   │   │       default_xpath_processor.dart
│   │   │       site_repository.dart
│   │   │
│   │   └───site_config
│   │           site_config_repository.dart
│   │
│   └───services
│       ├───api
│       │       api_client_service.dart
│       │
│       └───local
│           │   local_database_service.dart
│           │
│           └───database
│               ├───connection
│               │       native.dart
│               │
│               ├───db
│               │       database.dart
│               │       database.g.dart
│               │
│               └───tables
│                       sites_config_table.dart
│                       sites_table.dart
│
├───domain
│   ├───models
│   │   ├───news
│   │   │       news.dart
│   │   │       news.freezed.dart
│   │   │       news.g.dart
│   │   │
│   │   ├───news_xpath
│   │   │       news_xpath.dart
│   │   │       news_xpath.freezed.dart
│   │   │       news_xpath.g.dart
│   │   │
│   │   ├───site
│   │   │       site.dart
│   │   │       site.freezed.dart
│   │   │       site.g.dart
│   │   │
│   │   └───site_config
│   │           site_config.dart
│   │           site_config.freezed.dart
│   │           site_config.g.dart
│   │
│   └───use_cases
├───global
│   │   states.dart
│   │
│   └───variable
│       │   global.dart
│       │
│       └───profile_model
│               profile.dart
│               profile.g.dart
│
├───routing
│       router.dart
│       routes.dart
│
├───ui
│   │   scaffold.dart
│   │   scaffold_viewmodel.dart
│   │
│   ├───core
│   │   ├───l10n
│   │   │       app_en.arb
│   │   │       app_localizations.dart
│   │   │       app_localizations_en.dart
│   │   │       app_localizations_zh.dart
│   │   │       app_zh.arb
│   │   │
│   │   ├───themes
│   │   │       themes.dart
│   │   │
│   │   └───ui
│   │           bottom_bar.dart
│   │           top_bar.dart
│   │
│   ├───hot
│   │   ├───view_models
│   │   │       hot_viewmodel.dart
│   │   │
│   │   └───widgets
│   │           hot_screen.dart
│   │           news_card.dart
│   │
│   ├───settings
│   │   ├───view_models
│   │   │       settings_viewmodel.dart
│   │   │
│   │   └───widgets
│   │           about_dialog.dart
│   │           dark_mode_dialog.dart
│   │           font_size_dialog.dart
│   │           hot_counts_dialog.dart
│   │           locale_dialog.dart
│   │           restore_dialog.dart
│   │           settings_screen.dart
│   │           theme_dialog.dart
│   │           update_dialog.dart
│   │
│   └───subscribe
│       ├───view_models
│       │       subscribe_viewmodel.dart
│       │
│       └───widgets
│               subscribe_screen.dart
│
└───utils
        command.dart
        result.dart
```

* **config/**

  * assets.dart里存放资源文件路径。
  * dependencies.dart里注入项目依赖，比如数据层仓库和服务，以及数据库类和全局状态类。
* **data/**

  * 数据层包括仓库和服务。
  * 应用包括两个仓库，`site`仓库和 `site_config`仓库。前者负责从本地（数据库）或api服务获取并处理网站原始新闻数据并向ui层暴露获取处理后新闻的接口，后者负责从本地（数据库）服务获取网站设置信息。这两个仓库同时还提供有限的修改本地数据库的能力。
  * 应用包括api服务和本地服务。api服务从网站获取html文件，可以由仓库调用后解析其新闻数据；本地服务包括一个[drift](https://drift.simonbinder.eu/)数据库和操作数据库的接口。
* **domain/**

  * 领域层包括应用数据模型和用例。
  * 应用数据模型有新闻、新闻在html中的XPath、网站、网站设置。网站数据模型包括新闻和其他数据，网站设置数据模型包括新闻在html中的XPath和其他数据。应用使用网站数据模型为热榜页面提供数据模版，使用网站设置数据模型为订阅页面提供数据模版。
  * 用例在应用中暂未使用。
* **global/**

  * 包括全局变量和全局状态。
  * 全局变量和全局状态都可以在应用任何位置调用，但是前者的改变不会引起ui重绘，后者的改变会引起ui重绘。
* **routing/**

  * 应用路由信息，包括定义路由名称和创建路由。
* **ui/**

  * ui层包含各个页面的view和viewmodel，以及主题、国际化、通用组件，还包括应用的自定义框架。
* **utils/**

  * 存放有关命令模式的工具。
* **main.dart**

  * 应用主文件，包含全局变量初始化、主题配置、本地化配置。
