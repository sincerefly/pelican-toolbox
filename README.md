# pelican-toolbox

构建博客使用的工具镜像（Pelican + Node/PNPM 工具链可扩展）。

## CI/CD

本仓库使用 GitHub Actions 自动构建 Docker 镜像：

- `pull_request -> main`: 仅构建校验（不推送）
- `push -> main`: 仅构建校验（不推送）
- `push tag v*`: 多架构构建并推送到 DockerHub

Workflow 文件：`.github/workflows/docker-release.yml`

## DockerHub Secrets

在 GitHub 仓库 `Settings -> Secrets and variables -> Actions` 配置：

- `DOCKERHUB_USERNAME`: DockerHub 用户名
- `DOCKERHUB_TOKEN`: DockerHub Access Token

## 发布流程

1. 本地创建版本 tag：

```bash
./scripts/release-tag.sh 1.0.0
```

2. 推送代码和 tag：

```bash
git push origin main --tags
```

3. GitHub Actions 自动构建并推送：

- `joecovert/pelican-toolbox:1.0.0`
- `joecovert/pelican-toolbox:1.0`
- `joecovert/pelican-toolbox:1`
- `joecovert/pelican-toolbox:latest`
