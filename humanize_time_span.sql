CREATE OR REPLACE FUNCTION humanize_time_span(ts timestamp) RETURNS varchar AS
'
SELECT
  CASE
    WHEN (now() - ts::timestamp)::INT < 60 THEN '' Just Posted''
    WHEN ((now() - ts::timestamp)::INT) / 60 < 60 THEN ((now() - ts::TIMESTAMPTZ)::INT / 60)::INT || '' Minutes ago''
    WHEN (now() - ts::TIMESTAMPTZ)::INT / (60 * 60) < 24 THEN ((now() - ts::TIMESTAMPTZ)::INT / (60 * 60))::INT || '' Hours ago''
    ELSE ((now() - ts::TIMESTAMPTZ)::INT / (60 * 60 * 24))::INT || '' Days ago''
  END
'
LANGUAGE SQL;
