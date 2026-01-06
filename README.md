# munich_rental
## Goal
Front to end analysis pipeline of the rental prices in Munich. Logic inside python package. Host database on Databricks Free Edition. Visualize Results in Dashboard (Talbeau/ Streamlit)

## Structure
### 1. Raw Data Inputs
- [Rental Prices Proxy](https://insideairbnb.com/get-the-data/)
- [Munich Municipal Datasets](https://opendata.muenchen.de/dataset/)

### 2. Build Database based on Medallion Architecture (Python + SQL + Unity Catalog)
- **Bronze**: Raw scraped data
- **Silver**: Cleaned Datasets
- **Gold**: Analysis level Datasets

### 3. Run Analysis (Python)
- **DoubleML**: ML assited Casual Inference to deal with high dimension of Datasets

### 4. Visualization (Streamlit, Genie Space, etc...)
