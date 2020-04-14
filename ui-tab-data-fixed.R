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
## 
## # This tab is used to input the count or normalized data files

tabPanel("Data", 
         fluidRow(
         column(12,
                bsCollapse(id="input_collapse_panel",open="analysis_panel",multiple = FALSE,
                           bsCollapsePanel(title="Analysis Results:",value="analysis_panel",
                                           downloadButton('downloadResults_CSV','Save Results as CSV File'),
                                           downloadButton('downloadResults_RData',
                                                          'Save Results as START RData File for Future Upload',
                                                          class="mybuttonclass"),
                                           dataTableOutput('analysisoutput'),
                                           tags$head(tags$style(".mybuttonclass{background-color:#CD0000;} .mybuttonclass{color: #fff;} .mybuttonclass{border-color: #9E0000;}"))
                           )
                )#bscollapse
         )#column
         )#fluidrow
)#tabpanel
