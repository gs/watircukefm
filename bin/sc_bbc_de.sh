#!/bin/bash

cd ../config

cp machines/config_bbc_de.yml config.yml

cd ..

./WatirCuke @sc_de sc_bbc_de

./WatirCuke @sc_remove sc_remove