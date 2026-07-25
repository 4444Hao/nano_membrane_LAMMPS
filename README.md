  ```mermaid
flowchart LR
    classDef tool fill:#4a5038,stroke:#708090,color:#fff,stroke-width:2px
    classDef file fill:#3a7f7f,stroke:#5f9ea0,color:#fff,stroke-width:1px
    classDef script fill:#8b3a3a,stroke:#a52a2a,color:#fff,stroke-width:1px
    
    A(MaterialStudio2019):::tool
    B(零件pdb文件):::file
    C(Packmol):::tool
    D(in文件):::file
    E(完整版pdb文件):::file
    F(cvff_aug.frc + msi2lmp):::file
    G(car文件):::file
    H(data文件):::file
    I(in文件):::script
    J(sh脚本):::script
    K(LAMMPS模拟):::tool
    L(OVITO验证查看):::tool

    A -->|输出| B
    D --> C
    B --> C
    C --> E

    E -->|导入MaterialStudio2019| A
    A -->|力场类型、晶格| G
    F --> H
    G --> H

    H -->|优化调整| K
    I --> K
    J --> K

    K --> L
    E --> L
    L --> E
```
---
OVITO展示

[<video src="./assets/OVITO.mp4" controls autoplay muted loop width="300" style="object-fit: cover; object-position: center;">
  OVITO展示
</video>](https://github.com/user-attachments/assets/63fed3df-bc58-4d74-bf61-ffbcd4734945)
