# !!! CURRENTLY THIS WILL INTERATE OVER ALL THE MONTHS SET IN THE FOR LOOP

import nflgame
import csv

# def rb():
#     games = nflgame.games(2014, week=1)
#     players = nflgame.combine_max_stats(games)
#     for p in players.filter(passing_att__ge=0):
#          print p, p.team, p.home, p.rushing_att, p.rushing_lng, p.rushing_lngtd, p.rushing_tds, p.rushing_twopta, p.rushing_twoptm, p.rushing_twoptmissed, p.rushing_yds


# def qb():
#     games = nflgame.games(2014, week=1)
#     players = nflgame.combine_max_stats(games)
#     for p in players.filter(passing_att__ge=1):
#         print p, "QB", p.team, p.home, p.passing_att, p.passing_cmp, p.passing_cmp_air_yds, p.passing_incmp, p.passing_incmp_air_yds, p.passing_int, p.passing_ints, p.passing_sk, p.passing_sk_yds, p.passing_tds, p.passing_twopta, p.passing_twoptm, p.passing_twoptmissed, p.passing_yds


# g.players.passing().csv("passers.csv")



# time param
# p.player will give you the position included in the name
week_str = 13
subject = 'receiving'

#-------------- MULTI WEEK OUTPUT -----------------------------------

# for week_str in range(1,12):
#     game = nflgame.games(2014, week=week_str)
#     players = nflgame.combine_max_stats(game)
#     demo = nflgame.players
#     headers = ["NEWPLAYER", "PLAYER", "WEEK", "TEAM", "HOME", "RECEIVING_LNG", "RECEIVING_LNGTD", "RECEIVING_REC", "RECEIVING_TAR", "RECEIVING_TDS", "RECEIVING_TWOPTA", "RECEIVING_TWOPTM", "RECEIVING_TWOPTMISSED", "RECEIVING_YAC_YDS", "RECEIVING_YDS"]
#     with open("2014_%s_wk%d_max_stats_no_header.csv" % (subject, week_str), 'wb') as f: 
#         writer = csv.writer(f,delimiter=",")
#         #writer.writerow(headers)
#         for p in players.receiving():
#             writer.writerow([
#                 p, 
#                 "%d" % (week_str), 
#                 p.team, 
#                 p.home, 
#                 p.receiving_lng, 
#                 p.receiving_lngtd, 
#                 p.receiving_rec, 
#                 p.receiving_tar, 
#                 p.receiving_tds, 
#                 p.receiving_twopta, 
#                 p.receiving_twoptm, 
#                 p.receiving_twoptmissed, 
#                 p.receiving_yac_yds, 
#                 p.receiving_yds])
# week_str +=1  


# ------------------ SINGLE WEEK OUTPUT -----------------------------

game = nflgame.games(2014, week=week_str)
players = nflgame.combine_max_stats(game)
demo = nflgame.players
headers = ["NEWPLAYER", "PLAYER", "WEEK", "TEAM", "HOME", "RECEIVING_LNG", "RECEIVING_LNGTD", "RECEIVING_REC", "RECEIVING_TAR", "RECEIVING_TDS", "RECEIVING_TWOPTA", "RECEIVING_TWOPTM", "RECEIVING_TWOPTMISSED", "RECEIVING_YAC_YDS", "RECEIVING_YDS"]
with open("2014_%s_wk%d_max_stats_no_header.csv" % (subject, week_str), 'wb') as f: 
    writer = csv.writer(f,delimiter=",")
    #writer.writerow(headers)
    for p in players.receiving():
        writer.writerow([
            p, 
            "%d" % (week_str), 
            p.team, 
            p.home, 
            p.receiving_lng, 
            p.receiving_lngtd, 
            p.receiving_rec, 
            p.receiving_tar, 
            p.receiving_tds, 
            p.receiving_twopta, 
            p.receiving_twoptm, 
            p.receiving_twoptmissed, 
            p.receiving_yac_yds, 
            p.receiving_yds])



