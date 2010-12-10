#!/bin/bash

cd ../config

cp machines/config_bbc_en.yml config.yml

cd ..

./WatirCuke @sc_en sc_bbc_en

./WatirCuke @sc_remove sc_remove