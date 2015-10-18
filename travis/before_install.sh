echo "yes" | sudo apt-add-repository ppa:ubuntugis/ubuntugis-unstable

sudo apt-get update
sudo apt-get install -qq libgeos-dev libproj-dev postgresql-9.4-postgis  libgeos++-dev

