## AI 周 - 开始

你将在接下来的课程中与你的项目小组一起为某个**用户**开发一个具有特定**目标**的 AI 助手。例如，Wott 是一个为**学习编程的学生**设计的 AI 助手。你需要思考你的核心用户的"角色画像"（"学习编程的学生"）和他们的目标（"我在问题上遇到困难，希望 AI 帮我解决"）。这将帮助你定义应用的范围。

与你的小组进行头脑风暴，并创建一个票据与老师验证你的想法。

### 演示

你将在**多模态推理**和 **Tools & Agents** 课程期间演示你的作品（在生产环境，不要在 `localhost` 上演示！）。截止日期很重要！

### 第一部分

在创建 Rails 应用并进入第二部分之前，请完成以下步骤并在课程开始时与老师验证。这样做会节省很多时间，相信我们。

#### 1 - 用户故事

复制这个[电子表格](https://docs.google.com/spreadsheets/d/1Kh4r-r5ZDyaWSfJdvW1NQJEfqt-wO3ExFR9SVp29lpY/edit?gid=0#gid=0)（每个团队一个），并邀请你的队友协作。

![duplicate](https://raw.githubusercontent.com/lewagon/fullstack-images/master/rails/user-stories/duplicate.png)
![rename](https://raw.githubusercontent.com/lewagon/fullstack-images/master/rails/user-stories/rename.png)

首先思考你将在演示中展示的**用户旅程**。AI 助手有很多可能的用例，但请尝试将它们缩小到解决特定问题的最小可行旅程。

<details><summary markdown='span'>查看解决方案
</summary>

- 1 个用户浏览挑战（或你选择的上下文）的用户旅程
- 1 个用户添加新挑战的用户旅程
- 1 个用户编辑或删除他们创建的挑战的用户旅程
- 1 个用户与 AI 就某个挑战进行聊天（或你选择的上下文）的用户旅程
</details>

每个用户旅程包含多个**用户故事**：使用正确的术语将它们写在电子表格中。完成后，创建一个票据与老师验证。

你可以用纸笔快速绘制不同屏幕的草图以及它们包含的大致元素。这将帮助你可视化你的用户旅程。注意，此时不需要太具体！这是一个冲刺，你需要明智地分配你的时间和资源。

<details><summary markdown='span'>查看解决方案
</summary>
- 作为访客，我可以访问主页查看应用的价值主张
- 作为访客，我可以查看挑战列表，导航到我想要尝试的挑战
- 作为访客，我可以点击一个挑战查看其详情
- 作为用户，我可以显示一个表单来填写创建新挑战所需的信息
- 作为用户，我可以提交表单创建新挑战
- 作为用户，我可以显示一个表单来编辑我创建的挑战
- 作为用户，我可以提交表单更新挑战
- 作为用户，我可以删除我创建的挑战
- 作为用户，我可以创建一个关于某个挑战的 AI 助手聊天
- 作为用户，我可以查看我创建的关于某个挑战的 AI 助手聊天列表
- 作为用户，我可以导航到我创建的关于某个挑战的 AI 助手聊天
- 作为用户，我可以在聊天的上下文中向 AI 助手发送消息
- 作为用户，我可以向 AI 助手发送带有文件附件的消息
- 作为用户，我可以向 AI 助手发送后续消息
</details>

#### 2 - 数据库架构

使用[我们的 db 工具](https://kitt.lewagon.com/db/new)绘制你的数据库架构，并**创建一个票据与老师验证**。只绘制应用工作所需的最小可行架构。使用正确的约定（表的复数名称等 - 参见数据库课程）。

💡 为了统一存储用户问题和助手答案的方式，你可以包含以下表格，以及用于处理注册和登录的用户表。

<details><summary markdown='span'>查看解决方案
</summary>
  <img src="https://wagon-public-assets.s3.eu-west-3.amazonaws.com/3h0por8ku29vrntndn0ci30fobb7" alt="数据库架构显示四个表：users、challenges、chats 和 messages，它们的关系和列">
</details>

#### 3 - 路由

返回你的用户故事电子表格并添加以下信息：
- 路由：动词 + 路径
- 动作
- 控制器

创建一个票据与老师验证。一切都好吗？是时候执行 `rails new` 了！

### 第二部分

在团队之间分配任务之前，一起设置你的项目。**首席开发者**（只有他们）应该：

#### 1. 使用 Postgres 配置创建 Rails 项目

使用 Le Wagon 的最小模板，它已经有良好的前端设置：

```bash
cd ~/code/<user.github_nickname>
rails new \
  -d postgresql \
  -m https://raw.githubusercontent.com/lewagon/rails-templates/master/minimal.rb \
  将此更改为你的RAILS应用名称
```

再次强调，只有**首席开发者**会这样做！不是团队中的每个人...

#### 2. 将项目推送到 Github

```bash
cd 你的rails应用名称
gh repo create --public --source=.
git push origin master
```

#### 3. 部署到 Heroku

即使只是一个框架应用，从**第一天**开始部署到 Heroku 也很重要，然后每天持续部署每个新功能。

```bash
heroku create ai-assistant-<user.lower_github_nickname> --region=替换为区域 # （eu、us 或 `heroku regions` 列表中可用的任何区域）
heroku config:set WEB_CONCURRENCY=1 # 修复临时 Heroku 错误
git push heroku master
heroku run rails db:migrate
```

### 4. 看板

[看板](https://en.wikipedia.org/wiki/Kanban_board)是一个敏捷项目管理工具，旨在帮助可视化工作、跟踪进度并最大化效率（或流程）。有许多不同的资源（[Trello](https://trello.com/)、[Github Projects](https://github.com/features/project-management/)、[Notion](https://www.notion.so/)，仅举几例）。

如果你选择 Trello、Github Projects 或 Notion，我们已经为你准备了三个草稿供你开始使用，但如果你更熟悉其他工具，请随意使用：

1. Trello 草稿 - 复制[这个 Trello 看板](https://trello.com/b/WB3fRTj2)（菜单 > 更多选项 > 复制看板 > 你的项目的看板名称）。然后将所有团队成员添加到看板，并开始导入所有用户故事和任务（按优先级排序）。

2. Github Projects 草稿 - 要在 Github 上设置看板，你需要已经创建了存储库并添加了所有协作者。然后，团队成员可以使用[这个看板](https://github.com/orgs/lewagon/projects/117)作为你项目看板的基础。按照[这里](https://docs.github.com/en/issues/planning-and-tracking-with-projects/creating-projects/copying-an-existing-project)的说明查看如何复制并将看板添加到你自己项目的存储库。需要注意两点：Github 不会复制原始看板的卡片，所以你必须自己添加它们。随意复制/粘贴卡片来开始，或者从头开始。其次，Github 使用 markdown 语法进行文本格式化，如标题、字体样式和复选框。这不是必需的，但可以很好地为你的卡片添加格式。你可以在[这里](https://guides.github.com/features/mastering-markdown/)阅读更多相关信息。

3. Notion 草稿 - 通过在导航栏中选择 `Duplicate` 选项来复制[这个 Notion 页面](https://www.notion.com/lewagon/Project-Weeks-a3961a7da7324637bea441832becb3ad)。然后将所有团队成员添加到看板（点击 `Share` 然后通过电子邮件邀请他们），并开始导入所有用户故事和任务，按优先级排序。页面的右上部分应该包含所有相关的应用链接。那里的链接应该用作你需要包含的链接的指南，但不幸的是你无法编辑这些链接，所以你必须使用正确的链接自己重新创建它们。按照[这个指南](https://www.notion.com/help/embed-and-connect-other-apps#web-bookmarks)正确添加 `Web bookmarks`。如果你是 Notion 新手，请随意查看[这个页面](https://www.notion.com/help/start-here)了解更多信息并立即成为 Notion 专家 💯

从这一点开始，你可以开始分配任务。**在设置上花时间，因为如果你在开始时正确地做，一切都会更简单**。

### 项目管理的一些指导原则

#### 启动

现在，让我们让团队开始项目工作。首席开发者已经创建了 Rails 应用，将其推送到 Github，并部署到 Heroku。

#### 将你的队友添加为 Github 仓库的协作者

转到你的 Github 仓库设置（`https://github.com/<user.github_nickname>/rails-airbnb-clone/settings/collaboration`）并将你的队友添加为**协作者**。

其他队友现在可以**克隆**项目：

```bash
gh repo clone <owner-github-nickname>/<rails-app-name>
```

然后导航到目录并运行：

```bash
cd <rails-app-name>
rails db:create db:migrate
bundle install
```

现在你可以将团队分成两组，开始在应用的几个核心功能上进行结对编程。这是一个很好的开始方式，并确保大家都在同一页面上。

这是了解[结对编程](https://zh.wikipedia.org/wiki/%E7%BB%93%E5%AF%B9%E7%BC%96%E7%A8%8B)的机会：

> 结对编程是一种软件开发技术，其中两名程序员在一个工作站上一起工作。一个是驾驶员，编写代码，而另一个是观察员或导航员，在输入时检查每一行代码。两名程序员经常交换角色。

以下是你可以开始工作的 3 个范围：

**范围 1：Devise 设置**：
- 设置 Devise 并使用 devise 生成 `User` 模型。确保使用 `rails g devise User`（而不是 `rails g model`）！
- 回顾早上的课程，添加导航栏、注册和登录页面（包装在 Bootstrap cols 中），并设置适当的 `before_action` 和 `skip_before_action` 过滤器。

**范围 2：前端启动**：
- 构建一个简单、有吸引力的主页，带有 Bootstrap 容器、居中内容和清晰的价值主张。

**范围 3：模型生成**：
- _注意：必须首先设置 Devise！（范围 1）_
- 生成其他三个模型将使你在**团队编程**课程后更容易分配工作。

**（可选）范围 4：核心模型读取操作**：
恭喜你达到这一步！让我们开始在你项目的核心模型上编写以下用户故事（用你的替换"挑战"）：
- 作为访客，我可以查看挑战列表，导航到我想要探索的挑战。
- 作为访客，我可以点击一个挑战查看其详情

对于你处理的每个范围，不要忘记：

```bash
git checkout -b <feature-name>
```

然后在完成后在 Github 上打开拉取请求。

不要忘记持续将你的工作部署到 Heroku，并在离开前在 Slack 上分享你的生产 URL。

#### 任务组织

在电子表格中列出的约 10 个用户故事中，**其中一些功能比其他功能更重要**。你的职责是对它们进行优先排序，以在周末获得 MVP！

#### 从模型到视图独立编码

当你处理一个功能时，**从数据库到 HTML/CSS 认真地处理它**。以创建挑战为例：

*模型*
- 我将生成一个 `Challenge` 模型及其相关迁移。
- 然后我将编写一个带有关联和验证的工作模型。
- 然后我将从 `rails console` 测试我的模型，以确保模型中的所有内容都能正常工作。

*路由*：
- 我将在 `routes.rb` 中添加 new/create 路由

*控制器*：
- 我将在 `ChallengesController` 中添加两个 `new` 和 `create` 动作

*视图*：
- 我将在 `views/challenges/new.html.erb` 中编写挑战表单
- create 动作重定向到 `show` 视图，带有确认通知

*链接*：
- 我将在导航栏中添加一个创建挑战的链接。

*HTML/CSS*：
- 我的表单使用正确的 Bootstrap 类来处理输入和按钮，保持整洁。
- 我的新挑战页面使用 `container` 居中内容，有清晰的标题，每个预订都有整洁的设计。
- 如果我的 HTML 代码太长且难以阅读，我将花时间使用局部视图重构我的 HTML。

**从模型到视图完美地编码**

- 在 rails console 中测试所有模型关联和验证。
- 不要忽视视图。如果你添加表单，请制作一个漂亮、居中且响应式的 Bootstrap 表单。如果你编写公寓列表，请构建一个漂亮的 Bootstrap 网格（例如，左侧是公寓图片，右侧是公寓信息..）。
- 使用局部视图重构你的 HTML，使其更易读和可维护。