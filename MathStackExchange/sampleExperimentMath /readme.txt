1.Introduction

*** If you are not interested about the details of the experiment and just want to run it, please skip to “Running the Experiment” section. ***

The objective of this package is to provide a runable example of an tag recommendation experiment that was used to evaluate the system presented in “Learning in Efficient Tag Recommendation” (currently under revision). The process is divided into two parts: data processing and result evaluation:
(a) data processing. The system starts with an input file(s) that contains information about posts (see “Input Data Details” section for details). The posts should be sorted chronologically. The first 60% of posts are used in the initialization phase, solely to build the folksonomy (tasks performed: indexing). The next 20% posts are used to train merge coefficients (see paper for details). These post are still used to populate the folksonomy in real-time (tasks performed: indexing, training). The last 20% posts are used to produce the recommendation results (tasks performed: indexing, training, result printing). The percentage of posts used in each phase can be modified by changing the date spans in experiment settings scripts.
 
(b) result evaluation. The last step of data processing creates a separate file with the recommendation results for each recommendation step as well as real tags. In the result evaluation script the results and real tags are compared to establish the quality of recommendation measured in terms of recall, precision and F1 score. The evaluation script prints the average scores for recommendation sets of different sizes (k top recommended tags for k in [1,10]).

2.Package content
The package contains the following elements:
“snaffTagRecomender.jar” – the jar file that contains the recommender system, a wrapper for the offline tag recommendation experiment and evaluation class. The system is coded in Java.
“data” folder – the folder is used to store any data needed in the experiment: input files, the index files, recommendation results. So far only data for Stack Overflow dataset is available. We were able to use, transform and publish the Stack Overflow dataset freely, because it is distributed under Creative Commons License (data source: http://blog.stackoverflow.com/2009/06/stack-overflow-creative-commons-data-dump/ license: http://creativecommons.org/licenses/by-sa/2.5/). We make the reformatted dataset free to use under the same license. Please see the Input Data Details Section for more information about data format.
“lucene-2.9.0” folder – the folder contains jar files for Apache Lucene search engine (version 2.9.0, system details: http://lucene.apache.org/). Lucene is distributed under Apache License (http://www.apache.org/licenses/LICENSE-2.0.html).
“scripts” folder – The folder contains experiment settings scripts in XML format. The scripts contain all running parameters (e.g., paths, time spans for various processing phases). Please refer to the comments provided in the scripts for more details.
Running scripts – the scripts for processing the experiment (run*) and evaluation of results (eval*). Please see the “Running the experiments” section for more details.

3.Input Data Details
 The format of input data follows the format proposed by BibSonomy administrators during the ECML/PKDD Discovery Challenge 2008 and 2009 (see http://www.kde.cs.uni-kassel.de/ws/dc09/dataset/#tas for details). Each tag association is represented as a single line. The line consists of 6 columns separated by tabs:
column 1. user id
column 2. tag
column 3. resource id
column 4. 1 (obsolete artifact of BibSonomy dataset, see the link for details)
column 5. time stamp
column 6. resource title

4.System requirements
The requirements are: Java Runtime Environment (http://java.sun.com/javase/downloads/index.jsp), 1 GB of operational memory and around 0.5 GB of hard drive space (for Stack Overflow dataset processing).

5.Running the Experiment
To run the experiment for Stack Overflow dataset just use the “runSO_tagRecommendation” script for *nix system or “runSO_tagRecommendation.bat” for Windows system. Every ten seconds during the experiment the system will print a control message which presents the number of posts processed so far and the last line that was read from the input file. The results will be printed to “data/SO/recommendationResults/”. To evaluate the results and print quality scores use “evalSO_tagRecommendation” or “evalSO_tagRecommendation.bat”. A *.myEval file corresponding to each result file will be created in the same folder. The columns of the result file are:
column 1. the number of top tags that were evaluated
column 2. average recall@k calculated over all evaluated posts
column 3. average precision@k calculated over all evaluated posts
column 4. F1-score calculated based on the average recall and precision