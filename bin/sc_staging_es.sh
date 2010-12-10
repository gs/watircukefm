#!/bin/bash

cd ../config

cp machines/config_staging_es.yml config.yml

cd ..

./WatirCuke @sc_es sc_staging_es

./WatirCuke @sc_remove sc_remove