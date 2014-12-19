#!/bin/bash

#######################################################################################################
# Data load script to local postgres db
# This script can be used to load multiple nflgame csv files or a single one at a time
#
#
#
#
#
######################################################################################################

#sudo -u brian psql -d nflgame -c "SELECT * FROM nflgame_rushing;"

# --------- load a single file --------------------------

# sudo -u brian psql -d nflgame -c "\COPY nflgame_passing FROM '/Users/Brian/programming/nflgame/data/2014_passing_wk1_max_stats_no_header.csv' DELIMITER ',' CSV;"

# --------- loop through multiple files -----------------
# control the limit by adjusting the range of the while statement

cnt=1
while [ $cnt -lt 16 ]
do
  sudo -u brian psql -d nflgame -c "\COPY nflgame_rushing FROM '/Users/Brian/programming/nflgame/data/2014_rushing_wk"$cnt"_max_stats_no_header.csv' DELIMITER ',' CSV;"
  cnt=$[$cnt+1]
done