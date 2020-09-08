mkdir data
docker rm iku
docker run --name iku -e LICENSE=/license.json -p 8082:10000 -v %cd%\data:/home/dataiku/dss -v %cd%\config\license.json:/license.json -v %cd%\jdbc:/home/dataiku/dss/lib/jdbc -d iku