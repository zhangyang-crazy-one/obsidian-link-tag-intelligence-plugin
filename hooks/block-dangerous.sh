#!/bin/bash
# PreToolUse Hook: 拦截危险 Bash 命令
# 返回 exit code 2 阻塞执行

# 读取 JSON 输入
input=$(cat)

# 提取命令
command=$(echo "$input" | grep -o '"command":"[^"]*"' | head -1 | sed 's/"command":"//;s/"$//')

# 危险模式列表
dangerous_patterns=(
    "rm -rf /"
    "rm -rf /tmp"
    "rm -rf /var"
    "rm -rf /home"
    "format.*:"
    "mkfs\\."
    "dd if=.*of=/dev/"
    ":(){ :|:& };:"  # Fork bomb
)

# 检查危险模式
for pattern in "${dangerous_patterns[@]}"; do
    if echo "$command" | grep -qi "$pattern"; then
        echo "Blocked dangerous command: $command" >&2
        exit 2  # 阻塞
    fi
done

# 允许其他命令
exit 0
