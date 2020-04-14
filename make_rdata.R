## ==================================================================================== ##
# START Shiny App for analysis and visualization of transcriptome data.
# Copyright (C) 2016  Jessica Minnier
# 
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
# 
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
# 
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.
# 
# You may contact the author of this code, Jessica Minnier, at <minnier@ohsu.edu>
## ==================================================================================== ##
## 
source("helpers.R")
source("fun-input-analyze-data.R")

# If count data

countdata  <- read_csv("data/359-pTyr-Cond1-analyzed-01222020.csv")
countdata <- countdata %>% rename_at(vars(starts_with("Exp")),~stringr::str_replace(.,"Exp","CRP"))
names(countdata)

edgeRdata <- analyze_expression_data(countdata %>% select(Gene_ID:CRP_5), 
                                     analysis_method="edgeR", numgeneids = 2)
names(edgeRdata)
# 
# save(analyzed_data,
#      file="data/mousecounts_example.RData")


# If analyzed data

mydata <- read_csv("data/359-pTyr-Cond1-analyzed-01222020.csv")
mydata <- mydata %>% rename_at(vars(starts_with("Exp")),~stringr::str_replace(.,"Exp","CRP"))
data_analyzed = load_analyzed_data(mydata, 
                                   tmpgenecols = 1:2, 
                                   tmpexprcols = 3:12,
                                   tmpfccols = 13, 
                                   tmppvalcols = 14, 
                                   tmpqvalcols = 15, 
                                   isfclogged = TRUE)
# check colnames work

# replace just counts with counts and logcpm from above
data_analyzed$data_long <- edgeRdata$data_long
data_analyzed$data_long <- data_analyzed$data_long %>% 
  mutate(log10count = log10(count))
data_analyzed$data_long <- data_analyzed$data_long %>% select(unique_id:rep, log10count, count)

tmpdatlong = data_analyzed$data_long
(tmpynames = tmpdatlong%>%select(-unique_id,-sampleid,-group,-one_of("rep"))%>%colnames())
(tmpgroups = data_analyzed$group_names)
(tmpsamples = as.character(data_analyzed$sampledata$sampleid))
tmpdat = data_analyzed$results
table(tmpdat$test)
tmpdat <- tmpdat %>% mutate(test = case_when(
  test=="log_FC:FDR" ~ "+CRP/Con"
))
table(tmpdat$test)
(tmptests = unique(as.character(tmpdat$test)))
data_analyzed$results = tmpdat

save(data_analyzed, file="data/data_analyzed.RData")
