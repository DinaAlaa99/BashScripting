#! /bin/bash
#####script for  database operations

function insert {

query1=$( awk 'BEGIN{FS=":"}{print "insert into lab3.inv_master(custname,invdate,invtotal)values(\""$1"\","$2","$3");"}'  invoice )
mysql -u root -p"" -e "${query1}"  
query2=$(awk 'BEGIN{FS=":"}{print "insert into lab3.inv_details (itemname,invid,quantity,unitprice) values(\""$(1)"\","$(2)","$(3)","$(4)");"}' details)
mysql -u root -p"" -e "${query2}"
}
#insert

function delete {
   local INVID 
   read -p "please enter the id to be deleted:" INVID
   query3="delete from lab3.inv_details where invid=${INVID} ;" 
   query4="delete from lab3.inv_master where id = ${INVID};"

   mysql -u root -p"" -e "${query3}" 
   mysql -u root -p"" -e "${query4}" 


}
#delete
function selectdb {
   local INVID 
   read -p "please enter the invoice id to display:" INVID
   query5="select * from lab3.inv_details where id=${INVID} ;" 
   query6="select * from lab3.inv_master where id = ${INVID};"

   mysql -u root -p"" -e "${query5}" 
   mysql -u root -p"" -e "${query6}" 

}
#selectdb
