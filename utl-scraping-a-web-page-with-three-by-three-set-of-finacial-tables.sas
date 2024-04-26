%let pgm=utl-scraping-a-web-page-with-three-by-three-set-of-finacial-tables;

Scraping a web page with three by three set of finacial tables
https://tinyurl.com/49tyrt8v
https://www.e-adm.com/futr/futr_composite_window.asp

   Two Solutios

    1. Cut and paste into excel
       https://tinyurl.com/2fkpxapj
       https://github.com/rogerjdeangelis/utl-scraping-a-web-page-with-three-by-three-set-of-finacial-tables/blob/main/finance.xlsx

    2. r scrape using rvest


    github
    https://tinyurl.com/ern6pjsn
    https://github.com/rogerjdeangelis/utl-scraping-a-web-page-with-three-by-three-set-of-finacial-tables

    inspired by
    https://goo.gl/3AUClh
    http://stackoverflow.com/questions/42087955/web-scrape-data-from-finance-website-using-r-rvest

 /*              _     _
 _ __  _ __ ___ | |__ | | ___ _ __ ___
| `_ \| `__/ _ \| `_ \| |/ _ \ `_ ` _ \
| |_) | | | (_) | |_) | |  __/ | | | | |
| .__/|_|  \___/|_.__/|_|\___|_| |_| |_|
|_|
*/

/**********************************************************************************************************************************************/
/*                                                             |                                 |                                            */
/*                                                             |                                 |                                            */
/*                     INPUT                                   |        PROCESS                  |                 OUTPUT                     */
/*                     =====                                   |        =======                  |                 ======                     */
/*                                                             |                                 |                                            */
/*  Web Page (tundated for display                             | %utl_rbegin;                    | Obs  X1      X2       X3     X4      X5    */
/*  https://tinyurl.com/49tyrt8v                               | parmcards4;                     |                                            */
/*  https://www.e-adm.com/futr/futr_composite_window.asp       | library(rvest);                 |  1   Corn    Corn    Corn   Corn    Corn   */
/*                                                             | source("c:/temp/fn_tosas9.R")   |  2           LAST     CHG   HIGH    LOW    */
/* +------------------------+------------------+-------------- | url =                           |  3   May 24  440'0    -1'0  442'6   439'0  */
/* |Corn (Composite)   |Soybeans          |Lettuces          | |  'https://tinyurl.com/49tyrt8v';|  4   Jul 24  450'2    -1'6  454'0   449'2  */
/* |         LAST   CHG|      LAST     CHG|      LAST     CHG| | tableList <- read_html(url) %>% |  5   Sep 24  459'4    -2'2  463'2   458'6  */
/* |Mar 17  369'6  1'2 |Mar 17 1058'4 15'6|Mar 17 1058'4 15'6| |     html_nodes('.miniText') %>% |  6   Dec 24  473'2    -3'0  477'2   473'0  */
/* |May 17  377'6  1'6 |May 17 1068'6 15'4|May 17 1068'6 15'4| |     html_nodes('td table') %>%  |  7   Mar 25  486'6    -2'6  490'0   486'2  */
/* |Jul 17  384'4  1'2 |Jul 17 1076'2 14'6|Jul 17 1076'2 14'6| |     html_table();               |  8   May 25  495'4    -3'2  498'6   495'0  */
/* |Sep 17  390'2  0'4 |Aug 17 1072'2 13'2|Aug 17 1072'2 13'2| |     tableList[[9]];             |  9   Jul 25  502'0    -3'4  505'4   501'4  */
/* |Dec 17  396'6  0'4 |Sep 17 1049'4 11'0|Sep 17 1049'4 11'0| |     for (i in 1:9) {            | 10   Rice    Rice     Rice  Rice    Rice   */
/* |Mar 18  404'4  0'4 |Nov 17 1027'6 8'2 |Nov 17 1027'6 8'2 | |       assign(paste('tbl'        | 11           LAST     CHG   HIGH    LOW    */
/* |May 18  409'2  1'6 |Jan 18 1030'0 6'0 |Jan 18 1030'0 6'0 | |        ,i                       | 12   May 24  1159'2   -3'4  1164'0  1155'0 */
/* +-------------------+------------------+------------------+ |        ,sep = '')               | 13   Jul 24  1177'0   -2'6  1181'0  1172'4 */
/* |Corn (Composite)   |Soybeans          |Lettuces          | |        ,tableList[[i]]);        | 14   Aug 24  1180'2   -2'6  1183'6  1176'0 */
/* |         LAST   CHG|      LAST     CHG|      LAST     CHG| |     };                          | 15   Sep 24  1170'4   -1'6  1173'0  1165'6 */
/* |Mar 17  369'6  1'2 |Mar 17 1058'4 15'6|Mar 17 1058'4 15'6| | want<-rbind(tbl1,tbl2,tbl3,tbl4 | 16   Nov 24  1174'6   -0'6  1177'2  1169'6 */
/* |May 17  377'6  1'6 |May 17 1068'6 15'4|May 17 1068'6 15'4| |  ,tbl5,tbl6,tbl7,tbl8,tbl9);    | 17   Jan 25  1185'4   -0'4  1187'6  1180'4 */
/* |Jul 17  384'4  1'2 |Jul 17 1076'2 14'6|Jul 17 1076'2 14'6| | want;                           | 18   Mar 25  1186'0   1'0   1187'4  1180'0 */
/* |Sep 17  390'2  0'4 |Aug 17 1072'2 13'2|Aug 17 1072'2 13'2| | fn_tosas9(dataf=want);          | ...                                        */
/* |Dec 17  396'6  0'4 |Sep 17 1049'4 11'0|Sep 17 1049'4 11'0| | ;;;;                            | 73   Oats    Oats     OATS  Oats    Oats   */
/* |Mar 18  404'4  0'4 |Nov 17 1027'6 8'2 |Nov 17 1027'6 8'2 | | %utl_rend;                      | 74           LAST     CHG   HIGH    LOW    */
/* |May 18  409'2  1'6 |Jan 18 1030'0 6'0 |Jan 18 1030'0 6'0 | | options ls=255;                 | 75   May 24  1159'2   -3'4  1164'0  1155'0 */
/* +-------------------+------------------+------------------+ | libname tmp "c:/temp";          | 76   Jul 24  1177'0   -2'6  1181'0  1172'4 */
/*                                                             | proc print data=tmp.want;       | 77   Aug 24  1180'2   -2'6  1183'6  1176'0 */
/*                                                             | run;quit;                       | 78   Sep 24  1170'4   -1'6  1173'0  1165'6 */
/*                                                             |                                 | 79   Nov 24  1174'6   -0'6  1177'2  1169'6 */
/*                                                             | tableList#                      | 10   Jan 25  1185'4   -0'4  1187'6  1180'4 */
/*                                                             | source("c:/temp/fn_tosas9.R")   | 81   Mar 25  1186'0   1'0   1187'4  1180'0 */
/*                                                             | fn_tosas9(dataf=want);          |                                            */
/*                                                             |                                 |                                            */
/**********************************************************************************************************************************************/


/*   _     _       _     _ _       _     _                     _                          _
/ | | |__ (_) __ _| |__ | (_) __ _| |__ | |_   _ __   __ _ ___| |_ ___   _____  _____ ___| |
| | | `_ \| |/ _` | `_ \| | |/ _` | `_ \| __| | `_ \ / _` / __| __/ _ \ / _ \ \/ / __/ _ \ |
| | | | | | | (_| | | | | | | (_| | | | | |_  | |_) | (_| \__ \ ||  __/|  __/>  < (_|  __/ |
|_| |_| |_|_|\__, |_| |_|_|_|\__, |_| |_|\__| | .__/ \__,_|___/\__\___| \___/_/\_\___\___|_|
             |___/           |___/            |_|
*/

Manually go to the page and highlight and paste into excel

see

/*___                                                               _
|___ \   _ __   ___  ___ _ __ __ _ _ __   ___   _ ____   _____  ___| |_
  __) | | `__| / __|/ __| `__/ _` | `_ \ / _ \ | `__\ \ / / _ \/ __| __|
 / __/  | |    \__ \ (__| | | (_| | |_) |  __/ | |   \ V /  __/\__ \ |_
|_____| |_|    |___/\___|_|  \__,_| .__/ \___| |_|    \_/ \___||___/\__|
 _                   _            |_|
(_)_ __  _ __  _   _| |_
| | `_ \| `_ \| | | | __|
| | | | | |_) | |_| | |_
|_|_| |_| .__/ \__,_|\__|
        |_|
*/

/**************************************************************************************************************************/
/*                                                                                                                        */
/*   Web Page (tundated for display                                                                                       */
/*   https://tinyurl.com/49tyrt8v                                                                                         */
/*   https://www.e-adm.com/futr/futr_composite_window.asp                                                                 */
/*                                                                                                                        */
/*  +------------------------+------------------+--------------                                                           */
/*  |Corn (Composite)   |Soybeans          |Lettuces          |                                                           */
/*  |         LAST   CHG|      LAST     CHG|      LAST     CHG|                                                           */
/*  |Mar 17  369'6  1'2 |Mar 17 1058'4 15'6|Mar 17 1058'4 15'6|                                                           */
/*  |May 17  377'6  1'6 |May 17 1068'6 15'4|May 17 1068'6 15'4|                                                           */
/*  |Jul 17  384'4  1'2 |Jul 17 1076'2 14'6|Jul 17 1076'2 14'6|                                                           */
/*  |Sep 17  390'2  0'4 |Aug 17 1072'2 13'2|Aug 17 1072'2 13'2|                                                           */
/*  |Dec 17  396'6  0'4 |Sep 17 1049'4 11'0|Sep 17 1049'4 11'0|                                                           */
/*  |Mar 18  404'4  0'4 |Nov 17 1027'6 8'2 |Nov 17 1027'6 8'2 |                                                           */
/*  |May 18  409'2  1'6 |Jan 18 1030'0 6'0 |Jan 18 1030'0 6'0 |                                                           */
/*  +-------------------+------------------+------------------+                                                           */
/*  |Corn (Composite)   |Soybeans          |Lettuces          |                                                           */
/*  |         LAST   CHG|      LAST     CHG|      LAST     CHG|                                                           */
/*  |Mar 17  369'6  1'2 |Mar 17 1058'4 15'6|Mar 17 1058'4 15'6|                                                           */
/*  |May 17  377'6  1'6 |May 17 1068'6 15'4|May 17 1068'6 15'4|                                                           */
/*  |Jul 17  384'4  1'2 |Jul 17 1076'2 14'6|Jul 17 1076'2 14'6|                                                           */
/*  |Sep 17  390'2  0'4 |Aug 17 1072'2 13'2|Aug 17 1072'2 13'2|                                                           */
/*  |Dec 17  396'6  0'4 |Sep 17 1049'4 11'0|Sep 17 1049'4 11'0|                                                           */
/*  |Mar 18  404'4  0'4 |Nov 17 1027'6 8'2 |Nov 17 1027'6 8'2 |                                                           */
/*  |May 18  409'2  1'6 |Jan 18 1030'0 6'0 |Jan 18 1030'0 6'0 |                                                           */
/*  +-------------------+------------------+------------------+                                                           */
/*                                                                                                                        */
/**************************************************************************************************************************/

/*
 _ __  _ __ ___   ___ ___  ___ ___
| `_ \| `__/ _ \ / __/ _ \/ __/ __|
| |_) | | | (_) | (_|  __/\__ \__ \
| .__/|_|  \___/ \___\___||___/___/
|_|
*/

%utl_rbegin;
parmcards4;
library(rvest);
source("c:/temp/fn_tosas9.R")
url =
 'https://tinyurl.com/49tyrt8v';
tableList <- read_html(url) %>%
    html_nodes('.miniText') %>%
    html_nodes('td table') %>%
    html_table();
    tableList[[9]];
    for (i in 1:9) {
      assign(paste('tbl'
       ,i
       ,sep = '')
       ,tableList[[i]]);
    };
want<-rbind(tbl1,tbl2,tbl3,tbl4,tbl5
 ,tbl6,tbl7,tbl8,tbl9);
want;
fn_tosas9(dataf=want);
;;;;
%utl_rend;

options ls=255;
libname tmp "c:/temp";
proc print data=tmp.want;
run;quit;


/*       _                               _ _       _         _ _ _                   _       _
(_)_ __ | |_ ___ _ __ _ __ ___   ___  __| (_) __ _| |_ ___  | (_) | _____   ___   __| |___  | |_ _ __ __ _  ___ ___
| | `_ \| __/ _ \ `__| `_ ` _ \ / _ \/ _` | |/ _` | __/ _ \ | | | |/ / _ \ / _ \ / _` / __| | __| `__/ _` |/ __/ _ \
| | | | | ||  __/ |  | | | | | |  __/ (_| | | (_| | ||  __/ | | |   <  __/| (_) | (_| \__ \ | |_| | | (_| | (_|  __/
|_|_| |_|\__\___|_|  |_| |_| |_|\___|\__,_|_|\__,_|\__\___| |_|_|_|\_\___| \___/ \__,_|___/  \__|_|  \__,_|\___\___|
*/

/**************************************************************************************************************************/
/*                                                                                                                        */
/* List of 9                                                                                                              */
/*  $ : tibble [9 x 5] (S3: tbl_df/tbl/data.frame)                                                                        */
/*   ..$ X1: chr [1:9] "Corn                   " "" "May 24" "Jul 24" ...                                                 */
/*   ..$ X5: chr [1:9] "Corn                   " "LOW" "439'0" "449'2" ...                                                */
/*  $ : tibble [9 x 5] (S3: tbl_df/tbl/data.frame)                                                                        */
/*   ..$ X1: chr [1:9] "Soybeans (Composite) ( QBS)" "" "May 24" "Jul 24" ...                                             */
/*   ..$ X5: chr [1:9] "Soybeans (Composite) ( QBS)" "LOW" "1155'0" "1172'4" ...                                          */
/*  $ : tibble [9 x 5] (S3: tbl_df/tbl/data.frame)                                                                        */
/*   ..$ X1: chr [1:9] "Wheat-CBOT (Composite) ( QBW)" "" "May 24" "Jul 24" ...                                           */
/*   ..$ X5: chr [1:9] "Wheat-CBOT (Composite) ( QBW)" "LOW" "598'2" "616'2" ...                                          */
/*  $ : tibble [9 x 5] (S3: tbl_df/tbl/data.frame)                                                                        */
/*   ..$ X1: chr [1:9] "Wheat-KCBOT (Electronic) ( KE)" "" "May 24" "Jul 24" ...                                          */
/*   ..$ X5: chr [1:9] "Wheat-KCBOT (Electronic) ( KE)" "LOW" "627'4" "636'4" ...                                         */
/*  $ : tibble [9 x 5] (S3: tbl_df/tbl/data.frame)                                                                        */
/*   ..$ X1: chr [1:9] "Wheat-MGE (Electronic) ( MWE)" "" "May 24" "Jul 24" ...                                           */
/*   ..$ X5: chr [1:9] "Wheat-MGE (Electronic) ( MWE)" "LOW" "688'4" "694'6" ...                                          */
/*  $ : tibble [9 x 5] (S3: tbl_df/tbl/data.frame)                                                                        */
/*   ..$ X1: chr [1:9] "Rapeseed (Canola) ( RS-WC)" "" "May 24" "Jul 24" ...                                              */
/*   ..$ X5: chr [1:9] "Rapeseed (Canola) ( RS-WC)" "LOW" "616.7" "633.4" ...                                             */
/*  $ : tibble [9 x 5] (S3: tbl_df/tbl/data.frame)                                                                        */
/*   ..$ X1: chr [1:9] "Soybean Meal (Composite) ( QSM)" "" "May 24" "Jul 24" ...                                         */
/*   ..$ X5: chr [1:9] "Soybean Meal (Composite) ( QSM)" "LOW" "339.5" "344.0" ..                                         */
/*  $ : tibble [9 x 5] (S3: tbl_df/tbl/data.frame)                                                                        */
/*   ..$ X1: chr [1:9] "Soybean Oil (Composite) ( QBO)" "" "May 24" "Jul 24" ...                                          */
/*   ..$ X4: chr [1:9] "Soybean Oil (Composite) ( QBO)" "HIGH" "45.13" "45.75" ..                                         */
/*   ..$ X5: chr [1:9] "Soybean Oil (Composite) ( QBO)" "LOW" "44.66" "45.27" ...                                         */
/*  $ : tibble [9 x 5] (S3: tbl_df/tbl/data.frame)                                                                        */
/*   ..$ X1: chr [1:9] "Oats (Composite) ( QZO)" "" "May 24" "Jul 24" ...                                                 */
/*   ..$ X5: chr [1:9] "Oats (Composite) ( QZO)" "LOW" "363'4" "352'2" ...                                                */
/*                                                                                                                        */
/**************************************************************************************************************************/

/*           _               _
  ___  _   _| |_ _ __  _   _| |_
 / _ \| | | | __| `_ \| | | | __|
| (_) | |_| | |_| |_) | |_| | |_
 \___/ \__,_|\__| .__/ \__,_|\__|
                |_|
*/

options ps=100;
data x ;
  set tmp.want(drop=rownames);
  x1=scan(x1,1,'(');
  x2=scan(x2,1,'(');
  x3=scan(x3,1,'(');
  x4=scan(x4,1,'(');
  x5=scan(x5,1,'(');
run;quit;

/**************************************************************************************************************************/
/*                                                                                                                        */
/* Obs    X1              X2              X3              X4              X5                                              */
/*                                                                                                                        */
/*   1    Corn            Corn            Corn            Corn            Corn                                            */
/*   2                    LAST            CHG             HIGH            LOW                                             */
/*   3    May 24          440'0           -1'0            442'6           439'0                                           */
/*   4    Jul 24          450'2           -1'6            454'0           449'2                                           */
/*   5    Sep 24          459'4           -2'2            463'2           458'6                                           */
/*   6    Dec 24          473'2           -3'0            477'2           473'0                                           */
/*   7    Mar 25          486'6           -2'6            490'0           486'2                                           */
/*   8    May 25          495'4           -3'2            498'6           495'0                                           */
/*   9    Jul 25          502'0           -3'4            505'4           501'4                                           */
/*  10    Soybeans        Soybeans        Soybeans        Soybeans        Soybeans                                        */
/*  11                    LAST            CHG             HIGH            LOW                                             */
/*  12    May 24          1159'2          -3'4            1164'0          1155'0                                          */
/*  13    Jul 24          1177'0          -2'6            1181'0          1172'4                                          */
/*  14    Aug 24          1180'2          -2'6            1183'6          1176'0                                          */
/*  15    Sep 24          1170'4          -1'6            1173'0          1165'6                                          */
/*  16    Nov 24          1174'6          -0'6            1177'2          1169'6                                          */
/*  17    Jan 25          1185'4          -0'4            1187'6          1180'4                                          */
/*  18    Mar 25          1186'0          1'0             1187'4          1180'0                                          */
/*  19    Wheat-CBOT      Wheat-CBOT      Wheat-CBOT      Wheat-CBOT      Wheat-CBOT                                      */
/*  20                    LAST            CHG             HIGH            LOW                                             */
/*  21    May 24          604'0           1'6             614'4           598'2                                           */
/*  22    Jul 24          622'4           2'0             633'2           616'2                                           */
/*  23    Sep 24          642'2           3'0             652'2           635'2                                           */
/*  24    Dec 24          665'6           3'4             675'4           658'4                                           */
/*  25    Mar 25          684'2           3'6             693'4           676'6                                           */
/*  26    May 25          692'6           4'6             701'0           685'2                                           */
/*  27    Jul 25          687'4           5'0             696'0           679'4                                           */
/*  28    Wheat-KCBOT     Wheat-KCBOT     Wheat-KCBOT     Wheat-KCBOT     Wheat-KCBOT                                     */
/*  29                    LAST            CHG             HIGH            LOW                                             */
/*  30    May 24          645'4           13'4            655'0           627'4                                           */
/*  31    Jul 24          653'6           13'2            662'6           636'4                                           */
/*  32    Sep 24          666'0           13'4            674'4           648'0                                           */
/*  33    Dec 24          683'4           12'6            692'6           668'0                                           */
/*  34    Mar 25          698'0           12'6            706'4           682'2                                           */
/*  35    May 25          703'2           13'0            710'2           689'2                                           */
/*  36    Jul 25          685'6           9'6             692'6           674'6                                           */
/*  37    Wheat-MGE       Wheat-MGE       Wheat-MGE       Wheat-MGE       Wheat-MGE                                       */
/*  38                    LAST            CHG             HIGH            LOW                                             */
/*  39    May 24          697'2           6'2             701'4           688'4                                           */
/*  40    Jul 24          703'4           5'2             708'2           694'6                                           */
/*  41    Sep 24          710'0           5'2             713'4           700'0                                           */
/*  42    Dec 24          723'6           6'0             727'0           713'6                                           */
/*  43    Mar 25          734'6           7'2             737'0           726'6                                           */
/*  44    May 25          732'6           1'4             732'6           732'6                                           */
/*  45    Jul 25          719'4           0'4             719'4           719'4                                           */
/*  46    Rapeseed        Rapeseed        Rapeseed        Rapeseed        Rapeseed                                        */
/*  47                    LAST            CHG             HIGH            LOW                                             */
/*  48    May 24          617.7           -5.1            626.2           616.7                                           */
/*  49    Jul 24          634.4           -2.5            640.9           633.4                                           */
/*  50    Nov 24          651.5           -2.2            657.3           650.7                                           */
/*  51    Jan 25          659.5           -2.4            664.2           658.6                                           */
/*  52    Mar 25          662.7           -3.0            667.1           662.5                                           */
/*  53    May 25          661.3           -3.1            662.7           662.7                                           */
/*  54    Jul 25          656.8           -1.6            656.8           656.8                                           */
/*  55    Soybean Meal    Soybean Meal    Soybean Meal    Soybean Meal    Soybean Meal                                    */
/*  56                    LAST            CHG             HIGH            LOW                                             */
/*  57    May 24          339.8           -4.1            343.6           339.5                                           */
/*  58    Jul 24          344.2           -3.4            347.6           344.0                                           */
/*  59    Aug 24          345.5           -3.1            348.7           345.3                                           */
/*  60    Sep 24          346.4           -2.8            349.4           346.2                                           */
/*  61    Oct 24          346.8           -2.5            349.1           346.6                                           */
/*  62    Dec 24          349.6           -2.1            351.8           349.0                                           */
/*  63    Jan 25          350.8           -1.6            352.2           349.9                                           */
/*  64    Soybean Oil     Soybean Oil     Soybean Oil     Soybean Oil     Soybean Oil                                     */
/*  65                    LAST            CHG             HIGH            LOW                                             */
/*  66    May 24          44.90           0.08            45.13           44.66                                           */
/*  67    Jul 24          45.56           0.13            45.75           45.27                                           */
/*  68    Aug 24          45.78           0.12            45.98           45.52                                           */
/*  69    Sep 24          45.92           0.16            46.08           45.68                                           */
/*  70    Oct 24          45.94           0.20            46.08           45.72                                           */
/*  71    Dec 24          46.20           0.26            46.33           45.86                                           */
/*  72    Jan 25          46.36           0.27            46.47           46.02                                           */
/*  73    Oats            Oats            Oats            Oats            Oats                                            */
/*  74                    LAST            CHG             HIGH            LOW                                             */
/*  75    May 24          373'0           6'0             373'6           363'4                                           */
/*  76    Jul 24          358'2           7'2             360'0           352'2                                           */
/*  77    Sep 24          357'4           5'0             357'4           352'0                                           */
/*  78    Dec 24          359'0           5'2             359'0           355'0                                           */
/*  79    Mar 25          363'2           5'0             363'2           363'2                                           */
/*  80    May 25          369'2           5'0             369'2           369'2                                           */
/*  81    Jul 25          374'0           5'0             374'0           374'0                                           */
/*                                                                                                                        */
/**************************************************************************************************************************/

/*              _
  ___ _ __   __| |
 / _ \ `_ \ / _` |
|  __/ | | | (_| |
 \___|_| |_|\__,_|

*/
