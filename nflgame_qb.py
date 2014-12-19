# !!! CURRENTLY THIS WILL INTERATE OVER ALL THE MONTHS SET IN THE FOR LOOP

import nflgame
import csv

#-------------------------------------------------------------------------------------------------------------

# time param
# p.player will give you the position included in the name
week_str = 15
subject = 'passing'

#------------------ MULTI-WEEK OUTPUT -------------------------------

# for week_str in range(1,12):
#     game = nflgame.games(2014, week=week_str)
#     players = nflgame.combine_max_stats(game)
#     demo = nflgame.players
#     #headers = ["NEWPLAYER", "PLAYER", "WEEK", "TEAM", "HOME", "RECEIVING_LNG", "RECEIVING_LNGTD", "RECEIVING_REC", "RECEIVING_TAR", "RECEIVING_TDS", "RECEIVING_TWOPTA", "RECEIVING_TWOPTM", "RECEIVING_TWOPTMISSED", "RECEIVING_YAC_YDS", "RECEIVING_YDS"]
#     with open("2014_%s_wk%d_max_stats_no_header.csv" % (subject, week_str), 'wb') as f: 
#         writer = csv.writer(f,delimiter=",")
#         #writer.writerow(headers)
#         for p in players.passing():
#             writer.writerow([
#                 p, 
#                 "%d" % (week_str), 
#                 p.team, 
#                 p.home, 
#                 p.passing_att, 
#                 p.passing_cmp, 
#                 p.passing_cmp_air_yds, 
#                 p.passing_incmp, 
#                 p.passing_incmp_air_yds, 
#                 p.passing_int, 
#                 p.passing_ints, 
#                 p.passing_sk, 
#                 p.passing_sk_yds, 
#                 p.passing_tds,
#                 p.passing_twopta,
#                 p.passing_twoptm,
#                 p.passing_twoptmissed,
#                 p.passing_yds])
# week_str +=1  

#------------- SINGLE WEEK OUTPUT ----------------------------------

game = nflgame.games(2014, week=week_str)
players = nflgame.combine_max_stats(game)
demo = nflgame.players
#headers = ["NEWPLAYER", "PLAYER", "WEEK", "TEAM", "HOME", "RECEIVING_LNG", "RECEIVING_LNGTD", "RECEIVING_REC", "RECEIVING_TAR", "RECEIVING_TDS", "RECEIVING_TWOPTA", "RECEIVING_TWOPTM", "RECEIVING_TWOPTMISSED", "RECEIVING_YAC_YDS", "RECEIVING_YDS"]
with open("2014_%s_wk%d_max_stats_no_header.csv" % (subject, week_str), 'wb') as f: 
    writer = csv.writer(f,delimiter=",")
    #writer.writerow(headers)
    for p in players.passing():
        writer.writerow([
            p, 
            "%d" % (week_str), 
            p.team, 
            p.home, 
            p.passing_att, 
            p.passing_cmp, 
            p.passing_cmp_air_yds, 
            p.passing_incmp, 
            p.passing_incmp_air_yds, 
            p.passing_int, 
            p.passing_ints, 
            p.passing_sk, 
            p.passing_sk_yds, 
            p.passing_tds,
            p.passing_twopta,
            p.passing_twoptm,
            p.passing_twoptmissed,
            p.passing_yds])


