import pandas as pd

# Load InterProScan annotation
interpro = pd.read_csv("genome.interpro.tsv", sep="\t", header=None)

# Assign column names (simplified)
interpro.columns = [
    "ProteinID", "MD5", "Length", "Analysis",
    "SignatureAccession", "SignatureDesc",
    "Start", "End", "Score", "Status",
    "Date", "InterProID", "InterProDesc",
    "GO", "Pathway"
]

# Load keyword reference file
keywords = pd.read_csv("biofilm_keywords.csv")

# Screen for matches
biofilm_hits = interpro[
    interpro["InterProDesc"].str.contains(
        "|".join(keywords["Keyword"]),
        case=False,
        na=False
    )
]

biofilm_hits.to_csv("biofilm_related_genes.tsv", sep="\t", index=False)

