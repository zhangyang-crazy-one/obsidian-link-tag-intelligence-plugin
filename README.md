# Obsidian Link Tag Intelligence Plugin

Claude Code 插件配置，用于 Obsidian 插件开发工作流。

## 包含内容

| 组件 | 说明 |
|------|------|
| Agents | Obsidian API 专家、TypeScript 顾问、代码审查员 |
| Skills | obsidian-plugin-dev, context7, bug-debug, ui-ux-pro-max 等 |
| Hooks | Git 提交检查、代码风格检查、安全检查 |
| Rules | TypeScript 规范、Obsidian 插件开发规范、测试规范 |
| MCP | MiniMax, GitHub, Context7 |

## 安装方式

### 方式 1: --plugin-dir 直接加载
```bash
claude --plugin-dir /path/to/obsidian-link-tag-intelligence-plugin
```

### 方式 2: marketplace 安装
在 `~/.claude/settings.json` 添加：
```json
{
  "pluginMarketplaces": {
    "my-plugins": "https://github.com/zhangyang-crazy-one/obsidian-link-tag-intelligence-plugin"
  }
}
```
然后：`/plugin install my-plugins:obsidian-link-intelligence`

## 使用方式

技能调用前缀：`obsidian-link-tag-intelligence:`

```
/obsidian-link-tag-intelligence:obsidian-plugin-dev
/obsidian-link-tag-intelligence:bug-debug
/obsidian-link-tag-intelligence:context7
```

## 技术栈

TypeScript (strict) | Vitest | esbuild | CodeMirror 6 | Obsidian API

## 项目结构

```
obsidian-link-tag-intelligence-plugin/
├── .claude-plugin/plugin.json  # 插件元数据
├── agents/                     # Agent 定义
├── skills/                     # Skill 定义
├── hooks/                       # Hook 配置和脚本
├── rules/                       # 规则文件
├── .mcp.json                  # MCP 服务器配置
└── README.md
```

## Hooks

| 钩子 | 触发条件 | 功能 |
|------|----------|------|
| SessionStart | 会话开始 | 初始化检查 |
| Stop | 会话结束 | ESLint 检查 |
| PreToolUse | 工具调用前 | 危险命令拦截、console.log 检测 |
| PostToolUse | 工具调用后 | Prettier 格式化 |

## 安全策略

插件内置以下安全措施：
- 敏感文件访问阻止（.env, secrets, credentials）
- 危险 Bash 命令拦截（rm -rf, destructive）
- npm 依赖安全审计

## 版本

- 1.0.0: 初始版本
- 1.1.0: 第一轮优化 - 安全加固
