# Installation Guide  
## Whole Genome Sequencing — Day 2

This document describes how to install all tools used in **Day 2: Genome Assembly, Quality Assessment, and Topology**.

All installations are Linux-compatible and tested on HPC environments (e.g., SLURM-based clusters).

---

## 🧰 Recommended Environment Setup

We strongly recommend using **Conda** for reproducibility.

```bash
# Install Miniconda (if not already installed)
wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh
bash Miniconda3-latest-Linux-x86_64.sh
source ~/.bashrc
```
Create a dedicated environment:
```bash
conda create -n wgs_day2 -y python=3.10
conda activate wgs_day2
```
Add required channels:
```bash
conda config --add channels defaults
conda config --add channels bioconda
conda config --add channels conda-forge
```
## 🧱 Genome Assembly Tools
```bash
conda install -y spades #spades
spades.py --version #verify

conda install -y megahit #megahit
megahit --version #verify

conda install -y shovill #shovil
shovill --version #verify

#Flye
git clone https://github.com/fenderglass/Flye.git
cd Flye
python setup.py install --user
flye --version

#Unicycler
conda install -y unicycler
unicycler --version
```
## 📊 Assembly Evaluation & Visualization
```bash
conda install -y quast
quast.py --version
```

## Bandage (Assembly Graph Visualization)

Please see:https://jojyjohn28.github.io/blog/genome-visualization/

## References
1. Spades: https://github.com/ablab/spades
2. Megahit: https://github.com/voutcn/megahit
3. Shovill:https://github.com/tseemann/shovill
4. Unicycler :https://github.com/rrwick/Unicycler
5. Flye :https://github.com/mikolmogorov/Flye
6. Badage: https://github.com/rrwick/Bandage

## 📖 Related blog post
https://jojyjohn28.github.io/blog/wgs-day2-genome-assembly/