------------------------------
--CREATE TABLES AND VIEWS
--mysql version 8
------------------------------

----------------------------------------
--tabela para receber dados do twitter--
----------------------------------------
CREATE TABLE "pdi_twitter" (
  "id" varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  "hashtag" varchar(1000) DEFAULT NULL,
  "texto" varchar(10000) DEFAULT NULL,
  "created_at" datetime DEFAULT NULL,
  "user_mention" varchar(500) DEFAULT NULL,
  "followers_count" int(11) DEFAULT NULL,
  "json_data" json DEFAULT NULL,
  "iso_language_code" varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--tabela com as possíveis hashtags--
CREATE TABLE "pdi_twitter_hashtags" (
  "hashtag" varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

----------------------------------------
--view com o count das hashtags
----------------------------------------
CREATE
OR REPLACE
VIEW "vw_count_hashtag" AS select
    sum("tb1"."count_hashtag") AS "count_hashtag",
    "tb1"."hashtag" AS "hashtag"
from
    (
    select
        round(((length("pdi_twitter"."hashtag") - length(replace(lower("pdi_twitter"."hashtag"), 'devops', ''))) / length('devops')), 0) AS "count_hashtag",
        'devops' AS "hashtag"
    from
        "pdi_twitter"
    where
        ("pdi_twitter"."user_mention" is not null)
union all
    select
        round(((length("pdi_twitter"."hashtag") - length(replace(lower("pdi_twitter"."hashtag"), 'apifirst', ''))) / length('apifirst')), 0) AS "count_hashtag",
        'apifirst' AS "hashtag"
    from
        "pdi_twitter"
    where
        ("pdi_twitter"."user_mention" is not null)
union all
    select
        round(((length("pdi_twitter"."hashtag") - length(replace(lower("pdi_twitter"."hashtag"), 'microservices', ''))) / length('microservices')), 0) AS "count_hashtag",
        'microservices' AS "hashtag"
    from
        "pdi_twitter"
    where
        ("pdi_twitter"."user_mention" is not null)
union all
    select
        round(((length("pdi_twitter"."hashtag") - length(replace(lower("pdi_twitter"."hashtag"), 'apigateway', ''))) / length('apigateway')), 0) AS "count_hashtag",
        'apigateway' AS "hashtag"
    from
        "pdi_twitter"
    where
        ("pdi_twitter"."user_mention" is not null)
union all
    select
        round(((length("pdi_twitter"."hashtag") - length(replace(lower("pdi_twitter"."hashtag"), 'oauth', ''))) / length('oauth')), 0) AS "count_hashtag",
        'oauth' AS "hashtag"
    from
        "pdi_twitter"
    where
        ("pdi_twitter"."user_mention" is not null)
union all
    select
        round(((length("pdi_twitter"."hashtag") - length(replace(lower("pdi_twitter"."hashtag"), 'swagger', ''))) / length('swagger')), 0) AS "count_hashtag",
        'swagger' AS "hashtag"
    from
        "pdi_twitter"
    where
        ("pdi_twitter"."user_mention" is not null)
union all
    select
        round(((length("pdi_twitter"."hashtag") - length(replace(lower("pdi_twitter"."hashtag"), 'raml', ''))) / length('raml')), 0) AS "count_hashtag",
        'raml' AS "hashtag"
    from
        "pdi_twitter"
    where
        ("pdi_twitter"."user_mention" is not null)
union all
    select
        round(((length("pdi_twitter"."hashtag") - length(replace(lower("pdi_twitter"."hashtag"), 'openapis', ''))) / length('openapis')), 0) AS "count_hashtag",
        'openapis' AS "hashtag"
    from
        "pdi_twitter"
    where
        ("pdi_twitter"."user_mention" is not null)
union all
    select
        round(((length("pdi_twitter"."hashtag") - length(replace(lower("pdi_twitter"."hashtag"), 'openbanking', ''))) / length('openbanking')), 0) AS "count_hashtag",
        'openbanking' AS "hashtag"
    from
        "pdi_twitter"
    where
        ("pdi_twitter"."user_mention" is not null)
union all
    select
        round(((length("pdi_twitter"."hashtag") - length(replace(lower("pdi_twitter"."hashtag"), 'cloudfirst', ''))) / length('cloudfirst')), 0) AS "count_hashtag",
        'cloudfirst' AS "hashtag"
    from
        "pdi_twitter"
    where
        ("pdi_twitter"."user_mention" is not null)) "tb1"
group by
    "tb1"."hashtag";

--------------------------------------------------
--view com a quantidade de seguidores por user
--------------------------------------------------
CREATE
OR REPLACE
VIEW "vw_count_hashtag" AS select
    sum("tb1"."count_hashtag") AS "count_hashtag",
    "tb1"."hashtag" AS "hashtag"
from
    (
    select
        round(((length("pdi_twitter"."hashtag") - length(replace(lower("pdi_twitter"."hashtag"), 'devops', ''))) / length('devops')), 0) AS "count_hashtag",
        'devops' AS "hashtag"
    from
        "pdi_twitter"
    where
        ("pdi_twitter"."user_mention" is not null)
union all
    select
        round(((length("pdi_twitter"."hashtag") - length(replace(lower("pdi_twitter"."hashtag"), 'apifirst', ''))) / length('apifirst')), 0) AS "count_hashtag",
        'apifirst' AS "hashtag"
    from
        "pdi_twitter"
    where
        ("pdi_twitter"."user_mention" is not null)
union all
    select
        round(((length("pdi_twitter"."hashtag") - length(replace(lower("pdi_twitter"."hashtag"), 'microservices', ''))) / length('microservices')), 0) AS "count_hashtag",
        'microservices' AS "hashtag"
    from
        "pdi_twitter"
    where
        ("pdi_twitter"."user_mention" is not null)
union all
    select
        round(((length("pdi_twitter"."hashtag") - length(replace(lower("pdi_twitter"."hashtag"), 'apigateway', ''))) / length('apigateway')), 0) AS "count_hashtag",
        'apigateway' AS "hashtag"
    from
        "pdi_twitter"
    where
        ("pdi_twitter"."user_mention" is not null)
union all
    select
        round(((length("pdi_twitter"."hashtag") - length(replace(lower("pdi_twitter"."hashtag"), 'oauth', ''))) / length('oauth')), 0) AS "count_hashtag",
        'oauth' AS "hashtag"
    from
        "pdi_twitter"
    where
        ("pdi_twitter"."user_mention" is not null)
union all
    select
        round(((length("pdi_twitter"."hashtag") - length(replace(lower("pdi_twitter"."hashtag"), 'swagger', ''))) / length('swagger')), 0) AS "count_hashtag",
        'swagger' AS "hashtag"
    from
        "pdi_twitter"
    where
        ("pdi_twitter"."user_mention" is not null)
union all
    select
        round(((length("pdi_twitter"."hashtag") - length(replace(lower("pdi_twitter"."hashtag"), 'raml', ''))) / length('raml')), 0) AS "count_hashtag",
        'raml' AS "hashtag"
    from
        "pdi_twitter"
    where
        ("pdi_twitter"."user_mention" is not null)
union all
    select
        round(((length("pdi_twitter"."hashtag") - length(replace(lower("pdi_twitter"."hashtag"), 'openapis', ''))) / length('openapis')), 0) AS "count_hashtag",
        'openapis' AS "hashtag"
    from
        "pdi_twitter"
    where
        ("pdi_twitter"."user_mention" is not null)
union all
    select
        round(((length("pdi_twitter"."hashtag") - length(replace(lower("pdi_twitter"."hashtag"), 'openbanking', ''))) / length('openbanking')), 0) AS "count_hashtag",
        'openbanking' AS "hashtag"
    from
        "pdi_twitter"
    where
        ("pdi_twitter"."user_mention" is not null)
union all
    select
        round(((length("pdi_twitter"."hashtag") - length(replace(lower("pdi_twitter"."hashtag"), 'cloudfirst', ''))) / length('cloudfirst')), 0) AS "count_hashtag",
        'cloudfirst' AS "hashtag"
    from
        "pdi_twitter"
    where
        ("pdi_twitter"."user_mention" is not null)) "tb1"
group by
    "tb1"."hashtag";

