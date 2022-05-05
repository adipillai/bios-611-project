.PHONY: clean

clean:
	rm -rf derived_data
	rm -rf figures
	
derived_data/joined_and_cleaned.csv: source_data/covid19_data.csv source_data/gdl_humandevelopment_data.csv scripts/join-and-clean.R
	Rscript scripts/join-and-clean.R
	
## What to make: what we need
##	the-recipe
figures/hdi-vs-death-pct.png: derived_data/joined_and_cleaned.csv scripts/hdi-vs-death-pct.R
	Rscript scripts/hdi-vs-death-pct.R

figures/correlation-map.pdf: derived_data/joined_and_cleaned.csv scripts/correlation-map.R
	Rscript scripts/correlation-map.R
	
figures/bubble-plot.png: derived_data/joined_and_cleaned.csv scripts/bubble-map.R
	Rscript scripts/bubble-map.R
	
