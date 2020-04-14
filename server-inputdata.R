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



output$countdataDT <- renderDataTable({
  data_analyzed$countdata
})

output$analysisoutput <- renderDataTable({
  print("output$analysisoutput")
  datatable(data_analyzed$results)
})

# Download analyzed data

output$downloadResults_CSV <- downloadHandler(
  filename = paste0("START_results_",Sys.Date(),".csv"),
  content = function(file) {
    write.csv(data_analyzed$data_results_table, file, row.names=FALSE)})

output$downloadResults_RData <- downloadHandler(
  filename= paste0("START_results_",Sys.Date(),".RData"),
  content=function(file){
    save(data_analyzed,file=file)
  })


output$instructionspdf <- downloadHandler(
  filename="Instructions.pdf",
  content=function(file){
    file.copy("instructions/Instructions.pdf",file)
  })




