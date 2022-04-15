#! /bin//bash 
#####exit codes
##        0:database exists 
##        2:invoice file not exit
##        3:invoice file has no read permission
##        4:details file not exit
##        5: details file has no read permission

# function that check if the database exists or not
function check_database {

RESULT=`mysqlshow --user=root --password="" lab3| grep -o lab3`

if [ "$RESULT" == "lab3" ]; then
    echo exist
fi
exit 0
}
check_database

function check_files {

[ ! -f invoice ] && exit 2
[ ! -r invoice ] && exit 3
[ ! -f details ] && exit 4
[ ! -r details ] && exit 5 
}
check_files

function check_tables{
if  mysql  -u root -p""  -D lab3 -e "SHOW TABLES LIKE 'inv_details'" ; then
     echo exist
else
     echo  not_exist
fi 
if  mysql  -u root -p""  -D lab3 -e "SHOW TABLES LIKE 'inv_master'"  ; then
    echo exist
else
    echo not_exist
fi
}
check_files
