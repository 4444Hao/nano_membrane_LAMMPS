# wrap_membrane.py — 将膜坐标 PBC wrap 进 [0,100] × [0,100]
# 用法: python wrap_membrane.py

input_file = "membrane_a0.5.pdb"
output_file = "membrane_wrapped.pdb"

with open(input_file, "r") as f:
    lines = f.readlines()

count = 0
with open(output_file, "w") as f:
    for line in lines:
        if line.startswith("ATOM"):
            # PDB 格式: x 在第 31-38 列, y 在第 39-46 列
            x = float(line[30:38])
            y = float(line[38:46])
            z = float(line[46:54])

            # 将 x, y wrap 进 [0, 100)
            while x < 0:   x += 100.0
            while x >= 100: x -= 100.0
            while y < 0:   y += 100.0
            while y >= 100: y -= 100.0

            # z 保持不动 (膜在 z=368~430, 居中放置)
            # 写成固定 8 字符宽度、3 位小数
            new_line = (line[:30] +
                        f"{x:8.3f}" +
                        f"{y:8.3f}" +
                        f"{z:8.3f}" +
                        line[54:])
            f.write(new_line)
            count += 1
        else:
            f.write(line)

print(f"完成: {count} 个原子坐标已 wrap 到 [0,100]×[0,100]")
print(f"输出: {output_file}")
