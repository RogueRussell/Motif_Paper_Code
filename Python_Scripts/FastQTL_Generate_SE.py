import numpy as np
import pandas as pd
import scipy.stats as st

#create function to calculate zscore and standard error from pvalue and slope - which is affect size
def get_se_and_z(bhat, pval):
    if bhat < 0:
        z = st.norm.ppf(pval / 2)
    else:
        z = st.norm.ppf(1 - pval / 2)
    if z != 0:
        se = bhat/z
    else:
        se = np.nan
    return se, z

#read in data of significant cis- eQTLS that was generated from FastQTL
data_file = "Significant_TM_cis_eQTLS.txt"
df = pd.read_csv(data_file, delimiter='\t')

# Calculate SE for each row and create a new column "SE" in the DataFrame
df["SE"], df["Z-score"] = zip(*df.apply(lambda row: get_se_and_z(row["bhat"], row["pval"]), axis=1))

# Write the DataFrame to a new CSV file with the SE data
output_file = "TM_data_withSE.txt"
df.to_csv(output_file, index=False)