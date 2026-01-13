import pandas as pd

# Load feature table (abundance / expression)
feature_table = pd.read_excel("feature_table.xlsx")

# Load functional annotation
annotation = pd.read_excel("functional_annotation.xlsx")

# Clean column names
feature_table.columns = feature_table.columns.str.strip()
annotation.columns = annotation.columns.str.strip()

# Merge
merged = pd.merge(
    feature_table,
    annotation,
    on="Geneid",
    how="left",
    indicator=True
)

# Matched features
matched = merged[merged["_merge"] == "both"]
matched.to_excel("features_with_function.xlsx", index=False)

# Unmatched features
non_matched = merged[merged["_merge"] == "left_only"]
non_matched.to_excel("features_without_function.xlsx", index=False)

print("Functional screening and merging complete.")

