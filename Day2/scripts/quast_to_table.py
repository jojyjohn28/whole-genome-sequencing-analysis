import pandas as pd
from glob import glob

reports = glob("quast_results/*/report.tsv")

dfs = []
for r in reports:
    df = pd.read_csv(r, sep="\t", header=None, names=["Metric", "Value"])
    sample = r.split("/")[-2]
    df["Sample"] = sample
    dfs.append(df)

final = pd.concat(dfs)
final.to_csv("quast_summary_all_samples.tsv", sep="\t", index=False)

