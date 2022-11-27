CREATE OR REPLACE FUNCTION humanize_time_span(post_date timestamp) RETURNS varchar AS
'
SELECT
  CASE
    WHEN (now() - post_date::timestamp)::INT < 60 THEN '' Just Posted''
    WHEN ((now() - post_date::timestamp)::INT) / 60 < 60 THEN ((now() - post_date::TIMESTAMPTZ)::INT / 60)::INT || '' Minutes ago''
    WHEN (now() - post_date::TIMESTAMPTZ)::INT / (60 * 60) < 24 THEN ((now() - post_date::TIMESTAMPTZ)::INT / (60 * 60))::INT || '' Hours ago''
    ELSE ((now() - post_date::TIMESTAMPTZ)::INT / (60 * 60 * 24))::INT || '' Days ago''
  END
'
LANGUAGE SQL;
