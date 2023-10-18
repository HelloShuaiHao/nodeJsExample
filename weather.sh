#!/bin/sh

set -eux

CITY=Shanghai
LANGUAGE="zh-CN"
UNIT=m
UA="Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.88 Safari/537.36"

# 使用 curl 获取天气数据并保存到 result.html 文件中
curl -H "Accept-Language: $LANGUAGE" -H "User-Agent: $UA" -o result.html https://wttr.in/$CITY?format=4\&$UNIT

# 从 result.html 中提取天气数据并保存到 result.txt 文件中
cat result.html > result.txt

# 从 result.html 中提取温度数据
temperature=$(grep -oE '[0-9]+' result.html)

# 根据温度生成不同的穿衣建议并保存到 result.txt 文件中
if [ "$temperature" -gt 30 ]; then
    echo "今天气温较高，记得穿清凉、透气的衣服。" >> result.txt
elif [ "$temperature" -gt 20 ]; then
    echo "今天气温适中，记得穿薄外套或长袖衣服。" >> result.txt
else
    echo "今天气温较低，记得穿厚外套并注意保暖。" >> result.txt
fi
