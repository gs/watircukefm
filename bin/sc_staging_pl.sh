#!/bin/bash

cd ../config

cp machines/config_staging_pl.yml config.yml

cd ..

./WatirCuke @sc_pl sc_staging_pl

./WatirCuke @sc_remove sc_remove