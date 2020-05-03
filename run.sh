#!/bin/bash

#aws s3 ls s3://aktechthoughts/tweet_2020/ | cut -c32- | while read filename
ls data  | while read filename 
do
#aws s3 cp s3://aktechthoughts/tweet_2020/$filename ./data
python3 insert_json_data.py data/$filename
done



mysql -h "$HOST_NAME" -u "$USER_NAME" -p "$PASSWORD" "$DB_NAME" < "sql/Tweets.Texts.sql"
mysql -h "$HOST_NAME" -u "$USER_NAME" -p "$PASSWORD" "$DB_NAME" < "sql/Tweets.Users.sql"

