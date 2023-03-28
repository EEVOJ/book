# 服务链接汇总

- 代码仓库 <https://git.tsinghua.edu.cn/eevoj/vojservices>

## fastapi-hello

- api <http://166.111.223.64:18000>
- docs <http://166.111.223.64:18000/docs>

只支持 GET 方法，返回 Json 格式的 hello world。

```py
>>> import requests
>>> requests.get("http://166.111.223.64:18000").content
b'{"hello":"world"}'
```

## fastapi-综合

- api <http://166.111.223.64:18001>
- docs <http://166.111.223.64:18001/docs>

## fastapi-仿真

- api <http://166.111.223.64:18002>
- docs <http://166.111.223.64:18002/docs>

## fastapi-波形比较

- api <http://166.111.223.64:18003>
- docs <http://166.111.223.64:18003/docs>
