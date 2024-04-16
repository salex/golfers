--
-- PostgreSQL database dump
--

-- Dumped from database version 14.10 (Homebrew)
-- Dumped by pg_dump version 14.10 (Homebrew)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: ar_internal_metadata; Type: TABLE; Schema: public; Owner: salex
--

CREATE TABLE public.ar_internal_metadata (
    key character varying NOT NULL,
    value character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.ar_internal_metadata OWNER TO salex;

--
-- Name: games; Type: TABLE; Schema: public; Owner: salex
--

CREATE TABLE public.games (
    id bigint NOT NULL,
    group_id bigint NOT NULL,
    date date,
    status character varying,
    method character varying,
    scoring text,
    par3 text,
    skins text,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.games OWNER TO salex;

--
-- Name: games_id_seq; Type: SEQUENCE; Schema: public; Owner: salex
--

CREATE SEQUENCE public.games_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.games_id_seq OWNER TO salex;

--
-- Name: games_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: salex
--

ALTER SEQUENCE public.games_id_seq OWNED BY public.games.id;


--
-- Name: groups; Type: TABLE; Schema: public; Owner: salex
--

CREATE TABLE public.groups (
    id bigint NOT NULL,
    name character varying,
    tees character varying,
    settings text,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    courses text
);


ALTER TABLE public.groups OWNER TO salex;

--
-- Name: groups_id_seq; Type: SEQUENCE; Schema: public; Owner: salex
--

CREATE SEQUENCE public.groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.groups_id_seq OWNER TO salex;

--
-- Name: groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: salex
--

ALTER SEQUENCE public.groups_id_seq OWNED BY public.groups.id;


--
-- Name: players; Type: TABLE; Schema: public; Owner: salex
--

CREATE TABLE public.players (
    id bigint NOT NULL,
    group_id bigint NOT NULL,
    first_name character varying,
    last_name character varying,
    nickname character varying,
    use_nickname boolean,
    name character varying,
    tee character varying,
    quota integer,
    rquota double precision,
    phone character varying,
    is_frozen boolean,
    last_played date,
    pin integer,
    limited character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.players OWNER TO salex;

--
-- Name: players_id_seq; Type: SEQUENCE; Schema: public; Owner: salex
--

CREATE SEQUENCE public.players_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.players_id_seq OWNER TO salex;

--
-- Name: players_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: salex
--

ALTER SEQUENCE public.players_id_seq OWNED BY public.players.id;


--
-- Name: rounds; Type: TABLE; Schema: public; Owner: salex
--

CREATE TABLE public.rounds (
    id bigint NOT NULL,
    game_id bigint NOT NULL,
    player_id bigint NOT NULL,
    type character varying,
    date date,
    team integer,
    tee character varying,
    quota integer,
    front integer,
    back integer,
    total integer,
    quality double precision,
    skins double precision,
    par3 double precision,
    other double precision,
    limited character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.rounds OWNER TO salex;

--
-- Name: rounds_id_seq; Type: SEQUENCE; Schema: public; Owner: salex
--

CREATE SEQUENCE public.rounds_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.rounds_id_seq OWNER TO salex;

--
-- Name: rounds_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: salex
--

ALTER SEQUENCE public.rounds_id_seq OWNED BY public.rounds.id;


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: salex
--

CREATE TABLE public.schema_migrations (
    version character varying NOT NULL
);


ALTER TABLE public.schema_migrations OWNER TO salex;

--
-- Name: users; Type: TABLE; Schema: public; Owner: salex
--

CREATE TABLE public.users (
    id bigint NOT NULL,
    group_id bigint NOT NULL,
    fullname character varying,
    username character varying,
    email character varying,
    role character varying,
    permits text,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    password_digest character varying
);


ALTER TABLE public.users OWNER TO salex;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: salex
--

CREATE SEQUENCE public.users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_id_seq OWNER TO salex;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: salex
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: games id; Type: DEFAULT; Schema: public; Owner: salex
--

ALTER TABLE ONLY public.games ALTER COLUMN id SET DEFAULT nextval('public.games_id_seq'::regclass);


--
-- Name: groups id; Type: DEFAULT; Schema: public; Owner: salex
--

ALTER TABLE ONLY public.groups ALTER COLUMN id SET DEFAULT nextval('public.groups_id_seq'::regclass);


--
-- Name: players id; Type: DEFAULT; Schema: public; Owner: salex
--

ALTER TABLE ONLY public.players ALTER COLUMN id SET DEFAULT nextval('public.players_id_seq'::regclass);


--
-- Name: rounds id; Type: DEFAULT; Schema: public; Owner: salex
--

ALTER TABLE ONLY public.rounds ALTER COLUMN id SET DEFAULT nextval('public.rounds_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: salex
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Data for Name: ar_internal_metadata; Type: TABLE DATA; Schema: public; Owner: salex
--

COPY public.ar_internal_metadata (key, value, created_at, updated_at) FROM stdin;
environment	development	2023-10-24 16:01:33.997987	2023-10-24 16:01:33.997989
\.


--
-- Data for Name: games; Type: TABLE DATA; Schema: public; Owner: salex
--

COPY public.games (id, group_id, date, status, method, scoring, par3, skins, created_at, updated_at) FROM stdin;
3	5	2024-03-26	Scored	sides	{"makeup":"threesomes","seed_method":"draw"}	{"good":{"4":"47","1":"48","2":"55","3":"50"},"player_good":{"104":"","57":"","47":"4","48":"1","53":"","54":"","55":"2","52":"","51":"","50":"3","56":""}}	{"good":".9..11.....1.1.9..","player_par":{"104":"...........B......","57":".....B............","47":"...............B..","48":"..................","53":".B................","54":"....B..........B..","55":"..................","52":"...............B..","51":"..................","50":".B...........B....","56":".................."}}	2024-03-26 21:25:38.659961	2024-04-04 03:50:31.073587
2	5	2024-03-06	Scored	sides	{"makeup":"twosomes","seed_method":"draw"}	{"good":{"1":"73","2":"74","3":"71","4":"72"},"player_good":{"73":"1","74":"2","71":"3","72":"4","70":"","68":"","69":"","75":""}}	{"good":"911.121.....9.....","player_par":{"73":"....B.............","74":".....E......B.....","71":".B................","72":"......B.....B.....","70":"..................","68":"..B.........B.....","69":"B.................","75":"B................."}}	2024-03-06 17:40:41.73017	2024-04-04 16:38:16.484122
5	5	2024-03-29	Scheduled	sides	""	""	""	2024-03-29 16:47:55.239761	2024-04-01 23:08:36.78791
1	1	2024-02-25	scheduled	sides			000000000000000000	2024-02-25 17:32:29.006875	2024-04-02 20:46:24.105775
4	5	2024-03-26	Scored	places	{"makeup":"individuals","seed_method":"draw"}	{"good":{"1":"58","2":"64","4":"65","3":"63"},"player_good":{"58":"1","102":"","64":"2","59":"","65":"4","60":"","61":"","63":"3"}}	{"good":"..111....1......9.","player_par":{"58":"..B.............B.","102":"..................","64":"................B.","59":"...B.....B........","65":"....B.............","60":"..................","61":"..................","63":".................."}}	2024-03-26 21:40:53.256669	2024-04-04 03:32:55.937553
\.


--
-- Data for Name: groups; Type: TABLE DATA; Schema: public; Owner: salex
--

COPY public.groups (id, name, tees, settings, created_at, updated_at, courses) FROM stdin;
6	Saints		{"par_in":"444444444","par_out":"444444444","welcome":"Welcome to Test","alert":"","notice":"","tee_time":"9:30am","play_days":"m w f","dues":8,"skins_dues":2,"par3_dues":2,"other_dues":0,"truncate_quota":true,"pay":"","limit_new_player":false,"limit_rounds":2,"limit_points":2,"limit_new_tee":false,"limit_new_tee_rounds":1,"limit_new_tee_points":2,"limit_frozen_player":false,"limit_frozen_points":2,"limit_inactive_player":false,"limit_inactive_days":180,"limit_inactive_rounds":1,"limit_inactive_points":2,"sanitize_first_round":false,"trim_months":18,"rounds_used":10,"use_hi_lo_rule":false,"default_stats_rounds":100,"use_keyboard_scoring":false,"default_in_sidegames":true,"use_autoscroll":true,"score_place_dist":"mid","score_place_perc":50,"default_course":"TwinBridges"}	2024-03-31 00:18:49.619962	2024-04-03 12:39:55.883717	New::par_in=444444444:par_out=444444444:tees=Blue White Red 
2	WeBeBig	red gray	{"par_in":"444444444","par_out":"444444444","welcome":"Welcome to WeBeBig. now is the time for all good men to come to the aid of their country.","alert":"","notice":"","tee_time":"9:30am","play_days":"m w f","dues":6,"skins_dues":2,"par3_dues":2,"other_dues":0,"truncate_quota":true,"pay":"","limit_new_player":false,"limit_rounds":2,"limit_points":2,"limit_new_tee":false,"limit_new_tee_rounds":1,"limit_new_tee_points":2,"limit_frozen_player":false,"limit_frozen_points":2,"limit_inactive_player":false,"limit_inactive_days":180,"limit_inactive_rounds":1,"limit_inactive_points":2,"sanitize_first_round":false,"trim_months":18,"rounds_used":10,"use_hi_lo_rule":false,"default_stats_rounds":100,"use_keyboard_scoring":false,"default_in_sidegames":true,"use_autoscroll":true,"score_place_dist":"mid","score_place_perc":50,"default_course":"TwinBridges"}	2023-10-24 21:35:10.491452	2024-03-06 15:13:04.04236	New::par_in=444444444:par_out=444444444:tees=Blue White Red 
1	Test	red gray white blue gold	{"par_in":"444444444","par_out":"444444444","welcome":"Welcome to Test","alert":"shit","notice":"","tee_time":"9:30am","play_days":"m w f","dues":6,"skins_dues":2,"par3_dues":2,"other_dues":0,"truncate_quota":true,"pay":"","limit_new_player":false,"limit_rounds":2,"limit_points":2,"limit_new_tee":false,"limit_new_tee_rounds":1,"limit_new_tee_points":2,"limit_frozen_player":false,"limit_frozen_points":2,"limit_inactive_player":false,"limit_inactive_days":180,"limit_inactive_rounds":1,"limit_inactive_points":2,"sanitize_first_round":false,"trim_months":18,"rounds_used":10,"use_hi_lo_rule":false,"default_stats_rounds":100,"use_keyboard_scoring":false,"default_in_sidegames":true,"use_autoscroll":true,"score_place_dist":"mid","score_place_perc":50,"default_course":"TwinBridges"}	2023-10-24 20:53:23.678947	2024-03-06 15:13:04.04474	par3::par_in=333333333:par_out=333333333:tees=p3 ,TwinBridges::par_in=443455434:par_out=453445344:tees=gold Blue White Gray Red Junior,
4	The Gaggle	Blue White Gold Red	{"par_in":"434443455","par_out":"443534445","welcome":"Welcome to The Gaggle \\u003cbr/\\u003e Play on Mon, Wed, Fri and Sat at 8:00am","alert":"","notice":"","tee_time":"8:00am","play_days":"Mon, Wed, Fri, Sat","dues":8,"skins_dues":2,"par3_dues":0,"other_dues":0,"truncate_quota":false,"pay":"places","limit_new_player":true,"limit_rounds":2,"limit_points":4,"limit_new_tee":false,"limit_new_tee_rounds":1,"limit_new_tee_points":2,"limit_frozen_player":false,"limit_frozen_points":2,"limit_inactive_player":false,"limit_inactive_days":180,"limit_inactive_rounds":1,"limit_inactive_points":2,"sanitize_first_round":true,"trim_months":18,"rounds_used":7,"use_hi_lo_rule":true,"default_stats_rounds":100,"use_keyboard_scoring":false,"default_in_sidegames":true,"use_autoscroll":true,"score_place_dist":"mid","score_place_perc":40,"default_course":"TwinBridges"}	2024-04-05 18:14:57.376871	2024-04-05 18:14:57.387205	New::par_in=444444444:par_out=444444444:tees=Blue White Red 
5	Sinners	gold Blue White Gray Red	{"par_in":"443455434","par_out":"453445344","welcome":"Welcome to the Sinners  A group that normally plays on Mon, Wed and Fri at 9:30 am with 4 or 5 tee times","alert":"","notice":"","tee_time":"9:30am","play_days":"Mon, Wed, Fri","dues":6,"skins_dues":2,"par3_dues":2,"other_dues":0,"truncate_quota":true,"pay":"sides","limit_new_player":true,"limit_rounds":2,"limit_points":2,"limit_new_tee":true,"limit_new_tee_rounds":1,"limit_new_tee_points":2,"limit_frozen_player":true,"limit_frozen_points":2,"limit_inactive_player":true,"limit_inactive_days":180,"limit_inactive_rounds":2,"limit_inactive_points":2,"sanitize_first_round":true,"trim_months":24,"rounds_used":10,"use_hi_lo_rule":false,"default_stats_rounds":100,"use_keyboard_scoring":true,"default_in_sidegames":true,"use_autoscroll":true,"score_place_dist":"mid","score_place_perc":50,"default_course":"TwinBridges"}	2024-02-25 14:44:38.357546	2024-03-24 19:41:10.16934	East::par_in=3544444354:par_out=444444444:tees=Blue White Red ,
\.


--
-- Data for Name: players; Type: TABLE DATA; Schema: public; Owner: salex
--

COPY public.players (id, group_id, first_name, last_name, nickname, use_nickname, name, tee, quota, rquota, phone, is_frozen, last_played, pin, limited, created_at, updated_at) FROM stdin;
1	1	Joe	Blow		f	Joey	Gray	22	22		f	2024-02-25	232		2024-02-25 19:18:21.263138	2024-02-25 19:18:21.263138
8	5	Bob	Wilder		f	Bob Wilder	Gray	22	22		f	2024-03-26	665	2:newPlayer	2020-05-27 15:21:50.539	2024-03-30 00:02:23.636646
2	5	Pete	dahammer		f	Peter	White	24	24.6		f	2024-05-03	123		2024-03-06 16:43:35.223111	2024-03-26 22:20:26.373307
3	5	Allen	Hodges		f	Allen Hodges	White	15	15		f	2023-12-24	649	2:inactive	2020-05-27 15:21:50.287	2024-03-26 22:20:26.378132
28	5	Ron	Jensen		f	Ron Jensen	White	22	22		f	2024-03-26	454	\N	2020-05-27 15:21:49.042	2024-03-31 18:39:59.855468
5	5	Bill	Floto		f	Bill Floto	Red	18	18.7		f	2023-12-03	808	\N	2022-06-15 13:59:07.265	2024-03-26 22:20:26.382509
6	5	Bink Johnathan	Wise	Bink	f	Bink Johnathan Wise	White	16	16		t	2023-12-03	892	2:frozen	2023-09-25 19:49:39.206	2024-03-26 22:20:26.384094
20	5	Joe	Cobb		f	Joe Cobb	Gray	22	22		f	2024-03-26	341	\N	2020-05-27 15:21:48.899	2024-03-31 18:39:59.872695
29	5	Steve	Alex		f	Steve Alex	Red	19	19.5	3342946026	f	2024-03-26	459	2:newPlayer	2020-05-27 15:21:49.051	2024-03-31 18:39:59.885459
10	5	Brad	Coley		f	Brad Coley	White	28	28.5		f	2024-01-14	899	2:newPlayer	2023-11-15 15:12:18.198	2024-03-26 22:20:26.390252
4	5	Avery	Pruitt		f	Avery Pruitt	Gray	26	26.5		f	2024-03-26	376	\N	2020-05-27 15:21:48.946	2024-03-31 18:39:59.900661
23	5	Mikey	Harrison		f	Mikey Harrison	Red	21	21		f	2024-03-26	195	\N	2020-05-27 15:21:48.623	2024-03-31 18:39:59.915675
25	5	Red	Nix		f	Red Nix	Gray	19	19		f	2024-03-26	337	\N	2020-05-27 15:21:48.88	2024-03-31 18:39:59.929228
14	5	David	Reavis		f	David Reavis	White	26	26.6		f	2024-02-02	563	\N	2020-05-27 15:21:49.653	2024-03-26 22:20:26.396058
15	5	Dennis	Moyer	Snoopy	f	Dennis Moyer	Gray	23	23		t	2023-12-03	896	2:frozen	2023-10-04 14:11:06.084	2024-03-26 22:20:26.397472
16	5	David	Chandler	Doc	t	Doc - D Chandler	Red	28	28.5		f	2023-12-26	847	2:inactive	2023-04-28 13:27:15.179	2024-03-26 22:20:26.39878
31	5	Wayne	Woodcock	Woody	f	Wayne Woodcock	White	28	28.5		f	2024-03-26	729	\N	2020-09-18 14:05:12.26	2024-03-31 18:39:59.942346
18	5	Frank	Griffin		f	Frank Griffin	Red	18	18		t	2023-12-01	895	2:frozen	2023-10-02 13:55:39.083	2024-03-26 22:20:26.40137
19	5	Greg	Stroud		f	Greg Stroud	White	14	14		t	2024-01-23	900	2:frozen	2023-11-20 14:34:04.334	2024-03-26 22:20:26.402696
24	5	Ralph	Dunn		f	Ralph Dunn	Gray	22	22		f	2024-03-26	48	2:newPlayer	2020-05-27 15:21:48.458	2024-03-31 18:39:59.952401
26	5	Renae	Coley		f	Renae Coley	Gray	19	19.5		f	2024-03-26	545	2:newPlayer	2020-05-27 15:21:49.521	2024-03-31 18:39:59.961875
21	5	Lynn	Nailor		f	Lynn Nailor	Gray	19	19		f	2024-03-26	470	\N	2020-05-27 15:21:49.069	2024-03-31 18:39:59.987938
11	5	Coach	Tom-Mcdowell		f	Coach Tom-Mcdowell	Gray	25	25		f	2024-03-26	439	2:newPlayer	2020-05-27 15:21:48.992	2024-04-03 20:10:06.768746
30	5	Tyler	Coley		f	Tyler Coley	Blue	31	31.88		f	2024-01-23	652	2:inactive	2020-05-27 15:21:50.318	2024-03-26 22:20:26.415058
7	5	Bob	Swawson		f	Bob Swawson	White	23	23		f	2024-03-26	635	\N	2020-05-27 15:21:50.142	2024-04-03 23:51:51.59323
32	5	Allen	Hodges		f	Allen Hodges	White	15	15		f	2023-10-25	649	2:inactive	2024-04-04 21:13:52.713211	2024-04-04 21:13:52.713211
27	5	Rickey	Young		f	Rickey Young	Gray	20	20.5	\N	f	2024-03-06	142	2:newPlayer	2020-05-27 15:21:48.59	2024-03-29 12:54:03.569379
12	5	Dale	Denson		f	Dale Denson	Gray	24	24.5		f	2024-03-06	497	2:newPlayer	2020-05-27 15:21:49.128	2024-03-29 12:54:03.580568
22	5	Mark	Norman		f	Mark Norman	Gray	21	21.5		f	2024-03-06	728	2:newPlayer	2020-09-18 14:04:18.968	2024-03-29 12:54:03.589836
9	5	Bobby	Mcculloch		f	Bobby Mcculloch	Gray	17	17.5		f	2024-03-06	479	2:newPlayer	2020-05-27 15:21:49.088	2024-03-29 12:54:03.606322
17	5	Dominick	Margentina		f	Dominick Margentina	White	26	26.5	6303718931	f	2024-03-06	755	2:newPlayer	2021-08-11 14:04:02.406	2024-03-29 12:54:03.613707
13	5	Dan	Hill		f	Dan Hill	Gray	24	24		f	2024-03-06	759	2:newPlayer	2021-09-06 23:08:23.121	2024-03-29 12:54:03.621109
\.


--
-- Data for Name: rounds; Type: TABLE DATA; Schema: public; Owner: salex
--

COPY public.rounds (id, game_id, player_id, type, date, team, tee, quota, front, back, total, quality, skins, par3, other, limited, created_at, updated_at) FROM stdin;
64	4	11	ScoredRound	2024-03-26	3	Gray	27	12	11	23	0	0	4	\N	\N	2024-03-27 13:51:07.853271	2024-04-04 03:32:55.916662
59	4	20	ScoredRound	2024-03-26	4	Gray	26	9	9	18	0	8	0	\N	\N	2024-03-27 13:30:20.169707	2024-04-04 03:32:55.919911
65	4	21	ScoredRound	2024-03-26	5	Gray	16	11	9	20	20	4	4	\N	\N	2024-03-27 14:40:15.198381	2024-04-04 03:32:55.923371
73	2	4	ScoredRound	2024-03-06	3	Gray	25	15	13	28	16	3.2	4	\N	2:inactive	2024-03-29 12:46:51.402351	2024-03-31 23:45:53.397731
74	2	9	ScoredRound	2024-03-06	3	Gray	16	10	9	19	16	3.2	4	\N	\N	2024-03-29 12:46:51.409271	2024-03-31 23:45:53.405546
71	2	12	ScoredRound	2024-03-06	2	Gray	24	12	13	25	8	3.2	4	\N	\N	2024-03-29 12:46:51.387449	2024-03-31 23:45:53.409398
72	2	13	ScoredRound	2024-03-06	4	Gray	23	13	12	25	0	3.2	4	\N	\N	2024-03-29 12:46:51.39555	2024-03-31 23:45:53.412484
104	3	4	ScoredRound	2024-03-26	2	Gray	26	12	13	25	14.666666666666666	5.5	0	\N	2:newPlayer	2024-03-31 18:36:35.005951	2024-04-04 03:50:31.021504
70	2	17	ScoredRound	2024-03-06	4	White	27	14	12	26	0	0	0	\N	\N	2024-03-29 12:46:51.378289	2024-03-31 23:45:53.415207
68	2	22	ScoredRound	2024-03-06	2	Gray	20	11	12	23	8	3.2	0	\N	\N	2024-03-29 12:46:51.343973	2024-03-31 23:45:53.417929
69	2	27	ScoredRound	2024-03-06	1	Gray	19	11	11	22	0	0	0	\N	\N	2024-03-29 12:46:51.366088	2024-03-31 23:45:53.420733
57	3	7	ScoredRound	2024-03-26	4	White	24	10	13	23	11	5.5	0	\N	\N	2024-03-27 02:28:16.380583	2024-04-04 03:50:31.027563
47	3	20	ScoredRound	2024-03-26	1	Gray	26	13	13	26	0	0	5.5	\N	\N	2024-03-26 21:35:11.004559	2024-04-04 03:50:31.032875
48	3	21	ScoredRound	2024-03-26	4	Gray	16	6	12	18	11	0	5.5	\N	\N	2024-03-26 21:35:11.019379	2024-04-04 03:50:31.037315
60	4	23	ScoredRound	2024-03-26	6	Red	21	9	9	18	0	0	0	\N	\N	2024-03-27 13:30:20.177451	2024-04-04 03:32:55.926744
75	2	31	ScoredRound	2024-03-06	1	White	29	15	14	29	0	0	0	\N	\N	2024-03-29 12:46:51.415978	2024-03-31 23:45:53.423559
53	3	23	ScoredRound	2024-03-26	2	Red	21	11	13	24	14.666666666666666	0	0	\N	\N	2024-03-26 21:53:45.590469	2024-04-04 03:50:31.041659
54	3	24	ScoredRound	2024-03-26	3	Gray	23	11	10	21	0	5.5	0	\N	\N	2024-03-26 21:53:45.605999	2024-04-04 03:50:31.045682
55	3	25	ScoredRound	2024-03-26	2	Gray	18	10	10	20	14.666666666666666	0	5.5	\N	2:inactive	2024-03-26 21:53:45.615807	2024-04-04 03:50:31.050152
61	4	25	ScoredRound	2024-03-26	7	Gray	18	9	9	18	10.5	0	0	\N	2:inactive	2024-03-27 13:30:20.184608	2024-04-04 03:32:55.93032
63	4	28	ScoredRound	2024-03-26	8	White	27	9	9	18	0	0	4	\N	\N	2024-03-27 13:30:20.198356	2024-04-04 03:32:55.933742
52	3	26	ScoredRound	2024-03-26	3	Gray	19	10	10	20	0	0	0	\N	\N	2024-03-26 21:35:11.055953	2024-04-04 03:50:31.054862
51	3	28	ScoredRound	2024-03-26	1	White	27	13	13	26	0	0	0	\N	\N	2024-03-26 21:35:11.048445	2024-04-04 03:50:31.059602
50	3	29	ScoredRound	2024-03-26	1	Red	19	10	10	20	0	5.5	5.5	\N	\N	2024-03-26 21:35:11.040824	2024-04-04 03:50:31.064735
56	3	31	ScoredRound	2024-03-26	3	White	29	12	16	28	0	0	0	\N	\N	2024-03-26 22:22:02.355975	2024-04-04 03:50:31.069444
87	5	17	\N	2024-03-29	0	White	26	\N	\N	\N	\N	\N	\N	\N	2:newPlayer	2024-03-29 17:39:28.95536	2024-03-29 17:39:28.95536
105	5	11	\N	2024-03-29	0	Gray	22	\N	\N	\N	\N	\N	\N	\N	2:newPlayer	2024-03-31 18:51:02.593223	2024-03-31 18:51:02.593223
89	5	23	\N	2024-03-29	0	Red	19	\N	\N	\N	\N	\N	\N	\N	2:newPlayer	2024-03-29 17:43:38.046461	2024-03-29 17:43:38.046461
90	5	27	\N	2024-03-29	0	Gray	20	\N	\N	\N	\N	\N	\N	\N	2:newPlayer	2024-03-29 17:44:45.516809	2024-03-29 17:44:45.516809
106	5	20	\N	2024-03-29	0	Gray	22	\N	\N	\N	\N	\N	\N	\N	\N	2024-03-31 18:51:02.604416	2024-03-31 18:51:02.604416
110	1	1	\N	2024-02-25	0	Gray	22	\N	\N	\N	\N	\N	\N	\N		2024-04-02 20:46:24.095608	2024-04-02 20:46:24.095608
107	5	22	\N	2024-03-29	0	Gray	21	\N	\N	\N	\N	\N	\N	\N	2:newPlayer	2024-03-31 18:51:02.612934	2024-03-31 18:51:02.612934
108	5	28	\N	2024-03-29	0	White	22	\N	\N	\N	\N	\N	\N	\N	\N	2024-03-31 18:51:02.621067	2024-03-31 18:51:02.621067
109	5	9	\N	2024-03-29	0	Gray	17	\N	\N	\N	\N	\N	\N	\N	2:newPlayer	2024-03-31 18:51:02.629617	2024-03-31 18:51:02.629617
58	4	7	ScoredRound	2024-03-26	1	White	24	12	11	23	7	4	4	\N	\N	2024-03-27 13:30:20.152211	2024-04-04 03:32:55.906551
102	4	8	ScoredRound	2024-03-26	2	Gray	22	11	11	22	10.5	0	0	\N	\N	2024-03-29 23:31:29.135839	2024-04-04 03:32:55.913059
\.


--
-- Data for Name: schema_migrations; Type: TABLE DATA; Schema: public; Owner: salex
--

COPY public.schema_migrations (version) FROM stdin;
20231024155954
20231115171839
20231115173344
20240223124345
20240223154303
20240225141333
20240304141223
20240324161452
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: salex
--

COPY public.users (id, group_id, fullname, username, email, role, permits, created_at, updated_at, password_digest) FROM stdin;
1	1	iBe Super	king	king@pggole.us	super	{"group":"1111","user":"1111","player":"1111","game":"1111","round":"1111","blog":"1111","comment":"1111"}	2024-02-23 13:12:13.367365	2024-02-23 15:49:42.392472	$2a$12$2hnPcrYI/N/K2W6eNfQAdOMhz7uO2KYmhT1DXSInLxEK6EuA35MRy
2	2	I group 2	group2	g2@x.com	admin	{"group":"0110","user":"1111","player":"1111","game":"1111","round":"1111","blog":"1111","comment":"1111"}	2024-02-23 16:57:52.089319	2024-02-23 16:57:52.089319	$2a$12$79FYvHEGydxYfJCOmaAK6.isYR25TepRbsV.AGjt6xaH68hqfoWcW
3	1	scorer	scorer	ax@kk.ua	trustee	{"group":"0100","user":"0000","player":"1111","game":"1111","round":"1111","blog":"1111","comment":"1111"}	2024-02-23 21:18:28.11932	2024-02-23 21:19:57.450303	$2a$12$N92h7NZWSjv/RmPDsybdBeAkmMHJ.te6jbn1HwPCb7kUqlWPvJmIe
5	2	j member	member	mem@sh.com	member	{"group":"0100","user":"0000","player":"1111","game":"1111","round":"1111","blog":"1111","comment":"1111"}	2024-02-24 13:37:41.108356	2024-02-24 13:37:41.108356	$2a$12$KXIK5yilGw0057avjwOyUeBiEE/5n4jPA4fU8/Tzyg.1J3hfVkdbq
6	5	Steve	salex	s@pt.us	super	{"group":"1111","user":"1111","player":"1111","game":"1111","round":"1111","blog":"1111","comment":"1111"}	2024-03-06 16:14:28.433809	2024-03-06 16:14:28.433809	$2a$12$x3UsUI7pK0nevpozP9NQge5qG6/bIl1Yib6CKq0bNJZe8x/oOWB.G
7	5	bob	bob	b@pt.us	trustee	{"group":"0100","user":"0000","player":"1111","game":"1111","round":"1111","blog":"1111","comment":"1111"}	2024-03-06 16:32:18.793693	2024-03-06 16:32:18.793693	$2a$12$46NduF2.B0ldmUFtSdnJ9u0op.a.0TQQw3c0q.1f5WKqixvtoqCjq
8	5	Visitor	visit	visit@ptgolf.us	guest	{"group":"0100","user":"0000","player":"0100","game":"0100","round":"0100","blog":"0100","comment":"0100"}	2024-04-02 11:59:50.636431	2024-04-02 11:59:50.636431	$2a$12$bbz71gqdJCIYxvs6VCk6Bekw66zO1P1aGue02g74el9Hkv2yTg8GO
4	2	be trusted	trustee	t@pt.com	trustee	{"group":"0100","user":"0000","player":"1111","game":"1111","round":"1111","blog":"1111","comment":"1111"}	2024-02-24 13:34:05.965893	2024-04-02 20:38:00.582605	$2a$12$0aHF5CuVIT.IGW2S4xlYzOT1PhyvXVSpglQfyPs5HIEYAjkQTlUEW
\.


--
-- Name: games_id_seq; Type: SEQUENCE SET; Schema: public; Owner: salex
--

SELECT pg_catalog.setval('public.games_id_seq', 5, true);


--
-- Name: groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: salex
--

SELECT pg_catalog.setval('public.groups_id_seq', 12, true);


--
-- Name: players_id_seq; Type: SEQUENCE SET; Schema: public; Owner: salex
--

SELECT pg_catalog.setval('public.players_id_seq', 32, true);


--
-- Name: rounds_id_seq; Type: SEQUENCE SET; Schema: public; Owner: salex
--

SELECT pg_catalog.setval('public.rounds_id_seq', 110, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: salex
--

SELECT pg_catalog.setval('public.users_id_seq', 8, true);


--
-- Name: ar_internal_metadata ar_internal_metadata_pkey; Type: CONSTRAINT; Schema: public; Owner: salex
--

ALTER TABLE ONLY public.ar_internal_metadata
    ADD CONSTRAINT ar_internal_metadata_pkey PRIMARY KEY (key);


--
-- Name: games games_pkey; Type: CONSTRAINT; Schema: public; Owner: salex
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_pkey PRIMARY KEY (id);


--
-- Name: groups groups_pkey; Type: CONSTRAINT; Schema: public; Owner: salex
--

ALTER TABLE ONLY public.groups
    ADD CONSTRAINT groups_pkey PRIMARY KEY (id);


--
-- Name: players players_pkey; Type: CONSTRAINT; Schema: public; Owner: salex
--

ALTER TABLE ONLY public.players
    ADD CONSTRAINT players_pkey PRIMARY KEY (id);


--
-- Name: rounds rounds_pkey; Type: CONSTRAINT; Schema: public; Owner: salex
--

ALTER TABLE ONLY public.rounds
    ADD CONSTRAINT rounds_pkey PRIMARY KEY (id);


--
-- Name: schema_migrations schema_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: salex
--

ALTER TABLE ONLY public.schema_migrations
    ADD CONSTRAINT schema_migrations_pkey PRIMARY KEY (version);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: salex
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: index_games_on_group_id; Type: INDEX; Schema: public; Owner: salex
--

CREATE INDEX index_games_on_group_id ON public.games USING btree (group_id);


--
-- Name: index_players_on_group_id; Type: INDEX; Schema: public; Owner: salex
--

CREATE INDEX index_players_on_group_id ON public.players USING btree (group_id);


--
-- Name: index_rounds_on_game_id; Type: INDEX; Schema: public; Owner: salex
--

CREATE INDEX index_rounds_on_game_id ON public.rounds USING btree (game_id);


--
-- Name: index_rounds_on_player_id; Type: INDEX; Schema: public; Owner: salex
--

CREATE INDEX index_rounds_on_player_id ON public.rounds USING btree (player_id);


--
-- Name: index_users_on_group_id; Type: INDEX; Schema: public; Owner: salex
--

CREATE INDEX index_users_on_group_id ON public.users USING btree (group_id);


--
-- Name: games fk_rails_4bb2e454de; Type: FK CONSTRAINT; Schema: public; Owner: salex
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT fk_rails_4bb2e454de FOREIGN KEY (group_id) REFERENCES public.groups(id);


--
-- Name: rounds fk_rails_7812c1b477; Type: FK CONSTRAINT; Schema: public; Owner: salex
--

ALTER TABLE ONLY public.rounds
    ADD CONSTRAINT fk_rails_7812c1b477 FOREIGN KEY (game_id) REFERENCES public.games(id);


--
-- Name: players fk_rails_b1e5f5a430; Type: FK CONSTRAINT; Schema: public; Owner: salex
--

ALTER TABLE ONLY public.players
    ADD CONSTRAINT fk_rails_b1e5f5a430 FOREIGN KEY (group_id) REFERENCES public.groups(id);


--
-- Name: rounds fk_rails_ead0a0b1e4; Type: FK CONSTRAINT; Schema: public; Owner: salex
--

ALTER TABLE ONLY public.rounds
    ADD CONSTRAINT fk_rails_ead0a0b1e4 FOREIGN KEY (player_id) REFERENCES public.players(id);


--
-- Name: users fk_rails_f40b3f4da6; Type: FK CONSTRAINT; Schema: public; Owner: salex
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT fk_rails_f40b3f4da6 FOREIGN KEY (group_id) REFERENCES public.groups(id);


--
-- PostgreSQL database dump complete
--

