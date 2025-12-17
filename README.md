# Modeling economic disparities between academia and political leadership: A comparative analysis

## Dataset description

This dataset supports the study **“Modeling Economic Disparities Between Academia and Political Leadership: A Comparative Analysis.”**\
It contains salary data, derived indicators, and R scripts used to analyze income disparities between university professors and national legislators across selected African and Western countries.

Upon publication, this dataset will be archived in **Dryad** and assigned a permanent DOI.

## Data Files

### 1. File: table.csv

**Description:**\
Primary dataset containing salary and disparity metrics for six countries.

##### Variables

* Country : Name of country
* Li : Monthly salary of national legislators (USD)
* Pi : Monthly salary of university professors (USD)
* DIi : Disparity Index, computed as Li / Pi
* Si(k = 1) : Sustainability index for k = 1
* Si(k = 3) : Sustainability index for k = 3
* Si(k = 5): Sustainability index for k = 5

## Code files

### 2. R-simulation-main.zip

**Description:**\
Compressed archive containing all R scripts used for data analysis, modeling, and visualization.

**Contents:**

| Script           | Purpose                                             |
| :--------------- | :-------------------------------------------------- |
| `simulation_1.R` | Salary comparison and descriptive analysis          |
| `simulation_2.R` | Computation of disparity and sustainability indices |
| `simulation_3.R` | Sensitivity analysis and sustainability modeling    |

All figures in the associated manuscript are generated using **R (ggplot2)**.

---

## Reproducibility

### Software requirements

* R version ≥ 4.2
* Required R packages:
* `ggplot2`
* `dplyr`
* `tidyr`

  Packages can be installed using:

  ```
  install.packages(c("ggplot2", "dplyr", "tidyr"))

  ```

### How to reproduce the results

1. Download and unzip `R-simulation-main.zip`
2. Open R or RStudio
3. Set the working directory to the folder containing `table.csv`
4. Run the R scripts sequentially (`simulation_1.R` → `simulation_3.R`)
5. Figures and outputs will be generated automatically

## Associated manuscript

This dataset supports the manuscript:

> **Modeling Economic Disparities Between Academia and Political Leadership: A Comparative Analysis**

The manuscript was prepared using LaTeX and submitted separately to the journal.\
Figures in the final manuscript were produced using R and exported for inclusion.

---

## Data sources

The salary data were compiled from publicly available sources, including:

* UNESCO
* World Bank
* World Economic Forum
* OECD
* The Guardian Nigeria.
* National Assembly of Nigeria
* Federal Ministry of Health (Nigeria)

---

## License and reuse

The dataset is provided for **research and educational purposes**.\
Reuse is permitted with appropriate citation of the associated manuscript and dataset.

---

## Contact

For questions regarding the dataset or code, please contact the corresponding author via the associated publication.

