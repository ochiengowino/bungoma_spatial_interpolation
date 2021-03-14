# Tests-for-GeoSpatial-Data-Scientist

Dear applicant of the vacant "GeoSpatial Data Scientist" position at Cropnuts! You made it through the first screening round. 8 applicants are left from about 50 ones! Congratulations.

My name is Thomas Terhoeven-Urselmans and I am Head of Data Science group of Cropnuts. 

I would like to invite you to participate at this test and send back the results by email before Thursday 23rd of July 1pm EAT. Applicants not participating at the test will not be invited for job interview.
3-4 of you will be invited for job interviews based on the performance in the test and the CV. The invitation will come before Thursday evening. Interviews are scheduled for Friday 24th 2020 roughly between 10 am and 1pm. 
Dear applicant of the vacant "GeoSpatial Data Scientist" position at Cropnuts! You made it through the first screening round. 8 applicants are left from about 50 ones! Congratulations.

My name is Thomas Terhoeven-Urselmans and I am Head of Data Science group of Cropnuts. 

I would like to invite you to participate at this test and send back the results by email before Thursday 23rd of July 1pm EAT. Applicants not participating at the test will not be invited for job interview.
3-4 of you will be invited for job interviews based on the performance in the test and the CV. The invitation will come before Thursday evening. Interviews are scheduled for Friday 24th 2020 roughly between 10 am and 1pm. 
We hope that this tight schedule will be possible for you.

Regards,

Thomas Terhoeven-Urselmans

Find instructions on the test in the "README.md"-file that is within the attached zip-file.

Have fun,

Regards,

Thomas Terhoeven-Urselmans

Instructions:
-	you are principally free to use all open source and free of charge software, but using either R or python for this task is preferred! Please contact me before you start in case you use not R or python!
-	there are many correct ways to conduct a given task. I would like to invite you to become creative, founded on scientific grounds! Work on the parts that you manage. It is not required to finalize all.
-	the aim is to work not longer than 3-4 hours on this - please note how long (about) you needed for the below tasks
-	Tasks:
1. Load data 
	-	you will find an R workspace in inputData-folder
	-	in there you will find two Spatial*-objects of class SpatialPointDataFrame and SpatialPolygonsDataFrame
2. Conduct data cleaning and note down in "Applicants-remarks.txt" what you have done
3. Conduct spatial interpolation(s) of the soil property given (soil pH value determined in water and soil organic matter content (%) determined with Walkley-Black reference method) to cover the SpatialPolygonDataFrame included 
	-	I would propose to base the interpolation on evenly spaced points having a distance of 200 m
	-	you are free to choose any interpolation method you would propose for this type of data
	-	if you opt not to apply interpolation for the full area, please justify this
	-	you may use additional/other data layers in order to get a better result - in that case please add them to the inputData-folder
4. Vizualize the interpolated maps and store as jpeg in outputData-folder
5. Optional - you are welcome to conduct any other analysis of the data at hand that you think might be valueable for Cropnuts clients (creativity is welcome)!
6. Please store the SpatialPointDataFrame in a geo-database (preferably postgresql with postgis extension). Share the script you used and the db-file in scripts- and outputData-folder, respectively.
7. Please note everything that you would like to share in the file "Applicants-remarks.txt"
-	Please share your results via your github account to us (TTU-general) including all your scripts, evtl. additional inputs, generated outputs and remarks back to me
-	If that does not work out, send a zip-file of the repository to thomas.tu@cropnuts.com before 23rd July 2020 1 pm. Please submit what you manage to do.