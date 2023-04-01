# 需求

## 综合（synthesis）28000

- 输入
    - verilog_source: str
    - top_module: str
- 输出
    - log: str
    - resources_report: str
    - netlistsvg: str
    - netlistpng: bytes

## 仿真（simulation）28001

- 输入
    - verilog_source: str
    - testbench: str
    - signal_names: List[str]
- 输出
    - log: str
    - vcd: str
    - wavejson: str

## 判题（judge）28002

- 输入
    - wavejson_a: str
    - wavejson_b: str
    - signal_names: List[str]
- 输出
    - log: str
    - is_identical: bool

## WaveJson 转 SVG 和 PNG（wavejson_image）28003

- 输入
    - wavejson: str
- 输出
    - svg: str
    - png: bytes
