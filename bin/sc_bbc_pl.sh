#!/bin/bash

cd ../config

cp machines/config_bbc_pl.yml config.yml

cd ..

./WatirCuke @sc_pl sc_bbc_pl

./WatirCuke @sc_remove sc_remove