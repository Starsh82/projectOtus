varDB="employees"
mkdir $varDB
for varT in `mysql -N -e "show tables from $varDB;"`
    do
		mysqldump --opt --single-transaction --events --routines $varDB $varT > $varDB/$varT.sql
done
