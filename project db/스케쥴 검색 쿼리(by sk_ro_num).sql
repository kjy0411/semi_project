select
	schedule.*,
    addtime(addtime(subtime(sk_start_time, ai_start.ai_standard_time), sk_time), ai_end.ai_standard_time) as sk_end_time,
    ro_ai_start,
    ai_start.ai_name, -- 출발지
    ai_start.ai_standard_time, -- 출발표준시
    ro_ai_end,
    ai_end.ai_name, -- 도착지
    ai_end.ai_standard_time, -- 도착표준시
    ap_al_name
from
	schedule
		join
	airplane on ap_num = sk_ap_num
		join
	route on sk_ro_num = ro_num
		join
	airport as ai_start on ai_start.ai_num = ro_ai_start
		join
	airport as ai_end on ai_end.ai_num = ro_ai_end
where sk_ro_num = 1;