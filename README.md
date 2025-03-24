# 🎬 Netflix TV Shows & Movies Analysis | SQL + Power BI  

## 🚀 **Project Overview**  
This project provides an in-depth analysis of **Netflix’s content library**, exploring trends in **movie & TV show releases, ratings, top directors, and content duration**. Using **SQL for data processing** and **Power BI for visualization**, this analysis helps in understanding **content production patterns, user preferences, and streaming trends**.  

## 📦 **Business Problem**  
Netflix continuously expands its content catalog, but understanding **what works best for audience engagement** is key. This analysis answers:  

- **What is the distribution of Movies vs. TV Shows?**  
- **Which countries produce the most Netflix content?**  
- **What are the most common genres, ratings, and release trends?**  
- **Who are the most featured actors and directors on Netflix?**  
- **Are long-duration movies more popular than short ones?**  

---

## 🔑 **Key Insights & Findings**  
✅ **Movies dominate Netflix’s catalog**, comprising ~65% of total content.  
✅ **TV Shows with more than 5 seasons** are rare, suggesting most series end early.  
✅ **United States, India, and the UK** are the top content-producing countries.  
✅ **TV-MA and TV-14 are the most common ratings**, indicating a focus on mature audiences.  
✅ **The most common movie duration is ~90 minutes**, aligning with industry norms.  
✅ **Content additions peaked in recent years**, highlighting Netflix's aggressive expansion.  

---

## 🛠️ **Tech Stack & Tools Used**  
- **SQL (PostgreSQL)** – Data extraction, transformation, and KPI calculations.  
- **Power BI** – Interactive dashboard creation.  
- **Excel** – Minor data cleaning & transformation.  

---

## 📈 **Data Analysis Process**  

### **1️⃣ Data Cleaning & Processing**  
- **Standardized genre categories** to unify similar listings.  
- **Removed missing values** from `director`, `casts`, and `country` fields.  
- **Extracted season counts** from `duration` for TV show analysis.  
- **Created new date features** like `MonthName`, `MonthNo` for time-series insights.  

### **2️⃣ SQL Query Optimization**  
- **Indexed `release_year` and `date_added`** for faster time-based queries.  
- **Used STRING functions** to extract TV show seasons & movie durations.  
- **Normalized actor and director data** to count appearances efficiently.  

---

## 📊 **Power BI Dashboard Overview**  
Developed an **interactive Power BI dashboard** to help Netflix’s **content strategists, data analysts, and marketing teams** analyze content trends.  

#### **📌 Key Dashboard Components**  

✅ **KPI Cards:**  
   - **Total Movies & TV Shows**  
   - **Most Common Rating**  
   - **Top 5 Producing Countries**  

✅ **Filters & Slicers:**  
   - **Content Type (Movie vs. TV Show)**  
   - **Release Year**  

✅ **Visualizations & Business Impact:**  

| Visualization | Business Impact |
|--------------|----------------|
| **Total TV Shows vs. Movies (Bar Chart)** | Helps Netflix balance content diversity. |
| **Top 5 Producing Countries (Column Chart)** | Guides investment in regional content production. |
| **Most Common Genres (Bar Chart)** | Helps curate content recommendations. |
| **Release Year Trends (Line Chart)** | Tracks content production growth over time. |
| **Most Frequent Directors & Actors (Tables)** | Identifies key contributors to Netflix’s success. |
| **Longest Movies & TV Shows (Tables)** | Assesses demand for long-format content. |

# DASHBOARD OVERVIEW

![image alt](https://github.com/GauravLayak/Netflix-Analysis/blob/66a37f8f683459990126490ca802f7ca3b2c7f5c/Overview.png)

---

## 🎯 **Business Impact**  
🚀 **Optimized content acquisition strategy** – Focused on trending genres & popular ratings.  
🚀 **Better audience segmentation** – Identified key content-producing regions for localized marketing.  
🚀 **Improved investment decisions** – Insights on TV shows vs. movies balance helped guide production budgets.  

---

📌 If you find this project useful, ⭐ the repo and contribute! 🚀  
