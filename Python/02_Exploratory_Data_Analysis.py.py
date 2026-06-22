# GICCI_Phase2_MySQL.py
import pandas as pd
import matplotlib.pyplot as plt
import seaborn as sns
from db_connection import get_connection

# ─────────────────────────────
#  HELPER — run any SQL query
# ─────────────────────────────
def run_query(sql):
    conn = get_connection()
    df   = pd.read_sql(sql, conn)
    conn.close()
    return df

# ─────────────────────────────────────────────
#  LOAD ALL TABLES DIRECTLY FROM MySQL
# ─────────────────────────────────────────────
print("Loading data from MySQL...")

df_countries = run_query("SELECT * FROM countries")
df_eco       = run_query("SELECT * FROM economic_indicators")
df_currency  = run_query("SELECT * FROM currency_data")
df_crisis    = run_query("SELECT * FROM crisis_events")
df_gicci     = run_query("SELECT * FROM gicci_scores")

print(f" countries     : {df_countries.shape}")
print(f" eco_indicators: {df_eco.shape}")
print(f" currency_data : {df_currency.shape}")
print(f" crisis_events : {df_crisis.shape}")
print(f" gicci_scores  : {df_gicci.shape}")

# ─────────────────────────────────────────────
#  JOIN TABLES
# ─────────────────────────────────────────────
df_eco    = df_eco.merge(df_countries[['country_id','country_name','region']], on='country_id')
df_gicci  = df_gicci.merge(df_countries[['country_id','country_name','region']], on='country_id')
df_crisis = df_crisis.merge(df_countries[['country_id','country_name','region']], on='country_id')

# ─────────────────────────────────────────────
#  RUN ANALYTICAL SQL QUERIES
# ─────────────────────────────────────────────

# Query 1: Top 10 worst GICCI scores
q1 = run_query("""
    SELECT
        c.country_name,
        c.region,
        gs.year,
        gs.gicci_total,
        gs.risk_category,
        gs.inflation_score,
        gs.currency_score,
        gs.debt_score,
        gs.growth_score
    FROM gicci_scores gs
    JOIN countries c ON gs.country_id = c.country_id
    ORDER BY gs.gicci_total DESC
    LIMIT 10
""")
print("\nTOP 10 WORST GICCI SCORES:")
print(q1.to_string(index=False))

# Query 2: IMF involvement by region
q2 = run_query("""
    SELECT
        c.region,
        COUNT(*) AS total_crises,
        SUM(imf_involved) AS imf_bailouts,
        SUM(default_occurred) AS defaults,
        ROUND(AVG(severity_score), 2) AS avg_severity
    FROM crisis_events ce
    JOIN countries c ON ce.country_id = c.country_id
    GROUP BY c.region
    ORDER BY avg_severity DESC
""")
print("\n IMF INVOLVEMENT BY REGION:")
print(q2.to_string(index=False))

# Query 3: Inflation vs GDP by decade
q3 = run_query("""
    SELECT
        c.region,
        (year DIV 10 * 10) AS decade,
        ROUND(AVG(inflation_rate), 2)   AS avg_inflation,
        ROUND(AVG(gdp_growth_rate), 2)  AS avg_gdp_growth,
        COUNT(DISTINCT ei.country_id)   AS countries
    FROM economic_indicators ei
    JOIN countries c ON ei.country_id = c.country_id
    GROUP BY c.region, decade
    ORDER BY decade, avg_inflation DESC
""")
print("\nINFLATION VS GDP BY DECADE:")
print(q3.to_string(index=False))

# ─────────────────────────────────────────────
#  DARK THEME SETUP
# ─────────────────────────────────────────────
plt.rcParams['figure.facecolor'] = '#0d1117'
plt.rcParams['axes.facecolor']   = '#161b22'
plt.rcParams['axes.edgecolor']   = '#30363d'
plt.rcParams['text.color']       = '#e6edf3'
plt.rcParams['axes.labelcolor']  = '#e6edf3'
plt.rcParams['xtick.color']      = '#8b949e'
plt.rcParams['ytick.color']      = '#8b949e'
plt.rcParams['grid.color']       = '#21262d'
plt.rcParams['font.family']      = 'monospace'

colors = {
    'Stable'  : '#3fb950',
    'Watch'   : '#e3b341',
    'Stress'  : '#ffa657',
    'Crisis'  : '#f78166',
    'Collapse': '#ff4444'
}

# ─────────────────────────────────────────────
#  CHART 1: Top 10 Worst GICCI
# ─────────────────────────────────────────────
fig, ax = plt.subplots(figsize=(12, 6))

bar_colors = [colors.get(r, '#8b949e') for r in q1['risk_category']]
bars = ax.barh(
    [f"{row['country_name']} ({row['year']})" for _, row in q1.iterrows()],
    q1['gicci_total'],
    color=bar_colors,
    edgecolor='#0d1117'
)
for bar, val in zip(bars, q1['gicci_total']):
    ax.text(bar.get_width() + 1, bar.get_y() + bar.get_height() / 2,
            f'{val:.0f}', va='center', color='#e6edf3')

ax.invert_yaxis()
ax.set_title('Top 10 Worst GICCI Scores (Live from MySQL)', color='#e6edf3', fontsize=14)
ax.set_xlabel('GICCI Score (0-100)')
plt.tight_layout()
plt.savefig('top10_gicci_mysql.png', dpi=150, bbox_inches='tight', facecolor='#0d1117')
plt.show()
print("Chart 1 saved!")

# ─────────────────────────────────────────────
#  CHART 2: Risk Category Pie
# ─────────────────────────────────────────────
cat_counts = df_gicci['risk_category'].value_counts()
pie_colors = [colors.get(c, '#8b949e') for c in cat_counts.index]

fig, ax = plt.subplots(figsize=(8, 6))
ax.pie(cat_counts.values, labels=cat_counts.index,
       colors=pie_colors, autopct='%1.1f%%',
       startangle=140, textprops={'color': '#e6edf3'})
ax.set_title('GICCI Risk Category Distribution', color='#e6edf3', fontsize=14)
plt.tight_layout()
plt.savefig('risk_pie_mysql.png', dpi=150, bbox_inches='tight', facecolor='#0d1117')
plt.show()
print("Chart 2 saved!")

# ─────────────────────────────────────────────
#  CHART 3: Correlation Heatmap
# ─────────────────────────────────────────────
corr_cols   = ['inflation_rate', 'gdp_growth_rate', 'unemployment_rate', 'foreign_reserves_bn']
corr_data   = df_eco[corr_cols].dropna()
corr_matrix = corr_data.corr()

fig, ax = plt.subplots(figsize=(8, 6))
sns.heatmap(corr_matrix, annot=True, fmt='.3f',
            cmap='coolwarm', center=0,
            ax=ax, linewidths=1, linecolor='#0d1117')
ax.set_title('Economic Indicators — Correlation Heatmap', color='#e6edf3', fontsize=13)
plt.tight_layout()
plt.savefig('correlation_mysql.png', dpi=150, bbox_inches='tight', facecolor='#0d1117')
plt.show()
print("Chart 3 saved!")

# ─────────────────────────────────────────────
#  CHART 4: Inflation Over Time — India
# ─────────────────────────────────────────────
india = df_eco[df_eco['country_name'] == 'India'].sort_values('year')

fig, ax = plt.subplots(figsize=(12, 5))
ax.plot(india['year'], india['inflation_rate'],
        color='#ff7b72', marker='o', linewidth=2)
ax.fill_between(india['year'], india['inflation_rate'],
                alpha=0.2, color='#ff7b72')
ax.axhline(6, color='#ffa657', linestyle='--', alpha=0.7, label='6% danger threshold')
ax.annotate('1991 BOP Crisis', xy=(1991, 13.9), xytext=(1996, 16),
            arrowprops=dict(arrowstyle='->', color='#ffa657'),
            color='#ffa657', fontsize=9)
ax.set_title('India — Inflation Rate Over Time', color='#e6edf3', fontsize=14)
ax.set_xlabel('Year')
ax.set_ylabel('Inflation Rate (%)')
ax.legend()
plt.tight_layout()
plt.savefig('india_inflation_mysql.png', dpi=150, bbox_inches='tight', facecolor='#0d1117')
plt.show()
print(" Chart 4 saved!")

# ─────────────────────────────────────────────
#  CHART 5: Crisis Severity by Region
# ─────────────────────────────────────────────
region_severity = df_crisis.groupby('region')['severity_score'].mean().sort_values(ascending=True)

fig, ax = plt.subplots(figsize=(10, 5))
bars = ax.barh(region_severity.index, region_severity.values, color='#f78166')
for bar, val in zip(bars, region_severity.values):
    ax.text(bar.get_width() + 0.05, bar.get_y() + bar.get_height() / 2,
            f'{val:.1f}', va='center', color='#e6edf3')
ax.set_title('Average Crisis Severity by Region', color='#e6edf3', fontsize=14)
ax.set_xlabel('Average Severity Score (1-10)')
plt.tight_layout()
plt.savefig('severity_by_region_mysql.png', dpi=150, bbox_inches='tight', facecolor='#0d1117')
plt.show()
print("Chart 5 saved!")

# ─────────────────────────────────────────────
#  FINAL SUMMARY
# ─────────────────────────────────────────────
print("\n" + "="*55)
print("KEY INSIGHTS FROM MySQL DATA")
print("="*55)
print(f"  Total countries tracked : {len(df_countries)}")
print(f"  Total economic records  : {len(df_eco)}")
print(f"  Total crisis events     : {len(df_crisis)}")
print(f"  Avg GICCI score         : {df_gicci['gicci_total'].mean():.1f} / 100")
print(f"  Worst GICCI ever        : {df_gicci['gicci_total'].max():.0f} / 100")
print(f"  IMF bailout rate        : {df_crisis['imf_involved'].mean()*100:.1f}%")
print(f"  Sovereign default rate  : {df_crisis['default_occurred'].mean()*100:.1f}%")
print("="*55)
print("Phase 2 Complete! Next → Phase 3 ML Modeling ")