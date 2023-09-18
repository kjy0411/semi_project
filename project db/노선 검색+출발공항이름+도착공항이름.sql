SELECT * FROM reservation.route;
select
	*,
    (select ai_name from airport where ai_num = ro_ai_start) as ai_name_start,
    (select ai_name from airport where ai_num = ro_ai_end) as ai_name_end
from
	route
where
	ro_ai_start = "ICN" and ro_ai_end = "LHR";