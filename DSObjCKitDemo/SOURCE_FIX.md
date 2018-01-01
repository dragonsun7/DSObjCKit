#  <#Title#>


### 让 AFNetworking 接收 text/html 的 JSON 数据

修改 `AFURLResponseSerialization.m` 文件中 `AFJSONResponseSerializer` 类 `init` 方法，在可接收的 ContentTypes 中添加 `text/html` 类型

```objective-c
self.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript", @"text/html", nil];
```

