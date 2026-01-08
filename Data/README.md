# Example Raw Sequencing Data

This directory contains a **small example Illumina paired-end sequencing dataset**
included to support the **Whole Genome Sequencing Analysis** tutorial and blog series.

The raw reads are provided so that users can **run the complete workflow end-to-end**,
including quality control, genome assembly, and downstream analysis, without needing
to download external data.

---

## 📂 File contents

Data/
├── genome_R1.gz
└── genome_R2.gz


- `genome_R1.gz` – Forward (R1) paired-end reads  
- `genome_R2.gz` – Reverse (R2) paired-end reads  

⚠️ The total size of this dataset is **<100 MB**, making it suitable for inclusion
in a GitHub repository.

---

## 🎯 Intended use

This dataset is intended for:

- Demonstration and teaching purposes  
- Testing the assembly and QC workflows  
- Following the Day-by-Day WGS analysis series  
- Reproducing figures and results shown in the blog  

---

## ⚠️ Important notes

- This is **not the full raw dataset** used in any publication  
- File names have been simplified for clarity and reproducibility  
- For real research applications, users should substitute their own raw reads  

---


## 📖 Data availability

Full raw sequencing datasets used in associated studies are available through
public repositories (e.g., NCBI SRA) and are not stored in this GitHub repository
due to size constraints.

## 📬 Questions

If you have questions or would like to adapt this workflow to your own data,
please open an issue or reach out via the project blog or linkdin