INSERT INTO Users
SELECT 
	distinct 
	user_id,	
	user_name,
	user_profile_image_url,
	user_geo,
	user_coordinates
from (
	SELECT 
		JSON_EXTRACT(`data`, "$.id") as tweet_id,
		JSON_EXTRACT(JSON_EXTRACT(`data`, "$.user"), "$.id") as user_id,
		JSON_EXTRACT(JSON_EXTRACT(`data`, "$.user"), "$.screen_name") as user_name,
		JSON_EXTRACT(JSON_EXTRACT(`data`, "$.user"), "$.profile_image_url") as user_profile_image_url,	
		JSON_EXTRACT(`data`, "$.geo") as user_geo,	
		JSON_EXTRACT(`data`, "$.coordinates") as user_coordinates,
		JSON_EXTRACT(`data`, "$.text") as tweet_text,
		JSON_EXTRACT(`data`, "$.source") as tweet_source
	FROM tweets.Feeds
	union ALL
	SELECT
		JSON_EXTRACT(`data`, "$.id") as tweet_id,
		JSON_EXTRACT(JSON_EXTRACT(`data`, "$.user"), "$.id") as user_id,
		JSON_EXTRACT(JSON_EXTRACT(`data`, "$.user"), "$.screen_name") as user_name,
		JSON_EXTRACT(JSON_EXTRACT(`data`, "$.user"), "$.profile_image_url") as user_profile_image_url,	
		JSON_EXTRACT(`data`, "$.geo") as user_geo,	
		JSON_EXTRACT(`data`, "$.coordinates") as user_coordinates,
		JSON_EXTRACT(`data`, "$.text") as tweet_text,
		JSON_EXTRACT(`data`, "$.source") as tweet_source
	FROM (
		SELECT
		JSON_EXTRACT(`data`, "$.retweeted_status") as data
		FROM tweets.Feeds
		where JSON_EXTRACT(`data`, "$.retweeted_status") is not null
	 ) 	
	Tweet_feeds
) Full_Tweets;