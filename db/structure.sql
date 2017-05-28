--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

--
-- Name: batting_hand; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE batting_hand AS ENUM (
    'R',
    'L',
    'S'
);


--
-- Name: batting_rating; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE batting_rating AS ENUM (
    '1',
    '2',
    '3',
    '4',
    '5'
);


--
-- Name: fielding_rating; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE fielding_rating AS ENUM (
    '1',
    '2',
    '3',
    '4',
    '5'
);


--
-- Name: pitcher_type; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE pitcher_type AS ENUM (
    'SP',
    'RP',
    'SP/RP',
    'RP/SP'
);


--
-- Name: region; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE region AS ENUM (
    'East',
    'Central',
    'West'
);


--
-- Name: running; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE running AS ENUM (
    '1-19',
    '1-18',
    '1-17',
    '1-16',
    '1-15',
    '1-14',
    '1-13',
    '1-12',
    '1-11',
    '1-10',
    '1-9',
    '1-8',
    '1-7',
    '1-6',
    '1-5',
    '1-4',
    '1-3',
    '1-2'
);


--
-- Name: stealing; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE stealing AS ENUM (
    'AA',
    'A',
    'B',
    'C',
    'D',
    'E'
);


--
-- Name: throws; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE throws AS ENUM (
    'R',
    'L'
);


SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: ar_internal_metadata; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE ar_internal_metadata (
    key character varying NOT NULL,
    value character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: default_lineup_slots; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE default_lineup_slots (
    id integer NOT NULL,
    team_id integer NOT NULL,
    player_id integer NOT NULL,
    slot integer NOT NULL,
    position_id integer NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: default_lineup_slots_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE default_lineup_slots_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: default_lineup_slots_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE default_lineup_slots_id_seq OWNED BY default_lineup_slots.id;


--
-- Name: divisions; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE divisions (
    id integer NOT NULL,
    league_id integer NOT NULL,
    region region NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: divisions_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE divisions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: divisions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE divisions_id_seq OWNED BY divisions.id;


--
-- Name: game_lineup_slots; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE game_lineup_slots (
    id integer NOT NULL,
    game_id integer NOT NULL,
    team integer NOT NULL,
    player_id integer NOT NULL,
    slot integer NOT NULL,
    position_id integer NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    ab integer DEFAULT 0 NOT NULL,
    r integer DEFAULT 0 NOT NULL,
    h integer DEFAULT 0 NOT NULL,
    rbi integer DEFAULT 0 NOT NULL,
    bb integer DEFAULT 0 NOT NULL,
    so integer DEFAULT 0 NOT NULL,
    doubles integer DEFAULT 0 NOT NULL,
    triples integer DEFAULT 0 NOT NULL,
    hr integer DEFAULT 0 NOT NULL
);


--
-- Name: game_lineup_slots_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE game_lineup_slots_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: game_lineup_slots_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE game_lineup_slots_id_seq OWNED BY game_lineup_slots.id;


--
-- Name: games; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE games (
    id integer NOT NULL,
    away_team_id integer NOT NULL,
    home_team_id integer NOT NULL,
    start_time timestamp without time zone NOT NULL,
    status integer NOT NULL,
    away_score integer DEFAULT 0,
    home_score integer DEFAULT 0,
    current_inning integer
);


--
-- Name: games_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE games_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: games_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE games_id_seq OWNED BY games.id;


--
-- Name: innings; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE innings (
    id integer NOT NULL,
    game_id integer NOT NULL,
    number integer NOT NULL,
    half integer NOT NULL,
    status integer NOT NULL,
    runs integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    outs integer DEFAULT 0
);


--
-- Name: innings_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE innings_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: innings_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE innings_id_seq OWNED BY innings.id;


--
-- Name: leagues; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE leagues (
    id integer NOT NULL,
    name character varying NOT NULL,
    dh boolean NOT NULL,
    logo character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: leagues_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE leagues_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: leagues_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE leagues_id_seq OWNED BY leagues.id;


--
-- Name: outcomes; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE outcomes (
    id integer NOT NULL,
    code character varying NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    ab boolean DEFAULT true NOT NULL,
    h boolean DEFAULT false NOT NULL,
    bb boolean DEFAULT false NOT NULL,
    so boolean DEFAULT false NOT NULL,
    double boolean DEFAULT false NOT NULL,
    triple boolean DEFAULT false NOT NULL,
    hr boolean DEFAULT false NOT NULL
);


--
-- Name: outcomes_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE outcomes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: outcomes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE outcomes_id_seq OWNED BY outcomes.id;


--
-- Name: pitchers; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE pitchers (
    id integer NOT NULL,
    team_id integer NOT NULL,
    first_name character varying NOT NULL,
    last_name character varying NOT NULL,
    throws throws NOT NULL,
    vs_lhb json NOT NULL,
    vs_rhb json NOT NULL,
    batting_rating batting_rating NOT NULL,
    wins integer NOT NULL,
    losses integer NOT NULL,
    era numeric(3,2) NOT NULL,
    starts integer NOT NULL,
    saves integer NOT NULL,
    innings_pitched integer NOT NULL,
    hits_allowed integer NOT NULL,
    bb integer NOT NULL,
    so integer NOT NULL,
    hr_allowed integer NOT NULL,
    image_small character varying,
    image_large character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    pitcher_type pitcher_type NOT NULL
);


--
-- Name: pitchers_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE pitchers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: pitchers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE pitchers_id_seq OWNED BY pitchers.id;


--
-- Name: plate_appearances; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE plate_appearances (
    id integer NOT NULL,
    inning_id integer NOT NULL,
    batter_id integer NOT NULL,
    pitcher_id integer NOT NULL,
    runner_on_first_id integer,
    runner_on_second_id integer,
    runner_on_third_id integer,
    outcome_id integer NOT NULL,
    ab boolean DEFAULT true,
    h boolean DEFAULT false,
    hr boolean DEFAULT false,
    bb boolean DEFAULT false,
    so boolean DEFAULT false,
    double boolean DEFAULT false,
    triple boolean DEFAULT false,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: plate_appearances_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE plate_appearances_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: plate_appearances_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE plate_appearances_id_seq OWNED BY plate_appearances.id;


--
-- Name: player_positions; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE player_positions (
    id integer NOT NULL,
    player_id integer NOT NULL,
    position_id integer NOT NULL,
    fielding_rating fielding_rating NOT NULL,
    frequency integer NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: player_positions_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE player_positions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: player_positions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE player_positions_id_seq OWNED BY player_positions.id;


--
-- Name: players; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE players (
    id integer NOT NULL,
    team_id integer NOT NULL,
    first_name character varying NOT NULL,
    last_name character varying NOT NULL,
    batting_hand batting_hand NOT NULL,
    stealing stealing NOT NULL,
    running running NOT NULL,
    vs_lhp json NOT NULL,
    vs_rhp json NOT NULL,
    avg numeric(3,3) NOT NULL,
    ab smallint NOT NULL,
    doubles integer NOT NULL,
    triples integer NOT NULL,
    hr smallint NOT NULL,
    rbi smallint NOT NULL,
    bb smallint NOT NULL,
    so smallint NOT NULL,
    sb smallint NOT NULL,
    cs smallint NOT NULL,
    slg numeric(3,3) NOT NULL,
    obp numeric(3,3) NOT NULL,
    image_small character varying,
    image_large character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: players_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE players_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: players_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE players_id_seq OWNED BY players.id;


--
-- Name: positions; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE positions (
    id integer NOT NULL,
    name character varying NOT NULL,
    abbreviation character varying(2) NOT NULL,
    scorebook_id character varying(2) NOT NULL
);


--
-- Name: positions_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE positions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: positions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE positions_id_seq OWNED BY positions.id;


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE schema_migrations (
    version character varying NOT NULL
);


--
-- Name: teams; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE teams (
    id integer NOT NULL,
    division_id integer NOT NULL,
    city character varying NOT NULL,
    name character varying NOT NULL,
    logo character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    abbreviation character varying(3) NOT NULL
);


--
-- Name: teams_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE teams_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: teams_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE teams_id_seq OWNED BY teams.id;


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY default_lineup_slots ALTER COLUMN id SET DEFAULT nextval('default_lineup_slots_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY divisions ALTER COLUMN id SET DEFAULT nextval('divisions_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY game_lineup_slots ALTER COLUMN id SET DEFAULT nextval('game_lineup_slots_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY games ALTER COLUMN id SET DEFAULT nextval('games_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY innings ALTER COLUMN id SET DEFAULT nextval('innings_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY leagues ALTER COLUMN id SET DEFAULT nextval('leagues_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY outcomes ALTER COLUMN id SET DEFAULT nextval('outcomes_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY pitchers ALTER COLUMN id SET DEFAULT nextval('pitchers_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY plate_appearances ALTER COLUMN id SET DEFAULT nextval('plate_appearances_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY player_positions ALTER COLUMN id SET DEFAULT nextval('player_positions_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY players ALTER COLUMN id SET DEFAULT nextval('players_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY positions ALTER COLUMN id SET DEFAULT nextval('positions_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY teams ALTER COLUMN id SET DEFAULT nextval('teams_id_seq'::regclass);


--
-- Name: ar_internal_metadata_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY ar_internal_metadata
    ADD CONSTRAINT ar_internal_metadata_pkey PRIMARY KEY (key);


--
-- Name: default_lineup_slots_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY default_lineup_slots
    ADD CONSTRAINT default_lineup_slots_pkey PRIMARY KEY (id);


--
-- Name: divisions_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY divisions
    ADD CONSTRAINT divisions_pkey PRIMARY KEY (id);


--
-- Name: game_lineup_slots_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY game_lineup_slots
    ADD CONSTRAINT game_lineup_slots_pkey PRIMARY KEY (id);


--
-- Name: games_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY games
    ADD CONSTRAINT games_pkey PRIMARY KEY (id);


--
-- Name: innings_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY innings
    ADD CONSTRAINT innings_pkey PRIMARY KEY (id);


--
-- Name: leagues_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY leagues
    ADD CONSTRAINT leagues_pkey PRIMARY KEY (id);


--
-- Name: outcomes_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY outcomes
    ADD CONSTRAINT outcomes_pkey PRIMARY KEY (id);


--
-- Name: pitchers_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY pitchers
    ADD CONSTRAINT pitchers_pkey PRIMARY KEY (id);


--
-- Name: plate_appearances_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY plate_appearances
    ADD CONSTRAINT plate_appearances_pkey PRIMARY KEY (id);


--
-- Name: player_positions_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY player_positions
    ADD CONSTRAINT player_positions_pkey PRIMARY KEY (id);


--
-- Name: players_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY players
    ADD CONSTRAINT players_pkey PRIMARY KEY (id);


--
-- Name: positions_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY positions
    ADD CONSTRAINT positions_pkey PRIMARY KEY (id);


--
-- Name: teams_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY teams
    ADD CONSTRAINT teams_pkey PRIMARY KEY (id);


--
-- Name: index_default_lineup_slots_on_team_id_and_player_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE UNIQUE INDEX index_default_lineup_slots_on_team_id_and_player_id ON default_lineup_slots USING btree (team_id, player_id);


--
-- Name: index_default_lineup_slots_on_team_id_and_position_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE UNIQUE INDEX index_default_lineup_slots_on_team_id_and_position_id ON default_lineup_slots USING btree (team_id, position_id);


--
-- Name: index_default_lineup_slots_on_team_id_and_slot; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE UNIQUE INDEX index_default_lineup_slots_on_team_id_and_slot ON default_lineup_slots USING btree (team_id, slot);


--
-- Name: index_divisions_on_id_and_region; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE UNIQUE INDEX index_divisions_on_id_and_region ON divisions USING btree (id, region);


--
-- Name: index_game_lineup_slots_on_game_id_and_team_and_player_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE UNIQUE INDEX index_game_lineup_slots_on_game_id_and_team_and_player_id ON game_lineup_slots USING btree (game_id, team, player_id);


--
-- Name: index_game_lineup_slots_on_game_id_and_team_and_position_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE UNIQUE INDEX index_game_lineup_slots_on_game_id_and_team_and_position_id ON game_lineup_slots USING btree (game_id, team, position_id);


--
-- Name: index_game_lineup_slots_on_game_id_and_team_and_slot; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE UNIQUE INDEX index_game_lineup_slots_on_game_id_and_team_and_slot ON game_lineup_slots USING btree (game_id, team, slot);


--
-- Name: index_innings_on_game_id_and_number_and_half; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE UNIQUE INDEX index_innings_on_game_id_and_number_and_half ON innings USING btree (game_id, number, half);


--
-- Name: index_leagues_on_name; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE UNIQUE INDEX index_leagues_on_name ON leagues USING btree (name);


--
-- Name: index_outcomes_on_code; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_outcomes_on_code ON outcomes USING btree (code);


--
-- Name: index_player_positions_on_player_id_and_position_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE UNIQUE INDEX index_player_positions_on_player_id_and_position_id ON player_positions USING btree (player_id, position_id);


--
-- Name: index_teams_on_name; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE UNIQUE INDEX index_teams_on_name ON teams USING btree (name);


--
-- Name: unique_schema_migrations; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE UNIQUE INDEX unique_schema_migrations ON schema_migrations USING btree (version);


--
-- PostgreSQL database dump complete
--

SET search_path TO "$user",public;

INSERT INTO "schema_migrations" (version) VALUES
('20160312201127'),
('20160319021924'),
('20160319232808'),
('20160320203038'),
('20160417233633'),
('20160425020455'),
('20160501202135'),
('20160520022013'),
('20160521220817'),
('20160605223824'),
('20160606021734'),
('20160617022244'),
('20161114015724'),
('20161125210911'),
('20161126181033'),
('20161202024125'),
('20161204153917'),
('20170101234806'),
('20170103025525'),
('20170601012133'),
('20170601013937');


