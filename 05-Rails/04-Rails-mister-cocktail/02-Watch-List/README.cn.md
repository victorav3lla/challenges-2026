## 背景和目标

是时候开发一个有 3 个模型的应用了！就像你猜想的那样，我们将会引入多对多关系(`N:Ns`)。那将是什么呢，为你自己创建一个观影清单 Watch List 应用。你可以创建清单，在清单里保存你喜欢的电影。

下面是我们想在应用程序中实现的**用户行为**：

- 作为一个用户，我可以看到我所有的电影列表
- 作为一个用户，我可以创建一个电影列表
- 作为一个用户，我可以看到一个电影列表的细节
- 作为一个用户，我可以在电影列表中为某部电影添加书签
- 作为一个用户，我可以删除一个书签。

**注意**电影将被直接导入数据库中，所以不需要围绕 "电影 "模型实现任何用户操作。

## 生成 Rails 应用

**注意**: 下面的步骤你应该已经熟记于心了。今天别忘了加上`-d postgresql`（下一次课你就知道为什么了）😉

```bash
cd ~/code/<user.github_nickname>
rails new rails-watch-list -d postgresql --skip-action-mailbox -T
cd rails-watch-list
```

然后我们需要为这个新的 rails 应用创建 postgresql 数据库。

```bash
rails db:create
```

让我们设置 git，在 GitHub 上创建一个仓库并推送我们初始的 APP。

```bash
git add .
git commit -m "rails new"
gh repo create --public --source=.
git push origin master
```

导入老师的 spec 来`rspec`我们的进度。

```bash
echo "gem 'rspec-rails', group: [ :test ]" >> Gemfile
echo "gem 'rails-controller-testing', group: [ :test ]" >> Gemfile
bundle install
rails db:migrate
rails db:test:prepare
git submodule add https://github.com/lewagon/fullstack-challenges-04-Rails-watch-list-specs.git spec
git add .
git commit -m "Prepare rails app with external specs"
```

你可以通过下面的命令来测试你的代码：

```bash
rails db:migrate RAILS_ENV=test  # If you added a migration
rspec spec/models                # Launch tests
```

在开始编码之前，不要忘记为前端设置 Rails 应用。就像在讲座中一样，Rails 8 默认使用 Propshaft，但 `bootstrap` gem 需要 Sprockets：

```ruby
# Gemfile

# 删除这一行：
# gem "propshaft"

# 添加这些 gems：
gem "sprockets-rails"
gem "sassc-rails"
gem "bootstrap", "~> 5.3"
gem "autoprefixer-rails"
gem "font-awesome-sass", "~> 6.1"
gem "simple_form"
```

```bash
bundle install
```

创建 Sprockets manifest 文件（Rails 8 默认没有这个文件）：

```bash
mkdir -p app/assets/config
touch app/assets/config/manifest.js
```

```js
// app/assets/config/manifest.js
//= link_tree ../images
//= link_tree ../../javascript .js
//= link_directory ../stylesheets .css
```

然后安装 `simple_form`，使用 Bootstrap 样式创建更好看的表单：

```bash
rails generate simple_form:install --bootstrap
```

然后让我们下载 Le Wagon 的样式表：

```bash
rm -rf app/assets/stylesheets
curl -L https://github.com/lewagon/rails-stylesheets/archive/master.zip > stylesheets.zip
unzip stylesheets.zip -d app/assets && rm stylesheets.zip && mv app/assets/rails-stylesheets-master app/assets/stylesheets
```

更新你的 layout 以使用正确的 stylesheet 标签：

```erb
<!-- app/views/layouts/application.html.erb -->
<!-- 替换这一行 -->
<%= stylesheet_link_tag :app, "data-turbo-track": "reload" %>
<!-- 用这一行 -->
<%= stylesheet_link_tag "application", "data-turbo-track": "reload" %>
```

现在让我们使用`importmap`导入 Bootstrap JS 库：

```bash
importmap pin bootstrap
```

在`application.js`中，添加以下行：

```js
// app/javascript/application.js
import "@popperjs/core";
import "bootstrap";
```

将 Bootstrap JS 文件添加到你的 manifest：

```js
// app/assets/config/manifest.js
//= link_tree ../images
//= link_tree ../../javascript .js
//= link_directory ../stylesheets .css
//= link popper.js
//= link bootstrap.min.js
```

最后在 `config/importmap.rb` 中：

```rb
# config/importmap.rb

# 将以下行替换为：
# pin "bootstrap" # @5.3.2
# pin "@popperjs/core", to: "@popperjs--core.js" # @2.11.8

# 使用以下内容替换：
pin "bootstrap", to: "bootstrap.min.js", preload: true
pin "@popperjs/core", to: "popper.js", preload: true
```

不要忘记经常`commit`和`push`你的代码！

## 详细说明 Specs

### 1 - 模型 Models

和你的同伴一起在[kitt.lewagon.com/db](http://kitt.lewagon.com/db)画出数据库模式。我们需要三个数据库表，  电影`movies`，  清单`lists`和   书签`bookmarks`。思考这些表之间的关系和*哪一个表将会保存引用（references）*。😉

![](https://raw.githubusercontent.com/lewagon/fullstack-images/master/rails/watch-list/db.png)

一旦你完成了数据库设计，就是时候在你的应用中实现模型了。确保使用测试和下面的规范来设置正确的属性，验证和关联。

**重要**

测试的时候，不要运行`rake`命令，而是运行:

```bash
rspec spec/models
```

这个命令只跑`spec/models`文件夹里的测试，这些测试只是关于模型的。

在继续开发练习的应用性部分之前确保这些测试都通过了（是绿色的）。

#### 属性

- 一个 **电影 movie**  有一个 **标题 title** (就像  `"神奇女侠1984"`)，一个**概况 overview** (`"在1980年代的冷战期间，《神奇女侠与苏联发生了冲突！"`)，一个 **海报图片地址 poster url** 和一个 **评分 rating** (6.9)。
- 一个 **清单 list**  有一个 **name** (就像  `"Drama"`, `"Comedy"`, `"Classic"`, `"To rewatch"`, ... )
- 一个 **书签 bookmark** 把一个电影添加到一个清单 (就像 神奇女侠 被添加到了 "女性力量" 观影清单)。所以每一个**bookmark** 通过**评论 comment**关联了一个电影和一个清单。**评论 comment** 字段用于让用户给书签 bookmark 添加一个简短的注释（就像阿兰·图灵推荐了这部电影）。

#### 验证

- 一个电影（movie）必须要有一个唯一（unique）的标题（title）。
- 一个清单（list）必须要有一个唯一的名字（name）。
- 一个书签（bookmark）必须关联一个电影（movie）和一个清单（list），而且这个组合[电影 movie, 清单 list]必须要是唯一的。
- 书签（bookmark）的（comment）字段不能少于 6 个字符。

#### 关联

- 一个清单（list）有多个书签（bookmarks）
- 一个清单（list）通过书签（bookmarks）有多个电影 movies
- 一个电影（movie）有多个书签（bookmarks）
- 一个书签（bookmark）属于一个电影 （movie）
- 一个书签（bookmark）属于一个清单（list）
- 如果一个电影（movie）被一个或一个以上的书签（bookmark）引用了，这个电影不能被删除
- 如果要删除一个清单（list），也需要删除所有关联的书签 bookmark（但是不能删除关联的电影 movies，因为这些电影可能被其它清单 list 引用）

### 2 - 初始化电影数据

**我们的应用不允许用户创建电影**。
相反，我们会生成一些固定的电影供用户选择。
就像这样：

```ruby
# db/seeds.rb
Movie.create(title: "Wonder Woman 1984", overview: "Wonder Woman comes into conflict with the Soviet Union during the Cold War in the 1980s", poster_url: "https://image.tmdb.org/t/p/original/8UlWHLMpgZm9bx6QYh0NFoq67TZ.jpg", rating: 6.9)
Movie.create(title: "The Shawshank Redemption", overview: "Framed in the 1940s for double murder, upstanding banker Andy Dufresne begins a new life at the Shawshank prison", poster_url: "https://image.tmdb.org/t/p/original/q6y0Go1tsGEsmtFryDOJo3dEmqu.jpg", rating: 8.7)
Movie.create(title: "Titanic", overview: "101-year-old Rose DeWitt Bukater tells the story of her life aboard the Titanic.", poster_url: "https://image.tmdb.org/t/p/original/9xjZS2rlVxm8SFx8kPC3aIGCOYQ.jpg", rating: 7.9)
Movie.create(title: "Ocean's Eight", overview: "Debbie Ocean, a criminal mastermind, gathers a crew of female thieves to pull off the heist of the century.", poster_url: "https://image.tmdb.org/t/p/original/MvYpKlpFukTivnlBhizGbkAe3v.jpg", rating: 7.0)
```

### 选做:

使用[faker gem](https://github.com/faker-ruby/faker)创建一些有趣的电影。

或者更好的办法是使用这个 API 接口来创建一些真实的电影[this API](https://developers.themoviedb.org/3/movies/get-top-rated-movies)(使用 ruby 的 `open-uri` 和 `json` 库)。

**API 设置**

使用这个 API 需要你注册并且生成一个 API 密钥。这个过程实在是太长了，在 Le Wagon，我们给你提供了一个访问这个 API 的**代理**。多亏了这个代理，你可以使用这个 API 而不需要生成你自己的 API 密钥。在这个练习里你要使用这个代理工具。我们信任你！

如何使用:

1. API 要求使用：`https://api.themoviedb.org/3/movie/top_rated?api_key=<你的API密钥>`
2. 你要做的是使用`https://tmdb.lewagon.com`来替换链接里的`https://api.themoviedb.org/3`
3. 在[这里](https://tmdb.lewagon.com/movie/top_rated)试一下

**电影的图片 Movie Images**

仔细阅读这篇[文章](https://developers.themoviedb.org/3/getting-started/images)来理解如何从 API 获取电影的图片。

### 3 - 清单 Lists 的路由，控制器和视图

**重要**

不要使用`rspec`命令来开发应用部分。是时候在终端里运行`rails s`了，然后在浏览器打开[http://localhost:3000/](http://localhost:3000/)。始终要这样开发：

- 从**路由 route**开始,
- 然后再是**控制器 controller**,
- 最后才开发**view 视图**，并且刷新浏览器

一个功能已经开发好了（而且前端页面看起来也很好），重复以上流程，继续开发下一个功能！

你觉得你已经完成了**整个**挑战，运行`rspec`命令确保开发的应用满足了详细说明里的所有要求。

**功能**

再次强调，要开发路由，你必须要对应用的功能有一个非常明确的认识。以下是功能列表：

- 用户可以看到所有的清单 lists

```
GET "lists"
```

- 用户可以看到一个给定清单 list 的详细信息和名称

```
GET "lists/42"
```

- 用户可以创建一个新的清单 list

```
GET "lists/new"
POST "lists"
```

### 4 - 书签 bookmarks 的路由，控制器和视图

- 用户可以给一个现有的清单添加一个新的书签（电影/清单 组合）
- 阅读  `simple_form`[文档](https://github.com/heartcombo/simple_form#associations)里关于`f.association`的部分，给我们的电影列表创建一个下拉选择框。

```
GET "lists/42/bookmarks/new"
POST "lists/42/bookmarks"
```

- 用户可以从清单 list 里面删除一个书签 bookmark。如何创建一个删除链接？

```
DELETE "bookmarks/25"
```

我们需要一个`MoviesController`控制器吗?

### 5 - 边设计边写代码

开发一个非常好看的前端！和 CSS 好好玩一玩！😊 去 [dribbble](https://dribbble.com/) 或者 [onepagelove](https://onepagelove.com/) 找一些灵感。

不要忘了也可以在`app/assets/images`文件夹里使用本地图片。或者更好的办法是，当用户创建一个新的清单 list 的时候，让用户填入图片地址`image_url`。

![](https://raw.githubusercontent.com/lewagon/fullstack-images/master/rails/watch-list/homepage.png)

![](https://raw.githubusercontent.com/lewagon/fullstack-images/master/rails/watch-list/showpage.png)

### 6 - 新建书签 bookmark 的表单放在清单 list 的 show 页面（选做）

尝试把"新建书签 bookmark 的表单"放在清单 list 的 show 页面，而不是一个单独的页面。这样你就不需要离开清单 list 页面来添加一个新的电影了！路由会有哪些改变？控制器有哪些改变？

### 7 - 列出点评(选做)

任何用户都可以对我们的电影收藏做评价（告诉我们他们的想法）。给我们的清单添加一些点评 reviews！

![](https://raw.githubusercontent.com/lewagon/fullstack-images/master/rails/watch-list/reviews.png)
