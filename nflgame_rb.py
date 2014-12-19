# !!! CURRENTLY THIS WILL INTERATE OVER ALL THE WEEKS SET IN THE FOR LOOP
# 12/18/2014 added year to output

import nflgame
import csv

# !!! Single Week Writer !!!!

# def rb():
#     games = nflgame.games(2014, week=1)
#     players = nflgame.combine_max_stats(games)
#     for p in players.filter(passing_att__ge=0):
#          print p, p.team, p.home, p.rushing_att, p.rushing_lng, p.rushing_lngtd, p.rushing_tds, p.rushing_twopta, p.rushing_twoptm, p.rushing_twoptmissed, p.rushing_yds


# g.players.passing().csv("passers.csv")

# time param
week_str = 1
subject = 'rushing'

#------------------ MULTI-WEEK OUTPUT -------------------------------

for week_str in range(1,16):
    game = nflgame.games(2014, week=week_str)
    players = nflgame.combine_max_stats(game)
    headers = ["PLAYER", "WEEK", "TEAM", "HOME", "RUSHING_ATT", "RUSHING_LNG", "RUSHING_LNGTD", "RUSHING_TDS", "RUSHING_TWOPA", "RUSHING_TWOPTM", "RUSHING_TWOPTMISSED", "RUSHING_YDS"]
    with open("2014_%s_wk%d_max_stats_no_header.csv" % (subject, week_str), 'wb') as f: 
        writer = csv.writer(f,delimiter=",")
        #writer.writerow(headers)
        for p in players.rushing():
            writer.writerow([
                p,
                "2014",
                "%d" % (week_str), 
                p.team, 
                p.home, 
                p.rushing_att, 
                p.rushing_lng, 
                p.rushing_lngtd, 
                p.rushing_tds, 
                p.rushing_twopa, 
                p.rushing_twoptm, 
                p.rushing_twoptmissed, 
                p.rushing_yds])
week_str +=1        


#------------------ SINGLE-WEEK OUTPUT -------------------------------

# game = nflgame.games(2014,week=week_str)
# players = nflgame.combine_max_stats(game)
# headers = ["PLAYER", "WEEK", "TEAM", "HOME", "RUSHING_ATT", "RUSHING_LNG", "RUSHING_LNGTD", "RUSHING_TDS", "RUSHING_TWOPA", "RUSHING_TWOPTM", "RUSHING_TWOPTMISSED", "RUSHING_YDS"]
# with open("2014_%s_wk%d_max_stats_no_header.csv" % (subject, week_str), 'wb') as f: 
#     writer = csv.writer(f,delimiter=",")
#     #writer.writerow(headers)
#     for p in players.rushing():
#         writer.writerow([
#             p, 
#             "2014",
#             "%d" % (week_str),
#             p.team, 
#             p.home, 
#             p.rushing_att, 
#             p.rushing_lng, 
#             p.rushing_lngtd, 
#             p.rushing_tds, 
#             p.rushing_twopa, 
#             p.rushing_twoptm, 
#             p.rushing_twoptmissed, 
#             p.rushing_yds])




