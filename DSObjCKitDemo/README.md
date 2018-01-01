#  Title

### YTKNetwork 使用中的注意事项
* AFNetworking 会根据 Response 的 MIMEType 调用对应的解析器，这个判断写在`AFURLResponseSerialization.m`文件中，代码如下：

  ```objective-c
  if (... ![self.acceptableContentTypes containsObject:[response MIMEType]] ...) {
  	...  
  }
  ```

  而 JSON 解析器支持的MIMEType只有：`application/json`、`text/json`、`text/javascript`，这个代码也写在`AFURLResponseSerialization.m`文件中，代码为：

  ```objective-c
  self.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript", nil];	
  ```

  也就是说，如果 Response 返回的是 JSON，但是 MIMEType 不为上面三种之一，YTKNetwork 会返回错误。

  因此，如果要解决这个问题，有两种方法：

  1. 修改 AFNetworking 的 JSON 解析器支持的 MIMEType类型
  2. 让后台返回正确的 MIMEType

### Charles v4.2.1 使用

* Proxy Settings 中，指定端口（默认是8888）
* Proxy Settings 中，激活 Enable transparent HTTP proxying
* Proxy Settings 中，macOS 标签页，激活相应的项
* SSL Proxying Settings中，SSL Proxying 标签页，添加一条，Host: `*`，Port:`443`
* 菜单 Help -> SSL Proxying -> Install Charles Root Certificate，会打开钥匙串，安装好有需要设置为信任
* 终端中，使用 `curl -x 127.0.0.1:8888 https://www.baidu.com` 验证，成功的话 Charles 会有输出
* 系统设置，网络链接的高级设置中，需要将自动代理配置的勾去掉