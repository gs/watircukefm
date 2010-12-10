#!/bin/bash

cd ../config

cp machines/config_staging_de.yml config.yml

cd ..

./WatirCuke @sc_de sc_staging_de

./WatirCuke @sc_remove sc_remove