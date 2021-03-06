

myheader <- matrix(c(
  "id","NULL",
  "permit","NULL",
  "permit_type","character",
  "issue_date","permit.date",
  "estimated_cost","NULL",
  "amount_waived","NULL",
  "amount_paid","NULL",
  "total_permit_fee","NULL",
  "street_number","NULL",
  "street_direction","NULL",
  "street_name","NULL",
  "suffix","NULL",
  "work_description","NULL",
  "pin1","NULL",
  "pin2","NULL",
  "pin3","NULL",
  "pin4","NULL",
  "pin5","NULL",
  "pin6","NULL",
  "pin7","NULL",
  "pin8","NULL",
  "pin9","NULL",
  "pin10","NULL",
  "contractor_1_type","NULL",
  "contractor_1_name","NULL",
  "contractor_1_address","NULL",
  "contractor_1_city","NULL",
  "contractor_1_state","NULL",
  "contractor_1_zipcode","NULL",
  "contractor_1_phone","NULL",
  "contractor_2_type","NULL",
  "contractor_2_name","NULL",
  "contractor_2_address","NULL",
  "contractor_2_city","NULL",
  "contractor_2_state","NULL",
  "contractor_2_zipcode","NULL",
  "contractor_2_phone","NULL",
  "contractor_3_type","NULL",
  "contractor_3_name","NULL",
  "contractor_3_address","NULL",
  "contractor_3_city","NULL",
  "contractor_3_state","NULL",
  "contractor_3_zipcode","NULL",
  "contractor_3_phone","NULL",
  "contractor_4_type","NULL",
  "contractor_4_name","NULL",
  "contractor_4_address","NULL",
  "contractor_4_city","NULL",
  "contractor_4_state","NULL",
  "contractor_4_zipcode","NULL",
  "contractor_4_phone","NULL",
  "contractor_5_type","NULL",
  "contractor_5_name","NULL",
  "contractor_5_address","NULL",
  "contractor_5_city","NULL",
  "contractor_5_state","NULL",
  "contractor_5_zipcode","NULL",
  "contractor_5_phone","NULL",
  "contractor_6_type","NULL",
  "contractor_6_name","NULL",
  "contractor_6_address","NULL",
  "contractor_6_city","NULL",
  "contractor_6_state","NULL",
  "contractor_6_zipcode","NULL",
  "contractor_6_phone","NULL",
  "contractor_7_type","NULL",
  "contractor_7_name","NULL",
  "contractor_7_address","NULL",
  "contractor_7_city","NULL",
  "contractor_7_state","NULL",
  "contractor_7_zipcode","NULL",
  "contractor_7_phone","NULL",
  "contractor_8_type","NULL",
  "contractor_8_name","NULL",
  "contractor_8_address","NULL",
  "contractor_8_city","NULL",
  "contractor_8_state","NULL",
  "contractor_8_zipcode","NULL",
  "contractor_8_phone","NULL",
  "contractor_9_type","NULL",
  "contractor_9_name","NULL",
  "contractor_9_address","NULL",
  "contractor_9_city","NULL",
  "contractor_9_state","NULL",
  "contractor_9_zipcode","NULL",
  "contractor_9_phone","NULL",
  "contractor_10_type","NULL",
  "contractor_10_name","NULL",
  "contractor_10_address","NULL",
  "contractor_10_city","NULL",
  "contractor_10_state","NULL",
  "contractor_10_zipcode","NULL",
  "contractor_10_phone","NULL",
  "contractor_11_type","NULL",
  "contractor_11_name","NULL",
  "contractor_11_address","NULL",
  "contractor_11_city","NULL",
  "contractor_11_state","NULL",
  "contractor_11_zipcode","NULL",
  "contractor_11_phone","NULL",
  "contractor_12_type","NULL",
  "contractor_12_name","NULL",
  "contractor_12_address","NULL",
  "contractor_12_city","NULL",
  "contractor_12_state","NULL",
  "contractor_12_zipcode","NULL",
  "contractor_12_phone","NULL",
  "contractor_13_type","NULL",
  "contractor_13_name","NULL",
  "contractor_13_address","NULL",
  "contractor_13_city","NULL",
  "contractor_13_state","NULL",
  "contractor_13_zipcode","NULL",
  "contractor_13_phone","NULL",
  "contractor_14_type","NULL",
  "contractor_14_name","NULL",
  "contractor_14_address","NULL",
  "contractor_14_city","NULL",
  "contractor_14_state","NULL",
  "contractor_14_zipcode","NULL",
  "contractor_14_phone","NULL",
  "contractor_15_type","NULL",
  "contractor_15_name","NULL",
  "contractor_15_address","NULL",
  "contractor_15_city","NULL",
  "contractor_15_state","NULL",
  "contractor_15_zipcode","NULL",
  "contractor_15_phone","NULL",
  "latitude", "numeric",
  "longitude", "numeric",
  "location", "NULL"
), ncol=2, byrow=TRUE)


setting <- list(name="permit.date",
                func=function(from) as.POSIXct(strptime(from,format="%m/%d/%Y"))
)


mySubset <- "&$where=_issue_date>to_floating_timestamp('2011-01-01T01:00:01')"

permits <- liveReadCSV(key="ydr8-5enu", header=myheader, filter=mySubset, dateSetting=setting)

permits <- subset(permits, !is.na(latitude) & !is.na(longitude) & !is.na(issue_date))
permits$permit_type<- factor(permits$permit_type,levels=names(table(permits$permit_type)[order(-table(permits$permit_type))]))
print(table(permits$permit_type))

rm(myheader, mySubset, setting); gc()


