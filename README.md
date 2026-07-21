### Materials Studio 2019
 分子部件构建
 力场分配
 电荷设置
      标准值: O=-0.8476, H=0.4238, Na=+1, Cl=-1
导出 **pdb 格式**
### Packmol
  in 文件构建：指导组装
  装得到完整版 pdb 文件
    `packmol-20.2.2 < packmol.inp`
### OVITO
 验证: 打开 pdb, 确认各区域原子位置正确、无重叠
### cvff_aug.frc + msi2lmp.exe
  转换 pdb 为 data 格式
    输入: 完整 pdb + cvff_aug.frc + msi2lmp 控制文件
    输出: **data文件**
  删减 (若需移除多余原子)
    对照删除
### LAMMPS
  文件准备
    data 文件
    in 文件:  指导模拟中的温度、电荷等参数
    run_slurm.sh: 执行脚本
 指令
    `source /home/public/software_install/intel/bin/compilervars.sh intel64`
    `mpirun -n 28 lammps-20200303-icc_kokkos_omp -sf intel -in in.oscillatory_cnt.lmp`

### 分析流程 (模拟完成后)
  OVITO 打开 .lammpstrj
  通量分析
    读 flux_cnt_oscillatory.dat
    绘制 v_n_perm_water / v_n_perm_na / v_n_perm_cl 随时间曲线
    截留率 = 1 - (Δn_perm_ions / Δn_perm_water)
  扩散系数
  

[[VACNT分子动力学模拟全流程操作指南]]
