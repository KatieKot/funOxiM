# Distribution and regulatory roles of oxidized 5-methylcytosines in DNA and RNA of the Basidiomycete fungi Laccaria bicolor and Coprinopsis cinerea
Janina Ličytė, Kotryna Kvederavičiūtė, Audronė Rukšėnaitė, Eglė Godliauskaitė, Povilas Gibas, Vita Tomkutė, Gražina Petraitytė, Viktoras Masevičius, Saulius Klimašauskas, Edita Kriukienė  
Open Biology (2022), DOI: 10.1098/rsob.20160049


Sample codes to reproduce the analysis. 

### Requirements

1. scikick (https://github.com/matthewcarlucci/scikick)  
2. R (b4.0.3) 
3. Bioconductor (v3.12)

### Getting Started

These codes demonstrate how to reproduce most findings from Ličytė et al. paper. There are three Rmd files in the code directory. prep_data.Rmd is used to prepare main data matrix (gene level). Analysis.Rmd and AnalysisSup.Rmd shows basic principles of data acquisition. Note that example files contain only two samples and data from a single chromosome. Full data sets were deposited to NCBI GEO (GSE185551).  

If scikick is present on the system, it should be enough to run `sk run` from the project home directory. Alternatively, it is possible to use each code individually and render files manually (in this case output outdatadir variable in R will have to be set manually). 

### Input data 

Main input is coverage matrix, which represents CG coverages matrix. Data is read in as an RDS file, but is is possible to change this to any other common table format. Besides coverage matrix, there are several other input files describing differen genomic features - see example files for the exact format. 
