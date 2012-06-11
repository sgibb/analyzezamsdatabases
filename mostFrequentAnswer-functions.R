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

## which answer is mostly correct?
mostFrequentAnswer <- function(df) {
    return(colSums(df[, 6:10]));
}

## plot "most frequent answer" barplot
plotMostFrequentAnswer <- function(df, ...) {
    n <- nrow(df);
    x <- mostFrequentAnswer(df);
    main <- paste("Häufigste Antwort\nn==", n, sep="");
    sub <- paste(attr(df, "filename"), attr(df, "subject"), sep=" : ");
    p <- barplot(x, col="#7FC97F",
            main=main, names.arg=LETTERS[1:5],
            ylim=c(0, ceiling(max(x*1.05))), sub=sub, ...);
    printPercentage(x, n, p);
    invisible();
}

