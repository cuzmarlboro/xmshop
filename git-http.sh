#!/bin/bash
#Filename deploy.sh
#!/bin/bash

# 设置凭据缓存
git config --global credential.helper store

# 检查当前代理设置
CURRENT_PROXY=$(git config --global --get http.proxy)

# 如果没有设置代理，则设置默认代理
if [ -z "$CURRENT_PROXY" ]; then
    echo "未配置代理，正在设置默认代理..."
    git config --global http.proxy http://127.0.0.1:7890
    echo "代理已设置为: http://127.0.0.1:7890"
else
    git config --global http.proxy $CURRENT_PROXY
    echo "使用现有代理: $CURRENT_PROXY"
fi

# 显示当前配置
echo "当前 Git 代理配置:"
git config --global --get http.proxy

git status
git add .

if [ ! $1 ]; then
    git commit --no-verify -m "default"
fi

if [ $1 ]; then
    git commit --no-verify -m "$1"
fi

git push

echo 'Github 推送完成！'

git config --global --unset http.proxy
echo '代理已取消'
