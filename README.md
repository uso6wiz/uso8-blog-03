# uso8-blog-02
Spring Bootの勉強で作った試験用ブログアプリ。  
uso8-blog-01からH2DBをPostgreSQLへ変更。   
  
# uso8-blog-03  
WebアプリケーションをTomcatとApatcheをAJP連携へ変更。  
  
# 使い方
1.Repositryからプロジェクトのコピー  
```git clone https://github.com/uso6/uso8-blog-03.git```  
  
2.Spring Bootアプリの実行(※)  
```gradle bootrun```  

# ECS デプロイ（push で自動）
- `main` へ push すると GitHub Actions で Docker ビルド → ECR push → ECS 強制デプロイされます。
- **事前準備**
  - tf-aws の `service` で ECR / ECS / RDS を `terraform apply` 済みであること。
  - 同一アカウントに GitHub OIDC プロバイダーがあり、`service` で `github_org_repo_blog` を指定してデプロイ用 IAM ロール（`github-actions-blog-deploy`）を作成済みであること。
  - リポジトリの **Settings → Secrets and variables → Actions** に `AWS_ROLE_ARN` を追加し、上記 IAM ロールの ARN を登録すること。
- ローカルで Docker ビルドする場合: `docker build -t wiz-dev-app . && docker run -p 8080:8080 -e SPRING_PROFILES_ACTIVE=production -e SPRING_DATASOURCE_URL=... wiz-dev-app`  

