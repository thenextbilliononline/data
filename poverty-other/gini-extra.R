GINI Percentiles available if you want to use them: 
  
#Income share held by lowest 10% (SI.DST.FRST.10)
frst.10 <- curl_download("http://api.worldbank.org/v2/countries/all/indicators/SI.DST.FRST.10?per_page=10000", "gini.frst.10.xml")

#Income share held by lowest 20% (SI.DST.FRST.20)
frst.20 <- curl_download("http://api.worldbank.org/v2/countries/all/indicators/SI.DST.FRST.20?per_page=10000", "gini.frst.20.xml")

#Income share held by second 20% (SI.DST.02ND.20)
scnd.20 <- curl_download("http://api.worldbank.org/v2/countries/all/indicators/SI.DST.02ND.20?per_page=10000", "gini.scnd.20.xml")

# Income share held by third 20% (SI.DST.03RD.20)
thrd.20 <- curl_download("http://api.worldbank.org/v2/countries/all/indicators/SI.DST.03RD.20?per_page=10000", "gini.thrd.20.xml")

#Income share held by fourth 20% (SI.DST.04TH.20)
frth.20 <- curl_download("http://api.worldbank.org/v2/countries/all/indicators/SI.DST.04TH.20?per_page=10000", "gini.frth.20.xml")

# Income share held by highest 20% (SI.DST.05TH.20)
ffth.20 <- curl_download("http://api.worldbank.org/v2/countries/all/indicators/SI.DST.05TH.20?per_page=10000", "gini.ffth.20.xml")

# Income share held by highest 10% (SI.DST.10TH.10)
frst.10 <- curl_download("http://api.worldbank.org/v2/countries/all/indicators/SI.DST.FRST.10?per_page=10000", "frst.10.xml")
