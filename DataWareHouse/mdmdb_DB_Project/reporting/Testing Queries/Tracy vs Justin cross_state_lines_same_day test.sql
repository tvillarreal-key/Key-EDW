WITH MOTIVE AS (
/* pull all motive files and lag the jurisdiction by date/ asset_num combination */
    SELECT distinct 
        date,
        asset_num,
        jurisdiction,
        ROW_NUMBER() over (partition by date, asset_num order by date, asset_num) as rNum,
        lag(jurisdiction,1) over (partition by date, asset_num order by date, asset_num) as prev_juris
    from reporting.vw_dot_motive
)

/* Add in the cross_state_line_flag */
, CROSS_ST_LINE AS (
    select *,
        case when jurisdiction <> prev_juris then 1 else 0 end as cross_state_line_same_day
    from MOTIVE 
    where rNum > 1 -- remove the single entry and first line from the date/ asset combo because the first line will always show a null for the lag jurisdiction */
)
/* create a cross state line by distinct date/ asset combo */
, DISTINCT_ASSET_CROSS AS (
    select distinct 
        date, 
        asset_num, 
        max(cross_state_line_same_day) as crosses_state_line
    from CROSS_ST_LINE
    group by date, asset_num
)

select 'justin' as 'developer', count(distinct asset_num) as asset_cnt 
from DISTINCT_ASSET_CROSS

UNION

/* This was to compare what Tracy's code thought should be all the distint assets that crossed state lines in the same day */
select 
    'tracy view counts', count(distinct asset_num) as asset_cnt 
from reporting.vw_dot_motive_cross_state_lines
where cross_state_lines_single_day_flag = 1

UNION 

/*This was to get a grand total of all unique assets in the motive view */
select 'total vw_dot_motive counts', count(asset_num) as asset_count
from reporting.vw_dot_motive
