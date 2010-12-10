#!/bin/bash

cd ../config

cp machines/config_live_de.yml config.yml

cd ..

./WatirCuke @sc_de sc_live_de

./WatirCuke @sc_remove sc_remove