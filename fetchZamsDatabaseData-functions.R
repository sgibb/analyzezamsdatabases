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

## fetch data from zams zdb file
fetchZamsDatabaseData <- function(filename, subject=NULL) {
    ## load RSQLite
    library("RSQLite");

    if (!file.exists(filename)) {
        stop(sQuote("filename"), " have to be a valid path.");
    }

    ## create database connection
    con <- dbConnect("SQLite", dbname=filename);

    ## build query
    query <- paste("SELECT q.answerA, q.answerB, q.answerC, q.answerD, q.answerE, ",
             "q.solutionA, q.solutionB, q.solutionC, q.solutionD, q.solutionE",
             " FROM tQuestions AS q ", sep="");

    ## limit to a specific subject?
    if (!is.null(subject)) {
        query <- paste(query, ", tSubjects AS s WHERE ",
                       "q.subjectId = s.id AND s.name='", subject, "'", sep="");
    }

    df <- dbGetQuery(con, query);
    attr(df, "filename") <- filename;
    attr(df, "subject") <- subject;
    return(df);
}

