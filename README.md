# AUS Stats

Calculate and compare the frequency of the 'Atypia of undetermined significance' diagnosis between cytotechs and pathologists

## Overview

Summary of NGYN thyroid cases where an AUS diagnosis was rendered by a cytotech and/or a pathologist. Frequency of AUS use is compared between cytotechs and pathologists

## Data

Query is performed in LigoLab

- Reporting > Dynamic Reports > AUS Query

### Base tab

- Created Date = Last Quarter
- Site Class = Cytology
- Site = Thyroid (run once for 'Thyroid fluids and other' and again for 'Thyroid FNA sites')

### Case Tab

- Result ID Prefix = All NGYN prefixes that are not part of UCHealth South
    - exclude the following: NGYN (GRANDVIEW), NGYN (MHC), NGYN (MHN), NGYN (WOODLAND), NGYN OP (MHN)

### Extended Tab

- Report Release
    - Set parameters to include the first day of the quarter of interest through the current date

### Export Data

- Save output of each query as excel (YYYYqX-aus-#.xls) in the project data folder.

## Ouput

The Rmarkdown script can be "knit with parameters" and will prompt the user for starting and ending dates. The output can be opened in a browser and printed to the projects output folder as a PDF (scale to 80%) named 'YYYYqX-aus-stats.

## Distribution

The PDF report is sent to the Director of Cytology: Sara Kane (skane@summitpathology.com).