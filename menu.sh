 #! /bin/bash

######## script for creating a menu
source dataop.sh
function menu {
local option

echo "1.insert"
echo "2.delete"
echo "3.display"
echo "Enter the option: "
read option
#cal=("insert" "delete" "display")
#echo ${option}
select option  in insert delete display
do 
case $option in 
"insert")
   insert
   echo "data is inserted successfully"
    ;;
  "delete")
   read -r id 
   delete $id
   echo "data deleted successfuly"
   ;;

  "display") 
  read -r id 
   selectdb $id
    ;;
*)
   echo "invalid option"
;;
esac
done

}
menu 
