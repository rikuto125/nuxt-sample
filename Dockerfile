# Node.jsのバージョン18のイメージをベースに使用
FROM node:18.3.0-slim

# アプリケーションディレクトリを作成
#Docker Composeファイルのvolumesセクションとパスを合わせる
WORKDIR /usr/src/app

# アプリの依存関係をインストール
#package.jsonとpackage-lock.jsonをコピー
COPY package*.json ./
# npmを使って依存関係をインストール
RUN npm install

# アプリケーションのソースコードをバンドル
# 現在のディレクトリのすべてをコンテナの作業ディレクトリにコピー
COPY . .

# コンテナの3000番ポートを公開
# ポートはDocker Composeファイルのportsセクションと一致させる
EXPOSE 3000

# コンテナ起動時に実行されるコマンド
CMD ["npm", "run", "dev"]

