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

## is the longest answer the right one?
longestAnswer <- function(df) {
    answerLength <- apply(df, 1, function(x) {
        r <- rank(nchar(x[1:5]), ties="max");
        return (r[which(x[6:10] == 1)[1]]);
    });

    return(table(answerLength));
}

## plot "longest answer" barplot
plotLongestAnswer <- function(df, ...) {
    n <- nrow(df);
    x <- longestAnswer(df);
    main <- paste("Längste Antwort\nn==", n, sep="");
    sub <- paste(attr(df, "filename"), attr(df, "subject"), sep=" : ");
    p <- barplot(x, col="#7FC97F", main=main,
                 names.arg=c("kürzeste Antwort", "2.", "3.", "4.", 
                             "Längste Antwort"),
                ylim=c(0, ceiling(max(x*1.05))), sub=sub, ...);
    printPercentage(x, n, p);
}

