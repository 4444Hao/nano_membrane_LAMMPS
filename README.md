flowchart TB
    %% ========== 定义节点样式（使用 style 直接定义，绕开 Obsidian 主题覆盖） ==========
    style A fill:#5a6a4a,stroke:#708090,color:#fff,stroke-width:2px,stroke-linejoin:round
    style B fill:#3a7f7f,stroke:#5f9ea0,color:#fff,stroke-width:1px,stroke-linejoin:round
    style C fill:#5a6a4a,stroke:#708090,color:#fff,stroke-width:2px,stroke-linejoin:round
    style D fill:#3a7f7f,stroke:#5f9ea0,color:#fff,stroke-width:1px,stroke-linejoin:round
    style E fill:#3a7f7f,stroke:#5f9ea0,color:#fff,stroke-width:1px,stroke-linejoin:round
    style F fill:#3a7f7f,stroke:#5f9ea0,color:#fff,stroke-width:1px,stroke-linejoin:round
    style G fill:#3a7f7f,stroke:#5f9ea0,color:#fff,stroke-width:1px,stroke-linejoin:round
    style H fill:#3a7f7f,stroke:#5f9ea0,color:#fff,stroke-width:1px,stroke-linejoin:round
    style I fill:#7a3a3a,stroke:#a52a2a,color:#fff,stroke-width:1px,stroke-linejoin:round
    style J fill:#7a3a3a,stroke:#a52a2a,color:#fff,stroke-width:1px,stroke-linejoin:round
    style K fill:#5a6a4a,stroke:#708090,color:#fff,stroke-width:2px,stroke-linejoin:round
    style L fill:#5a6a4a,stroke:#708090,color:#fff,stroke-width:2px,stroke-linejoin:round
    
    %% ========== 节点定义（简化名称，中文显示更清晰） ==========
    A["MaterialStudio 2019"] 
    B["零件 pdb 文件"]
    C["Packmol"]
    D["in 文件"]
    E["完整版 pdb 文件"]
    F["cvff_aug.frc + msi2lmp"]
    G["car 文件"]
    H["data 文件"]
    I["in 文件"]
    J["sh 脚本"]
    K["LAMMPS 模拟"]
    L["OVITO 验证查看"]

    %% ========== 黄色链路：体系构建 ==========
    A -->|"输出"| B
    D --> C
    B --> C
    C --> E

    %% ========== 红色链路：力场文件生成 ==========
    A -->|"力场类型、晶格"| G
    F --> H
    G --> H

    %% ========== 绿色链路：模拟执行 ==========
    H -->|"优化调整"| K
    I --> K
    J --> K

    %% ========== 灰色链路：可视化反馈 ==========
    K --> L
    E --> L
    L --> E
