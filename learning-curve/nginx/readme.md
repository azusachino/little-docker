# nginx learning

## conf

```conf
server {
    listen 8080;
    location /test {
        set $foo hello;
        # response with echo content
        echo "foo: $foo";
    }
}
```
