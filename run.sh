#!/bin/bash

aws s3 ls s3://aktechthoughts/tweet_2020/ | cut -c32- | while read filename
#ls data  | while read filename 
do
aws s3 cp s3://aktechthoughts/tweet_2020/$filename ./data
python3 insert_json_data.py data/$filename
cat data/$filename >> data/Consolidated_Tweets.json
rm data/$filename
done


mysql --host="$DB_HOST_NAME" --user="$USER_NAME" --password="$PASSWORD" "$DB_NAME" < sql/Tweets.Users.sql 
mysql --host="$DB_HOST_NAME" --user="$USER_NAME" --password="$PASSWORD" "$DB_NAME" < sql/Tweets.Texts.sql
