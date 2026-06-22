# GICCI Project - Phase 3: Machine Learning
# Author: Santosh Gutte
# Date: 2026
# Description: Building ML models to predict economic crisis using GICCI data

import pandas as pd
import numpy as np
import matplotlib.pyplot as plt
import seaborn as sns

from db_connection import get_connection

from sklearn.model_selection import train_test_split
from sklearn.preprocessing import StandardScaler
from sklearn.linear_model import LogisticRegression, LinearRegression
from sklearn.ensemble import RandomForestClassifier, RandomForestRegressor, GradientBoostingClassifier
from sklearn.cluster import KMeans
from sklearn.decomposition import PCA
from sklearn.metrics import accuracy_score, classification_report, confusion_matrix
from sklearn.metrics import r2_score, mean_squared_error

import warnings
warnings.filterwarnings('ignore')


# -----------------------------------------------------------
# Step 1: Load data from MySQL
# -----------------------------------------------------------

def run_query(query):
    conn = get_connection()
    df = pd.read_sql(query, conn)
    conn.close()
    return df

print("Loading data from MySQL database...")

countries = run_query("SELECT * FROM countries")
eco       = run_query("SELECT * FROM economic_indicators")
gicci     = run_query("SELECT * FROM gicci_scores")
crisis    = run_query("SELECT * FROM crisis_events")

print("Data loaded successfully!")
print("countries:", countries.shape)
print("economic_indicators:", eco.shape)
print("gicci_scores:", gicci.shape)


# -----------------------------------------------------------
# Step 2: Merge tables and prepare the dataset
# -----------------------------------------------------------

# join country names into eco and gicci tables
eco   = eco.merge(countries[['country_id', 'country_name', 'region']], on='country_id')
gicci = gicci.merge(countries[['country_id', 'country_name', 'region']], on='country_id')
crisis = crisis.merge(countries[['country_id', 'country_name', 'region']], on='country_id')

# merge gicci scores with economic indicators
df = gicci.merge(
    eco[['country_id', 'year', 'inflation_rate', 'gdp_growth_rate',
         'unemployment_rate', 'foreign_reserves_bn']],
    on=['country_id', 'year'],
    how='left'
)

# fill missing values with median
df['inflation_rate'].fillna(df['inflation_rate'].median(), inplace=True)
df['gdp_growth_rate'].fillna(df['gdp_growth_rate'].median(), inplace=True)
df['unemployment_rate'].fillna(df['unemployment_rate'].median(), inplace=True)
df['foreign_reserves_bn'].fillna(df['foreign_reserves_bn'].median(), inplace=True)

# cap inflation at 500 to handle extreme outliers like Zimbabwe
df['inflation_rate'] = df['inflation_rate'].clip(upper=500)

print("\nFinal dataset shape:", df.shape)
print("\nRisk category counts:")
print(df['risk_category'].value_counts())


# -----------------------------------------------------------
# MODEL 1: Crisis Prediction (Classification)
# Question: Can we predict if a country will be in crisis?
# -----------------------------------------------------------

print("\n--- MODEL 1: Crisis Prediction ---")

# create binary target variable
# 1 = Crisis or Collapse, 0 = everything else
df['is_crisis'] = df['risk_category'].apply(lambda x: 1 if x in ['Crisis', 'Collapse'] else 0)

print("Crisis cases:", df['is_crisis'].sum())
print("Non-crisis cases:", (df['is_crisis'] == 0).sum())

# select features for classification
features = ['inflation_rate', 'gdp_growth_rate', 'unemployment_rate',
            'foreign_reserves_bn', 'inflation_score', 'currency_score',
            'debt_score', 'growth_score']

X = df[features]
y = df['is_crisis']

# train test split
X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=0.2, random_state=42)

# scale the features
scaler = StandardScaler()
X_train_scaled = scaler.fit_transform(X_train)
X_test_scaled  = scaler.transform(X_test)

print("\nTraining size:", X_train.shape[0])
print("Testing size:", X_test.shape[0])


# Model 1a - Logistic Regression
lr_model = LogisticRegression(max_iter=1000, random_state=42)
lr_model.fit(X_train_scaled, y_train)
lr_predictions = lr_model.predict(X_test_scaled)

print("\nLogistic Regression Results:")
print("Accuracy:", round(accuracy_score(y_test, lr_predictions) * 100, 2), "%")
print(classification_report(y_test, lr_predictions, target_names=['Not Crisis', 'Crisis']))


# Model 1b - Random Forest
rf_model = RandomForestClassifier(n_estimators=100, random_state=42)
rf_model.fit(X_train, y_train)
rf_predictions = rf_model.predict(X_test)

print("Random Forest Results:")
print("Accuracy:", round(accuracy_score(y_test, rf_predictions) * 100, 2), "%")
print(classification_report(y_test, rf_predictions, target_names=['Not Crisis', 'Crisis']))


# Model 1c - Gradient Boosting
gb_model = GradientBoostingClassifier(n_estimators=100, random_state=42)
gb_model.fit(X_train, y_train)
gb_predictions = gb_model.predict(X_test)

print("Gradient Boosting Results:")
print("Accuracy:", round(accuracy_score(y_test, gb_predictions) * 100, 2), "%")
print(classification_report(y_test, gb_predictions, target_names=['Not Crisis', 'Crisis']))


# Plot 1 - Confusion matrices for all 3 models
fig, axes = plt.subplots(1, 3, figsize=(15, 4))
fig.suptitle('Model 1 - Confusion Matrices', fontsize=14)

model_names = ['Logistic Regression', 'Random Forest', 'Gradient Boosting']
all_predictions = [lr_predictions, rf_predictions, gb_predictions]

for i in range(3):
    cm = confusion_matrix(y_test, all_predictions[i])
    sns.heatmap(cm, annot=True, fmt='d', cmap='Blues', ax=axes[i],
                xticklabels=['Not Crisis', 'Crisis'],
                yticklabels=['Not Crisis', 'Crisis'])
    acc = round(accuracy_score(y_test, all_predictions[i]) * 100, 1)
    axes[i].set_title(model_names[i] + '\nAccuracy: ' + str(acc) + '%')
    axes[i].set_xlabel('Predicted')
    axes[i].set_ylabel('Actual')

plt.tight_layout()
plt.savefig('model1_confusion_matrix.png', dpi=150)
plt.show()
print("Plot saved: model1_confusion_matrix.png")


# Plot 2 - Feature importance from Random Forest
feature_importance = pd.Series(rf_model.feature_importances_, index=features)
feature_importance = feature_importance.sort_values()

plt.figure(figsize=(8, 5))
feature_importance.plot(kind='barh', color='steelblue')
plt.title('Feature Importance - Random Forest')
plt.xlabel('Importance Score')
plt.tight_layout()
plt.savefig('model1_feature_importance.png', dpi=150)
plt.show()
print("Plot saved: model1_feature_importance.png")


# -----------------------------------------------------------
# MODEL 2: GICCI Score Prediction (Regression)
# Question: Can we predict the exact GICCI score?
# -----------------------------------------------------------

print("\n--- MODEL 2: GICCI Score Prediction ---")

reg_features = ['inflation_rate', 'gdp_growth_rate', 'unemployment_rate', 'foreign_reserves_bn']

X_reg = df[reg_features].dropna()
y_reg = df.loc[X_reg.index, 'gicci_total']

X_train_r, X_test_r, y_train_r, y_test_r = train_test_split(X_reg, y_reg, test_size=0.2, random_state=42)

scaler_r = StandardScaler()
X_train_r_scaled = scaler_r.fit_transform(X_train_r)
X_test_r_scaled  = scaler_r.transform(X_test_r)


# Model 2a - Linear Regression
lin_model = LinearRegression()
lin_model.fit(X_train_r_scaled, y_train_r)
lin_predictions = lin_model.predict(X_test_r_scaled)

lin_r2   = round(r2_score(y_test_r, lin_predictions), 3)
lin_rmse = round(np.sqrt(mean_squared_error(y_test_r, lin_predictions)), 2)

print("Linear Regression:")
print("R2 Score:", lin_r2)
print("RMSE:", lin_rmse)


# Model 2b - Random Forest Regressor
rfr_model = RandomForestRegressor(n_estimators=100, random_state=42)
rfr_model.fit(X_train_r, y_train_r)
rfr_predictions = rfr_model.predict(X_test_r)

rfr_r2   = round(r2_score(y_test_r, rfr_predictions), 3)
rfr_rmse = round(np.sqrt(mean_squared_error(y_test_r, rfr_predictions)), 2)

print("\nRandom Forest Regressor:")
print("R2 Score:", rfr_r2)
print("RMSE:", rfr_rmse)


# Plot 3 - Actual vs Predicted
fig, axes = plt.subplots(1, 2, figsize=(12, 5))
fig.suptitle('Model 2 - Actual vs Predicted GICCI Score', fontsize=13)

axes[0].scatter(y_test_r, lin_predictions, color='royalblue', alpha=0.7)
axes[0].plot([0, 100], [0, 100], 'r--', label='Perfect line')
axes[0].set_xlabel('Actual GICCI')
axes[0].set_ylabel('Predicted GICCI')
axes[0].set_title('Linear Regression\nR2: ' + str(lin_r2) + '  RMSE: ' + str(lin_rmse))
axes[0].legend()

axes[1].scatter(y_test_r, rfr_predictions, color='seagreen', alpha=0.7)
axes[1].plot([0, 100], [0, 100], 'r--', label='Perfect line')
axes[1].set_xlabel('Actual GICCI')
axes[1].set_ylabel('Predicted GICCI')
axes[1].set_title('Random Forest\nR2: ' + str(rfr_r2) + '  RMSE: ' + str(rfr_rmse))
axes[1].legend()

plt.tight_layout()
plt.savefig('model2_actual_vs_predicted.png', dpi=150)
plt.show()
print("Plot saved: model2_actual_vs_predicted.png")


# -----------------------------------------------------------
# MODEL 3: Country Clustering (K-Means)
# Question: Which countries are economically similar?
# -----------------------------------------------------------

print("\n--- MODEL 3: Country Clustering ---")

# calculate average values per country
country_avg = df.groupby('country_name').agg(
    avg_inflation    = ('inflation_rate',   'mean'),
    avg_gdp          = ('gdp_growth_rate',  'mean'),
    avg_unemployment = ('unemployment_rate','mean'),
    avg_gicci        = ('gicci_total',      'mean'),
    avg_inf_score    = ('inflation_score',  'mean'),
    avg_cur_score    = ('currency_score',   'mean'),
    avg_debt_score   = ('debt_score',       'mean'),
    avg_growth_score = ('growth_score',     'mean')
).reset_index()

cluster_cols = ['avg_inflation', 'avg_gdp', 'avg_unemployment', 'avg_gicci',
                'avg_inf_score', 'avg_cur_score', 'avg_debt_score', 'avg_growth_score']

X_clust = country_avg[cluster_cols].fillna(0)
X_clust['avg_inflation'] = X_clust['avg_inflation'].clip(upper=200)

scaler_c = StandardScaler()
X_clust_scaled = scaler_c.fit_transform(X_clust)


# find best K using elbow method
inertia_values = []
k_values = range(2, 9)

for k in k_values:
    km = KMeans(n_clusters=k, random_state=42, n_init=10)
    km.fit(X_clust_scaled)
    inertia_values.append(km.inertia_)

# Plot 4 - Elbow curve
plt.figure(figsize=(7, 4))
plt.plot(k_values, inertia_values, marker='o', color='steelblue')
plt.axvline(x=4, color='red', linestyle='--', label='Best K = 4')
plt.title('Elbow Method - Finding Optimal K')
plt.xlabel('Number of Clusters')
plt.ylabel('Inertia')
plt.legend()
plt.tight_layout()
plt.savefig('model3_elbow.png', dpi=150)
plt.show()
print("Plot saved: model3_elbow.png")


# apply kmeans with k=4
kmeans = KMeans(n_clusters=4, random_state=42, n_init=10)
country_avg['cluster'] = kmeans.fit_predict(X_clust_scaled)

# label each cluster based on average GICCI score
cluster_gicci_avg = country_avg.groupby('cluster')['avg_gicci'].mean().sort_values()
cluster_label_map = {}
labels = ['Stable', 'Emerging', 'Vulnerable', 'Crisis-Prone']

for i, cluster_id in enumerate(cluster_gicci_avg.index):
    cluster_label_map[cluster_id] = labels[i]

country_avg['cluster_name'] = country_avg['cluster'].map(cluster_label_map)

print("\nCountries in each cluster:")
for label in labels:
    group = country_avg[country_avg['cluster_name'] == label]['country_name'].tolist()
    print("\n" + label + ":")
    print(", ".join(group))


# Plot 5 - PCA scatter plot to visualize clusters
pca = PCA(n_components=2)
pca_result = pca.fit_transform(X_clust_scaled)

country_avg['pca1'] = pca_result[:, 0]
country_avg['pca2'] = pca_result[:, 1]

cluster_colors = {
    'Stable'      : 'green',
    'Emerging'    : 'gold',
    'Vulnerable'  : 'orange',
    'Crisis-Prone': 'red'
}

plt.figure(figsize=(12, 7))

for cluster_name, group in country_avg.groupby('cluster_name'):
    plt.scatter(group['pca1'], group['pca2'],
                label=cluster_name,
                color=cluster_colors[cluster_name],
                s=100, edgecolors='black', linewidth=0.5)
    for _, row in group.iterrows():
        plt.annotate(row['country_name'], (row['pca1'], row['pca2']),
                     fontsize=7, xytext=(4, 4), textcoords='offset points')

plt.title('Country Clusters - PCA Visualization')
plt.xlabel('PCA Component 1')
plt.ylabel('PCA Component 2')
plt.legend()
plt.tight_layout()
plt.savefig('model3_clusters.png', dpi=150)
plt.show()
print("Plot saved: model3_clusters.png")


# -----------------------------------------------------------
# Bonus: Simple Crisis Predictor Function
# Enter a country's data and get a prediction
# -----------------------------------------------------------

def predict_country(inflation, gdp_growth, unemployment, forex_reserves,
                    inf_score, cur_score, debt_score, growth_score):

    input_df = pd.DataFrame([[inflation, gdp_growth, unemployment, forex_reserves,
                               inf_score, cur_score, debt_score, growth_score]],
                            columns=features)

    input_scaled = scaler.transform(input_df)
    prediction   = rf_model.predict(input_df)[0]
    probability  = rf_model.predict_proba(input_df)[0][1]

    gicci_input  = input_df[reg_features]
    gicci_score  = rfr_model.predict(gicci_input)[0]

    print("Crisis Prediction :", "CRISIS" if prediction == 1 else "NOT IN CRISIS")
    print("Crisis Probability:", str(round(probability * 100, 1)) + "%")
    print("Predicted GICCI   :", round(gicci_score, 1), "/ 100")


# test with India 2025 data
print("\n--- Test: India 2025 ---")
predict_country(
    inflation=4.8, gdp_growth=6.5, unemployment=4.3, forex_reserves=660,
    inf_score=3, cur_score=0, debt_score=5, growth_score=0
)

# test with a crisis country
print("\n--- Test: Hypothetical Crisis Country ---")
predict_country(
    inflation=120.0, gdp_growth=-9.0, unemployment=40.0, forex_reserves=1.2,
    inf_score=22, cur_score=22, debt_score=20, growth_score=25
)

# test with Argentina 2024
print("\n--- Test: Argentina 2024 ---")
predict_country(
    inflation=211.0, gdp_growth=-1.7, unemployment=7.5, forex_reserves=27.0,
    inf_score=25, cur_score=22, debt_score=15, growth_score=20
)


# -----------------------------------------------------------
# Final Summary
# -----------------------------------------------------------

print("\n==========================================")
print("Phase 3 Complete - Model Summary")
print("==========================================")
print("Model 1 - Crisis Classification")
print("  Logistic Regression Accuracy :", round(accuracy_score(y_test, lr_predictions) * 100, 1), "%")
print("  Random Forest Accuracy       :", round(accuracy_score(y_test, rf_predictions) * 100, 1), "%")
print("  Gradient Boosting Accuracy   :", round(accuracy_score(y_test, gb_predictions) * 100, 1), "%")
print("\nModel 2 - GICCI Score Regression")
print("  Linear Regression  R2 :", lin_r2, " RMSE :", lin_rmse)
print("  Random Forest      R2 :", rfr_r2, " RMSE :", rfr_rmse)
print("\nModel 3 - Country Clustering")
print("  K-Means with K=4 clusters")
print("  Stable | Emerging | Vulnerable | Crisis-Prone")
print("\nNext: Phase 4 - HTML Dashboard")
print("==========================================")