# Python 學習筆記

## 遞進

( + or - or * or / )= 等加、減、乘、除

```python
value = 0
while(value<10):
    print(value)
    value += 3           # value等差+3

result:
0
3
6
9
```

## 選擇判斷式

```python
if value > 3.1415926:
    print('比圓周率大')
elif value == 3.1415926:
    print('和圓周率相等')
else:
    print('比圓周率小')
```

## 三元運算子

`(條件為真回傳) if (判斷式) else (條件為假回傳)`

```python
a,b = 1,3
'Ture' if a>b else 'False'    # a > b 如果為真回傳 Ture 字串,反之則為 False 字串

result:
False
```

## 儲存容器

```python
Tuple=(1,2,3)
list=[1,2,3]
set={1,2,3}
dict={0:1,1:2,2:3}    # key:value
```

## Tuple Unpacking

```python
Tuple=(1,2,3)
T,U,P=Tuple     # 分別將 Tuple內的元素指定給TUP三個變數
print('T=',T,',U=',U,',P=',P)
```

## 串列

```python
a = [0,1,2,3,4,5,6,7,8,9,11,13,15,17,19]  # 總共 14 項
b = a[2:19:3]
# 解釋1   從項目 2 開始,每隔 3 個項目取出,直到項目 19 為止。
# 解釋2   區間 [2:19] 內,除以 3 餘 2 的項目總成一新串列。即 a[項目%3=2]或 a[餘數:被除數結束點:除數]

result:
[2, 5, 8, 13, 19]
```
