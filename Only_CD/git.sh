mkdir model_publish
cd model_publish

git clone https://github.com/kalikichandu/ML-Model-Retraining-DevOps-way.git
cd ML-Model-Retraining-DevOps-way
mkdir $1
cp ../../Only_CD/model.pkl $1/
git add .
git commit -m'Adding Version $1 File'
git push