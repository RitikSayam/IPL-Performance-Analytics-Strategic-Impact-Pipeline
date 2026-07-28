# IPL-Performance-Analytics-Strategic-Impact-Pipeline
An end-to-end Data Analytics project examining 260,000+ ball-by-ball delivery records across 1,095 IPL matches (2008–2024). This project leverages a normalized MySQL relational database and Python (Pandas, Seaborn, Matplotlib) to evaluate player archetypes, bowling pressure metrics, venue/toss dynamics, and clutch performances.

## 🛠️ Tech Stack & Tools

* **Database Management:** MySQL (Relational Schema, Primary/Foreign Key Constraints)
* **Programming & ETL:** Python 3.x
* **Data Processing & Connectivity:** `pandas`, `pymysql`, `SQLAlchemy`
* **Data Visualization:** `seaborn`, `matplotlib`
* **Environment:** Jupyter Notebook / MySQL Workbench

---

## 🏛️ Database Architecture

The raw dataset was normalized into two relational tables in MySQL connected via a **Foreign Key constraint** on `match_id` to ensure data integrity and prevent redundancy:

1. **`matches` (Parent Table):** Contains match-level metadata (1,095 records) including venue, teams, toss decisions, winner, and player of the match.
2. **`deliveries` (Child Table):** Contains ball-by-ball granular statistics (~260,920 records) linked to `matches` via `match_id`.

```text
[ matches ] (1)  <--------->  (N) [ deliveries ]
 (match_id PK)                  (match_id FK)
