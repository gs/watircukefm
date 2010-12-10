#!/bin/bash

cd ../config

cp machines/config_staging_en.yml config.yml

cd ..

./WatirCuke @sc_en sc_staging_en

./WatirCuke @sc_remove sc_remove