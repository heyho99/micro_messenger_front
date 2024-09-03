# ベースイメージとして公式のApacheイメージを使用
FROM httpd:2.4

# ApacheのデフォルトのWebルートディレクトリにアプリケーションファイルをコピー
COPY . /usr/local/apache2/htdocs/

# ServerNameディレクティブを設定して警告を抑制
RUN echo "ServerName localhost" >> /usr/local/apache2/conf/httpd.conf

# ポートを1024以上の非特権ポートに変更する（例: 8080）
RUN sed -i 's/Listen 80/Listen 8080/' /usr/local/apache2/conf/httpd.conf

# Apacheのログディレクトリの所有権と書き込み権限を変更
RUN chown -R daemon:daemon /usr/local/apache2/logs/ && \
    chmod -R 775 /usr/local/apache2/logs/

# EXPOSEポートを8080に設定
EXPOSE 8080

# コンテナのエントリーポイントとしてApacheを実行
CMD ["httpd-foreground"]
