pip config --global set global.index-url http://nexus.gebz.local:8080/repository/pip/simple

pip config --global set global.trusted-host nexus.gebz.local:8080
pip config --global set global.trusted-host nexus.gebz.local

pip config --global set global.index http://nexus.gebz.local:8080/repository/pip/pypi
