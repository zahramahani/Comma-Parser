echo "install_comma_parser"  
sudo apt install -y build-essential
sudo apt install -y postgresql-server-dev-$pg_version
tar -xvf comma_parser.tar.gz
mkdir -p comma_parser/build
cd comma_parser/build
sed -i "s|pg_config|/usr/lib/postgresql/$pg_version/bin/pg_config|g" ../Makefile
make -f ../Makefile
sudo make -f ../Makefile install
cd ../..
rm -rf comma_parser
pg_port=`pg_lsclusters | grep "$pg_version  $pg_cluster"| awk '{print $3}'`
sudo su -c "psql -p $pg_port -c 'create extension comma_parser;' $pg_database" postgres
sudo su -c "psql -p $pg_port -c \"GRANT USAGE ON SCHEMA public TO $pg_atlas_user;\" $pg_database" postgres
echo "success_to_install_comma_parser"