select
			schedule.*,
		    ap_al_name,
            -- 해당 노선의 출발지의 공항이름
            (select
				ai_name
			from
				airport
					join
				(select * from route) as start_route on ro_ai_start = ai_num
			where ro_num = sk_ro_num) as ai_start_name,
            -- 해당 노선의 도착지의 공항이름
            (select
				ai_name
			from
				airport
					join
				(select * from route) as start_route on ro_ai_end = ai_num
			where ro_num = sk_ro_num) as ai_end_name,
            -- 해당 노선의 출발지의 UTC
            (select
				ai_standard_time
			from
				route
					join
				(select * from airport) as start_airport on ro_ai_start = ai_num
			where
				ro_num = sk_ro_num) as start_standard_time,
			-- 해당 노선의 도착지의 UTC
            (select
				ai_standard_time
			from
				route
					join
				(select * from airport) as endairport on ro_ai_end = ai_num
			where
				ro_num = sk_ro_num) as end_standard_time
		from
			schedule
				join
			airplane on sk_ap_num = ap_num
				join
			route on ro_num = sk_ro_num
            join
			airport on ro_ai_start = ai_num
				 or ro_ai_end = ai_num
		where
			sk_ro_num = 1
		group by
			sk_num;
-- 출발지의 공항이름
select
	ai_name
from
	airport
		join
	(select * from route) as start_route on ro_ai_start = ai_num
where ro_num = sk_ro_num;
-- 도착지의 공항이름
select
	ai_name
from
	airport
		join
	(select * from route) as start_route on ro_ai_end = ai_num
where ro_num = sk_ro_num;
-- 출발지의 utc
select
	ai_standard_time
from
	route
		join
	(select * from airport) as start_airport on ro_ai_start = ai_num
where
	ro_num = sk_ro_num;
-- 도착지의 utc
select
	ai_standard_time
from
	route
		join
	(select * from airport) as endairport on ro_ai_end = ai_num
where
	ro_num = sk_ro_num;