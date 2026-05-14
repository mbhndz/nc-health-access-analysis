import sqlite3
from pathlib import Path

import pandas as pd


PROJECT_ROOT = Path(__file__).resolve().parents[1]

csv_path = PROJECT_ROOT / "data" / "processed" / "nc_county_health_analysis.csv"
db_path = PROJECT_ROOT / "data" / "processed" / "nc_county_health_analysis.sqlite"

table_name = "nc_county_health_analysis"

df = pd.read_csv(csv_path)

with sqlite3.connect(db_path) as conn:
    df.to_sql(table_name, conn, if_exists="replace", index=False)

print(f"Loaded {len(df)} rows into {db_path}")
print(f"Table name: {table_name}")