#!/bin/bash

read -p "Give the directory path name you want to sort: " dir

cd "$dir"
mkdir Scripts Data Images Models Docs 2>/dev/null
mv *{.txt,.py,.sh,.ipynb} Scripts/ 2>/dev/null
mv *{.csv,.xlsx,.json,.xml} Data/ 2>/dev/null
mv *{.jpg,.png,.jpeg,.heic} Images/ 2>/dev/null
mv *{.pkl,.joblib} Models/ 2>/dev/null
mv *{.pdf} Docs/ 2>/dev/null
rmdir Scripts Data Images Models Docs 2>/dev/null
ls Scripts Data Images Models Docs 2>/dev/null
