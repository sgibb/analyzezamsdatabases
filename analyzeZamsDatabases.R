## Copyright 2012 Sebastian Gibb
## <mail@sebastiangibb.de>
##
## This is free software: you can redistribute it and/or modify
## it under the terms of the GNU General Public License as published by
## the Free Software Foundation, either version 3 of the License, or
## (at your option) any later version.
##
## It is distributed in the hope that it will be useful,
## but WITHOUT ANY WARRANTY; without even the implied warranty of
## MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
## GNU General Public License for more details.
##
## See <http://www.gnu.org/licenses/>

## please adapt the next 3 variables

## zams dir path (e.g. ${HOME}/zams)
zamsDir <- file.path(Sys.getenv("HOME"), "zams");

## databases
databases <- "LeipzigKlinik.zdb";

## subject
subject <- "Neurologie";



## import functions
source("fetchZamsDatabaseData-functions.R");
source("longestAnswer-functions.R");
source("mostFrequentAnswer-functions.R");
source("printPercentage-functions.R");

## draw plots into png
for (database in file.path(zamsDir, databases)) {
    df <- fetchZamsDatabaseData(database, subject=subject);

    pngfile <- gsub(x=basename(database), pattern=".zdb", replacement=".png",
                    fixed=TRUE);
 
    png(file=paste("mostFrequentAnswer-", pngfile, sep=""));
    plotMostFrequentAnswer(df);
    dev.off();

    png(file=paste("longestAnswer-", pngfile, sep=""));
    plotLongestAnswer(df);
    dev.off();
}

