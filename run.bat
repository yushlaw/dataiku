docker run --rm --name iku -e LICENSE=/license.json -p 8083:10000 -v %cd%\data:/home/dataiku/dss -v %cd%\config\license.json:/license.json -d iku