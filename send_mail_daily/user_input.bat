#!/bin/bash
read -p "Enter Your Name: "  username
echo "Welcome $username!"





set message=1000
echo %message%



pause

# R CMD BATCH C:\Tasks\Days_Left\days_left.R
# C:\"Program Files"\R\R-3.3.0\bin\R.exe CMD BATCH C:\Tasks\Days_Left\days_left.R


for /f "tokens=1-4 delims=/ " %%i in ("%date%") do (
     set dow=%%i
     set month=%%j
     set day=%%k
     set year=%%l
)
set datestr=%month%_%day%_%year%
echo datestr is %datestr%

%date%
REM @echo off