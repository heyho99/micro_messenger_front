# ベースイメージとして公式のApacheイメージを使用
FROM httpd:2.4

# ApacheのデフォルトのWebルートディレクトリにアプリケーションファイルをコピー
COPY . /usr/local/apache2/htdocs/

# 必要に応じて、Apacheの設定ファイルをカスタマイズしたい場合は以下のコマンドで設定ファイルをコピー
# COPY ./my-httpd.conf /usr/local/apache2/conf/httpd.conf

# EXPOSEポート（必要であれば、既定でポート80が公開されています）
EXPOSE 80
