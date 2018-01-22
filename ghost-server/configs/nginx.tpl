server {
    listen 80 default_server;
    listen [::]:80 default_server ipv6only=on;

    server_name ${domain-name}; # Replace with your domain

    root /usr/share/nginx/html;
    index index.html index.htm;

    client_max_body_size 1G;

    location / {
        proxy_pass http://localhost:2368;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        proxy_set_header Host $http_host;
        proxy_set_header X-Forwarded-Proto $scheme;
        proxy_buffering off;
    }
}
