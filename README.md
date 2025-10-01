# RIS-Sionna-Experiments

This repository contains the simulation framework and case studies used in our paper:  

**"From Lab to Digital Twin: Calibration of mmWave Ray-Tracing with RIS Reflections"**  
Accepted at *IEEE PIMRC*, 2025.  

-------

## Contents

  - `RIS_single_git.ipynb`: Single RIS setup  
  - `RIS_cascaded_git.ipynb`: Cascaded RIS setup  
  - `RIS_part_git.ipynb`: Partitioned RIS setup  
  - `Theoretical_Calculation_RIS.m`: MATLAB script to compute received power theoretically for validation.  
  - `horn_WI.uan`: Antenna pattern file  
  - `lab5.xml`: Scene definition file  
  - `lab_sionna_019_test5_cleaned`: Scene object file
--------

## Getting Started

### 1. Install dependencies
```bash
conda env create -f environment.yml
conda activate ris-env
