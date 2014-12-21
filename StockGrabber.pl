#!/usr/bin/perl
use warnings;
use strict;
use LWP::Simple;
use Finance::YahooQuote;
use Data::Dumper;

$Finance::YahooQuote::TIMEOUT = 60;
useExtendedQueryFormat();

my @stocks = ("AFSI", "AKRX", "AMG", "AOS", "BA", "BBSI", "BCOR", "BEAV", "BWLD", "CLB", "CTSH", "EEFT",
              "EFII", "GILD", "HURN", "HXL", "IGTE", "JAZZ", "KS", "LFUS", "LOPE", "LVS", "MA", "MCK",
              "MEOH", "MGA", "MIDD", "MKTX", "NKE", "PCP", "PII", "PKG", "PRAA", "PRGO", "RNET", "SAVE",
              "SBNY", "SBUX", "SHPG", "SIVB", "SNTS", "SSNC", "STN", "TRN", "UHAL", "WNS","CVR","ESTE",
              "ESYS","EVI","EVK","HEIA","LCI","MHH","NOG","SFBC","STZB","TIS","UIHC","WTT");

#Grab most of the yahoo finance using api
my @quotes = getquote @stocks;

my %AllStocks;
my $i = 0;

print "Symbol,CompanyName,LastPrice,LastTradeDate,LastTradeTime,Change,PercentChange,Volume,AverageDailyVol,Bid,Ask,PreviousClose,".
      "TodaysOpen,DaysRange,52WeekRange,EarningsPerShare,PERatio,DividendPayDate,DividendPerShare,DividendYield,MarketCapitalization,".
      "StockExchange,ShortRatio,1yrTargetPrice,EPSEstCurrentYr,EPSEstNextYear,EPSEstNextQuarter,PriceEPSEstCurrentYr,PriceEPSEstNextYr,".
      "PEGRatio,BookValue,PriceBook,PriceSales,EBITDA,50DayMovingAvg,200DayMovingAvg,MeanRecommendation,NoOfBrokers,TheStreetRating,".
      "NavellierFundamentalGrade,NavellierSalesGrowth,NavellierOperatingMarginGrowth,NavellierEarningsGrowth,NavellierEarningsMomentum,".
      "NavellierEarningsSurprises,NavellierAnalystEarningsRevisions,NavellierCashFlow,NavellierReturnOnEquity,NavellierQuantitativeGrade,".
      "NavellierTotalGrade,ZacksRating,NavellierRisk,MorningstarRating,MorningstarFairValueEstimate,MorningstarUncertainty,".
      "MorningstarConsiderBuy,MorningstarConsiderSell,MorningstarEconomicMoat,MorningstarCreditRating,MorningstarStewardshipRating\n";

for (my $i=0; $i < @stocks; $i++){
    $AllStocks{$stocks[$i]}{"Symbol"} = $quotes[$i][0];
    $AllStocks{$stocks[$i]}{"CompanyName"} = $quotes[$i][1];
    $AllStocks{$stocks[$i]}{"CompanyName"} =~ s/,//g;
    $AllStocks{$stocks[$i]}{"LastPrice"} = $quotes[$i][2];
    $AllStocks{$stocks[$i]}{"LastTradeDate"} = $quotes[$i][3];
    $AllStocks{$stocks[$i]}{"LastTradeTime"} = $quotes[$i][4];
    $AllStocks{$stocks[$i]}{"Change"} = $quotes[$i][5];
    $AllStocks{$stocks[$i]}{"PercentChange"} = $quotes[$i][6];
    $AllStocks{$stocks[$i]}{"Volume"} = $quotes[$i][7];
    $AllStocks{$stocks[$i]}{"AverageDailyVol"} = $quotes[$i][8];
    $AllStocks{$stocks[$i]}{"Bid"} = $quotes[$i][9];
    $AllStocks{$stocks[$i]}{"Ask"} = $quotes[$i][10];
    $AllStocks{$stocks[$i]}{"PreviousClose"} = $quotes[$i][11];
    $AllStocks{$stocks[$i]}{"TodaysOpen"} = $quotes[$i][12];
    $AllStocks{$stocks[$i]}{"DaysRange"} = $quotes[$i][13];
    $AllStocks{$stocks[$i]}{"52WeekRange"} = $quotes[$i][14];
    $AllStocks{$stocks[$i]}{"EarningsPerShare"} = $quotes[$i][15];
    $AllStocks{$stocks[$i]}{"PERatio"} = $quotes[$i][16];
    $AllStocks{$stocks[$i]}{"DividendPayDate"} = $quotes[$i][17];
    $AllStocks{$stocks[$i]}{"DividendPerShare"} = $quotes[$i][18];
    $AllStocks{$stocks[$i]}{"DividendYield"} = $quotes[$i][19];
    $AllStocks{$stocks[$i]}{"MarketCapitalization"} = $quotes[$i][20];
    $AllStocks{$stocks[$i]}{"StockExchange"} = $quotes[$i][21];
    $AllStocks{$stocks[$i]}{"ShortRatio"} = $quotes[$i][22];
    $AllStocks{$stocks[$i]}{"1yrTargetPrice"} = $quotes[$i][23];
    $AllStocks{$stocks[$i]}{"EPSEstCurrentYr"} = $quotes[$i][24];
    $AllStocks{$stocks[$i]}{"EPSEstNextYear"} = $quotes[$i][25];
    $AllStocks{$stocks[$i]}{"EPSEstNextQuarter"} = $quotes[$i][26];
    $AllStocks{$stocks[$i]}{"PriceEPSEstCurrentYr"} = $quotes[$i][27];
    $AllStocks{$stocks[$i]}{"PriceEPSEstNextYr"} = $quotes[$i][28];
    $AllStocks{$stocks[$i]}{"PEGRatio"} = $quotes[$i][29];
    $AllStocks{$stocks[$i]}{"BookValue"} = $quotes[$i][30];
    $AllStocks{$stocks[$i]}{"PriceBook"} = $quotes[$i][31];
    $AllStocks{$stocks[$i]}{"PriceSales"} = $quotes[$i][32];
    $AllStocks{$stocks[$i]}{"EBITDA"} = $quotes[$i][33];
    $AllStocks{$stocks[$i]}{"50DayMovingAvg"} = $quotes[$i][34];
    $AllStocks{$stocks[$i]}{"200DayMovingAvg"} = $quotes[$i][35];
    $AllStocks{$stocks[$i]}{"MeanRecommendation"} = "";
    $AllStocks{$stocks[$i]}{"NoOfBrokers"} = "";
    $AllStocks{$stocks[$i]}{"TheStreetRating"} = "";
    $AllStocks{$stocks[$i]}{"NavellierFundamentalGrade"} = "";
    $AllStocks{$stocks[$i]}{"NavellierSalesGrowth"} = "";
    $AllStocks{$stocks[$i]}{"NavellierOperatingMarginGrowth"} = "";
    $AllStocks{$stocks[$i]}{"NavellierEarningsGrowth"} = "";
    $AllStocks{$stocks[$i]}{"NavellierEarningsMomentum"} = "";
    $AllStocks{$stocks[$i]}{"NavellierEarningsSurprises"} = "";
    $AllStocks{$stocks[$i]}{"NavellierAnalystEarningsRevisions"} = "";
    $AllStocks{$stocks[$i]}{"NavellierCashFlow"} = "";
    $AllStocks{$stocks[$i]}{"NavellierReturnOnEquity"} = "";
    $AllStocks{$stocks[$i]}{"NavellierQuantitativeGrade"} = "";
    $AllStocks{$stocks[$i]}{"NavellierTotalGrade"} = "";
    $AllStocks{$stocks[$i]}{"ZacksRating"} = "";
    $AllStocks{$stocks[$i]}{"NavellierRisk"} = "";
    $AllStocks{$stocks[$i]}{"MorningstarRating"} = "";
    $AllStocks{$stocks[$i]}{"MorningstarFairValueEstimate"} = "";
    $AllStocks{$stocks[$i]}{"MorningstarUncertainty"} = "";
    $AllStocks{$stocks[$i]}{"MorningstarConsiderBuy"} = "";
    $AllStocks{$stocks[$i]}{"MorningstarConsiderSell"} = "";
    $AllStocks{$stocks[$i]}{"MorningstarEconomicMoat"} = "";
    $AllStocks{$stocks[$i]}{"MorningstarCreditRating"} = "";
    $AllStocks{$stocks[$i]}{"MorningstarStewardshipRating"} = "";

    my $YahooAnalyst = get("http://finance.yahoo.com/q/ao?s=$stocks[$i]+Analyst+Opinion") or die 'Unable to get page yahoo finance with stock '.$stocks[$i];
    my @YahooAnalystRows = split("\n", $YahooAnalyst);
    foreach my $row (@YahooAnalystRows) {
        if ($row =~ /Mean Recommendation \(this week\):<\/td><td class="yfnc_tabledata1">/) {
            $AllStocks{$stocks[$i]}{"MeanRecommendation"} = $row;
            $AllStocks{$stocks[$i]}{"NoOfBrokers"} = $row;

            $AllStocks{$stocks[$i]}{"MeanRecommendation"} =~ s/.*Mean Recommendation \(this week\):<\/td><td class="yfnc_tabledata1">//;
            $AllStocks{$stocks[$i]}{"MeanRecommendation"} =~ s/<\/td>.*//;

            $AllStocks{$stocks[$i]}{"NoOfBrokers"} =~ s/.*No\. of Brokers:<\/td><td class="yfnc_tabledata1">//;
            $AllStocks{$stocks[$i]}{"NoOfBrokers"} =~ s/<\/td>.*//;

            last;
        }
    }

    my $TheStreet = get("http://www.thestreet.com/quote/$stocks[$i]/details/analyst-ratings.html") or die 'Unable to get page thestreet with stock '.$stocks[$i];
    my @TheStreetRows = split("\n", $TheStreet);
    foreach my $row (@TheStreetRows) {
        if ($row =~ /"LetterGradeRating":"/) {
            $AllStocks{$stocks[$i]}{"TheStreetRating"} = $row;

            $AllStocks{$stocks[$i]}{"TheStreetRating"} =~ s/.*LetterGradeRating":"//;
            $AllStocks{$stocks[$i]}{"TheStreetRating"} =~ s/"}]}.*//;

            last;
        }
    }

    my $Navellier = get("http://navelliergrowth.investorplace.com/portfolio-grader/stock-report.html?t=$stocks[$i]") or die 'Unable to get navellier with stock '.$stocks[$i];
    my @NavellierRows = split("\n", $Navellier);

    for (my $x = 0; $x <= $#NavellierRows; ++$x) {
        local $_ = $NavellierRows[$x];
        if (/Volatility:<\/strong>/) {
            $AllStocks{$stocks[$i]}{"NavellierRisk"} = $NavellierRows[$x];
            $AllStocks{$stocks[$i]}{"NavellierRisk"} =~ s/.*Volatility:<\/strong>\s*//;
            $AllStocks{$stocks[$i]}{"NavellierRisk"} =~ s/<\/td>.*//;
        }
        if (/Fundamental Grade:/) {
            $AllStocks{$stocks[$i]}{"NavellierFundamentalGrade"} = $NavellierRows[++$x];
            $AllStocks{$stocks[$i]}{"NavellierFundamentalGrade"} =~ s/.*"25%">//;
            $AllStocks{$stocks[$i]}{"NavellierFundamentalGrade"} =~ s/<\/td>.*//;
            next;
        } elsif (/Sales Growth:/) {
            $AllStocks{$stocks[$i]}{"NavellierSalesGrowth"} = $NavellierRows[++$x];
            $AllStocks{$stocks[$i]}{"NavellierSalesGrowth"} =~ s/.*<td>//;
            $AllStocks{$stocks[$i]}{"NavellierSalesGrowth"} =~ s/<\/td>.*//;

            next;
        } elsif (/Operating Margin Growth:/) {
            $AllStocks{$stocks[$i]}{"NavellierOperatingMarginGrowth"} = $NavellierRows[++$x];
            $AllStocks{$stocks[$i]}{"NavellierOperatingMarginGrowth"} =~ s/.*<td>//;
            $AllStocks{$stocks[$i]}{"NavellierOperatingMarginGrowth"} =~ s/<\/td>.*//;

            next;
        } elsif (/Earnings Growth:/) {
            $AllStocks{$stocks[$i]}{"NavellierEarningsGrowth"} = $NavellierRows[++$x];
            $AllStocks{$stocks[$i]}{"NavellierEarningsGrowth"} =~ s/.*<td>//;
            $AllStocks{$stocks[$i]}{"NavellierEarningsGrowth"} =~ s/<\/td>.*//;

            next;
        } elsif (/Earnings Momentum:/) {
            $AllStocks{$stocks[$i]}{"NavellierEarningsMomentum"} = $NavellierRows[++$x];
            $AllStocks{$stocks[$i]}{"NavellierEarningsMomentum"} =~ s/.*<td>//;
            $AllStocks{$stocks[$i]}{"NavellierEarningsMomentum"} =~ s/<\/td>.*//;

            next;
        } elsif (/Earnings Surprises:/) {
            $AllStocks{$stocks[$i]}{"NavellierEarningsSurprises"} = $NavellierRows[++$x];
            $AllStocks{$stocks[$i]}{"NavellierEarningsSurprises"} =~ s/.*<td>//;
            $AllStocks{$stocks[$i]}{"NavellierEarningsSurprises"} =~ s/<\/td>.*//;

            next;
        } elsif (/Analyst Earnings Revisions:/) {
            $AllStocks{$stocks[$i]}{"NavellierAnalystEarningsRevisions"} = $NavellierRows[++$x];
            $AllStocks{$stocks[$i]}{"NavellierAnalystEarningsRevisions"} =~ s/.*<td>//;
            $AllStocks{$stocks[$i]}{"NavellierAnalystEarningsRevisions"} =~ s/<\/td>.*//;

            next;
        } elsif (/Cash Flow:/) {
            $AllStocks{$stocks[$i]}{"NavellierCashFlow"} = $NavellierRows[++$x];
            $AllStocks{$stocks[$i]}{"NavellierCashFlow"} =~ s/.*<td>//;
            $AllStocks{$stocks[$i]}{"NavellierCashFlow"} =~ s/<\/td>.*//;

            next;
        } elsif (/Return on Equity:/) {
            $AllStocks{$stocks[$i]}{"NavellierReturnOnEquity"} = $NavellierRows[++$x];
            $AllStocks{$stocks[$i]}{"NavellierReturnOnEquity"} =~ s/.*<td>//;
            $AllStocks{$stocks[$i]}{"NavellierReturnOnEquity"} =~ s/<\/td>.*//;

            next;
        } elsif (/Quantitative Grade:/) {
            $AllStocks{$stocks[$i]}{"NavellierQuantitativeGrade"} = $NavellierRows[++$x];
            $AllStocks{$stocks[$i]}{"NavellierQuantitativeGrade"} =~ s/.*<td>//;
            $AllStocks{$stocks[$i]}{"NavellierQuantitativeGrade"} =~ s/<\/td>.*//;

            next;
        }
         elsif (/Total Grade:/) {
            $AllStocks{$stocks[$i]}{"NavellierTotalGrade"} = $NavellierRows[++$x];
            $AllStocks{$stocks[$i]}{"NavellierTotalGrade"} =~ s/.*<td>//;
            $AllStocks{$stocks[$i]}{"NavellierTotalGrade"} =~ s/<\/td>.*//;

            next;
        }
    }

    my $Zacks = get("http://www.zacks.com/stock/quote/$stocks[$i]?q=$stocks[$i]") or die 'Unable to get zacks with stock '.$stocks[$i];
    my @ZacksRows = split("\n", $Zacks);
    foreach my $row (@ZacksRows) {
        if ($row =~ /<p>Zacks Rank : /) {
            $AllStocks{$stocks[$i]}{"ZacksRating"} = $row;

            $AllStocks{$stocks[$i]}{"ZacksRating"} =~ s/.*<p>Zacks Rank : //;
            $AllStocks{$stocks[$i]}{"ZacksRating"} =~ s/-.*//;

            # Handle NA
            $AllStocks{$stocks[$i]}{"ZacksRating"} =~ s/ .*//;

            last;
        }
    }

    my $Morningstar = get("http://quotes.morningstar.com/stock/$stocks[$i]/s?t=$stocks[$i]") or die 'Unable to get morningstar with stock '.$stocks[$i];
    my @MorningstarRows = split("\n", $Morningstar);
    foreach my $row (@MorningstarRows) {
        if ($row =~ /r_star/) {
            $AllStocks{$stocks[$i]}{"MorningstarRating"} = $row;
            $AllStocks{$stocks[$i]}{"MorningstarRating"} =~ s/.*r_star//;
            $AllStocks{$stocks[$i]}{"MorningstarRating"} =~ s/\'.*//;
            if ($AllStocks{$stocks[$i]}{"MorningstarRating"} == 0) {
              $AllStocks{$stocks[$i]}{"MorningstarRating"} = "";
            }
            last;
        }
    }

    my $MorningstarTake = get("http://analysisreport.morningstar.com/stock/research?t=$stocks[$i]&region=USA&culture=en-US&productcode=MLE") or die 'Unable to get morningstar with stock '.$stocks[$i];
    @MorningstarRows = split("\n", $MorningstarTake);
    my $MorningstarTakeUrl = "";
    foreach my $row (@MorningstarRows) {
      if ($row =~ /c-take/) {
        $MorningstarTakeUrl = $row;
        $MorningstarTakeUrl =~ s/.*analysisreport.morningstar.com//;
        $MorningstarTakeUrl =~ s/".*//;
        $MorningstarTakeUrl = "http://analysisreport.morningstar.com$MorningstarTakeUrl";
        last;
      }
    }

    if ($MorningstarTakeUrl ne "") {
      $MorningstarTake = get($MorningstarTakeUrl) or die 'Unable to get morningstar with stock '.$stocks[$i];
      @MorningstarRows = split("\n", $MorningstarTake);
      $MorningstarTakeUrl = "";
      for (my $x = 0; $x <= $#MorningstarRows; ++$x) {
        if ($MorningstarRows[$x] =~ /^\s*Uncertainty/) {
          $AllStocks{$stocks[$i]}{"MorningstarFairValueEstimate"} = "$MorningstarRows[$x+6]";
          $AllStocks{$stocks[$i]}{"MorningstarFairValueEstimate"} =~ s/.*<td>//;
          $AllStocks{$stocks[$i]}{"MorningstarFairValueEstimate"} =~ s/<span>.*//;
          $AllStocks{$stocks[$i]}{"MorningstarUncertainty"} = "$MorningstarRows[$x+7]";
          $AllStocks{$stocks[$i]}{"MorningstarUncertainty"} =~ s/.*<td>//;
          $AllStocks{$stocks[$i]}{"MorningstarUncertainty"} =~ s/<\/td>.*//;
        } elsif ($MorningstarRows[$x] =~ /^\s*Economic Moat/) {
          $AllStocks{$stocks[$i]}{"MorningstarConsiderBuy"} = "$MorningstarRows[$x+4]";
          $AllStocks{$stocks[$i]}{"MorningstarConsiderBuy"} =~ s/.*<td>//;
          $AllStocks{$stocks[$i]}{"MorningstarConsiderBuy"} =~ s/<span>.*//;
          $AllStocks{$stocks[$i]}{"MorningstarConsiderSell"} = "$MorningstarRows[$x+5]";
          $AllStocks{$stocks[$i]}{"MorningstarConsiderSell"} =~ s/.*<td>//;
          $AllStocks{$stocks[$i]}{"MorningstarConsiderSell"} =~ s/<span>.*//;
          $AllStocks{$stocks[$i]}{"MorningstarEconomicMoat"} = "$MorningstarRows[$x+6]";
          $AllStocks{$stocks[$i]}{"MorningstarEconomicMoat"} =~ s/.*<td>//;
          $AllStocks{$stocks[$i]}{"MorningstarEconomicMoat"} =~ s/<\/td>.*//;
        } elsif ($MorningstarRows[$x] =~ /id="creditStewardship"/) {
          if ($MorningstarRows[$x+1] =~ /colspan="3"/) { # no credit rating provided
            $AllStocks{$stocks[$i]}{"MorningstarCreditRating"} = "";
            $AllStocks{$stocks[$i]}{"MorningstarStewardshipRating"} = "$MorningstarRows[$x+1]";
            $AllStocks{$stocks[$i]}{"MorningstarStewardshipRating"} =~ s/.*colspan="3">//;
            $AllStocks{$stocks[$i]}{"MorningstarStewardshipRating"} =~ s/<\/td>.*//;
          } else {
            $AllStocks{$stocks[$i]}{"MorningstarCreditRating"} = "$MorningstarRows[$x+1]";
            $AllStocks{$stocks[$i]}{"MorningstarCreditRating"} =~ s/.*creditRatingCnt">//;
            $AllStocks{$stocks[$i]}{"MorningstarCreditRating"} =~ s/<\/td>.*//;
            $AllStocks{$stocks[$i]}{"MorningstarStewardshipRating"} = "$MorningstarRows[$x+3]";
            $AllStocks{$stocks[$i]}{"MorningstarStewardshipRating"} =~ s/.*<td>//;
            $AllStocks{$stocks[$i]}{"MorningstarStewardshipRating"} =~ s/<\/td>.*//;
          }
        }
      }
    }

    print
    $AllStocks{$stocks[$i]}{"Symbol"}.",".
    $AllStocks{$stocks[$i]}{"CompanyName"}.",".
    $AllStocks{$stocks[$i]}{"LastPrice"}.",".
    $AllStocks{$stocks[$i]}{"LastTradeDate"}.",".
    $AllStocks{$stocks[$i]}{"LastTradeTime"}.",".
    $AllStocks{$stocks[$i]}{"Change"}.",".
    $AllStocks{$stocks[$i]}{"PercentChange"}.",".
    $AllStocks{$stocks[$i]}{"Volume"}.",".
    $AllStocks{$stocks[$i]}{"AverageDailyVol"}.",".
    $AllStocks{$stocks[$i]}{"Bid"}.",".
    $AllStocks{$stocks[$i]}{"Ask"}.",".
    $AllStocks{$stocks[$i]}{"PreviousClose"}.",".
    $AllStocks{$stocks[$i]}{"TodaysOpen"}.",".
    $AllStocks{$stocks[$i]}{"DaysRange"}.",".
    $AllStocks{$stocks[$i]}{"52WeekRange"}.",".
    $AllStocks{$stocks[$i]}{"EarningsPerShare"}.",".
    $AllStocks{$stocks[$i]}{"PERatio"}.",".
    $AllStocks{$stocks[$i]}{"DividendPayDate"}.",".
    $AllStocks{$stocks[$i]}{"DividendPerShare"}.",".
    $AllStocks{$stocks[$i]}{"DividendYield"}.",".
    $AllStocks{$stocks[$i]}{"MarketCapitalization"}.",".
    $AllStocks{$stocks[$i]}{"StockExchange"}.",".
    $AllStocks{$stocks[$i]}{"ShortRatio"}.",".
    $AllStocks{$stocks[$i]}{"1yrTargetPrice"}.",".
    $AllStocks{$stocks[$i]}{"EPSEstCurrentYr"}.",".
    $AllStocks{$stocks[$i]}{"EPSEstNextYear"}.",".
    $AllStocks{$stocks[$i]}{"EPSEstNextQuarter"}.",".
    $AllStocks{$stocks[$i]}{"PriceEPSEstCurrentYr"}.",".
    $AllStocks{$stocks[$i]}{"PriceEPSEstNextYr"}.",".
    $AllStocks{$stocks[$i]}{"PEGRatio"}.",".
    $AllStocks{$stocks[$i]}{"BookValue"}.",".
    $AllStocks{$stocks[$i]}{"PriceBook"}.",".
    $AllStocks{$stocks[$i]}{"PriceSales"}.",".
    $AllStocks{$stocks[$i]}{"EBITDA"}.",".
    $AllStocks{$stocks[$i]}{"50DayMovingAvg"}.",".
    $AllStocks{$stocks[$i]}{"200DayMovingAvg"}.",".
    $AllStocks{$stocks[$i]}{"MeanRecommendation"}.",".
    $AllStocks{$stocks[$i]}{"NoOfBrokers"}.",".
    $AllStocks{$stocks[$i]}{"TheStreetRating"}.",".
    $AllStocks{$stocks[$i]}{"NavellierFundamentalGrade"}.",".
    $AllStocks{$stocks[$i]}{"NavellierSalesGrowth"}.",".
    $AllStocks{$stocks[$i]}{"NavellierOperatingMarginGrowth"}.",".
    $AllStocks{$stocks[$i]}{"NavellierEarningsGrowth"}.",".
    $AllStocks{$stocks[$i]}{"NavellierEarningsMomentum"}.",".
    $AllStocks{$stocks[$i]}{"NavellierEarningsSurprises"}.",".
    $AllStocks{$stocks[$i]}{"NavellierAnalystEarningsRevisions"}.",".
    $AllStocks{$stocks[$i]}{"NavellierCashFlow"}.",".
    $AllStocks{$stocks[$i]}{"NavellierReturnOnEquity"}.",".
    $AllStocks{$stocks[$i]}{"NavellierQuantitativeGrade"}.",".
    $AllStocks{$stocks[$i]}{"NavellierTotalGrade"}.",".
    $AllStocks{$stocks[$i]}{"ZacksRating"}.",".
    $AllStocks{$stocks[$i]}{"NavellierRisk"}.",".
    $AllStocks{$stocks[$i]}{"MorningstarRating"}.",".
    $AllStocks{$stocks[$i]}{"MorningstarFairValueEstimate"}.",".
    $AllStocks{$stocks[$i]}{"MorningstarUncertainty"}.",".
    $AllStocks{$stocks[$i]}{"MorningstarConsiderBuy"}.",".
    $AllStocks{$stocks[$i]}{"MorningstarConsiderSell"}.",".
    $AllStocks{$stocks[$i]}{"MorningstarEconomicMoat"}.",".
    $AllStocks{$stocks[$i]}{"MorningstarCreditRating"}.",".
    $AllStocks{$stocks[$i]}{"MorningstarStewardshipRating"}."\n";


}

#print Dumper(\%AllStocks);
