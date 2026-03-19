# Obsidian Link Tag Intelligence Plugin

Claude Code 插件配置，用于 Obsidian 插件开发工作流。

## 包含内容

- **Agents**: Obsidian API 专家、TypeScript 顾问、代码审查员
- **Skills**: obsidian-plugin-dev, context7, bug-debug, ui-ux-pro-max 等
- **Hooks**: Git 提交检查、代码风格检查、安全检查
- **Rules**: TypeScript 规范、Obsidian 插件开发规范、测试规范
- **MCP Servers**: MiniMax, GitHub, Context7

## 安装方式

### 方式 1: --plugin-dir 直接加载

```bash
claude --plugin-dir /path/to/obsidian-link-tag-intelligence-plugin
```

### 方式 2: 配置私有 marketplace

在 `~/.claude/settings.json` 添加：

```json
{
  "pluginMarketplaces": {
    "my-plugins": "https://github.com/zhangyangrui/obsidian-link-tag-intelligence-plugin"
  }
}
```

然后：`/plugin install my-plugins:obsidian-link-tag-intelligence`

## 使用方式

技能调用前缀：`obsidian-link-tag-intelligence:`

```
/obsidian-link-tag-intelligence:obsidian-plugin-dev
/obsidian-link-tag-intelligence:bug-debug
/obsidian-link-tag-intelligence:context7
```

## 技术栈

- TypeScript (strict mode)
- Vitest 测试
- esbuild 构建
- CodeMirror 6 编辑器扩展
- Obsidian API

## 项目结构

```
obsidian-link-tag-intelligence-plugin/
├── .claude-plugin/
│   └── plugin.json          # 插件元数据
├── agents/                  # Agent 定义
├── skills/                  # Skill 定义
├── hooks/                   # Hook 脚本和配置
│   ├── hooks.json           # Hook 配置
│   └── *.sh                # Hook 脚本
├── rules/                   # 规则文件
├── .mcp.json               # MCP 服务器配置
└── README.md               # 本文档
```

## Hooks 列表

| 钩子 | 触发条件 | 功能 |
|------|----------|------|
| SessionStart | 会话开始 | 初始化检查 |
| Stop | 会话结束 | ESLint 检查 |
| PreToolUse | 工具调用前 | Git 提交检查、console.log 检测、npm 审计 |
| PostToolUse | 工具调用后 | Prettier 格式化 |

## 版本历史

- 1.0.0: 初始版本，包含 Obsidian 插件开发完整配置
