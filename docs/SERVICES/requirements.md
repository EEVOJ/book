# 需求整理

## 综合（synthesis）24000

- 输入
    - verilog_source: str
    - top_module: str
- 输出
    - log: str
    - resources_report: str
    - netlistsvg: str
    - netlistpng: bytes

## 仿真（simulation）24001

- 输入
    - verilog_source: str
    - testbench: str
    - signal_names: List[str]
- 输出
    - log: str
    - vcd: str
    - wavejson: str

## 判题（judge）24002

- 输入
    - wavejson_a: str
    - wavejson_b: str
    - signal_names: List[str]
- 输出
    - log: str
    - is_identical: bool

## WaveJson 转 SVG 和 PNG（wavejsonimage）24003

- 输入
    - wavejson: str
- 输出
    - svg: str
    - png: bytes

## hello world（hello）24233

GET 返回 {"hello": "world"}
