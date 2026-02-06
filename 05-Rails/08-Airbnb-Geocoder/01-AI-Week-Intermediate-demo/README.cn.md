## AI Week - 中期演示

此时，你应该已经拥有了用户和第一个使用 LLM API 运行的功能，以及一个有效的 system prompt。

今天你应该在应用中添加对话行为，允许用户对 LLM 答案进行**后续追问**，**保持**之前消息的**上下文**。

同时，随着对话的增长，确保用适当的保护措施控制 token 消耗，并通过使用 **Turbo Streams** 而不是重定向来响应，修复令人烦恼的滚动行为。

另外，正如在第二堂课中看到的，你可以优化前端并在 UI 中添加**交互行为**，通过简单的 Stimulus 控制器用 JavaScript 来实现。

最后，不要忘记准备你的**中期演示**：在中期冻结部署，专注于测试用户旅程直到完美。所有演示必须在生产环境中进行，不允许使用 localhost。确保用精心设计的 [seeds](https://kitt.lewagon.com/knowledge/cheatsheets/rails_seeds) 准备好生产环境。