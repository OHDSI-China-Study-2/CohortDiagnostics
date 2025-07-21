CREATE TABLE #Codesets (
  codeset_id int NOT NULL,
  concept_id bigint NOT NULL
)
;

INSERT INTO #Codesets (codeset_id, concept_id)
SELECT 1 as codeset_id, c.concept_id FROM (select distinct I.concept_id FROM
( 
  select concept_id from @vocabulary_database_schema.CONCEPT where concept_id in (3037187,4041723,4041725,37173107,37173227,3025791,46235168,3041651,40766113,3966401,3036671,40481772,3002574,3018251,3037110,46236950,3017703,3035250,4182052,4156660,3002009,3024762,36660046,40765583,3037110,3011424,3019210,3034962,3004501,3025211,3002009,3013826,4149519,4120298)
UNION  select c.concept_id
  from @vocabulary_database_schema.CONCEPT c
  join @vocabulary_database_schema.CONCEPT_ANCESTOR ca on c.concept_id = ca.descendant_concept_id
  and ca.ancestor_concept_id in (4182052,36660046,4149519)
  and c.invalid_reason is null

) I
LEFT JOIN
(
  select concept_id from @vocabulary_database_schema.CONCEPT where concept_id in (40766113,3041651,3025791,3002574,3025893,40762090,3005478,3023544,3005943,3007034,3020399,3020632,3015996,3001020,3016159,3017222,3027145,3010115,3032276,40759245,3024540,3006289,3022314,3034003,3037787,3011088,3037936,3028287,40761076,3010956,3031651,3005231,3000272,3031105,3016521,3012009,3032809,3003773,3019571,3029102,3039896,3024629,3042145,3039280,3043210,3042982,3043057,3035214,4149883,44816584,3000361,44816585,3035381,3005570,40762249,3008770,44786994,3007308,3020650,3007777,3006684,3028014,3023961,3024785,3025622,3007971,3006258,3021752,3030260,3009261,3005875,3003667,3005589,3020820,3021033,3019493,3007031,3018958,3009251,3011355,3004629,3023638,3021635,3003453,3005851,3022233,3005370,3003201,3025876,3002934,3010617,3002376,3020455,3001283,3020450,40481772,40484115,40485034,40483659,4147409,4147408,4192542,4151414,4055970,4149386,4131031,4207608,2314093,2314092,4208334,4131376,1617169,4135437,3016083,3014014,3019210,3022548,3023572,3002436,3001346,3016680,1989265,3030618,3015544,3020909,3033618,3011789,3015046,3034466,40759281,3008572,3016427,3016726,3017261,3004251,40763914,3000607,3002240,3010075,3049817,3004617,3003462,3003403,3001978,3004676,4151548,3042439,3046229,3035729,3020044,46235203,46235204,46235205,46235206,3020722,1616856,3052839,3051873,3051002,1091284,3040806,3042173,3036257,21491017,21491018,21492444,3023044,3036782,1091681,3020618,3040563,40479425,40479799,40484114,40484139,40485040,40479401,40484575,40758981,3051368,40760907,3051044,3040980,3014305,4289453,2212169,44790867,4012477,44783612,40482677,4176733,4027514,40482666,4143633,4017758,4286945,3048865,3034530,3045908,3039562,3043908,3025211,3006760,3041757,3044527,3002009,3007781,3024583,3043648,3040375,3040872,3038855,3021232,3033778,3012415,3000404,3008804,1617484,37020666,3039397,3964843,3023306,3017053,3001975,21494214,3039851,3040457,3038543,3041353,3038958,3040694,3044574,3040904,3041620,40759870,3041009,3041860,3015930,3000545,3005096,3040983,3965300,3004428,36660184,3023776,3043930,3042343,3041056,3042329,3041872,3006717,3007092,3042637,3025070,3025673,3964631,37021474,3041799,3964600,3026300,3966521,3019876,3021737,3000845,3040420,3019013,3015283,3003334,3007427,36659783,3002544,3038570,3027457,3005996,3024047,3009582,3039937,3965113,3027198,3020407,36659954,3014737,3022574,3000781,36660356,3038965,3022268,3024644,3000940,3011161,3005487,36660344,3021924,3005850,3035415,3039849,3010794,3052976,3033312,3021860,3009414,3004389,36660564,3023243,3017083,3023466,3004681,3022285,3023125,3004351,3018151,3019431,3017328,3039229,3024762,3004766,3042186,3007864,40762854,40762855,40762856,40762857,40762858,3021525,3044548,3040116,3040402,3038251,3041470,3040937,3003912,40757397,3041766,3038390,3038991,3036375,40758480,3039763,3036895,40757398,3042216,46234926,3042995,3021258,3007619,3044219,3041160,3043956,3040673,3041760,3038672,3038264,3043922,3043635,3039788,3006520,3043514,40758510,3040060,3019047,40757390,43534069,3041159,3040683,3034101,3041140,3042029,3044269,3040870,3009154,3016160,3017538,3038621,3016701,40757389,3041638,3040613,3012413,3005834,3040603,3022161,3000992,3044555,3013026,3041609,3017048,3017091,3038314,3017589,3041489,40757404,3041136,3042487,40757393,3022201,3043978,3017634,3017890,3042489,3003824,3041490,3018175,3004724,3040107,3041895,3002654,3041454,3039297,3038557,3038422,3041615,3041856,3041903,46236367,40484576,3006325,3009245,3017892,3014716,3008191,3016699,3004209,3007332,1617040,21492339,37021274,3050405,3966369,3010300,3017345,3002310,3026071,3025232,3042058,3003541,3019474,4229586,40762853,46236371,40757408,3037432,3020869,3011761,3039422,3051280,3015024,40757396,3040655,40757407,3044516,3040659,3015621,40757401,40757400,3038838,3006669,4198718,4209254,4197835,4193852,4198731,4195213,44805579,4234906,4258832,4198733,4193853,4198732,4209122,4193854,4193855,4198719,4198742,4198743,3041015,3027276,3017592,37020527,3052646,3026020,3006333,3041875,3041863,3039582,3044252,3029871,3034771,3026604,21492336,3025113,3005787,3040739,3038995,3040940,3004723,40760467,3007820,3038316,37020873,3052659,3026550,3048282,3043637,3038549,3041864,3022079,3025740,3026571,3025136,3012805,3030070,3027936,3013604,1616656,21492337,37019755,3050128,37020288,3028247,3010722,3003412,3041024,3041720,3010118,3040476,3042431,3015323,3039166,3027980,3020260,3028607,21492338,3023186,3018998,3030931,3028112,3013145,3013881,3022933,3040592,3041921,3038687,3011296,3008349,3041745,3025181,3038525,40762852,3038566,40757532,3001022,3039558,40757379,3038565,3041028,3038257,3040594,44786741,40757380,3009877,40757391,43534070,40757402,3042146,3038581,3050625,40757381,3050771,40757392,40757403,3041787,3040442,3042342,42868432,40757382,3018582,42868430,3039826,3041486,3041604,3040867,3038395,40757383,3040578,3015980,3005793,3039178,3008799,40757394,3040908,40757405,3041786,3016567,3039739,3044550,3038420,3040892,42868433,3014194,42868431,3040104,46235368,40758481,3051231,3023228,40757395,3047279,40757406,3044218,3023758,40757384,3039807,3044562,3049428,3040634,40757385,3040641,40757386,3040468,3041763,3038727,3040099,40757387,3039224,3040896,3040710,40483242,3036283,3036807,3023379,3013802,3014163,3009006,3043678,3035125,3040748,3035352,3035858,3009397,3013219,3020317,3021580,3000931,3035759,3025398,3042443,40757524,40757525,40757526,3040567,40757523,3040366,40757527,40757528,40757529,40757627,40757628,40757629,40757630,40757530,3041971,3030745,3038434,3020096,3005550,3026728,3049496,3032780,3012635,3048585,3048856,36660183,3032986,3041884,3032779,3041186,3010044,36660135,3053004,3010030,3030416,3038388,3020193,3032719,40761077,3012792,3028944,40761078,3050134,3050095,3032230,3025658,3031928,3052381,3049466,3029014,3031929,3025866,3026536,3042201,3041915,4017078,40762874,40762873,3043536,3045291,40762876,3039997,3045318,40762875,3045067,3043032,40757626,3041930,3045105,3045131,3045158,3045700,3029462,3006893,4041726,40485039,4042760,3036671,3035250,3017703,3004077,3038962,3034962,3040151,3001501,40757617,40757618,4310205,4250134,4078281,3049746,36304599,3001511,3020058,3005030,3003435,3049846,3002332,3006887,4036846,42868682,3019765,3004067,3039439,3018056,36660046,4153112,4116187,4150337,40483205,40762250)

) E ON I.concept_id = E.concept_id
WHERE E.concept_id is null
) C UNION ALL 
SELECT 2 as codeset_id, c.concept_id FROM (select distinct I.concept_id FROM
( 
  select concept_id from @vocabulary_database_schema.CONCEPT where concept_id in (262,9203,9201)
UNION  select c.concept_id
  from @vocabulary_database_schema.CONCEPT c
  join @vocabulary_database_schema.CONCEPT_ANCESTOR ca on c.concept_id = ca.descendant_concept_id
  and ca.ancestor_concept_id in (262,9203,9201)
  and c.invalid_reason is null

) I
) C
;

SELECT event_id, person_id, start_date, end_date, op_start_date, op_end_date, visit_occurrence_id
INTO #qualified_events
FROM 
(
  select pe.event_id, pe.person_id, pe.start_date, pe.end_date, pe.op_start_date, pe.op_end_date, row_number() over (partition by pe.person_id order by pe.start_date ASC) as ordinal, cast(pe.visit_occurrence_id as bigint) as visit_occurrence_id
  FROM (-- Begin Primary Events
select P.ordinal as event_id, P.person_id, P.start_date, P.end_date, op_start_date, op_end_date, cast(P.visit_occurrence_id as bigint) as visit_occurrence_id
FROM
(
  select E.person_id, E.start_date, E.end_date,
         row_number() OVER (PARTITION BY E.person_id ORDER BY E.sort_date ASC, E.event_id) ordinal,
         OP.observation_period_start_date as op_start_date, OP.observation_period_end_date as op_end_date, cast(E.visit_occurrence_id as bigint) as visit_occurrence_id
  FROM 
  (
  select PE.person_id, PE.event_id, PE.start_date, PE.end_date, PE.visit_occurrence_id, PE.sort_date FROM (
-- Begin Visit Occurrence Criteria
select C.person_id, C.visit_occurrence_id as event_id, C.visit_start_date as start_date, C.visit_end_date as end_date,
       C.visit_occurrence_id, C.visit_start_date as sort_date
from 
(
  select vo.* 
  FROM @cdm_database_schema.VISIT_OCCURRENCE vo
JOIN #Codesets cs on (vo.visit_concept_id = cs.concept_id and cs.codeset_id = 2)
) C


-- End Visit Occurrence Criteria

) PE
JOIN (
-- Begin Criteria Group
select 0 as index_id, person_id, event_id
FROM
(
  select E.person_id, E.event_id 
  FROM (SELECT Q.person_id, Q.event_id, Q.start_date, Q.end_date, Q.visit_occurrence_id, OP.observation_period_start_date as op_start_date, OP.observation_period_end_date as op_end_date
FROM (-- Begin Visit Occurrence Criteria
select C.person_id, C.visit_occurrence_id as event_id, C.visit_start_date as start_date, C.visit_end_date as end_date,
       C.visit_occurrence_id, C.visit_start_date as sort_date
from 
(
  select vo.* 
  FROM @cdm_database_schema.VISIT_OCCURRENCE vo
JOIN #Codesets cs on (vo.visit_concept_id = cs.concept_id and cs.codeset_id = 2)
) C


-- End Visit Occurrence Criteria
) Q
JOIN @cdm_database_schema.OBSERVATION_PERIOD OP on Q.person_id = OP.person_id 
  and OP.observation_period_start_date <= Q.start_date and OP.observation_period_end_date >= Q.start_date
) E
  INNER JOIN
  (
    -- Begin Correlated Criteria
select 0 as index_id, cc.person_id, cc.event_id
from (SELECT p.person_id, p.event_id 
FROM (SELECT Q.person_id, Q.event_id, Q.start_date, Q.end_date, Q.visit_occurrence_id, OP.observation_period_start_date as op_start_date, OP.observation_period_end_date as op_end_date
FROM (-- Begin Visit Occurrence Criteria
select C.person_id, C.visit_occurrence_id as event_id, C.visit_start_date as start_date, C.visit_end_date as end_date,
       C.visit_occurrence_id, C.visit_start_date as sort_date
from 
(
  select vo.* 
  FROM @cdm_database_schema.VISIT_OCCURRENCE vo
JOIN #Codesets cs on (vo.visit_concept_id = cs.concept_id and cs.codeset_id = 2)
) C


-- End Visit Occurrence Criteria
) Q
JOIN @cdm_database_schema.OBSERVATION_PERIOD OP on Q.person_id = OP.person_id 
  and OP.observation_period_start_date <= Q.start_date and OP.observation_period_end_date >= Q.start_date
) P
JOIN (
  -- Begin Measurement Criteria
select C.person_id, C.measurement_id as event_id, C.measurement_date as start_date, DATEADD(d,1,C.measurement_date) as END_DATE,
       C.visit_occurrence_id, C.measurement_date as sort_date
from 
(
  select m.* 
  FROM @cdm_database_schema.MEASUREMENT m
JOIN #Codesets cs on (m.measurement_concept_id = cs.concept_id and cs.codeset_id = 1)
) C


-- End Measurement Criteria

) A on A.person_id = P.person_id  AND A.START_DATE >= P.OP_START_DATE AND A.START_DATE <= P.OP_END_DATE AND A.START_DATE >= DATEADD(day,0,P.START_DATE) AND A.START_DATE <= P.OP_END_DATE AND A.START_DATE >= P.OP_START_DATE AND A.START_DATE <= DATEADD(day,0,P.END_DATE) ) cc 
GROUP BY cc.person_id, cc.event_id
HAVING COUNT(cc.event_id) >= 1
-- End Correlated Criteria

  ) CQ on E.person_id = CQ.person_id and E.event_id = CQ.event_id
  GROUP BY E.person_id, E.event_id
  HAVING COUNT(index_id) = 1
) G
-- End Criteria Group
) AC on AC.person_id = pe.person_id and AC.event_id = pe.event_id

  ) E
	JOIN @cdm_database_schema.observation_period OP on E.person_id = OP.person_id and E.start_date >=  OP.observation_period_start_date and E.start_date <= op.observation_period_end_date
  WHERE DATEADD(day,0,OP.OBSERVATION_PERIOD_START_DATE) <= E.START_DATE AND DATEADD(day,0,E.START_DATE) <= OP.OBSERVATION_PERIOD_END_DATE
) P

-- End Primary Events
) pe
  
) QE

;

--- Inclusion Rule Inserts

create table #inclusion_events (inclusion_rule_id bigint,
	person_id bigint,
	event_id bigint
);

select event_id, person_id, start_date, end_date, op_start_date, op_end_date
into #included_events
FROM (
  SELECT event_id, person_id, start_date, end_date, op_start_date, op_end_date, row_number() over (partition by person_id order by start_date ASC) as ordinal
  from
  (
    select Q.event_id, Q.person_id, Q.start_date, Q.end_date, Q.op_start_date, Q.op_end_date, SUM(coalesce(POWER(cast(2 as bigint), I.inclusion_rule_id), 0)) as inclusion_rule_mask
    from #qualified_events Q
    LEFT JOIN #inclusion_events I on I.person_id = Q.person_id and I.event_id = Q.event_id
    GROUP BY Q.event_id, Q.person_id, Q.start_date, Q.end_date, Q.op_start_date, Q.op_end_date
  ) MG -- matching groups
{0 != 0}?{
  -- the matching group with all bits set ( POWER(2,# of inclusion rules) - 1 = inclusion_rule_mask
  WHERE (MG.inclusion_rule_mask = POWER(cast(2 as bigint),0)-1)
}
) Results

;

-- date offset strategy

select event_id, person_id, 
  case when DATEADD(day,0,end_date) > op_end_date then op_end_date else DATEADD(day,0,end_date) end as end_date
INTO #strategy_ends
from #included_events;


-- generate cohort periods into #final_cohort
select person_id, start_date, end_date
INTO #cohort_rows
from ( -- first_ends
	select F.person_id, F.start_date, F.end_date
	FROM (
	  select I.event_id, I.person_id, I.start_date, CE.end_date, row_number() over (partition by I.person_id, I.event_id order by CE.end_date) as ordinal
	  from #included_events I
	  join ( -- cohort_ends
-- cohort exit dates
-- End Date Strategy
SELECT event_id, person_id, end_date from #strategy_ends

    ) CE on I.event_id = CE.event_id and I.person_id = CE.person_id and CE.end_date >= I.start_date
	) F
	WHERE F.ordinal = 1
) FE;

select person_id, min(start_date) as start_date, end_date
into #final_cohort
from ( --cteEnds
	SELECT
		 c.person_id
		, c.start_date
		, MIN(ed.end_date) AS end_date
	FROM #cohort_rows c
	JOIN ( -- cteEndDates
    SELECT
      person_id
      , DATEADD(day,-1 * 0, event_date)  as end_date
    FROM
    (
      SELECT
        person_id
        , event_date
        , event_type
        , SUM(event_type) OVER (PARTITION BY person_id ORDER BY event_date, event_type ROWS UNBOUNDED PRECEDING) AS interval_status
      FROM
      (
        SELECT
          person_id
          , start_date AS event_date
          , -1 AS event_type
        FROM #cohort_rows

        UNION ALL


        SELECT
          person_id
          , DATEADD(day,0,end_date) as end_date
          , 1 AS event_type
        FROM #cohort_rows
      ) RAWDATA
    ) e
    WHERE interval_status = 0
  ) ed ON c.person_id = ed.person_id AND ed.end_date >= c.start_date
	GROUP BY c.person_id, c.start_date
) e
group by person_id, end_date
;

DELETE FROM @target_database_schema.@target_cohort_table where cohort_definition_id = @target_cohort_id;
INSERT INTO @target_database_schema.@target_cohort_table (cohort_definition_id, subject_id, cohort_start_date, cohort_end_date)
select @target_cohort_id as cohort_definition_id, person_id, start_date, end_date 
FROM #final_cohort CO
;

{1 != 0}?{
-- BEGIN: Censored Stats

delete from @results_database_schema.cohort_censor_stats where cohort_definition_id = @target_cohort_id;

-- END: Censored Stats
}
{1 != 0 & 0 != 0}?{

CREATE TABLE #inclusion_rules (rule_sequence int);

-- Find the event that is the 'best match' per person.  
-- the 'best match' is defined as the event that satisfies the most inclusion rules.
-- ties are solved by choosing the event that matches the earliest inclusion rule, and then earliest.

select q.person_id, q.event_id
into #best_events
from #qualified_events Q
join (
	SELECT R.person_id, R.event_id, ROW_NUMBER() OVER (PARTITION BY R.person_id ORDER BY R.rule_count DESC,R.min_rule_id ASC, R.start_date ASC) AS rank_value
	FROM (
		SELECT Q.person_id, Q.event_id, COALESCE(COUNT(DISTINCT I.inclusion_rule_id), 0) AS rule_count, COALESCE(MIN(I.inclusion_rule_id), 0) AS min_rule_id, Q.start_date
		FROM #qualified_events Q
		LEFT JOIN #inclusion_events I ON q.person_id = i.person_id AND q.event_id = i.event_id
		GROUP BY Q.person_id, Q.event_id, Q.start_date
	) R
) ranked on Q.person_id = ranked.person_id and Q.event_id = ranked.event_id
WHERE ranked.rank_value = 1
;

-- modes of generation: (the same tables store the results for the different modes, identified by the mode_id column)
-- 0: all events
-- 1: best event


-- BEGIN: Inclusion Impact Analysis - event
-- calculte matching group counts
delete from @results_database_schema.cohort_inclusion_result where cohort_definition_id = @target_cohort_id and mode_id = 0;
insert into @results_database_schema.cohort_inclusion_result (cohort_definition_id, inclusion_rule_mask, person_count, mode_id)
select @target_cohort_id as cohort_definition_id, inclusion_rule_mask, count_big(*) as person_count, 0 as mode_id
from
(
  select Q.person_id, Q.event_id, CAST(SUM(coalesce(POWER(cast(2 as bigint), I.inclusion_rule_id), 0)) AS bigint) as inclusion_rule_mask
  from #qualified_events Q
  LEFT JOIN #inclusion_events I on q.person_id = i.person_id and q.event_id = i.event_id
  GROUP BY Q.person_id, Q.event_id
) MG -- matching groups
group by inclusion_rule_mask
;

-- calculate gain counts 
delete from @results_database_schema.cohort_inclusion_stats where cohort_definition_id = @target_cohort_id and mode_id = 0;
insert into @results_database_schema.cohort_inclusion_stats (cohort_definition_id, rule_sequence, person_count, gain_count, person_total, mode_id)
select @target_cohort_id as cohort_definition_id, ir.rule_sequence, coalesce(T.person_count, 0) as person_count, coalesce(SR.person_count, 0) gain_count, EventTotal.total, 0 as mode_id
from #inclusion_rules ir
left join
(
  select i.inclusion_rule_id, count_big(i.event_id) as person_count
  from #qualified_events Q
  JOIN #inclusion_events i on Q.person_id = I.person_id and Q.event_id = i.event_id
  group by i.inclusion_rule_id
) T on ir.rule_sequence = T.inclusion_rule_id
CROSS JOIN (select count(*) as total_rules from #inclusion_rules) RuleTotal
CROSS JOIN (select count_big(event_id) as total from #qualified_events) EventTotal
LEFT JOIN @results_database_schema.cohort_inclusion_result SR on SR.mode_id = 0 AND SR.cohort_definition_id = @target_cohort_id AND (POWER(cast(2 as bigint),RuleTotal.total_rules) - POWER(cast(2 as bigint),ir.rule_sequence) - 1) = SR.inclusion_rule_mask -- POWER(2,rule count) - POWER(2,rule sequence) - 1 is the mask for 'all except this rule'
;

-- calculate totals
delete from @results_database_schema.cohort_summary_stats where cohort_definition_id = @target_cohort_id and mode_id = 0;
insert into @results_database_schema.cohort_summary_stats (cohort_definition_id, base_count, final_count, mode_id)
select @target_cohort_id as cohort_definition_id, PC.total as person_count, coalesce(FC.total, 0) as final_count, 0 as mode_id
FROM
(select count_big(event_id) as total from #qualified_events) PC,
(select sum(sr.person_count) as total
  from @results_database_schema.cohort_inclusion_result sr
  CROSS JOIN (select count(*) as total_rules from #inclusion_rules) RuleTotal
  where sr.mode_id = 0 and sr.cohort_definition_id = @target_cohort_id and sr.inclusion_rule_mask = POWER(cast(2 as bigint),RuleTotal.total_rules)-1
) FC
;

-- END: Inclusion Impact Analysis - event

-- BEGIN: Inclusion Impact Analysis - person
-- calculte matching group counts
delete from @results_database_schema.cohort_inclusion_result where cohort_definition_id = @target_cohort_id and mode_id = 1;
insert into @results_database_schema.cohort_inclusion_result (cohort_definition_id, inclusion_rule_mask, person_count, mode_id)
select @target_cohort_id as cohort_definition_id, inclusion_rule_mask, count_big(*) as person_count, 1 as mode_id
from
(
  select Q.person_id, Q.event_id, CAST(SUM(coalesce(POWER(cast(2 as bigint), I.inclusion_rule_id), 0)) AS bigint) as inclusion_rule_mask
  from #best_events Q
  LEFT JOIN #inclusion_events I on q.person_id = i.person_id and q.event_id = i.event_id
  GROUP BY Q.person_id, Q.event_id
) MG -- matching groups
group by inclusion_rule_mask
;

-- calculate gain counts 
delete from @results_database_schema.cohort_inclusion_stats where cohort_definition_id = @target_cohort_id and mode_id = 1;
insert into @results_database_schema.cohort_inclusion_stats (cohort_definition_id, rule_sequence, person_count, gain_count, person_total, mode_id)
select @target_cohort_id as cohort_definition_id, ir.rule_sequence, coalesce(T.person_count, 0) as person_count, coalesce(SR.person_count, 0) gain_count, EventTotal.total, 1 as mode_id
from #inclusion_rules ir
left join
(
  select i.inclusion_rule_id, count_big(i.event_id) as person_count
  from #best_events Q
  JOIN #inclusion_events i on Q.person_id = I.person_id and Q.event_id = i.event_id
  group by i.inclusion_rule_id
) T on ir.rule_sequence = T.inclusion_rule_id
CROSS JOIN (select count(*) as total_rules from #inclusion_rules) RuleTotal
CROSS JOIN (select count_big(event_id) as total from #best_events) EventTotal
LEFT JOIN @results_database_schema.cohort_inclusion_result SR on SR.mode_id = 1 AND SR.cohort_definition_id = @target_cohort_id AND (POWER(cast(2 as bigint),RuleTotal.total_rules) - POWER(cast(2 as bigint),ir.rule_sequence) - 1) = SR.inclusion_rule_mask -- POWER(2,rule count) - POWER(2,rule sequence) - 1 is the mask for 'all except this rule'
;

-- calculate totals
delete from @results_database_schema.cohort_summary_stats where cohort_definition_id = @target_cohort_id and mode_id = 1;
insert into @results_database_schema.cohort_summary_stats (cohort_definition_id, base_count, final_count, mode_id)
select @target_cohort_id as cohort_definition_id, PC.total as person_count, coalesce(FC.total, 0) as final_count, 1 as mode_id
FROM
(select count_big(event_id) as total from #best_events) PC,
(select sum(sr.person_count) as total
  from @results_database_schema.cohort_inclusion_result sr
  CROSS JOIN (select count(*) as total_rules from #inclusion_rules) RuleTotal
  where sr.mode_id = 1 and sr.cohort_definition_id = @target_cohort_id and sr.inclusion_rule_mask = POWER(cast(2 as bigint),RuleTotal.total_rules)-1
) FC
;

-- END: Inclusion Impact Analysis - person

TRUNCATE TABLE #best_events;
DROP TABLE #best_events;

TRUNCATE TABLE #inclusion_rules;
DROP TABLE #inclusion_rules;
}

TRUNCATE TABLE #strategy_ends;
DROP TABLE #strategy_ends;


TRUNCATE TABLE #cohort_rows;
DROP TABLE #cohort_rows;

TRUNCATE TABLE #final_cohort;
DROP TABLE #final_cohort;

TRUNCATE TABLE #inclusion_events;
DROP TABLE #inclusion_events;

TRUNCATE TABLE #qualified_events;
DROP TABLE #qualified_events;

TRUNCATE TABLE #included_events;
DROP TABLE #included_events;

TRUNCATE TABLE #Codesets;
DROP TABLE #Codesets;
