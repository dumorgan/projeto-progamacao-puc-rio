--
-- PostgreSQL database dump
--

-- Dumped from database version 10.9 (Ubuntu 10.9-0ubuntu0.18.04.1)
-- Dumped by pg_dump version 11.2

-- Started on 2019-06-25 17:40:57

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 2 (class 3079 OID 181536)
-- Name: timescaledb; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS timescaledb WITH SCHEMA public;


--
-- TOC entry 4793 (class 0 OID 0)
-- Dependencies: 2
-- Name: EXTENSION timescaledb; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION timescaledb IS 'Enables scalable inserts and complex queries for time-series data';


SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 235 (class 1259 OID 600293)
-- Name: new_sample; Type: TABLE; Schema: public; Owner: morgan
--

CREATE TABLE public.new_sample (
    id bigint NOT NULL,
    power_source_id bigint,
    measurement double precision,
    "timestamp" timestamp without time zone NOT NULL,
    physical_quantity_id bigint,
    is_on boolean
);


ALTER TABLE public.new_sample OWNER TO morgan;

--
-- TOC entry 246 (class 1259 OID 600348)
-- Name: _hyper_8_100_chunk; Type: TABLE; Schema: _timescaledb_internal; Owner: morgan
--

CREATE TABLE _timescaledb_internal._hyper_8_100_chunk (
    CONSTRAINT constraint_100 CHECK ((("timestamp" >= '2014-09-04 00:00:00'::timestamp without time zone) AND ("timestamp" < '2014-09-11 00:00:00'::timestamp without time zone)))
)
INHERITS (public.new_sample);


ALTER TABLE _timescaledb_internal._hyper_8_100_chunk OWNER TO morgan;

--
-- TOC entry 247 (class 1259 OID 600353)
-- Name: _hyper_8_101_chunk; Type: TABLE; Schema: _timescaledb_internal; Owner: morgan
--

CREATE TABLE _timescaledb_internal._hyper_8_101_chunk (
    CONSTRAINT constraint_101 CHECK ((("timestamp" >= '2014-09-11 00:00:00'::timestamp without time zone) AND ("timestamp" < '2014-09-18 00:00:00'::timestamp without time zone)))
)
INHERITS (public.new_sample);


ALTER TABLE _timescaledb_internal._hyper_8_101_chunk OWNER TO morgan;

--
-- TOC entry 248 (class 1259 OID 600358)
-- Name: _hyper_8_102_chunk; Type: TABLE; Schema: _timescaledb_internal; Owner: morgan
--

CREATE TABLE _timescaledb_internal._hyper_8_102_chunk (
    CONSTRAINT constraint_102 CHECK ((("timestamp" >= '2014-09-18 00:00:00'::timestamp without time zone) AND ("timestamp" < '2014-09-25 00:00:00'::timestamp without time zone)))
)
INHERITS (public.new_sample);


ALTER TABLE _timescaledb_internal._hyper_8_102_chunk OWNER TO morgan;

--
-- TOC entry 249 (class 1259 OID 600363)
-- Name: _hyper_8_103_chunk; Type: TABLE; Schema: _timescaledb_internal; Owner: morgan
--

CREATE TABLE _timescaledb_internal._hyper_8_103_chunk (
    CONSTRAINT constraint_103 CHECK ((("timestamp" >= '2014-09-25 00:00:00'::timestamp without time zone) AND ("timestamp" < '2014-10-02 00:00:00'::timestamp without time zone)))
)
INHERITS (public.new_sample);


ALTER TABLE _timescaledb_internal._hyper_8_103_chunk OWNER TO morgan;

--
-- TOC entry 250 (class 1259 OID 600368)
-- Name: _hyper_8_104_chunk; Type: TABLE; Schema: _timescaledb_internal; Owner: morgan
--

CREATE TABLE _timescaledb_internal._hyper_8_104_chunk (
    CONSTRAINT constraint_104 CHECK ((("timestamp" >= '2014-10-02 00:00:00'::timestamp without time zone) AND ("timestamp" < '2014-10-09 00:00:00'::timestamp without time zone)))
)
INHERITS (public.new_sample);


ALTER TABLE _timescaledb_internal._hyper_8_104_chunk OWNER TO morgan;

--
-- TOC entry 251 (class 1259 OID 600373)
-- Name: _hyper_8_105_chunk; Type: TABLE; Schema: _timescaledb_internal; Owner: morgan
--

CREATE TABLE _timescaledb_internal._hyper_8_105_chunk (
    CONSTRAINT constraint_105 CHECK ((("timestamp" >= '2014-10-09 00:00:00'::timestamp without time zone) AND ("timestamp" < '2014-10-16 00:00:00'::timestamp without time zone)))
)
INHERITS (public.new_sample);


ALTER TABLE _timescaledb_internal._hyper_8_105_chunk OWNER TO morgan;

--
-- TOC entry 252 (class 1259 OID 600378)
-- Name: _hyper_8_106_chunk; Type: TABLE; Schema: _timescaledb_internal; Owner: morgan
--

CREATE TABLE _timescaledb_internal._hyper_8_106_chunk (
    CONSTRAINT constraint_106 CHECK ((("timestamp" >= '2014-10-16 00:00:00'::timestamp without time zone) AND ("timestamp" < '2014-10-23 00:00:00'::timestamp without time zone)))
)
INHERITS (public.new_sample);


ALTER TABLE _timescaledb_internal._hyper_8_106_chunk OWNER TO morgan;

--
-- TOC entry 253 (class 1259 OID 600383)
-- Name: _hyper_8_107_chunk; Type: TABLE; Schema: _timescaledb_internal; Owner: morgan
--

CREATE TABLE _timescaledb_internal._hyper_8_107_chunk (
    CONSTRAINT constraint_107 CHECK ((("timestamp" >= '2014-10-23 00:00:00'::timestamp without time zone) AND ("timestamp" < '2014-10-30 00:00:00'::timestamp without time zone)))
)
INHERITS (public.new_sample);


ALTER TABLE _timescaledb_internal._hyper_8_107_chunk OWNER TO morgan;

--
-- TOC entry 254 (class 1259 OID 600388)
-- Name: _hyper_8_108_chunk; Type: TABLE; Schema: _timescaledb_internal; Owner: morgan
--

CREATE TABLE _timescaledb_internal._hyper_8_108_chunk (
    CONSTRAINT constraint_108 CHECK ((("timestamp" >= '2014-10-30 00:00:00'::timestamp without time zone) AND ("timestamp" < '2014-11-06 00:00:00'::timestamp without time zone)))
)
INHERITS (public.new_sample);


ALTER TABLE _timescaledb_internal._hyper_8_108_chunk OWNER TO morgan;

--
-- TOC entry 255 (class 1259 OID 600393)
-- Name: _hyper_8_109_chunk; Type: TABLE; Schema: _timescaledb_internal; Owner: morgan
--

CREATE TABLE _timescaledb_internal._hyper_8_109_chunk (
    CONSTRAINT constraint_109 CHECK ((("timestamp" >= '2014-11-06 00:00:00'::timestamp without time zone) AND ("timestamp" < '2014-11-13 00:00:00'::timestamp without time zone)))
)
INHERITS (public.new_sample);


ALTER TABLE _timescaledb_internal._hyper_8_109_chunk OWNER TO morgan;

--
-- TOC entry 256 (class 1259 OID 600398)
-- Name: _hyper_8_110_chunk; Type: TABLE; Schema: _timescaledb_internal; Owner: morgan
--

CREATE TABLE _timescaledb_internal._hyper_8_110_chunk (
    CONSTRAINT constraint_110 CHECK ((("timestamp" >= '2014-11-13 00:00:00'::timestamp without time zone) AND ("timestamp" < '2014-11-20 00:00:00'::timestamp without time zone)))
)
INHERITS (public.new_sample);


ALTER TABLE _timescaledb_internal._hyper_8_110_chunk OWNER TO morgan;

--
-- TOC entry 257 (class 1259 OID 600403)
-- Name: _hyper_8_111_chunk; Type: TABLE; Schema: _timescaledb_internal; Owner: morgan
--

CREATE TABLE _timescaledb_internal._hyper_8_111_chunk (
    CONSTRAINT constraint_111 CHECK ((("timestamp" >= '2013-02-28 00:00:00'::timestamp without time zone) AND ("timestamp" < '2013-03-07 00:00:00'::timestamp without time zone)))
)
INHERITS (public.new_sample);


ALTER TABLE _timescaledb_internal._hyper_8_111_chunk OWNER TO morgan;

--
-- TOC entry 258 (class 1259 OID 600408)
-- Name: _hyper_8_112_chunk; Type: TABLE; Schema: _timescaledb_internal; Owner: morgan
--

CREATE TABLE _timescaledb_internal._hyper_8_112_chunk (
    CONSTRAINT constraint_112 CHECK ((("timestamp" >= '2013-02-14 00:00:00'::timestamp without time zone) AND ("timestamp" < '2013-02-21 00:00:00'::timestamp without time zone)))
)
INHERITS (public.new_sample);


ALTER TABLE _timescaledb_internal._hyper_8_112_chunk OWNER TO morgan;

--
-- TOC entry 259 (class 1259 OID 600413)
-- Name: _hyper_8_113_chunk; Type: TABLE; Schema: _timescaledb_internal; Owner: morgan
--

CREATE TABLE _timescaledb_internal._hyper_8_113_chunk (
    CONSTRAINT constraint_113 CHECK ((("timestamp" >= '2013-02-21 00:00:00'::timestamp without time zone) AND ("timestamp" < '2013-02-28 00:00:00'::timestamp without time zone)))
)
INHERITS (public.new_sample);


ALTER TABLE _timescaledb_internal._hyper_8_113_chunk OWNER TO morgan;

--
-- TOC entry 260 (class 1259 OID 600418)
-- Name: _hyper_8_114_chunk; Type: TABLE; Schema: _timescaledb_internal; Owner: morgan
--

CREATE TABLE _timescaledb_internal._hyper_8_114_chunk (
    CONSTRAINT constraint_114 CHECK ((("timestamp" >= '2013-03-07 00:00:00'::timestamp without time zone) AND ("timestamp" < '2013-03-14 00:00:00'::timestamp without time zone)))
)
INHERITS (public.new_sample);


ALTER TABLE _timescaledb_internal._hyper_8_114_chunk OWNER TO morgan;

--
-- TOC entry 261 (class 1259 OID 600423)
-- Name: _hyper_8_115_chunk; Type: TABLE; Schema: _timescaledb_internal; Owner: morgan
--

CREATE TABLE _timescaledb_internal._hyper_8_115_chunk (
    CONSTRAINT constraint_115 CHECK ((("timestamp" >= '2013-03-14 00:00:00'::timestamp without time zone) AND ("timestamp" < '2013-03-21 00:00:00'::timestamp without time zone)))
)
INHERITS (public.new_sample);


ALTER TABLE _timescaledb_internal._hyper_8_115_chunk OWNER TO morgan;

--
-- TOC entry 262 (class 1259 OID 600428)
-- Name: _hyper_8_116_chunk; Type: TABLE; Schema: _timescaledb_internal; Owner: morgan
--

CREATE TABLE _timescaledb_internal._hyper_8_116_chunk (
    CONSTRAINT constraint_116 CHECK ((("timestamp" >= '2013-03-21 00:00:00'::timestamp without time zone) AND ("timestamp" < '2013-03-28 00:00:00'::timestamp without time zone)))
)
INHERITS (public.new_sample);


ALTER TABLE _timescaledb_internal._hyper_8_116_chunk OWNER TO morgan;

--
-- TOC entry 263 (class 1259 OID 600433)
-- Name: _hyper_8_117_chunk; Type: TABLE; Schema: _timescaledb_internal; Owner: morgan
--

CREATE TABLE _timescaledb_internal._hyper_8_117_chunk (
    CONSTRAINT constraint_117 CHECK ((("timestamp" >= '2013-04-11 00:00:00'::timestamp without time zone) AND ("timestamp" < '2013-04-18 00:00:00'::timestamp without time zone)))
)
INHERITS (public.new_sample);


ALTER TABLE _timescaledb_internal._hyper_8_117_chunk OWNER TO morgan;

--
-- TOC entry 264 (class 1259 OID 600438)
-- Name: _hyper_8_118_chunk; Type: TABLE; Schema: _timescaledb_internal; Owner: morgan
--

CREATE TABLE _timescaledb_internal._hyper_8_118_chunk (
    CONSTRAINT constraint_118 CHECK ((("timestamp" >= '2013-03-28 00:00:00'::timestamp without time zone) AND ("timestamp" < '2013-04-04 00:00:00'::timestamp without time zone)))
)
INHERITS (public.new_sample);


ALTER TABLE _timescaledb_internal._hyper_8_118_chunk OWNER TO morgan;

--
-- TOC entry 265 (class 1259 OID 600443)
-- Name: _hyper_8_119_chunk; Type: TABLE; Schema: _timescaledb_internal; Owner: morgan
--

CREATE TABLE _timescaledb_internal._hyper_8_119_chunk (
    CONSTRAINT constraint_119 CHECK ((("timestamp" >= '2013-04-04 00:00:00'::timestamp without time zone) AND ("timestamp" < '2013-04-11 00:00:00'::timestamp without time zone)))
)
INHERITS (public.new_sample);


ALTER TABLE _timescaledb_internal._hyper_8_119_chunk OWNER TO morgan;

--
-- TOC entry 266 (class 1259 OID 600448)
-- Name: _hyper_8_120_chunk; Type: TABLE; Schema: _timescaledb_internal; Owner: morgan
--

CREATE TABLE _timescaledb_internal._hyper_8_120_chunk (
    CONSTRAINT constraint_120 CHECK ((("timestamp" >= '2013-04-25 00:00:00'::timestamp without time zone) AND ("timestamp" < '2013-05-02 00:00:00'::timestamp without time zone)))
)
INHERITS (public.new_sample);


ALTER TABLE _timescaledb_internal._hyper_8_120_chunk OWNER TO morgan;

--
-- TOC entry 267 (class 1259 OID 600453)
-- Name: _hyper_8_121_chunk; Type: TABLE; Schema: _timescaledb_internal; Owner: morgan
--

CREATE TABLE _timescaledb_internal._hyper_8_121_chunk (
    CONSTRAINT constraint_121 CHECK ((("timestamp" >= '2013-04-18 00:00:00'::timestamp without time zone) AND ("timestamp" < '2013-04-25 00:00:00'::timestamp without time zone)))
)
INHERITS (public.new_sample);


ALTER TABLE _timescaledb_internal._hyper_8_121_chunk OWNER TO morgan;

--
-- TOC entry 268 (class 1259 OID 600458)
-- Name: _hyper_8_122_chunk; Type: TABLE; Schema: _timescaledb_internal; Owner: morgan
--

CREATE TABLE _timescaledb_internal._hyper_8_122_chunk (
    CONSTRAINT constraint_122 CHECK ((("timestamp" >= '2013-05-02 00:00:00'::timestamp without time zone) AND ("timestamp" < '2013-05-09 00:00:00'::timestamp without time zone)))
)
INHERITS (public.new_sample);


ALTER TABLE _timescaledb_internal._hyper_8_122_chunk OWNER TO morgan;

--
-- TOC entry 269 (class 1259 OID 600463)
-- Name: _hyper_8_123_chunk; Type: TABLE; Schema: _timescaledb_internal; Owner: morgan
--

CREATE TABLE _timescaledb_internal._hyper_8_123_chunk (
    CONSTRAINT constraint_123 CHECK ((("timestamp" >= '2013-05-09 00:00:00'::timestamp without time zone) AND ("timestamp" < '2013-05-16 00:00:00'::timestamp without time zone)))
)
INHERITS (public.new_sample);


ALTER TABLE _timescaledb_internal._hyper_8_123_chunk OWNER TO morgan;

--
-- TOC entry 270 (class 1259 OID 600468)
-- Name: _hyper_8_124_chunk; Type: TABLE; Schema: _timescaledb_internal; Owner: morgan
--

CREATE TABLE _timescaledb_internal._hyper_8_124_chunk (
    CONSTRAINT constraint_124 CHECK ((("timestamp" >= '2013-05-23 00:00:00'::timestamp without time zone) AND ("timestamp" < '2013-05-30 00:00:00'::timestamp without time zone)))
)
INHERITS (public.new_sample);


ALTER TABLE _timescaledb_internal._hyper_8_124_chunk OWNER TO morgan;

--
-- TOC entry 271 (class 1259 OID 600473)
-- Name: _hyper_8_125_chunk; Type: TABLE; Schema: _timescaledb_internal; Owner: morgan
--

CREATE TABLE _timescaledb_internal._hyper_8_125_chunk (
    CONSTRAINT constraint_125 CHECK ((("timestamp" >= '2013-05-30 00:00:00'::timestamp without time zone) AND ("timestamp" < '2013-06-06 00:00:00'::timestamp without time zone)))
)
INHERITS (public.new_sample);


ALTER TABLE _timescaledb_internal._hyper_8_125_chunk OWNER TO morgan;

--
-- TOC entry 272 (class 1259 OID 600478)
-- Name: _hyper_8_126_chunk; Type: TABLE; Schema: _timescaledb_internal; Owner: morgan
--

CREATE TABLE _timescaledb_internal._hyper_8_126_chunk (
    CONSTRAINT constraint_126 CHECK ((("timestamp" >= '2013-05-16 00:00:00'::timestamp without time zone) AND ("timestamp" < '2013-05-23 00:00:00'::timestamp without time zone)))
)
INHERITS (public.new_sample);


ALTER TABLE _timescaledb_internal._hyper_8_126_chunk OWNER TO morgan;

--
-- TOC entry 273 (class 1259 OID 600483)
-- Name: _hyper_8_127_chunk; Type: TABLE; Schema: _timescaledb_internal; Owner: morgan
--

CREATE TABLE _timescaledb_internal._hyper_8_127_chunk (
    CONSTRAINT constraint_127 CHECK ((("timestamp" >= '2013-06-06 00:00:00'::timestamp without time zone) AND ("timestamp" < '2013-06-13 00:00:00'::timestamp without time zone)))
)
INHERITS (public.new_sample);


ALTER TABLE _timescaledb_internal._hyper_8_127_chunk OWNER TO morgan;

--
-- TOC entry 274 (class 1259 OID 600488)
-- Name: _hyper_8_128_chunk; Type: TABLE; Schema: _timescaledb_internal; Owner: morgan
--

CREATE TABLE _timescaledb_internal._hyper_8_128_chunk (
    CONSTRAINT constraint_128 CHECK ((("timestamp" >= '2013-06-20 00:00:00'::timestamp without time zone) AND ("timestamp" < '2013-06-27 00:00:00'::timestamp without time zone)))
)
INHERITS (public.new_sample);


ALTER TABLE _timescaledb_internal._hyper_8_128_chunk OWNER TO morgan;

--
-- TOC entry 275 (class 1259 OID 600493)
-- Name: _hyper_8_129_chunk; Type: TABLE; Schema: _timescaledb_internal; Owner: morgan
--

CREATE TABLE _timescaledb_internal._hyper_8_129_chunk (
    CONSTRAINT constraint_129 CHECK ((("timestamp" >= '2013-06-13 00:00:00'::timestamp without time zone) AND ("timestamp" < '2013-06-20 00:00:00'::timestamp without time zone)))
)
INHERITS (public.new_sample);


ALTER TABLE _timescaledb_internal._hyper_8_129_chunk OWNER TO morgan;

--
-- TOC entry 276 (class 1259 OID 600498)
-- Name: _hyper_8_130_chunk; Type: TABLE; Schema: _timescaledb_internal; Owner: morgan
--

CREATE TABLE _timescaledb_internal._hyper_8_130_chunk (
    CONSTRAINT constraint_130 CHECK ((("timestamp" >= '2013-07-04 00:00:00'::timestamp without time zone) AND ("timestamp" < '2013-07-11 00:00:00'::timestamp without time zone)))
)
INHERITS (public.new_sample);


ALTER TABLE _timescaledb_internal._hyper_8_130_chunk OWNER TO morgan;

--
-- TOC entry 277 (class 1259 OID 600503)
-- Name: _hyper_8_131_chunk; Type: TABLE; Schema: _timescaledb_internal; Owner: morgan
--

CREATE TABLE _timescaledb_internal._hyper_8_131_chunk (
    CONSTRAINT constraint_131 CHECK ((("timestamp" >= '2013-06-27 00:00:00'::timestamp without time zone) AND ("timestamp" < '2013-07-04 00:00:00'::timestamp without time zone)))
)
INHERITS (public.new_sample);


ALTER TABLE _timescaledb_internal._hyper_8_131_chunk OWNER TO morgan;

--
-- TOC entry 278 (class 1259 OID 600508)
-- Name: _hyper_8_132_chunk; Type: TABLE; Schema: _timescaledb_internal; Owner: morgan
--

CREATE TABLE _timescaledb_internal._hyper_8_132_chunk (
    CONSTRAINT constraint_132 CHECK ((("timestamp" >= '2013-07-11 00:00:00'::timestamp without time zone) AND ("timestamp" < '2013-07-18 00:00:00'::timestamp without time zone)))
)
INHERITS (public.new_sample);


ALTER TABLE _timescaledb_internal._hyper_8_132_chunk OWNER TO morgan;

--
-- TOC entry 279 (class 1259 OID 600513)
-- Name: _hyper_8_133_chunk; Type: TABLE; Schema: _timescaledb_internal; Owner: morgan
--

CREATE TABLE _timescaledb_internal._hyper_8_133_chunk (
    CONSTRAINT constraint_133 CHECK ((("timestamp" >= '2013-07-18 00:00:00'::timestamp without time zone) AND ("timestamp" < '2013-07-25 00:00:00'::timestamp without time zone)))
)
INHERITS (public.new_sample);


ALTER TABLE _timescaledb_internal._hyper_8_133_chunk OWNER TO morgan;

--
-- TOC entry 280 (class 1259 OID 600518)
-- Name: _hyper_8_134_chunk; Type: TABLE; Schema: _timescaledb_internal; Owner: morgan
--

CREATE TABLE _timescaledb_internal._hyper_8_134_chunk (
    CONSTRAINT constraint_134 CHECK ((("timestamp" >= '2013-07-25 00:00:00'::timestamp without time zone) AND ("timestamp" < '2013-08-01 00:00:00'::timestamp without time zone)))
)
INHERITS (public.new_sample);


ALTER TABLE _timescaledb_internal._hyper_8_134_chunk OWNER TO morgan;

--
-- TOC entry 281 (class 1259 OID 600523)
-- Name: _hyper_8_135_chunk; Type: TABLE; Schema: _timescaledb_internal; Owner: morgan
--

CREATE TABLE _timescaledb_internal._hyper_8_135_chunk (
    CONSTRAINT constraint_135 CHECK ((("timestamp" >= '2013-08-01 00:00:00'::timestamp without time zone) AND ("timestamp" < '2013-08-08 00:00:00'::timestamp without time zone)))
)
INHERITS (public.new_sample);


ALTER TABLE _timescaledb_internal._hyper_8_135_chunk OWNER TO morgan;

--
-- TOC entry 282 (class 1259 OID 600528)
-- Name: _hyper_8_136_chunk; Type: TABLE; Schema: _timescaledb_internal; Owner: morgan
--

CREATE TABLE _timescaledb_internal._hyper_8_136_chunk (
    CONSTRAINT constraint_136 CHECK ((("timestamp" >= '2013-08-22 00:00:00'::timestamp without time zone) AND ("timestamp" < '2013-08-29 00:00:00'::timestamp without time zone)))
)
INHERITS (public.new_sample);


ALTER TABLE _timescaledb_internal._hyper_8_136_chunk OWNER TO morgan;

--
-- TOC entry 283 (class 1259 OID 600533)
-- Name: _hyper_8_137_chunk; Type: TABLE; Schema: _timescaledb_internal; Owner: morgan
--

CREATE TABLE _timescaledb_internal._hyper_8_137_chunk (
    CONSTRAINT constraint_137 CHECK ((("timestamp" >= '2013-08-29 00:00:00'::timestamp without time zone) AND ("timestamp" < '2013-09-05 00:00:00'::timestamp without time zone)))
)
INHERITS (public.new_sample);


ALTER TABLE _timescaledb_internal._hyper_8_137_chunk OWNER TO morgan;

--
-- TOC entry 284 (class 1259 OID 600538)
-- Name: _hyper_8_138_chunk; Type: TABLE; Schema: _timescaledb_internal; Owner: morgan
--

CREATE TABLE _timescaledb_internal._hyper_8_138_chunk (
    CONSTRAINT constraint_138 CHECK ((("timestamp" >= '2013-09-19 00:00:00'::timestamp without time zone) AND ("timestamp" < '2013-09-26 00:00:00'::timestamp without time zone)))
)
INHERITS (public.new_sample);


ALTER TABLE _timescaledb_internal._hyper_8_138_chunk OWNER TO morgan;

--
-- TOC entry 285 (class 1259 OID 600543)
-- Name: _hyper_8_139_chunk; Type: TABLE; Schema: _timescaledb_internal; Owner: morgan
--

CREATE TABLE _timescaledb_internal._hyper_8_139_chunk (
    CONSTRAINT constraint_139 CHECK ((("timestamp" >= '2013-09-05 00:00:00'::timestamp without time zone) AND ("timestamp" < '2013-09-12 00:00:00'::timestamp without time zone)))
)
INHERITS (public.new_sample);


ALTER TABLE _timescaledb_internal._hyper_8_139_chunk OWNER TO morgan;

--
-- TOC entry 286 (class 1259 OID 600548)
-- Name: _hyper_8_140_chunk; Type: TABLE; Schema: _timescaledb_internal; Owner: morgan
--

CREATE TABLE _timescaledb_internal._hyper_8_140_chunk (
    CONSTRAINT constraint_140 CHECK ((("timestamp" >= '2013-09-12 00:00:00'::timestamp without time zone) AND ("timestamp" < '2013-09-19 00:00:00'::timestamp without time zone)))
)
INHERITS (public.new_sample);


ALTER TABLE _timescaledb_internal._hyper_8_140_chunk OWNER TO morgan;

--
-- TOC entry 287 (class 1259 OID 600553)
-- Name: _hyper_8_141_chunk; Type: TABLE; Schema: _timescaledb_internal; Owner: morgan
--

CREATE TABLE _timescaledb_internal._hyper_8_141_chunk (
    CONSTRAINT constraint_141 CHECK ((("timestamp" >= '2013-09-26 00:00:00'::timestamp without time zone) AND ("timestamp" < '2013-10-03 00:00:00'::timestamp without time zone)))
)
INHERITS (public.new_sample);


ALTER TABLE _timescaledb_internal._hyper_8_141_chunk OWNER TO morgan;

--
-- TOC entry 288 (class 1259 OID 600558)
-- Name: _hyper_8_142_chunk; Type: TABLE; Schema: _timescaledb_internal; Owner: morgan
--

CREATE TABLE _timescaledb_internal._hyper_8_142_chunk (
    CONSTRAINT constraint_142 CHECK ((("timestamp" >= '2013-10-03 00:00:00'::timestamp without time zone) AND ("timestamp" < '2013-10-10 00:00:00'::timestamp without time zone)))
)
INHERITS (public.new_sample);


ALTER TABLE _timescaledb_internal._hyper_8_142_chunk OWNER TO morgan;

--
-- TOC entry 289 (class 1259 OID 600563)
-- Name: _hyper_8_143_chunk; Type: TABLE; Schema: _timescaledb_internal; Owner: morgan
--

CREATE TABLE _timescaledb_internal._hyper_8_143_chunk (
    CONSTRAINT constraint_143 CHECK ((("timestamp" >= '2013-10-10 00:00:00'::timestamp without time zone) AND ("timestamp" < '2013-10-17 00:00:00'::timestamp without time zone)))
)
INHERITS (public.new_sample);


ALTER TABLE _timescaledb_internal._hyper_8_143_chunk OWNER TO morgan;

--
-- TOC entry 290 (class 1259 OID 600568)
-- Name: _hyper_8_144_chunk; Type: TABLE; Schema: _timescaledb_internal; Owner: morgan
--

CREATE TABLE _timescaledb_internal._hyper_8_144_chunk (
    CONSTRAINT constraint_144 CHECK ((("timestamp" >= '2013-08-15 00:00:00'::timestamp without time zone) AND ("timestamp" < '2013-08-22 00:00:00'::timestamp without time zone)))
)
INHERITS (public.new_sample);


ALTER TABLE _timescaledb_internal._hyper_8_144_chunk OWNER TO morgan;

--
-- TOC entry 291 (class 1259 OID 600573)
-- Name: _hyper_8_145_chunk; Type: TABLE; Schema: _timescaledb_internal; Owner: morgan
--

CREATE TABLE _timescaledb_internal._hyper_8_145_chunk (
    CONSTRAINT constraint_145 CHECK ((("timestamp" >= '2012-11-08 00:00:00'::timestamp without time zone) AND ("timestamp" < '2012-11-15 00:00:00'::timestamp without time zone)))
)
INHERITS (public.new_sample);


ALTER TABLE _timescaledb_internal._hyper_8_145_chunk OWNER TO morgan;

--
-- TOC entry 292 (class 1259 OID 600578)
-- Name: _hyper_8_146_chunk; Type: TABLE; Schema: _timescaledb_internal; Owner: morgan
--

CREATE TABLE _timescaledb_internal._hyper_8_146_chunk (
    CONSTRAINT constraint_146 CHECK ((("timestamp" >= '2012-11-15 00:00:00'::timestamp without time zone) AND ("timestamp" < '2012-11-22 00:00:00'::timestamp without time zone)))
)
INHERITS (public.new_sample);


ALTER TABLE _timescaledb_internal._hyper_8_146_chunk OWNER TO morgan;

--
-- TOC entry 293 (class 1259 OID 600583)
-- Name: _hyper_8_147_chunk; Type: TABLE; Schema: _timescaledb_internal; Owner: morgan
--

CREATE TABLE _timescaledb_internal._hyper_8_147_chunk (
    CONSTRAINT constraint_147 CHECK ((("timestamp" >= '2012-11-22 00:00:00'::timestamp without time zone) AND ("timestamp" < '2012-11-29 00:00:00'::timestamp without time zone)))
)
INHERITS (public.new_sample);


ALTER TABLE _timescaledb_internal._hyper_8_147_chunk OWNER TO morgan;

--
-- TOC entry 294 (class 1259 OID 600588)
-- Name: _hyper_8_148_chunk; Type: TABLE; Schema: _timescaledb_internal; Owner: morgan
--

CREATE TABLE _timescaledb_internal._hyper_8_148_chunk (
    CONSTRAINT constraint_148 CHECK ((("timestamp" >= '2012-11-29 00:00:00'::timestamp without time zone) AND ("timestamp" < '2012-12-06 00:00:00'::timestamp without time zone)))
)
INHERITS (public.new_sample);


ALTER TABLE _timescaledb_internal._hyper_8_148_chunk OWNER TO morgan;

--
-- TOC entry 295 (class 1259 OID 600593)
-- Name: _hyper_8_149_chunk; Type: TABLE; Schema: _timescaledb_internal; Owner: morgan
--

CREATE TABLE _timescaledb_internal._hyper_8_149_chunk (
    CONSTRAINT constraint_149 CHECK ((("timestamp" >= '2012-12-06 00:00:00'::timestamp without time zone) AND ("timestamp" < '2012-12-13 00:00:00'::timestamp without time zone)))
)
INHERITS (public.new_sample);


ALTER TABLE _timescaledb_internal._hyper_8_149_chunk OWNER TO morgan;

--
-- TOC entry 296 (class 1259 OID 600598)
-- Name: _hyper_8_150_chunk; Type: TABLE; Schema: _timescaledb_internal; Owner: morgan
--

CREATE TABLE _timescaledb_internal._hyper_8_150_chunk (
    CONSTRAINT constraint_150 CHECK ((("timestamp" >= '2012-12-13 00:00:00'::timestamp without time zone) AND ("timestamp" < '2012-12-20 00:00:00'::timestamp without time zone)))
)
INHERITS (public.new_sample);


ALTER TABLE _timescaledb_internal._hyper_8_150_chunk OWNER TO morgan;

--
-- TOC entry 297 (class 1259 OID 600603)
-- Name: _hyper_8_151_chunk; Type: TABLE; Schema: _timescaledb_internal; Owner: morgan
--

CREATE TABLE _timescaledb_internal._hyper_8_151_chunk (
    CONSTRAINT constraint_151 CHECK ((("timestamp" >= '2012-12-20 00:00:00'::timestamp without time zone) AND ("timestamp" < '2012-12-27 00:00:00'::timestamp without time zone)))
)
INHERITS (public.new_sample);


ALTER TABLE _timescaledb_internal._hyper_8_151_chunk OWNER TO morgan;

--
-- TOC entry 298 (class 1259 OID 600608)
-- Name: _hyper_8_152_chunk; Type: TABLE; Schema: _timescaledb_internal; Owner: morgan
--

CREATE TABLE _timescaledb_internal._hyper_8_152_chunk (
    CONSTRAINT constraint_152 CHECK ((("timestamp" >= '2012-12-27 00:00:00'::timestamp without time zone) AND ("timestamp" < '2013-01-03 00:00:00'::timestamp without time zone)))
)
INHERITS (public.new_sample);


ALTER TABLE _timescaledb_internal._hyper_8_152_chunk OWNER TO morgan;

--
-- TOC entry 299 (class 1259 OID 600613)
-- Name: _hyper_8_153_chunk; Type: TABLE; Schema: _timescaledb_internal; Owner: morgan
--

CREATE TABLE _timescaledb_internal._hyper_8_153_chunk (
    CONSTRAINT constraint_153 CHECK ((("timestamp" >= '2013-01-03 00:00:00'::timestamp without time zone) AND ("timestamp" < '2013-01-10 00:00:00'::timestamp without time zone)))
)
INHERITS (public.new_sample);


ALTER TABLE _timescaledb_internal._hyper_8_153_chunk OWNER TO morgan;

--
-- TOC entry 300 (class 1259 OID 600618)
-- Name: _hyper_8_154_chunk; Type: TABLE; Schema: _timescaledb_internal; Owner: morgan
--

CREATE TABLE _timescaledb_internal._hyper_8_154_chunk (
    CONSTRAINT constraint_154 CHECK ((("timestamp" >= '2013-01-10 00:00:00'::timestamp without time zone) AND ("timestamp" < '2013-01-17 00:00:00'::timestamp without time zone)))
)
INHERITS (public.new_sample);


ALTER TABLE _timescaledb_internal._hyper_8_154_chunk OWNER TO morgan;

--
-- TOC entry 301 (class 1259 OID 600623)
-- Name: _hyper_8_155_chunk; Type: TABLE; Schema: _timescaledb_internal; Owner: morgan
--

CREATE TABLE _timescaledb_internal._hyper_8_155_chunk (
    CONSTRAINT constraint_155 CHECK ((("timestamp" >= '2013-01-17 00:00:00'::timestamp without time zone) AND ("timestamp" < '2013-01-24 00:00:00'::timestamp without time zone)))
)
INHERITS (public.new_sample);


ALTER TABLE _timescaledb_internal._hyper_8_155_chunk OWNER TO morgan;

--
-- TOC entry 302 (class 1259 OID 600628)
-- Name: _hyper_8_156_chunk; Type: TABLE; Schema: _timescaledb_internal; Owner: morgan
--

CREATE TABLE _timescaledb_internal._hyper_8_156_chunk (
    CONSTRAINT constraint_156 CHECK ((("timestamp" >= '2013-01-24 00:00:00'::timestamp without time zone) AND ("timestamp" < '2013-01-31 00:00:00'::timestamp without time zone)))
)
INHERITS (public.new_sample);


ALTER TABLE _timescaledb_internal._hyper_8_156_chunk OWNER TO morgan;

--
-- TOC entry 303 (class 1259 OID 600633)
-- Name: _hyper_8_157_chunk; Type: TABLE; Schema: _timescaledb_internal; Owner: morgan
--

CREATE TABLE _timescaledb_internal._hyper_8_157_chunk (
    CONSTRAINT constraint_157 CHECK ((("timestamp" >= '2013-02-07 00:00:00'::timestamp without time zone) AND ("timestamp" < '2013-02-14 00:00:00'::timestamp without time zone)))
)
INHERITS (public.new_sample);


ALTER TABLE _timescaledb_internal._hyper_8_157_chunk OWNER TO morgan;

--
-- TOC entry 304 (class 1259 OID 600638)
-- Name: _hyper_8_158_chunk; Type: TABLE; Schema: _timescaledb_internal; Owner: morgan
--

CREATE TABLE _timescaledb_internal._hyper_8_158_chunk (
    CONSTRAINT constraint_158 CHECK ((("timestamp" >= '2013-08-08 00:00:00'::timestamp without time zone) AND ("timestamp" < '2013-08-15 00:00:00'::timestamp without time zone)))
)
INHERITS (public.new_sample);


ALTER TABLE _timescaledb_internal._hyper_8_158_chunk OWNER TO morgan;

--
-- TOC entry 305 (class 1259 OID 600643)
-- Name: _hyper_8_159_chunk; Type: TABLE; Schema: _timescaledb_internal; Owner: morgan
--

CREATE TABLE _timescaledb_internal._hyper_8_159_chunk (
    CONSTRAINT constraint_159 CHECK ((("timestamp" >= '2013-10-17 00:00:00'::timestamp without time zone) AND ("timestamp" < '2013-10-24 00:00:00'::timestamp without time zone)))
)
INHERITS (public.new_sample);


ALTER TABLE _timescaledb_internal._hyper_8_159_chunk OWNER TO morgan;

--
-- TOC entry 306 (class 1259 OID 600648)
-- Name: _hyper_8_160_chunk; Type: TABLE; Schema: _timescaledb_internal; Owner: morgan
--

CREATE TABLE _timescaledb_internal._hyper_8_160_chunk (
    CONSTRAINT constraint_160 CHECK ((("timestamp" >= '2013-10-24 00:00:00'::timestamp without time zone) AND ("timestamp" < '2013-10-31 00:00:00'::timestamp without time zone)))
)
INHERITS (public.new_sample);


ALTER TABLE _timescaledb_internal._hyper_8_160_chunk OWNER TO morgan;

--
-- TOC entry 307 (class 1259 OID 600653)
-- Name: _hyper_8_161_chunk; Type: TABLE; Schema: _timescaledb_internal; Owner: morgan
--

CREATE TABLE _timescaledb_internal._hyper_8_161_chunk (
    CONSTRAINT constraint_161 CHECK ((("timestamp" >= '2013-10-31 00:00:00'::timestamp without time zone) AND ("timestamp" < '2013-11-07 00:00:00'::timestamp without time zone)))
)
INHERITS (public.new_sample);


ALTER TABLE _timescaledb_internal._hyper_8_161_chunk OWNER TO morgan;

--
-- TOC entry 308 (class 1259 OID 600658)
-- Name: _hyper_8_162_chunk; Type: TABLE; Schema: _timescaledb_internal; Owner: morgan
--

CREATE TABLE _timescaledb_internal._hyper_8_162_chunk (
    CONSTRAINT constraint_162 CHECK ((("timestamp" >= '2013-11-14 00:00:00'::timestamp without time zone) AND ("timestamp" < '2013-11-21 00:00:00'::timestamp without time zone)))
)
INHERITS (public.new_sample);


ALTER TABLE _timescaledb_internal._hyper_8_162_chunk OWNER TO morgan;

--
-- TOC entry 309 (class 1259 OID 600663)
-- Name: _hyper_8_163_chunk; Type: TABLE; Schema: _timescaledb_internal; Owner: morgan
--

CREATE TABLE _timescaledb_internal._hyper_8_163_chunk (
    CONSTRAINT constraint_163 CHECK ((("timestamp" >= '2013-11-07 00:00:00'::timestamp without time zone) AND ("timestamp" < '2013-11-14 00:00:00'::timestamp without time zone)))
)
INHERITS (public.new_sample);


ALTER TABLE _timescaledb_internal._hyper_8_163_chunk OWNER TO morgan;

--
-- TOC entry 310 (class 1259 OID 600668)
-- Name: _hyper_8_164_chunk; Type: TABLE; Schema: _timescaledb_internal; Owner: morgan
--

CREATE TABLE _timescaledb_internal._hyper_8_164_chunk (
    CONSTRAINT constraint_164 CHECK ((("timestamp" >= '2013-11-21 00:00:00'::timestamp without time zone) AND ("timestamp" < '2013-11-28 00:00:00'::timestamp without time zone)))
)
INHERITS (public.new_sample);


ALTER TABLE _timescaledb_internal._hyper_8_164_chunk OWNER TO morgan;

--
-- TOC entry 311 (class 1259 OID 600673)
-- Name: _hyper_8_165_chunk; Type: TABLE; Schema: _timescaledb_internal; Owner: morgan
--

CREATE TABLE _timescaledb_internal._hyper_8_165_chunk (
    CONSTRAINT constraint_165 CHECK ((("timestamp" >= '2013-11-28 00:00:00'::timestamp without time zone) AND ("timestamp" < '2013-12-05 00:00:00'::timestamp without time zone)))
)
INHERITS (public.new_sample);


ALTER TABLE _timescaledb_internal._hyper_8_165_chunk OWNER TO morgan;

--
-- TOC entry 312 (class 1259 OID 600678)
-- Name: _hyper_8_166_chunk; Type: TABLE; Schema: _timescaledb_internal; Owner: morgan
--

CREATE TABLE _timescaledb_internal._hyper_8_166_chunk (
    CONSTRAINT constraint_166 CHECK ((("timestamp" >= '2013-12-05 00:00:00'::timestamp without time zone) AND ("timestamp" < '2013-12-12 00:00:00'::timestamp without time zone)))
)
INHERITS (public.new_sample);


ALTER TABLE _timescaledb_internal._hyper_8_166_chunk OWNER TO morgan;

--
-- TOC entry 313 (class 1259 OID 600683)
-- Name: _hyper_8_167_chunk; Type: TABLE; Schema: _timescaledb_internal; Owner: morgan
--

CREATE TABLE _timescaledb_internal._hyper_8_167_chunk (
    CONSTRAINT constraint_167 CHECK ((("timestamp" >= '2013-12-12 00:00:00'::timestamp without time zone) AND ("timestamp" < '2013-12-19 00:00:00'::timestamp without time zone)))
)
INHERITS (public.new_sample);


ALTER TABLE _timescaledb_internal._hyper_8_167_chunk OWNER TO morgan;

--
-- TOC entry 314 (class 1259 OID 600688)
-- Name: _hyper_8_168_chunk; Type: TABLE; Schema: _timescaledb_internal; Owner: morgan
--

CREATE TABLE _timescaledb_internal._hyper_8_168_chunk (
    CONSTRAINT constraint_168 CHECK ((("timestamp" >= '2013-12-19 00:00:00'::timestamp without time zone) AND ("timestamp" < '2013-12-26 00:00:00'::timestamp without time zone)))
)
INHERITS (public.new_sample);


ALTER TABLE _timescaledb_internal._hyper_8_168_chunk OWNER TO morgan;

--
-- TOC entry 315 (class 1259 OID 600693)
-- Name: _hyper_8_169_chunk; Type: TABLE; Schema: _timescaledb_internal; Owner: morgan
--

CREATE TABLE _timescaledb_internal._hyper_8_169_chunk (
    CONSTRAINT constraint_169 CHECK ((("timestamp" >= '2013-12-26 00:00:00'::timestamp without time zone) AND ("timestamp" < '2014-01-02 00:00:00'::timestamp without time zone)))
)
INHERITS (public.new_sample);


ALTER TABLE _timescaledb_internal._hyper_8_169_chunk OWNER TO morgan;

--
-- TOC entry 316 (class 1259 OID 600698)
-- Name: _hyper_8_170_chunk; Type: TABLE; Schema: _timescaledb_internal; Owner: morgan
--

CREATE TABLE _timescaledb_internal._hyper_8_170_chunk (
    CONSTRAINT constraint_170 CHECK ((("timestamp" >= '2014-01-02 00:00:00'::timestamp without time zone) AND ("timestamp" < '2014-01-09 00:00:00'::timestamp without time zone)))
)
INHERITS (public.new_sample);


ALTER TABLE _timescaledb_internal._hyper_8_170_chunk OWNER TO morgan;

--
-- TOC entry 317 (class 1259 OID 600703)
-- Name: _hyper_8_171_chunk; Type: TABLE; Schema: _timescaledb_internal; Owner: morgan
--

CREATE TABLE _timescaledb_internal._hyper_8_171_chunk (
    CONSTRAINT constraint_171 CHECK ((("timestamp" >= '2014-01-16 00:00:00'::timestamp without time zone) AND ("timestamp" < '2014-01-23 00:00:00'::timestamp without time zone)))
)
INHERITS (public.new_sample);


ALTER TABLE _timescaledb_internal._hyper_8_171_chunk OWNER TO morgan;

--
-- TOC entry 318 (class 1259 OID 600708)
-- Name: _hyper_8_172_chunk; Type: TABLE; Schema: _timescaledb_internal; Owner: morgan
--

CREATE TABLE _timescaledb_internal._hyper_8_172_chunk (
    CONSTRAINT constraint_172 CHECK ((("timestamp" >= '2014-01-09 00:00:00'::timestamp without time zone) AND ("timestamp" < '2014-01-16 00:00:00'::timestamp without time zone)))
)
INHERITS (public.new_sample);


ALTER TABLE _timescaledb_internal._hyper_8_172_chunk OWNER TO morgan;

--
-- TOC entry 319 (class 1259 OID 600713)
-- Name: _hyper_8_173_chunk; Type: TABLE; Schema: _timescaledb_internal; Owner: morgan
--

CREATE TABLE _timescaledb_internal._hyper_8_173_chunk (
    CONSTRAINT constraint_173 CHECK ((("timestamp" >= '2014-01-23 00:00:00'::timestamp without time zone) AND ("timestamp" < '2014-01-30 00:00:00'::timestamp without time zone)))
)
INHERITS (public.new_sample);


ALTER TABLE _timescaledb_internal._hyper_8_173_chunk OWNER TO morgan;

--
-- TOC entry 320 (class 1259 OID 600718)
-- Name: _hyper_8_174_chunk; Type: TABLE; Schema: _timescaledb_internal; Owner: morgan
--

CREATE TABLE _timescaledb_internal._hyper_8_174_chunk (
    CONSTRAINT constraint_174 CHECK ((("timestamp" >= '2014-01-30 00:00:00'::timestamp without time zone) AND ("timestamp" < '2014-02-06 00:00:00'::timestamp without time zone)))
)
INHERITS (public.new_sample);


ALTER TABLE _timescaledb_internal._hyper_8_174_chunk OWNER TO morgan;

--
-- TOC entry 321 (class 1259 OID 600723)
-- Name: _hyper_8_175_chunk; Type: TABLE; Schema: _timescaledb_internal; Owner: morgan
--

CREATE TABLE _timescaledb_internal._hyper_8_175_chunk (
    CONSTRAINT constraint_175 CHECK ((("timestamp" >= '2014-02-06 00:00:00'::timestamp without time zone) AND ("timestamp" < '2014-02-13 00:00:00'::timestamp without time zone)))
)
INHERITS (public.new_sample);


ALTER TABLE _timescaledb_internal._hyper_8_175_chunk OWNER TO morgan;

--
-- TOC entry 322 (class 1259 OID 600728)
-- Name: _hyper_8_176_chunk; Type: TABLE; Schema: _timescaledb_internal; Owner: morgan
--

CREATE TABLE _timescaledb_internal._hyper_8_176_chunk (
    CONSTRAINT constraint_176 CHECK ((("timestamp" >= '2014-02-13 00:00:00'::timestamp without time zone) AND ("timestamp" < '2014-02-20 00:00:00'::timestamp without time zone)))
)
INHERITS (public.new_sample);


ALTER TABLE _timescaledb_internal._hyper_8_176_chunk OWNER TO morgan;

--
-- TOC entry 323 (class 1259 OID 600733)
-- Name: _hyper_8_177_chunk; Type: TABLE; Schema: _timescaledb_internal; Owner: morgan
--

CREATE TABLE _timescaledb_internal._hyper_8_177_chunk (
    CONSTRAINT constraint_177 CHECK ((("timestamp" >= '2014-02-20 00:00:00'::timestamp without time zone) AND ("timestamp" < '2014-02-27 00:00:00'::timestamp without time zone)))
)
INHERITS (public.new_sample);


ALTER TABLE _timescaledb_internal._hyper_8_177_chunk OWNER TO morgan;

--
-- TOC entry 324 (class 1259 OID 600738)
-- Name: _hyper_8_178_chunk; Type: TABLE; Schema: _timescaledb_internal; Owner: morgan
--

CREATE TABLE _timescaledb_internal._hyper_8_178_chunk (
    CONSTRAINT constraint_178 CHECK ((("timestamp" >= '2014-02-27 00:00:00'::timestamp without time zone) AND ("timestamp" < '2014-03-06 00:00:00'::timestamp without time zone)))
)
INHERITS (public.new_sample);


ALTER TABLE _timescaledb_internal._hyper_8_178_chunk OWNER TO morgan;

--
-- TOC entry 325 (class 1259 OID 600743)
-- Name: _hyper_8_179_chunk; Type: TABLE; Schema: _timescaledb_internal; Owner: morgan
--

CREATE TABLE _timescaledb_internal._hyper_8_179_chunk (
    CONSTRAINT constraint_179 CHECK ((("timestamp" >= '2014-03-06 00:00:00'::timestamp without time zone) AND ("timestamp" < '2014-03-13 00:00:00'::timestamp without time zone)))
)
INHERITS (public.new_sample);


ALTER TABLE _timescaledb_internal._hyper_8_179_chunk OWNER TO morgan;

--
-- TOC entry 326 (class 1259 OID 600748)
-- Name: _hyper_8_180_chunk; Type: TABLE; Schema: _timescaledb_internal; Owner: morgan
--

CREATE TABLE _timescaledb_internal._hyper_8_180_chunk (
    CONSTRAINT constraint_180 CHECK ((("timestamp" >= '2014-03-20 00:00:00'::timestamp without time zone) AND ("timestamp" < '2014-03-27 00:00:00'::timestamp without time zone)))
)
INHERITS (public.new_sample);


ALTER TABLE _timescaledb_internal._hyper_8_180_chunk OWNER TO morgan;

--
-- TOC entry 327 (class 1259 OID 600753)
-- Name: _hyper_8_181_chunk; Type: TABLE; Schema: _timescaledb_internal; Owner: morgan
--

CREATE TABLE _timescaledb_internal._hyper_8_181_chunk (
    CONSTRAINT constraint_181 CHECK ((("timestamp" >= '2014-03-13 00:00:00'::timestamp without time zone) AND ("timestamp" < '2014-03-20 00:00:00'::timestamp without time zone)))
)
INHERITS (public.new_sample);


ALTER TABLE _timescaledb_internal._hyper_8_181_chunk OWNER TO morgan;

--
-- TOC entry 328 (class 1259 OID 600758)
-- Name: _hyper_8_182_chunk; Type: TABLE; Schema: _timescaledb_internal; Owner: morgan
--

CREATE TABLE _timescaledb_internal._hyper_8_182_chunk (
    CONSTRAINT constraint_182 CHECK ((("timestamp" >= '2014-03-27 00:00:00'::timestamp without time zone) AND ("timestamp" < '2014-04-03 00:00:00'::timestamp without time zone)))
)
INHERITS (public.new_sample);


ALTER TABLE _timescaledb_internal._hyper_8_182_chunk OWNER TO morgan;

--
-- TOC entry 329 (class 1259 OID 600763)
-- Name: _hyper_8_183_chunk; Type: TABLE; Schema: _timescaledb_internal; Owner: morgan
--

CREATE TABLE _timescaledb_internal._hyper_8_183_chunk (
    CONSTRAINT constraint_183 CHECK ((("timestamp" >= '2014-04-10 00:00:00'::timestamp without time zone) AND ("timestamp" < '2014-04-17 00:00:00'::timestamp without time zone)))
)
INHERITS (public.new_sample);


ALTER TABLE _timescaledb_internal._hyper_8_183_chunk OWNER TO morgan;

--
-- TOC entry 330 (class 1259 OID 600768)
-- Name: _hyper_8_184_chunk; Type: TABLE; Schema: _timescaledb_internal; Owner: morgan
--

CREATE TABLE _timescaledb_internal._hyper_8_184_chunk (
    CONSTRAINT constraint_184 CHECK ((("timestamp" >= '2014-04-17 00:00:00'::timestamp without time zone) AND ("timestamp" < '2014-04-24 00:00:00'::timestamp without time zone)))
)
INHERITS (public.new_sample);


ALTER TABLE _timescaledb_internal._hyper_8_184_chunk OWNER TO morgan;

--
-- TOC entry 331 (class 1259 OID 600773)
-- Name: _hyper_8_185_chunk; Type: TABLE; Schema: _timescaledb_internal; Owner: morgan
--

CREATE TABLE _timescaledb_internal._hyper_8_185_chunk (
    CONSTRAINT constraint_185 CHECK ((("timestamp" >= '2014-04-03 00:00:00'::timestamp without time zone) AND ("timestamp" < '2014-04-10 00:00:00'::timestamp without time zone)))
)
INHERITS (public.new_sample);


ALTER TABLE _timescaledb_internal._hyper_8_185_chunk OWNER TO morgan;

--
-- TOC entry 332 (class 1259 OID 600778)
-- Name: _hyper_8_186_chunk; Type: TABLE; Schema: _timescaledb_internal; Owner: morgan
--

CREATE TABLE _timescaledb_internal._hyper_8_186_chunk (
    CONSTRAINT constraint_186 CHECK ((("timestamp" >= '2014-04-24 00:00:00'::timestamp without time zone) AND ("timestamp" < '2014-05-01 00:00:00'::timestamp without time zone)))
)
INHERITS (public.new_sample);


ALTER TABLE _timescaledb_internal._hyper_8_186_chunk OWNER TO morgan;

--
-- TOC entry 333 (class 1259 OID 600783)
-- Name: _hyper_8_187_chunk; Type: TABLE; Schema: _timescaledb_internal; Owner: morgan
--

CREATE TABLE _timescaledb_internal._hyper_8_187_chunk (
    CONSTRAINT constraint_187 CHECK ((("timestamp" >= '2014-05-01 00:00:00'::timestamp without time zone) AND ("timestamp" < '2014-05-08 00:00:00'::timestamp without time zone)))
)
INHERITS (public.new_sample);


ALTER TABLE _timescaledb_internal._hyper_8_187_chunk OWNER TO morgan;

--
-- TOC entry 334 (class 1259 OID 600788)
-- Name: _hyper_8_188_chunk; Type: TABLE; Schema: _timescaledb_internal; Owner: morgan
--

CREATE TABLE _timescaledb_internal._hyper_8_188_chunk (
    CONSTRAINT constraint_188 CHECK ((("timestamp" >= '2014-05-08 00:00:00'::timestamp without time zone) AND ("timestamp" < '2014-05-15 00:00:00'::timestamp without time zone)))
)
INHERITS (public.new_sample);


ALTER TABLE _timescaledb_internal._hyper_8_188_chunk OWNER TO morgan;

--
-- TOC entry 335 (class 1259 OID 600793)
-- Name: _hyper_8_189_chunk; Type: TABLE; Schema: _timescaledb_internal; Owner: morgan
--

CREATE TABLE _timescaledb_internal._hyper_8_189_chunk (
    CONSTRAINT constraint_189 CHECK ((("timestamp" >= '2014-05-15 00:00:00'::timestamp without time zone) AND ("timestamp" < '2014-05-22 00:00:00'::timestamp without time zone)))
)
INHERITS (public.new_sample);


ALTER TABLE _timescaledb_internal._hyper_8_189_chunk OWNER TO morgan;

--
-- TOC entry 336 (class 1259 OID 600798)
-- Name: _hyper_8_190_chunk; Type: TABLE; Schema: _timescaledb_internal; Owner: morgan
--

CREATE TABLE _timescaledb_internal._hyper_8_190_chunk (
    CONSTRAINT constraint_190 CHECK ((("timestamp" >= '2014-05-29 00:00:00'::timestamp without time zone) AND ("timestamp" < '2014-06-05 00:00:00'::timestamp without time zone)))
)
INHERITS (public.new_sample);


ALTER TABLE _timescaledb_internal._hyper_8_190_chunk OWNER TO morgan;

--
-- TOC entry 337 (class 1259 OID 600803)
-- Name: _hyper_8_191_chunk; Type: TABLE; Schema: _timescaledb_internal; Owner: morgan
--

CREATE TABLE _timescaledb_internal._hyper_8_191_chunk (
    CONSTRAINT constraint_191 CHECK ((("timestamp" >= '2014-05-22 00:00:00'::timestamp without time zone) AND ("timestamp" < '2014-05-29 00:00:00'::timestamp without time zone)))
)
INHERITS (public.new_sample);


ALTER TABLE _timescaledb_internal._hyper_8_191_chunk OWNER TO morgan;

--
-- TOC entry 338 (class 1259 OID 600808)
-- Name: _hyper_8_192_chunk; Type: TABLE; Schema: _timescaledb_internal; Owner: morgan
--

CREATE TABLE _timescaledb_internal._hyper_8_192_chunk (
    CONSTRAINT constraint_192 CHECK ((("timestamp" >= '2014-06-05 00:00:00'::timestamp without time zone) AND ("timestamp" < '2014-06-12 00:00:00'::timestamp without time zone)))
)
INHERITS (public.new_sample);


ALTER TABLE _timescaledb_internal._hyper_8_192_chunk OWNER TO morgan;

--
-- TOC entry 339 (class 1259 OID 600813)
-- Name: _hyper_8_193_chunk; Type: TABLE; Schema: _timescaledb_internal; Owner: morgan
--

CREATE TABLE _timescaledb_internal._hyper_8_193_chunk (
    CONSTRAINT constraint_193 CHECK ((("timestamp" >= '2014-06-12 00:00:00'::timestamp without time zone) AND ("timestamp" < '2014-06-19 00:00:00'::timestamp without time zone)))
)
INHERITS (public.new_sample);


ALTER TABLE _timescaledb_internal._hyper_8_193_chunk OWNER TO morgan;

--
-- TOC entry 340 (class 1259 OID 600818)
-- Name: _hyper_8_194_chunk; Type: TABLE; Schema: _timescaledb_internal; Owner: morgan
--

CREATE TABLE _timescaledb_internal._hyper_8_194_chunk (
    CONSTRAINT constraint_194 CHECK ((("timestamp" >= '2014-06-19 00:00:00'::timestamp without time zone) AND ("timestamp" < '2014-06-26 00:00:00'::timestamp without time zone)))
)
INHERITS (public.new_sample);


ALTER TABLE _timescaledb_internal._hyper_8_194_chunk OWNER TO morgan;

--
-- TOC entry 341 (class 1259 OID 600823)
-- Name: _hyper_8_195_chunk; Type: TABLE; Schema: _timescaledb_internal; Owner: morgan
--

CREATE TABLE _timescaledb_internal._hyper_8_195_chunk (
    CONSTRAINT constraint_195 CHECK ((("timestamp" >= '2014-11-20 00:00:00'::timestamp without time zone) AND ("timestamp" < '2014-11-27 00:00:00'::timestamp without time zone)))
)
INHERITS (public.new_sample);


ALTER TABLE _timescaledb_internal._hyper_8_195_chunk OWNER TO morgan;

--
-- TOC entry 342 (class 1259 OID 600828)
-- Name: _hyper_8_196_chunk; Type: TABLE; Schema: _timescaledb_internal; Owner: morgan
--

CREATE TABLE _timescaledb_internal._hyper_8_196_chunk (
    CONSTRAINT constraint_196 CHECK ((("timestamp" >= '2014-11-27 00:00:00'::timestamp without time zone) AND ("timestamp" < '2014-12-04 00:00:00'::timestamp without time zone)))
)
INHERITS (public.new_sample);


ALTER TABLE _timescaledb_internal._hyper_8_196_chunk OWNER TO morgan;

--
-- TOC entry 343 (class 1259 OID 600833)
-- Name: _hyper_8_197_chunk; Type: TABLE; Schema: _timescaledb_internal; Owner: morgan
--

CREATE TABLE _timescaledb_internal._hyper_8_197_chunk (
    CONSTRAINT constraint_197 CHECK ((("timestamp" >= '2014-12-04 00:00:00'::timestamp without time zone) AND ("timestamp" < '2014-12-11 00:00:00'::timestamp without time zone)))
)
INHERITS (public.new_sample);


ALTER TABLE _timescaledb_internal._hyper_8_197_chunk OWNER TO morgan;

--
-- TOC entry 344 (class 1259 OID 600838)
-- Name: _hyper_8_198_chunk; Type: TABLE; Schema: _timescaledb_internal; Owner: morgan
--

CREATE TABLE _timescaledb_internal._hyper_8_198_chunk (
    CONSTRAINT constraint_198 CHECK ((("timestamp" >= '2014-12-11 00:00:00'::timestamp without time zone) AND ("timestamp" < '2014-12-18 00:00:00'::timestamp without time zone)))
)
INHERITS (public.new_sample);


ALTER TABLE _timescaledb_internal._hyper_8_198_chunk OWNER TO morgan;

--
-- TOC entry 345 (class 1259 OID 600843)
-- Name: _hyper_8_199_chunk; Type: TABLE; Schema: _timescaledb_internal; Owner: morgan
--

CREATE TABLE _timescaledb_internal._hyper_8_199_chunk (
    CONSTRAINT constraint_199 CHECK ((("timestamp" >= '2014-12-18 00:00:00'::timestamp without time zone) AND ("timestamp" < '2014-12-25 00:00:00'::timestamp without time zone)))
)
INHERITS (public.new_sample);


ALTER TABLE _timescaledb_internal._hyper_8_199_chunk OWNER TO morgan;

--
-- TOC entry 346 (class 1259 OID 600848)
-- Name: _hyper_8_200_chunk; Type: TABLE; Schema: _timescaledb_internal; Owner: morgan
--

CREATE TABLE _timescaledb_internal._hyper_8_200_chunk (
    CONSTRAINT constraint_200 CHECK ((("timestamp" >= '2014-12-25 00:00:00'::timestamp without time zone) AND ("timestamp" < '2015-01-01 00:00:00'::timestamp without time zone)))
)
INHERITS (public.new_sample);


ALTER TABLE _timescaledb_internal._hyper_8_200_chunk OWNER TO morgan;

--
-- TOC entry 347 (class 1259 OID 600853)
-- Name: _hyper_8_201_chunk; Type: TABLE; Schema: _timescaledb_internal; Owner: morgan
--

CREATE TABLE _timescaledb_internal._hyper_8_201_chunk (
    CONSTRAINT constraint_201 CHECK ((("timestamp" >= '2015-01-01 00:00:00'::timestamp without time zone) AND ("timestamp" < '2015-01-08 00:00:00'::timestamp without time zone)))
)
INHERITS (public.new_sample);


ALTER TABLE _timescaledb_internal._hyper_8_201_chunk OWNER TO morgan;

--
-- TOC entry 348 (class 1259 OID 600858)
-- Name: _hyper_8_202_chunk; Type: TABLE; Schema: _timescaledb_internal; Owner: morgan
--

CREATE TABLE _timescaledb_internal._hyper_8_202_chunk (
    CONSTRAINT constraint_202 CHECK ((("timestamp" >= '2015-01-08 00:00:00'::timestamp without time zone) AND ("timestamp" < '2015-01-15 00:00:00'::timestamp without time zone)))
)
INHERITS (public.new_sample);


ALTER TABLE _timescaledb_internal._hyper_8_202_chunk OWNER TO morgan;

--
-- TOC entry 349 (class 1259 OID 600863)
-- Name: _hyper_8_203_chunk; Type: TABLE; Schema: _timescaledb_internal; Owner: morgan
--

CREATE TABLE _timescaledb_internal._hyper_8_203_chunk (
    CONSTRAINT constraint_203 CHECK ((("timestamp" >= '2015-01-22 00:00:00'::timestamp without time zone) AND ("timestamp" < '2015-01-29 00:00:00'::timestamp without time zone)))
)
INHERITS (public.new_sample);


ALTER TABLE _timescaledb_internal._hyper_8_203_chunk OWNER TO morgan;

--
-- TOC entry 350 (class 1259 OID 600868)
-- Name: _hyper_8_204_chunk; Type: TABLE; Schema: _timescaledb_internal; Owner: morgan
--

CREATE TABLE _timescaledb_internal._hyper_8_204_chunk (
    CONSTRAINT constraint_204 CHECK ((("timestamp" >= '2015-01-15 00:00:00'::timestamp without time zone) AND ("timestamp" < '2015-01-22 00:00:00'::timestamp without time zone)))
)
INHERITS (public.new_sample);


ALTER TABLE _timescaledb_internal._hyper_8_204_chunk OWNER TO morgan;

--
-- TOC entry 351 (class 1259 OID 600873)
-- Name: _hyper_8_205_chunk; Type: TABLE; Schema: _timescaledb_internal; Owner: morgan
--

CREATE TABLE _timescaledb_internal._hyper_8_205_chunk (
    CONSTRAINT constraint_205 CHECK ((("timestamp" >= '2015-01-29 00:00:00'::timestamp without time zone) AND ("timestamp" < '2015-02-05 00:00:00'::timestamp without time zone)))
)
INHERITS (public.new_sample);


ALTER TABLE _timescaledb_internal._hyper_8_205_chunk OWNER TO morgan;

--
-- TOC entry 352 (class 1259 OID 600878)
-- Name: _hyper_8_206_chunk; Type: TABLE; Schema: _timescaledb_internal; Owner: morgan
--

CREATE TABLE _timescaledb_internal._hyper_8_206_chunk (
    CONSTRAINT constraint_206 CHECK ((("timestamp" >= '2015-02-05 00:00:00'::timestamp without time zone) AND ("timestamp" < '2015-02-12 00:00:00'::timestamp without time zone)))
)
INHERITS (public.new_sample);


ALTER TABLE _timescaledb_internal._hyper_8_206_chunk OWNER TO morgan;

--
-- TOC entry 353 (class 1259 OID 600883)
-- Name: _hyper_8_207_chunk; Type: TABLE; Schema: _timescaledb_internal; Owner: morgan
--

CREATE TABLE _timescaledb_internal._hyper_8_207_chunk (
    CONSTRAINT constraint_207 CHECK ((("timestamp" >= '2015-02-12 00:00:00'::timestamp without time zone) AND ("timestamp" < '2015-02-19 00:00:00'::timestamp without time zone)))
)
INHERITS (public.new_sample);


ALTER TABLE _timescaledb_internal._hyper_8_207_chunk OWNER TO morgan;

--
-- TOC entry 354 (class 1259 OID 600888)
-- Name: _hyper_8_208_chunk; Type: TABLE; Schema: _timescaledb_internal; Owner: morgan
--

CREATE TABLE _timescaledb_internal._hyper_8_208_chunk (
    CONSTRAINT constraint_208 CHECK ((("timestamp" >= '2015-02-19 00:00:00'::timestamp without time zone) AND ("timestamp" < '2015-02-26 00:00:00'::timestamp without time zone)))
)
INHERITS (public.new_sample);


ALTER TABLE _timescaledb_internal._hyper_8_208_chunk OWNER TO morgan;

--
-- TOC entry 355 (class 1259 OID 600893)
-- Name: _hyper_8_209_chunk; Type: TABLE; Schema: _timescaledb_internal; Owner: morgan
--

CREATE TABLE _timescaledb_internal._hyper_8_209_chunk (
    CONSTRAINT constraint_209 CHECK ((("timestamp" >= '2015-02-26 00:00:00'::timestamp without time zone) AND ("timestamp" < '2015-03-05 00:00:00'::timestamp without time zone)))
)
INHERITS (public.new_sample);


ALTER TABLE _timescaledb_internal._hyper_8_209_chunk OWNER TO morgan;

--
-- TOC entry 356 (class 1259 OID 600898)
-- Name: _hyper_8_210_chunk; Type: TABLE; Schema: _timescaledb_internal; Owner: morgan
--

CREATE TABLE _timescaledb_internal._hyper_8_210_chunk (
    CONSTRAINT constraint_210 CHECK ((("timestamp" >= '2015-03-05 00:00:00'::timestamp without time zone) AND ("timestamp" < '2015-03-12 00:00:00'::timestamp without time zone)))
)
INHERITS (public.new_sample);


ALTER TABLE _timescaledb_internal._hyper_8_210_chunk OWNER TO morgan;

--
-- TOC entry 357 (class 1259 OID 600903)
-- Name: _hyper_8_211_chunk; Type: TABLE; Schema: _timescaledb_internal; Owner: morgan
--

CREATE TABLE _timescaledb_internal._hyper_8_211_chunk (
    CONSTRAINT constraint_211 CHECK ((("timestamp" >= '2015-03-12 00:00:00'::timestamp without time zone) AND ("timestamp" < '2015-03-19 00:00:00'::timestamp without time zone)))
)
INHERITS (public.new_sample);


ALTER TABLE _timescaledb_internal._hyper_8_211_chunk OWNER TO morgan;

--
-- TOC entry 358 (class 1259 OID 600908)
-- Name: _hyper_8_212_chunk; Type: TABLE; Schema: _timescaledb_internal; Owner: morgan
--

CREATE TABLE _timescaledb_internal._hyper_8_212_chunk (
    CONSTRAINT constraint_212 CHECK ((("timestamp" >= '2015-03-19 00:00:00'::timestamp without time zone) AND ("timestamp" < '2015-03-26 00:00:00'::timestamp without time zone)))
)
INHERITS (public.new_sample);


ALTER TABLE _timescaledb_internal._hyper_8_212_chunk OWNER TO morgan;

--
-- TOC entry 359 (class 1259 OID 600913)
-- Name: _hyper_8_213_chunk; Type: TABLE; Schema: _timescaledb_internal; Owner: morgan
--

CREATE TABLE _timescaledb_internal._hyper_8_213_chunk (
    CONSTRAINT constraint_213 CHECK ((("timestamp" >= '2015-03-26 00:00:00'::timestamp without time zone) AND ("timestamp" < '2015-04-02 00:00:00'::timestamp without time zone)))
)
INHERITS (public.new_sample);


ALTER TABLE _timescaledb_internal._hyper_8_213_chunk OWNER TO morgan;

--
-- TOC entry 360 (class 1259 OID 600918)
-- Name: _hyper_8_214_chunk; Type: TABLE; Schema: _timescaledb_internal; Owner: morgan
--

CREATE TABLE _timescaledb_internal._hyper_8_214_chunk (
    CONSTRAINT constraint_214 CHECK ((("timestamp" >= '2015-04-02 00:00:00'::timestamp without time zone) AND ("timestamp" < '2015-04-09 00:00:00'::timestamp without time zone)))
)
INHERITS (public.new_sample);


ALTER TABLE _timescaledb_internal._hyper_8_214_chunk OWNER TO morgan;

--
-- TOC entry 361 (class 1259 OID 600923)
-- Name: _hyper_8_215_chunk; Type: TABLE; Schema: _timescaledb_internal; Owner: morgan
--

CREATE TABLE _timescaledb_internal._hyper_8_215_chunk (
    CONSTRAINT constraint_215 CHECK ((("timestamp" >= '2015-04-16 00:00:00'::timestamp without time zone) AND ("timestamp" < '2015-04-23 00:00:00'::timestamp without time zone)))
)
INHERITS (public.new_sample);


ALTER TABLE _timescaledb_internal._hyper_8_215_chunk OWNER TO morgan;

--
-- TOC entry 362 (class 1259 OID 600928)
-- Name: _hyper_8_216_chunk; Type: TABLE; Schema: _timescaledb_internal; Owner: morgan
--

CREATE TABLE _timescaledb_internal._hyper_8_216_chunk (
    CONSTRAINT constraint_216 CHECK ((("timestamp" >= '2015-04-09 00:00:00'::timestamp without time zone) AND ("timestamp" < '2015-04-16 00:00:00'::timestamp without time zone)))
)
INHERITS (public.new_sample);


ALTER TABLE _timescaledb_internal._hyper_8_216_chunk OWNER TO morgan;

--
-- TOC entry 363 (class 1259 OID 600933)
-- Name: _hyper_8_217_chunk; Type: TABLE; Schema: _timescaledb_internal; Owner: morgan
--

CREATE TABLE _timescaledb_internal._hyper_8_217_chunk (
    CONSTRAINT constraint_217 CHECK ((("timestamp" >= '2015-04-23 00:00:00'::timestamp without time zone) AND ("timestamp" < '2015-04-30 00:00:00'::timestamp without time zone)))
)
INHERITS (public.new_sample);


ALTER TABLE _timescaledb_internal._hyper_8_217_chunk OWNER TO morgan;

--
-- TOC entry 364 (class 1259 OID 600938)
-- Name: _hyper_8_218_chunk; Type: TABLE; Schema: _timescaledb_internal; Owner: morgan
--

CREATE TABLE _timescaledb_internal._hyper_8_218_chunk (
    CONSTRAINT constraint_218 CHECK ((("timestamp" >= '2015-04-30 00:00:00'::timestamp without time zone) AND ("timestamp" < '2015-05-07 00:00:00'::timestamp without time zone)))
)
INHERITS (public.new_sample);


ALTER TABLE _timescaledb_internal._hyper_8_218_chunk OWNER TO morgan;

--
-- TOC entry 365 (class 1259 OID 600943)
-- Name: _hyper_8_219_chunk; Type: TABLE; Schema: _timescaledb_internal; Owner: morgan
--

CREATE TABLE _timescaledb_internal._hyper_8_219_chunk (
    CONSTRAINT constraint_219 CHECK ((("timestamp" >= '2015-05-07 00:00:00'::timestamp without time zone) AND ("timestamp" < '2015-05-14 00:00:00'::timestamp without time zone)))
)
INHERITS (public.new_sample);


ALTER TABLE _timescaledb_internal._hyper_8_219_chunk OWNER TO morgan;

--
-- TOC entry 366 (class 1259 OID 600948)
-- Name: _hyper_8_220_chunk; Type: TABLE; Schema: _timescaledb_internal; Owner: morgan
--

CREATE TABLE _timescaledb_internal._hyper_8_220_chunk (
    CONSTRAINT constraint_220 CHECK ((("timestamp" >= '2015-05-14 00:00:00'::timestamp without time zone) AND ("timestamp" < '2015-05-21 00:00:00'::timestamp without time zone)))
)
INHERITS (public.new_sample);


ALTER TABLE _timescaledb_internal._hyper_8_220_chunk OWNER TO morgan;

--
-- TOC entry 367 (class 1259 OID 600953)
-- Name: _hyper_8_221_chunk; Type: TABLE; Schema: _timescaledb_internal; Owner: morgan
--

CREATE TABLE _timescaledb_internal._hyper_8_221_chunk (
    CONSTRAINT constraint_221 CHECK ((("timestamp" >= '2015-05-21 00:00:00'::timestamp without time zone) AND ("timestamp" < '2015-05-28 00:00:00'::timestamp without time zone)))
)
INHERITS (public.new_sample);


ALTER TABLE _timescaledb_internal._hyper_8_221_chunk OWNER TO morgan;

--
-- TOC entry 368 (class 1259 OID 600958)
-- Name: _hyper_8_222_chunk; Type: TABLE; Schema: _timescaledb_internal; Owner: morgan
--

CREATE TABLE _timescaledb_internal._hyper_8_222_chunk (
    CONSTRAINT constraint_222 CHECK ((("timestamp" >= '2015-05-28 00:00:00'::timestamp without time zone) AND ("timestamp" < '2015-06-04 00:00:00'::timestamp without time zone)))
)
INHERITS (public.new_sample);


ALTER TABLE _timescaledb_internal._hyper_8_222_chunk OWNER TO morgan;

--
-- TOC entry 369 (class 1259 OID 600963)
-- Name: _hyper_8_223_chunk; Type: TABLE; Schema: _timescaledb_internal; Owner: morgan
--

CREATE TABLE _timescaledb_internal._hyper_8_223_chunk (
    CONSTRAINT constraint_223 CHECK ((("timestamp" >= '2015-06-04 00:00:00'::timestamp without time zone) AND ("timestamp" < '2015-06-11 00:00:00'::timestamp without time zone)))
)
INHERITS (public.new_sample);


ALTER TABLE _timescaledb_internal._hyper_8_223_chunk OWNER TO morgan;

--
-- TOC entry 370 (class 1259 OID 600968)
-- Name: _hyper_8_224_chunk; Type: TABLE; Schema: _timescaledb_internal; Owner: morgan
--

CREATE TABLE _timescaledb_internal._hyper_8_224_chunk (
    CONSTRAINT constraint_224 CHECK ((("timestamp" >= '2015-06-18 00:00:00'::timestamp without time zone) AND ("timestamp" < '2015-06-25 00:00:00'::timestamp without time zone)))
)
INHERITS (public.new_sample);


ALTER TABLE _timescaledb_internal._hyper_8_224_chunk OWNER TO morgan;

--
-- TOC entry 371 (class 1259 OID 600973)
-- Name: _hyper_8_225_chunk; Type: TABLE; Schema: _timescaledb_internal; Owner: morgan
--

CREATE TABLE _timescaledb_internal._hyper_8_225_chunk (
    CONSTRAINT constraint_225 CHECK ((("timestamp" >= '2015-06-11 00:00:00'::timestamp without time zone) AND ("timestamp" < '2015-06-18 00:00:00'::timestamp without time zone)))
)
INHERITS (public.new_sample);


ALTER TABLE _timescaledb_internal._hyper_8_225_chunk OWNER TO morgan;

--
-- TOC entry 372 (class 1259 OID 600978)
-- Name: _hyper_8_226_chunk; Type: TABLE; Schema: _timescaledb_internal; Owner: morgan
--

CREATE TABLE _timescaledb_internal._hyper_8_226_chunk (
    CONSTRAINT constraint_226 CHECK ((("timestamp" >= '2015-06-25 00:00:00'::timestamp without time zone) AND ("timestamp" < '2015-07-02 00:00:00'::timestamp without time zone)))
)
INHERITS (public.new_sample);


ALTER TABLE _timescaledb_internal._hyper_8_226_chunk OWNER TO morgan;

--
-- TOC entry 373 (class 1259 OID 600983)
-- Name: _hyper_8_227_chunk; Type: TABLE; Schema: _timescaledb_internal; Owner: morgan
--

CREATE TABLE _timescaledb_internal._hyper_8_227_chunk (
    CONSTRAINT constraint_227 CHECK ((("timestamp" >= '2015-07-02 00:00:00'::timestamp without time zone) AND ("timestamp" < '2015-07-09 00:00:00'::timestamp without time zone)))
)
INHERITS (public.new_sample);


ALTER TABLE _timescaledb_internal._hyper_8_227_chunk OWNER TO morgan;

--
-- TOC entry 374 (class 1259 OID 600988)
-- Name: _hyper_8_228_chunk; Type: TABLE; Schema: _timescaledb_internal; Owner: morgan
--

CREATE TABLE _timescaledb_internal._hyper_8_228_chunk (
    CONSTRAINT constraint_228 CHECK ((("timestamp" >= '2015-07-09 00:00:00'::timestamp without time zone) AND ("timestamp" < '2015-07-16 00:00:00'::timestamp without time zone)))
)
INHERITS (public.new_sample);


ALTER TABLE _timescaledb_internal._hyper_8_228_chunk OWNER TO morgan;

--
-- TOC entry 375 (class 1259 OID 600993)
-- Name: _hyper_8_229_chunk; Type: TABLE; Schema: _timescaledb_internal; Owner: morgan
--

CREATE TABLE _timescaledb_internal._hyper_8_229_chunk (
    CONSTRAINT constraint_229 CHECK ((("timestamp" >= '2015-07-23 00:00:00'::timestamp without time zone) AND ("timestamp" < '2015-07-30 00:00:00'::timestamp without time zone)))
)
INHERITS (public.new_sample);


ALTER TABLE _timescaledb_internal._hyper_8_229_chunk OWNER TO morgan;

--
-- TOC entry 376 (class 1259 OID 600998)
-- Name: _hyper_8_230_chunk; Type: TABLE; Schema: _timescaledb_internal; Owner: morgan
--

CREATE TABLE _timescaledb_internal._hyper_8_230_chunk (
    CONSTRAINT constraint_230 CHECK ((("timestamp" >= '2015-07-30 00:00:00'::timestamp without time zone) AND ("timestamp" < '2015-08-06 00:00:00'::timestamp without time zone)))
)
INHERITS (public.new_sample);


ALTER TABLE _timescaledb_internal._hyper_8_230_chunk OWNER TO morgan;

--
-- TOC entry 377 (class 1259 OID 601003)
-- Name: _hyper_8_231_chunk; Type: TABLE; Schema: _timescaledb_internal; Owner: morgan
--

CREATE TABLE _timescaledb_internal._hyper_8_231_chunk (
    CONSTRAINT constraint_231 CHECK ((("timestamp" >= '2015-07-16 00:00:00'::timestamp without time zone) AND ("timestamp" < '2015-07-23 00:00:00'::timestamp without time zone)))
)
INHERITS (public.new_sample);


ALTER TABLE _timescaledb_internal._hyper_8_231_chunk OWNER TO morgan;

--
-- TOC entry 378 (class 1259 OID 601008)
-- Name: _hyper_8_232_chunk; Type: TABLE; Schema: _timescaledb_internal; Owner: morgan
--

CREATE TABLE _timescaledb_internal._hyper_8_232_chunk (
    CONSTRAINT constraint_232 CHECK ((("timestamp" >= '2015-08-06 00:00:00'::timestamp without time zone) AND ("timestamp" < '2015-08-13 00:00:00'::timestamp without time zone)))
)
INHERITS (public.new_sample);


ALTER TABLE _timescaledb_internal._hyper_8_232_chunk OWNER TO morgan;

--
-- TOC entry 379 (class 1259 OID 601013)
-- Name: _hyper_8_233_chunk; Type: TABLE; Schema: _timescaledb_internal; Owner: morgan
--

CREATE TABLE _timescaledb_internal._hyper_8_233_chunk (
    CONSTRAINT constraint_233 CHECK ((("timestamp" >= '2015-08-13 00:00:00'::timestamp without time zone) AND ("timestamp" < '2015-08-20 00:00:00'::timestamp without time zone)))
)
INHERITS (public.new_sample);


ALTER TABLE _timescaledb_internal._hyper_8_233_chunk OWNER TO morgan;

--
-- TOC entry 380 (class 1259 OID 601018)
-- Name: _hyper_8_234_chunk; Type: TABLE; Schema: _timescaledb_internal; Owner: morgan
--

CREATE TABLE _timescaledb_internal._hyper_8_234_chunk (
    CONSTRAINT constraint_234 CHECK ((("timestamp" >= '2015-08-27 00:00:00'::timestamp without time zone) AND ("timestamp" < '2015-09-03 00:00:00'::timestamp without time zone)))
)
INHERITS (public.new_sample);


ALTER TABLE _timescaledb_internal._hyper_8_234_chunk OWNER TO morgan;

--
-- TOC entry 381 (class 1259 OID 601023)
-- Name: _hyper_8_235_chunk; Type: TABLE; Schema: _timescaledb_internal; Owner: morgan
--

CREATE TABLE _timescaledb_internal._hyper_8_235_chunk (
    CONSTRAINT constraint_235 CHECK ((("timestamp" >= '2015-08-20 00:00:00'::timestamp without time zone) AND ("timestamp" < '2015-08-27 00:00:00'::timestamp without time zone)))
)
INHERITS (public.new_sample);


ALTER TABLE _timescaledb_internal._hyper_8_235_chunk OWNER TO morgan;

--
-- TOC entry 382 (class 1259 OID 601028)
-- Name: _hyper_8_236_chunk; Type: TABLE; Schema: _timescaledb_internal; Owner: morgan
--

CREATE TABLE _timescaledb_internal._hyper_8_236_chunk (
    CONSTRAINT constraint_236 CHECK ((("timestamp" >= '2015-09-10 00:00:00'::timestamp without time zone) AND ("timestamp" < '2015-09-17 00:00:00'::timestamp without time zone)))
)
INHERITS (public.new_sample);


ALTER TABLE _timescaledb_internal._hyper_8_236_chunk OWNER TO morgan;

--
-- TOC entry 383 (class 1259 OID 601033)
-- Name: _hyper_8_237_chunk; Type: TABLE; Schema: _timescaledb_internal; Owner: morgan
--

CREATE TABLE _timescaledb_internal._hyper_8_237_chunk (
    CONSTRAINT constraint_237 CHECK ((("timestamp" >= '2015-09-17 00:00:00'::timestamp without time zone) AND ("timestamp" < '2015-09-24 00:00:00'::timestamp without time zone)))
)
INHERITS (public.new_sample);


ALTER TABLE _timescaledb_internal._hyper_8_237_chunk OWNER TO morgan;

--
-- TOC entry 384 (class 1259 OID 601038)
-- Name: _hyper_8_238_chunk; Type: TABLE; Schema: _timescaledb_internal; Owner: morgan
--

CREATE TABLE _timescaledb_internal._hyper_8_238_chunk (
    CONSTRAINT constraint_238 CHECK ((("timestamp" >= '2015-09-03 00:00:00'::timestamp without time zone) AND ("timestamp" < '2015-09-10 00:00:00'::timestamp without time zone)))
)
INHERITS (public.new_sample);


ALTER TABLE _timescaledb_internal._hyper_8_238_chunk OWNER TO morgan;

--
-- TOC entry 385 (class 1259 OID 601043)
-- Name: _hyper_8_239_chunk; Type: TABLE; Schema: _timescaledb_internal; Owner: morgan
--

CREATE TABLE _timescaledb_internal._hyper_8_239_chunk (
    CONSTRAINT constraint_239 CHECK ((("timestamp" >= '2015-09-24 00:00:00'::timestamp without time zone) AND ("timestamp" < '2015-10-01 00:00:00'::timestamp without time zone)))
)
INHERITS (public.new_sample);


ALTER TABLE _timescaledb_internal._hyper_8_239_chunk OWNER TO morgan;

--
-- TOC entry 386 (class 1259 OID 601048)
-- Name: _hyper_8_240_chunk; Type: TABLE; Schema: _timescaledb_internal; Owner: morgan
--

CREATE TABLE _timescaledb_internal._hyper_8_240_chunk (
    CONSTRAINT constraint_240 CHECK ((("timestamp" >= '2015-10-01 00:00:00'::timestamp without time zone) AND ("timestamp" < '2015-10-08 00:00:00'::timestamp without time zone)))
)
INHERITS (public.new_sample);


ALTER TABLE _timescaledb_internal._hyper_8_240_chunk OWNER TO morgan;

--
-- TOC entry 387 (class 1259 OID 601053)
-- Name: _hyper_8_241_chunk; Type: TABLE; Schema: _timescaledb_internal; Owner: morgan
--

CREATE TABLE _timescaledb_internal._hyper_8_241_chunk (
    CONSTRAINT constraint_241 CHECK ((("timestamp" >= '2015-10-08 00:00:00'::timestamp without time zone) AND ("timestamp" < '2015-10-15 00:00:00'::timestamp without time zone)))
)
INHERITS (public.new_sample);


ALTER TABLE _timescaledb_internal._hyper_8_241_chunk OWNER TO morgan;

--
-- TOC entry 388 (class 1259 OID 601058)
-- Name: _hyper_8_242_chunk; Type: TABLE; Schema: _timescaledb_internal; Owner: morgan
--

CREATE TABLE _timescaledb_internal._hyper_8_242_chunk (
    CONSTRAINT constraint_242 CHECK ((("timestamp" >= '2015-10-15 00:00:00'::timestamp without time zone) AND ("timestamp" < '2015-10-22 00:00:00'::timestamp without time zone)))
)
INHERITS (public.new_sample);


ALTER TABLE _timescaledb_internal._hyper_8_242_chunk OWNER TO morgan;

--
-- TOC entry 389 (class 1259 OID 601063)
-- Name: _hyper_8_243_chunk; Type: TABLE; Schema: _timescaledb_internal; Owner: morgan
--

CREATE TABLE _timescaledb_internal._hyper_8_243_chunk (
    CONSTRAINT constraint_243 CHECK ((("timestamp" >= '2015-10-22 00:00:00'::timestamp without time zone) AND ("timestamp" < '2015-10-29 00:00:00'::timestamp without time zone)))
)
INHERITS (public.new_sample);


ALTER TABLE _timescaledb_internal._hyper_8_243_chunk OWNER TO morgan;

--
-- TOC entry 390 (class 1259 OID 601068)
-- Name: _hyper_8_244_chunk; Type: TABLE; Schema: _timescaledb_internal; Owner: morgan
--

CREATE TABLE _timescaledb_internal._hyper_8_244_chunk (
    CONSTRAINT constraint_244 CHECK ((("timestamp" >= '2015-11-05 00:00:00'::timestamp without time zone) AND ("timestamp" < '2015-11-12 00:00:00'::timestamp without time zone)))
)
INHERITS (public.new_sample);


ALTER TABLE _timescaledb_internal._hyper_8_244_chunk OWNER TO morgan;

--
-- TOC entry 391 (class 1259 OID 601073)
-- Name: _hyper_8_245_chunk; Type: TABLE; Schema: _timescaledb_internal; Owner: morgan
--

CREATE TABLE _timescaledb_internal._hyper_8_245_chunk (
    CONSTRAINT constraint_245 CHECK ((("timestamp" >= '2015-10-29 00:00:00'::timestamp without time zone) AND ("timestamp" < '2015-11-05 00:00:00'::timestamp without time zone)))
)
INHERITS (public.new_sample);


ALTER TABLE _timescaledb_internal._hyper_8_245_chunk OWNER TO morgan;

--
-- TOC entry 392 (class 1259 OID 601078)
-- Name: _hyper_8_246_chunk; Type: TABLE; Schema: _timescaledb_internal; Owner: morgan
--

CREATE TABLE _timescaledb_internal._hyper_8_246_chunk (
    CONSTRAINT constraint_246 CHECK ((("timestamp" >= '2015-11-12 00:00:00'::timestamp without time zone) AND ("timestamp" < '2015-11-19 00:00:00'::timestamp without time zone)))
)
INHERITS (public.new_sample);


ALTER TABLE _timescaledb_internal._hyper_8_246_chunk OWNER TO morgan;

--
-- TOC entry 393 (class 1259 OID 601083)
-- Name: _hyper_8_247_chunk; Type: TABLE; Schema: _timescaledb_internal; Owner: morgan
--

CREATE TABLE _timescaledb_internal._hyper_8_247_chunk (
    CONSTRAINT constraint_247 CHECK ((("timestamp" >= '2015-11-19 00:00:00'::timestamp without time zone) AND ("timestamp" < '2015-11-26 00:00:00'::timestamp without time zone)))
)
INHERITS (public.new_sample);


ALTER TABLE _timescaledb_internal._hyper_8_247_chunk OWNER TO morgan;

--
-- TOC entry 394 (class 1259 OID 601088)
-- Name: _hyper_8_248_chunk; Type: TABLE; Schema: _timescaledb_internal; Owner: morgan
--

CREATE TABLE _timescaledb_internal._hyper_8_248_chunk (
    CONSTRAINT constraint_248 CHECK ((("timestamp" >= '2015-11-26 00:00:00'::timestamp without time zone) AND ("timestamp" < '2015-12-03 00:00:00'::timestamp without time zone)))
)
INHERITS (public.new_sample);


ALTER TABLE _timescaledb_internal._hyper_8_248_chunk OWNER TO morgan;

--
-- TOC entry 395 (class 1259 OID 601093)
-- Name: _hyper_8_249_chunk; Type: TABLE; Schema: _timescaledb_internal; Owner: morgan
--

CREATE TABLE _timescaledb_internal._hyper_8_249_chunk (
    CONSTRAINT constraint_249 CHECK ((("timestamp" >= '2015-12-03 00:00:00'::timestamp without time zone) AND ("timestamp" < '2015-12-10 00:00:00'::timestamp without time zone)))
)
INHERITS (public.new_sample);


ALTER TABLE _timescaledb_internal._hyper_8_249_chunk OWNER TO morgan;

--
-- TOC entry 396 (class 1259 OID 601098)
-- Name: _hyper_8_250_chunk; Type: TABLE; Schema: _timescaledb_internal; Owner: morgan
--

CREATE TABLE _timescaledb_internal._hyper_8_250_chunk (
    CONSTRAINT constraint_250 CHECK ((("timestamp" >= '2015-12-10 00:00:00'::timestamp without time zone) AND ("timestamp" < '2015-12-17 00:00:00'::timestamp without time zone)))
)
INHERITS (public.new_sample);


ALTER TABLE _timescaledb_internal._hyper_8_250_chunk OWNER TO morgan;

--
-- TOC entry 397 (class 1259 OID 601103)
-- Name: _hyper_8_251_chunk; Type: TABLE; Schema: _timescaledb_internal; Owner: morgan
--

CREATE TABLE _timescaledb_internal._hyper_8_251_chunk (
    CONSTRAINT constraint_251 CHECK ((("timestamp" >= '2015-12-17 00:00:00'::timestamp without time zone) AND ("timestamp" < '2015-12-24 00:00:00'::timestamp without time zone)))
)
INHERITS (public.new_sample);


ALTER TABLE _timescaledb_internal._hyper_8_251_chunk OWNER TO morgan;

--
-- TOC entry 398 (class 1259 OID 601108)
-- Name: _hyper_8_252_chunk; Type: TABLE; Schema: _timescaledb_internal; Owner: morgan
--

CREATE TABLE _timescaledb_internal._hyper_8_252_chunk (
    CONSTRAINT constraint_252 CHECK ((("timestamp" >= '2015-12-24 00:00:00'::timestamp without time zone) AND ("timestamp" < '2015-12-31 00:00:00'::timestamp without time zone)))
)
INHERITS (public.new_sample);


ALTER TABLE _timescaledb_internal._hyper_8_252_chunk OWNER TO morgan;

--
-- TOC entry 399 (class 1259 OID 601113)
-- Name: _hyper_8_253_chunk; Type: TABLE; Schema: _timescaledb_internal; Owner: morgan
--

CREATE TABLE _timescaledb_internal._hyper_8_253_chunk (
    CONSTRAINT constraint_253 CHECK ((("timestamp" >= '2015-12-31 00:00:00'::timestamp without time zone) AND ("timestamp" < '2016-01-07 00:00:00'::timestamp without time zone)))
)
INHERITS (public.new_sample);


ALTER TABLE _timescaledb_internal._hyper_8_253_chunk OWNER TO morgan;

--
-- TOC entry 400 (class 1259 OID 601118)
-- Name: _hyper_8_254_chunk; Type: TABLE; Schema: _timescaledb_internal; Owner: morgan
--

CREATE TABLE _timescaledb_internal._hyper_8_254_chunk (
    CONSTRAINT constraint_254 CHECK ((("timestamp" >= '2016-01-07 00:00:00'::timestamp without time zone) AND ("timestamp" < '2016-01-14 00:00:00'::timestamp without time zone)))
)
INHERITS (public.new_sample);


ALTER TABLE _timescaledb_internal._hyper_8_254_chunk OWNER TO morgan;

--
-- TOC entry 401 (class 1259 OID 601123)
-- Name: _hyper_8_255_chunk; Type: TABLE; Schema: _timescaledb_internal; Owner: morgan
--

CREATE TABLE _timescaledb_internal._hyper_8_255_chunk (
    CONSTRAINT constraint_255 CHECK ((("timestamp" >= '2016-01-21 00:00:00'::timestamp without time zone) AND ("timestamp" < '2016-01-28 00:00:00'::timestamp without time zone)))
)
INHERITS (public.new_sample);


ALTER TABLE _timescaledb_internal._hyper_8_255_chunk OWNER TO morgan;

--
-- TOC entry 402 (class 1259 OID 601128)
-- Name: _hyper_8_256_chunk; Type: TABLE; Schema: _timescaledb_internal; Owner: morgan
--

CREATE TABLE _timescaledb_internal._hyper_8_256_chunk (
    CONSTRAINT constraint_256 CHECK ((("timestamp" >= '2016-01-14 00:00:00'::timestamp without time zone) AND ("timestamp" < '2016-01-21 00:00:00'::timestamp without time zone)))
)
INHERITS (public.new_sample);


ALTER TABLE _timescaledb_internal._hyper_8_256_chunk OWNER TO morgan;

--
-- TOC entry 403 (class 1259 OID 601133)
-- Name: _hyper_8_257_chunk; Type: TABLE; Schema: _timescaledb_internal; Owner: morgan
--

CREATE TABLE _timescaledb_internal._hyper_8_257_chunk (
    CONSTRAINT constraint_257 CHECK ((("timestamp" >= '2016-01-28 00:00:00'::timestamp without time zone) AND ("timestamp" < '2016-02-04 00:00:00'::timestamp without time zone)))
)
INHERITS (public.new_sample);


ALTER TABLE _timescaledb_internal._hyper_8_257_chunk OWNER TO morgan;

--
-- TOC entry 404 (class 1259 OID 601138)
-- Name: _hyper_8_258_chunk; Type: TABLE; Schema: _timescaledb_internal; Owner: morgan
--

CREATE TABLE _timescaledb_internal._hyper_8_258_chunk (
    CONSTRAINT constraint_258 CHECK ((("timestamp" >= '2016-02-04 00:00:00'::timestamp without time zone) AND ("timestamp" < '2016-02-11 00:00:00'::timestamp without time zone)))
)
INHERITS (public.new_sample);


ALTER TABLE _timescaledb_internal._hyper_8_258_chunk OWNER TO morgan;

--
-- TOC entry 405 (class 1259 OID 601143)
-- Name: _hyper_8_259_chunk; Type: TABLE; Schema: _timescaledb_internal; Owner: morgan
--

CREATE TABLE _timescaledb_internal._hyper_8_259_chunk (
    CONSTRAINT constraint_259 CHECK ((("timestamp" >= '2016-02-11 00:00:00'::timestamp without time zone) AND ("timestamp" < '2016-02-18 00:00:00'::timestamp without time zone)))
)
INHERITS (public.new_sample);


ALTER TABLE _timescaledb_internal._hyper_8_259_chunk OWNER TO morgan;

--
-- TOC entry 406 (class 1259 OID 601148)
-- Name: _hyper_8_260_chunk; Type: TABLE; Schema: _timescaledb_internal; Owner: morgan
--

CREATE TABLE _timescaledb_internal._hyper_8_260_chunk (
    CONSTRAINT constraint_260 CHECK ((("timestamp" >= '2016-02-18 00:00:00'::timestamp without time zone) AND ("timestamp" < '2016-02-25 00:00:00'::timestamp without time zone)))
)
INHERITS (public.new_sample);


ALTER TABLE _timescaledb_internal._hyper_8_260_chunk OWNER TO morgan;

--
-- TOC entry 407 (class 1259 OID 601153)
-- Name: _hyper_8_261_chunk; Type: TABLE; Schema: _timescaledb_internal; Owner: morgan
--

CREATE TABLE _timescaledb_internal._hyper_8_261_chunk (
    CONSTRAINT constraint_261 CHECK ((("timestamp" >= '2016-02-25 00:00:00'::timestamp without time zone) AND ("timestamp" < '2016-03-03 00:00:00'::timestamp without time zone)))
)
INHERITS (public.new_sample);


ALTER TABLE _timescaledb_internal._hyper_8_261_chunk OWNER TO morgan;

--
-- TOC entry 408 (class 1259 OID 601158)
-- Name: _hyper_8_262_chunk; Type: TABLE; Schema: _timescaledb_internal; Owner: morgan
--

CREATE TABLE _timescaledb_internal._hyper_8_262_chunk (
    CONSTRAINT constraint_262 CHECK ((("timestamp" >= '2016-03-03 00:00:00'::timestamp without time zone) AND ("timestamp" < '2016-03-10 00:00:00'::timestamp without time zone)))
)
INHERITS (public.new_sample);


ALTER TABLE _timescaledb_internal._hyper_8_262_chunk OWNER TO morgan;

--
-- TOC entry 409 (class 1259 OID 601163)
-- Name: _hyper_8_263_chunk; Type: TABLE; Schema: _timescaledb_internal; Owner: morgan
--

CREATE TABLE _timescaledb_internal._hyper_8_263_chunk (
    CONSTRAINT constraint_263 CHECK ((("timestamp" >= '2016-03-10 00:00:00'::timestamp without time zone) AND ("timestamp" < '2016-03-17 00:00:00'::timestamp without time zone)))
)
INHERITS (public.new_sample);


ALTER TABLE _timescaledb_internal._hyper_8_263_chunk OWNER TO morgan;

--
-- TOC entry 410 (class 1259 OID 601168)
-- Name: _hyper_8_264_chunk; Type: TABLE; Schema: _timescaledb_internal; Owner: morgan
--

CREATE TABLE _timescaledb_internal._hyper_8_264_chunk (
    CONSTRAINT constraint_264 CHECK ((("timestamp" >= '2016-03-17 00:00:00'::timestamp without time zone) AND ("timestamp" < '2016-03-24 00:00:00'::timestamp without time zone)))
)
INHERITS (public.new_sample);


ALTER TABLE _timescaledb_internal._hyper_8_264_chunk OWNER TO morgan;

--
-- TOC entry 411 (class 1259 OID 601173)
-- Name: _hyper_8_265_chunk; Type: TABLE; Schema: _timescaledb_internal; Owner: morgan
--

CREATE TABLE _timescaledb_internal._hyper_8_265_chunk (
    CONSTRAINT constraint_265 CHECK ((("timestamp" >= '2016-03-31 00:00:00'::timestamp without time zone) AND ("timestamp" < '2016-04-07 00:00:00'::timestamp without time zone)))
)
INHERITS (public.new_sample);


ALTER TABLE _timescaledb_internal._hyper_8_265_chunk OWNER TO morgan;

--
-- TOC entry 412 (class 1259 OID 601178)
-- Name: _hyper_8_266_chunk; Type: TABLE; Schema: _timescaledb_internal; Owner: morgan
--

CREATE TABLE _timescaledb_internal._hyper_8_266_chunk (
    CONSTRAINT constraint_266 CHECK ((("timestamp" >= '2016-03-24 00:00:00'::timestamp without time zone) AND ("timestamp" < '2016-03-31 00:00:00'::timestamp without time zone)))
)
INHERITS (public.new_sample);


ALTER TABLE _timescaledb_internal._hyper_8_266_chunk OWNER TO morgan;

--
-- TOC entry 413 (class 1259 OID 601183)
-- Name: _hyper_8_267_chunk; Type: TABLE; Schema: _timescaledb_internal; Owner: morgan
--

CREATE TABLE _timescaledb_internal._hyper_8_267_chunk (
    CONSTRAINT constraint_267 CHECK ((("timestamp" >= '2016-04-07 00:00:00'::timestamp without time zone) AND ("timestamp" < '2016-04-14 00:00:00'::timestamp without time zone)))
)
INHERITS (public.new_sample);


ALTER TABLE _timescaledb_internal._hyper_8_267_chunk OWNER TO morgan;

--
-- TOC entry 414 (class 1259 OID 601188)
-- Name: _hyper_8_268_chunk; Type: TABLE; Schema: _timescaledb_internal; Owner: morgan
--

CREATE TABLE _timescaledb_internal._hyper_8_268_chunk (
    CONSTRAINT constraint_268 CHECK ((("timestamp" >= '2016-04-14 00:00:00'::timestamp without time zone) AND ("timestamp" < '2016-04-21 00:00:00'::timestamp without time zone)))
)
INHERITS (public.new_sample);


ALTER TABLE _timescaledb_internal._hyper_8_268_chunk OWNER TO morgan;

--
-- TOC entry 415 (class 1259 OID 601193)
-- Name: _hyper_8_269_chunk; Type: TABLE; Schema: _timescaledb_internal; Owner: morgan
--

CREATE TABLE _timescaledb_internal._hyper_8_269_chunk (
    CONSTRAINT constraint_269 CHECK ((("timestamp" >= '2016-04-21 00:00:00'::timestamp without time zone) AND ("timestamp" < '2016-04-28 00:00:00'::timestamp without time zone)))
)
INHERITS (public.new_sample);


ALTER TABLE _timescaledb_internal._hyper_8_269_chunk OWNER TO morgan;

--
-- TOC entry 416 (class 1259 OID 601198)
-- Name: _hyper_8_270_chunk; Type: TABLE; Schema: _timescaledb_internal; Owner: morgan
--

CREATE TABLE _timescaledb_internal._hyper_8_270_chunk (
    CONSTRAINT constraint_270 CHECK ((("timestamp" >= '2016-04-28 00:00:00'::timestamp without time zone) AND ("timestamp" < '2016-05-05 00:00:00'::timestamp without time zone)))
)
INHERITS (public.new_sample);


ALTER TABLE _timescaledb_internal._hyper_8_270_chunk OWNER TO morgan;

--
-- TOC entry 417 (class 1259 OID 601203)
-- Name: _hyper_8_271_chunk; Type: TABLE; Schema: _timescaledb_internal; Owner: morgan
--

CREATE TABLE _timescaledb_internal._hyper_8_271_chunk (
    CONSTRAINT constraint_271 CHECK ((("timestamp" >= '2016-05-05 00:00:00'::timestamp without time zone) AND ("timestamp" < '2016-05-12 00:00:00'::timestamp without time zone)))
)
INHERITS (public.new_sample);


ALTER TABLE _timescaledb_internal._hyper_8_271_chunk OWNER TO morgan;

--
-- TOC entry 418 (class 1259 OID 601208)
-- Name: _hyper_8_272_chunk; Type: TABLE; Schema: _timescaledb_internal; Owner: morgan
--

CREATE TABLE _timescaledb_internal._hyper_8_272_chunk (
    CONSTRAINT constraint_272 CHECK ((("timestamp" >= '2016-05-12 00:00:00'::timestamp without time zone) AND ("timestamp" < '2016-05-19 00:00:00'::timestamp without time zone)))
)
INHERITS (public.new_sample);


ALTER TABLE _timescaledb_internal._hyper_8_272_chunk OWNER TO morgan;

--
-- TOC entry 419 (class 1259 OID 601213)
-- Name: _hyper_8_273_chunk; Type: TABLE; Schema: _timescaledb_internal; Owner: morgan
--

CREATE TABLE _timescaledb_internal._hyper_8_273_chunk (
    CONSTRAINT constraint_273 CHECK ((("timestamp" >= '2016-05-19 00:00:00'::timestamp without time zone) AND ("timestamp" < '2016-05-26 00:00:00'::timestamp without time zone)))
)
INHERITS (public.new_sample);


ALTER TABLE _timescaledb_internal._hyper_8_273_chunk OWNER TO morgan;

--
-- TOC entry 420 (class 1259 OID 601218)
-- Name: _hyper_8_274_chunk; Type: TABLE; Schema: _timescaledb_internal; Owner: morgan
--

CREATE TABLE _timescaledb_internal._hyper_8_274_chunk (
    CONSTRAINT constraint_274 CHECK ((("timestamp" >= '2016-06-02 00:00:00'::timestamp without time zone) AND ("timestamp" < '2016-06-09 00:00:00'::timestamp without time zone)))
)
INHERITS (public.new_sample);


ALTER TABLE _timescaledb_internal._hyper_8_274_chunk OWNER TO morgan;

--
-- TOC entry 421 (class 1259 OID 601223)
-- Name: _hyper_8_275_chunk; Type: TABLE; Schema: _timescaledb_internal; Owner: morgan
--

CREATE TABLE _timescaledb_internal._hyper_8_275_chunk (
    CONSTRAINT constraint_275 CHECK ((("timestamp" >= '2016-05-26 00:00:00'::timestamp without time zone) AND ("timestamp" < '2016-06-02 00:00:00'::timestamp without time zone)))
)
INHERITS (public.new_sample);


ALTER TABLE _timescaledb_internal._hyper_8_275_chunk OWNER TO morgan;

--
-- TOC entry 422 (class 1259 OID 601228)
-- Name: _hyper_8_276_chunk; Type: TABLE; Schema: _timescaledb_internal; Owner: morgan
--

CREATE TABLE _timescaledb_internal._hyper_8_276_chunk (
    CONSTRAINT constraint_276 CHECK ((("timestamp" >= '2016-06-09 00:00:00'::timestamp without time zone) AND ("timestamp" < '2016-06-16 00:00:00'::timestamp without time zone)))
)
INHERITS (public.new_sample);


ALTER TABLE _timescaledb_internal._hyper_8_276_chunk OWNER TO morgan;

--
-- TOC entry 423 (class 1259 OID 601233)
-- Name: _hyper_8_277_chunk; Type: TABLE; Schema: _timescaledb_internal; Owner: morgan
--

CREATE TABLE _timescaledb_internal._hyper_8_277_chunk (
    CONSTRAINT constraint_277 CHECK ((("timestamp" >= '2016-06-16 00:00:00'::timestamp without time zone) AND ("timestamp" < '2016-06-23 00:00:00'::timestamp without time zone)))
)
INHERITS (public.new_sample);


ALTER TABLE _timescaledb_internal._hyper_8_277_chunk OWNER TO morgan;

--
-- TOC entry 424 (class 1259 OID 601238)
-- Name: _hyper_8_278_chunk; Type: TABLE; Schema: _timescaledb_internal; Owner: morgan
--

CREATE TABLE _timescaledb_internal._hyper_8_278_chunk (
    CONSTRAINT constraint_278 CHECK ((("timestamp" >= '2016-06-30 00:00:00'::timestamp without time zone) AND ("timestamp" < '2016-07-07 00:00:00'::timestamp without time zone)))
)
INHERITS (public.new_sample);


ALTER TABLE _timescaledb_internal._hyper_8_278_chunk OWNER TO morgan;

--
-- TOC entry 425 (class 1259 OID 601243)
-- Name: _hyper_8_279_chunk; Type: TABLE; Schema: _timescaledb_internal; Owner: morgan
--

CREATE TABLE _timescaledb_internal._hyper_8_279_chunk (
    CONSTRAINT constraint_279 CHECK ((("timestamp" >= '2016-07-07 00:00:00'::timestamp without time zone) AND ("timestamp" < '2016-07-14 00:00:00'::timestamp without time zone)))
)
INHERITS (public.new_sample);


ALTER TABLE _timescaledb_internal._hyper_8_279_chunk OWNER TO morgan;

--
-- TOC entry 426 (class 1259 OID 601248)
-- Name: _hyper_8_280_chunk; Type: TABLE; Schema: _timescaledb_internal; Owner: morgan
--

CREATE TABLE _timescaledb_internal._hyper_8_280_chunk (
    CONSTRAINT constraint_280 CHECK ((("timestamp" >= '2016-06-23 00:00:00'::timestamp without time zone) AND ("timestamp" < '2016-06-30 00:00:00'::timestamp without time zone)))
)
INHERITS (public.new_sample);


ALTER TABLE _timescaledb_internal._hyper_8_280_chunk OWNER TO morgan;

--
-- TOC entry 427 (class 1259 OID 601253)
-- Name: _hyper_8_281_chunk; Type: TABLE; Schema: _timescaledb_internal; Owner: morgan
--

CREATE TABLE _timescaledb_internal._hyper_8_281_chunk (
    CONSTRAINT constraint_281 CHECK ((("timestamp" >= '2016-07-14 00:00:00'::timestamp without time zone) AND ("timestamp" < '2016-07-21 00:00:00'::timestamp without time zone)))
)
INHERITS (public.new_sample);


ALTER TABLE _timescaledb_internal._hyper_8_281_chunk OWNER TO morgan;

--
-- TOC entry 428 (class 1259 OID 601258)
-- Name: _hyper_8_282_chunk; Type: TABLE; Schema: _timescaledb_internal; Owner: morgan
--

CREATE TABLE _timescaledb_internal._hyper_8_282_chunk (
    CONSTRAINT constraint_282 CHECK ((("timestamp" >= '2016-07-21 00:00:00'::timestamp without time zone) AND ("timestamp" < '2016-07-28 00:00:00'::timestamp without time zone)))
)
INHERITS (public.new_sample);


ALTER TABLE _timescaledb_internal._hyper_8_282_chunk OWNER TO morgan;

--
-- TOC entry 429 (class 1259 OID 601263)
-- Name: _hyper_8_283_chunk; Type: TABLE; Schema: _timescaledb_internal; Owner: morgan
--

CREATE TABLE _timescaledb_internal._hyper_8_283_chunk (
    CONSTRAINT constraint_283 CHECK ((("timestamp" >= '2016-07-28 00:00:00'::timestamp without time zone) AND ("timestamp" < '2016-08-04 00:00:00'::timestamp without time zone)))
)
INHERITS (public.new_sample);


ALTER TABLE _timescaledb_internal._hyper_8_283_chunk OWNER TO morgan;

--
-- TOC entry 430 (class 1259 OID 601268)
-- Name: _hyper_8_284_chunk; Type: TABLE; Schema: _timescaledb_internal; Owner: morgan
--

CREATE TABLE _timescaledb_internal._hyper_8_284_chunk (
    CONSTRAINT constraint_284 CHECK ((("timestamp" >= '2016-08-11 00:00:00'::timestamp without time zone) AND ("timestamp" < '2016-08-18 00:00:00'::timestamp without time zone)))
)
INHERITS (public.new_sample);


ALTER TABLE _timescaledb_internal._hyper_8_284_chunk OWNER TO morgan;

--
-- TOC entry 431 (class 1259 OID 601273)
-- Name: _hyper_8_285_chunk; Type: TABLE; Schema: _timescaledb_internal; Owner: morgan
--

CREATE TABLE _timescaledb_internal._hyper_8_285_chunk (
    CONSTRAINT constraint_285 CHECK ((("timestamp" >= '2016-08-04 00:00:00'::timestamp without time zone) AND ("timestamp" < '2016-08-11 00:00:00'::timestamp without time zone)))
)
INHERITS (public.new_sample);


ALTER TABLE _timescaledb_internal._hyper_8_285_chunk OWNER TO morgan;

--
-- TOC entry 432 (class 1259 OID 601278)
-- Name: _hyper_8_286_chunk; Type: TABLE; Schema: _timescaledb_internal; Owner: morgan
--

CREATE TABLE _timescaledb_internal._hyper_8_286_chunk (
    CONSTRAINT constraint_286 CHECK ((("timestamp" >= '2016-08-18 00:00:00'::timestamp without time zone) AND ("timestamp" < '2016-08-25 00:00:00'::timestamp without time zone)))
)
INHERITS (public.new_sample);


ALTER TABLE _timescaledb_internal._hyper_8_286_chunk OWNER TO morgan;

--
-- TOC entry 433 (class 1259 OID 601283)
-- Name: _hyper_8_287_chunk; Type: TABLE; Schema: _timescaledb_internal; Owner: morgan
--

CREATE TABLE _timescaledb_internal._hyper_8_287_chunk (
    CONSTRAINT constraint_287 CHECK ((("timestamp" >= '2016-08-25 00:00:00'::timestamp without time zone) AND ("timestamp" < '2016-09-01 00:00:00'::timestamp without time zone)))
)
INHERITS (public.new_sample);


ALTER TABLE _timescaledb_internal._hyper_8_287_chunk OWNER TO morgan;

--
-- TOC entry 434 (class 1259 OID 601288)
-- Name: _hyper_8_288_chunk; Type: TABLE; Schema: _timescaledb_internal; Owner: morgan
--

CREATE TABLE _timescaledb_internal._hyper_8_288_chunk (
    CONSTRAINT constraint_288 CHECK ((("timestamp" >= '2016-09-01 00:00:00'::timestamp without time zone) AND ("timestamp" < '2016-09-08 00:00:00'::timestamp without time zone)))
)
INHERITS (public.new_sample);


ALTER TABLE _timescaledb_internal._hyper_8_288_chunk OWNER TO morgan;

--
-- TOC entry 435 (class 1259 OID 601293)
-- Name: _hyper_8_289_chunk; Type: TABLE; Schema: _timescaledb_internal; Owner: morgan
--

CREATE TABLE _timescaledb_internal._hyper_8_289_chunk (
    CONSTRAINT constraint_289 CHECK ((("timestamp" >= '2016-09-08 00:00:00'::timestamp without time zone) AND ("timestamp" < '2016-09-15 00:00:00'::timestamp without time zone)))
)
INHERITS (public.new_sample);


ALTER TABLE _timescaledb_internal._hyper_8_289_chunk OWNER TO morgan;

--
-- TOC entry 436 (class 1259 OID 601298)
-- Name: _hyper_8_290_chunk; Type: TABLE; Schema: _timescaledb_internal; Owner: morgan
--

CREATE TABLE _timescaledb_internal._hyper_8_290_chunk (
    CONSTRAINT constraint_290 CHECK ((("timestamp" >= '2016-09-15 00:00:00'::timestamp without time zone) AND ("timestamp" < '2016-09-22 00:00:00'::timestamp without time zone)))
)
INHERITS (public.new_sample);


ALTER TABLE _timescaledb_internal._hyper_8_290_chunk OWNER TO morgan;

--
-- TOC entry 437 (class 1259 OID 601303)
-- Name: _hyper_8_291_chunk; Type: TABLE; Schema: _timescaledb_internal; Owner: morgan
--

CREATE TABLE _timescaledb_internal._hyper_8_291_chunk (
    CONSTRAINT constraint_291 CHECK ((("timestamp" >= '2016-09-22 00:00:00'::timestamp without time zone) AND ("timestamp" < '2016-09-29 00:00:00'::timestamp without time zone)))
)
INHERITS (public.new_sample);


ALTER TABLE _timescaledb_internal._hyper_8_291_chunk OWNER TO morgan;

--
-- TOC entry 438 (class 1259 OID 601308)
-- Name: _hyper_8_292_chunk; Type: TABLE; Schema: _timescaledb_internal; Owner: morgan
--

CREATE TABLE _timescaledb_internal._hyper_8_292_chunk (
    CONSTRAINT constraint_292 CHECK ((("timestamp" >= '2016-09-29 00:00:00'::timestamp without time zone) AND ("timestamp" < '2016-10-06 00:00:00'::timestamp without time zone)))
)
INHERITS (public.new_sample);


ALTER TABLE _timescaledb_internal._hyper_8_292_chunk OWNER TO morgan;

--
-- TOC entry 439 (class 1259 OID 601313)
-- Name: _hyper_8_293_chunk; Type: TABLE; Schema: _timescaledb_internal; Owner: morgan
--

CREATE TABLE _timescaledb_internal._hyper_8_293_chunk (
    CONSTRAINT constraint_293 CHECK ((("timestamp" >= '2016-10-13 00:00:00'::timestamp without time zone) AND ("timestamp" < '2016-10-20 00:00:00'::timestamp without time zone)))
)
INHERITS (public.new_sample);


ALTER TABLE _timescaledb_internal._hyper_8_293_chunk OWNER TO morgan;

--
-- TOC entry 440 (class 1259 OID 601318)
-- Name: _hyper_8_294_chunk; Type: TABLE; Schema: _timescaledb_internal; Owner: morgan
--

CREATE TABLE _timescaledb_internal._hyper_8_294_chunk (
    CONSTRAINT constraint_294 CHECK ((("timestamp" >= '2016-10-06 00:00:00'::timestamp without time zone) AND ("timestamp" < '2016-10-13 00:00:00'::timestamp without time zone)))
)
INHERITS (public.new_sample);


ALTER TABLE _timescaledb_internal._hyper_8_294_chunk OWNER TO morgan;

--
-- TOC entry 441 (class 1259 OID 601323)
-- Name: _hyper_8_295_chunk; Type: TABLE; Schema: _timescaledb_internal; Owner: morgan
--

CREATE TABLE _timescaledb_internal._hyper_8_295_chunk (
    CONSTRAINT constraint_295 CHECK ((("timestamp" >= '2016-10-20 00:00:00'::timestamp without time zone) AND ("timestamp" < '2016-10-27 00:00:00'::timestamp without time zone)))
)
INHERITS (public.new_sample);


ALTER TABLE _timescaledb_internal._hyper_8_295_chunk OWNER TO morgan;

--
-- TOC entry 442 (class 1259 OID 601328)
-- Name: _hyper_8_296_chunk; Type: TABLE; Schema: _timescaledb_internal; Owner: morgan
--

CREATE TABLE _timescaledb_internal._hyper_8_296_chunk (
    CONSTRAINT constraint_296 CHECK ((("timestamp" >= '2016-10-27 00:00:00'::timestamp without time zone) AND ("timestamp" < '2016-11-03 00:00:00'::timestamp without time zone)))
)
INHERITS (public.new_sample);


ALTER TABLE _timescaledb_internal._hyper_8_296_chunk OWNER TO morgan;

--
-- TOC entry 443 (class 1259 OID 601333)
-- Name: _hyper_8_297_chunk; Type: TABLE; Schema: _timescaledb_internal; Owner: morgan
--

CREATE TABLE _timescaledb_internal._hyper_8_297_chunk (
    CONSTRAINT constraint_297 CHECK ((("timestamp" >= '2016-11-03 00:00:00'::timestamp without time zone) AND ("timestamp" < '2016-11-10 00:00:00'::timestamp without time zone)))
)
INHERITS (public.new_sample);


ALTER TABLE _timescaledb_internal._hyper_8_297_chunk OWNER TO morgan;

--
-- TOC entry 444 (class 1259 OID 601338)
-- Name: _hyper_8_298_chunk; Type: TABLE; Schema: _timescaledb_internal; Owner: morgan
--

CREATE TABLE _timescaledb_internal._hyper_8_298_chunk (
    CONSTRAINT constraint_298 CHECK ((("timestamp" >= '2016-11-10 00:00:00'::timestamp without time zone) AND ("timestamp" < '2016-11-17 00:00:00'::timestamp without time zone)))
)
INHERITS (public.new_sample);


ALTER TABLE _timescaledb_internal._hyper_8_298_chunk OWNER TO morgan;

--
-- TOC entry 445 (class 1259 OID 601343)
-- Name: _hyper_8_299_chunk; Type: TABLE; Schema: _timescaledb_internal; Owner: morgan
--

CREATE TABLE _timescaledb_internal._hyper_8_299_chunk (
    CONSTRAINT constraint_299 CHECK ((("timestamp" >= '2016-11-17 00:00:00'::timestamp without time zone) AND ("timestamp" < '2016-11-24 00:00:00'::timestamp without time zone)))
)
INHERITS (public.new_sample);


ALTER TABLE _timescaledb_internal._hyper_8_299_chunk OWNER TO morgan;

--
-- TOC entry 446 (class 1259 OID 601348)
-- Name: _hyper_8_300_chunk; Type: TABLE; Schema: _timescaledb_internal; Owner: morgan
--

CREATE TABLE _timescaledb_internal._hyper_8_300_chunk (
    CONSTRAINT constraint_300 CHECK ((("timestamp" >= '2016-11-24 00:00:00'::timestamp without time zone) AND ("timestamp" < '2016-12-01 00:00:00'::timestamp without time zone)))
)
INHERITS (public.new_sample);


ALTER TABLE _timescaledb_internal._hyper_8_300_chunk OWNER TO morgan;

--
-- TOC entry 447 (class 1259 OID 601353)
-- Name: _hyper_8_301_chunk; Type: TABLE; Schema: _timescaledb_internal; Owner: morgan
--

CREATE TABLE _timescaledb_internal._hyper_8_301_chunk (
    CONSTRAINT constraint_301 CHECK ((("timestamp" >= '2016-12-01 00:00:00'::timestamp without time zone) AND ("timestamp" < '2016-12-08 00:00:00'::timestamp without time zone)))
)
INHERITS (public.new_sample);


ALTER TABLE _timescaledb_internal._hyper_8_301_chunk OWNER TO morgan;

--
-- TOC entry 448 (class 1259 OID 601358)
-- Name: _hyper_8_302_chunk; Type: TABLE; Schema: _timescaledb_internal; Owner: morgan
--

CREATE TABLE _timescaledb_internal._hyper_8_302_chunk (
    CONSTRAINT constraint_302 CHECK ((("timestamp" >= '2016-12-15 00:00:00'::timestamp without time zone) AND ("timestamp" < '2016-12-22 00:00:00'::timestamp without time zone)))
)
INHERITS (public.new_sample);


ALTER TABLE _timescaledb_internal._hyper_8_302_chunk OWNER TO morgan;

--
-- TOC entry 449 (class 1259 OID 601363)
-- Name: _hyper_8_303_chunk; Type: TABLE; Schema: _timescaledb_internal; Owner: morgan
--

CREATE TABLE _timescaledb_internal._hyper_8_303_chunk (
    CONSTRAINT constraint_303 CHECK ((("timestamp" >= '2016-12-08 00:00:00'::timestamp without time zone) AND ("timestamp" < '2016-12-15 00:00:00'::timestamp without time zone)))
)
INHERITS (public.new_sample);


ALTER TABLE _timescaledb_internal._hyper_8_303_chunk OWNER TO morgan;

--
-- TOC entry 450 (class 1259 OID 601368)
-- Name: _hyper_8_304_chunk; Type: TABLE; Schema: _timescaledb_internal; Owner: morgan
--

CREATE TABLE _timescaledb_internal._hyper_8_304_chunk (
    CONSTRAINT constraint_304 CHECK ((("timestamp" >= '2016-12-22 00:00:00'::timestamp without time zone) AND ("timestamp" < '2016-12-29 00:00:00'::timestamp without time zone)))
)
INHERITS (public.new_sample);


ALTER TABLE _timescaledb_internal._hyper_8_304_chunk OWNER TO morgan;

--
-- TOC entry 451 (class 1259 OID 601373)
-- Name: _hyper_8_305_chunk; Type: TABLE; Schema: _timescaledb_internal; Owner: morgan
--

CREATE TABLE _timescaledb_internal._hyper_8_305_chunk (
    CONSTRAINT constraint_305 CHECK ((("timestamp" >= '2017-01-05 00:00:00'::timestamp without time zone) AND ("timestamp" < '2017-01-12 00:00:00'::timestamp without time zone)))
)
INHERITS (public.new_sample);


ALTER TABLE _timescaledb_internal._hyper_8_305_chunk OWNER TO morgan;

--
-- TOC entry 452 (class 1259 OID 601378)
-- Name: _hyper_8_306_chunk; Type: TABLE; Schema: _timescaledb_internal; Owner: morgan
--

CREATE TABLE _timescaledb_internal._hyper_8_306_chunk (
    CONSTRAINT constraint_306 CHECK ((("timestamp" >= '2017-01-12 00:00:00'::timestamp without time zone) AND ("timestamp" < '2017-01-19 00:00:00'::timestamp without time zone)))
)
INHERITS (public.new_sample);


ALTER TABLE _timescaledb_internal._hyper_8_306_chunk OWNER TO morgan;

--
-- TOC entry 453 (class 1259 OID 601383)
-- Name: _hyper_8_307_chunk; Type: TABLE; Schema: _timescaledb_internal; Owner: morgan
--

CREATE TABLE _timescaledb_internal._hyper_8_307_chunk (
    CONSTRAINT constraint_307 CHECK ((("timestamp" >= '2016-12-29 00:00:00'::timestamp without time zone) AND ("timestamp" < '2017-01-05 00:00:00'::timestamp without time zone)))
)
INHERITS (public.new_sample);


ALTER TABLE _timescaledb_internal._hyper_8_307_chunk OWNER TO morgan;

--
-- TOC entry 454 (class 1259 OID 601388)
-- Name: _hyper_8_308_chunk; Type: TABLE; Schema: _timescaledb_internal; Owner: morgan
--

CREATE TABLE _timescaledb_internal._hyper_8_308_chunk (
    CONSTRAINT constraint_308 CHECK ((("timestamp" >= '2017-01-19 00:00:00'::timestamp without time zone) AND ("timestamp" < '2017-01-26 00:00:00'::timestamp without time zone)))
)
INHERITS (public.new_sample);


ALTER TABLE _timescaledb_internal._hyper_8_308_chunk OWNER TO morgan;

--
-- TOC entry 455 (class 1259 OID 601393)
-- Name: _hyper_8_309_chunk; Type: TABLE; Schema: _timescaledb_internal; Owner: morgan
--

CREATE TABLE _timescaledb_internal._hyper_8_309_chunk (
    CONSTRAINT constraint_309 CHECK ((("timestamp" >= '2017-01-26 00:00:00'::timestamp without time zone) AND ("timestamp" < '2017-02-02 00:00:00'::timestamp without time zone)))
)
INHERITS (public.new_sample);


ALTER TABLE _timescaledb_internal._hyper_8_309_chunk OWNER TO morgan;

--
-- TOC entry 456 (class 1259 OID 601398)
-- Name: _hyper_8_310_chunk; Type: TABLE; Schema: _timescaledb_internal; Owner: morgan
--

CREATE TABLE _timescaledb_internal._hyper_8_310_chunk (
    CONSTRAINT constraint_310 CHECK ((("timestamp" >= '2017-02-02 00:00:00'::timestamp without time zone) AND ("timestamp" < '2017-02-09 00:00:00'::timestamp without time zone)))
)
INHERITS (public.new_sample);


ALTER TABLE _timescaledb_internal._hyper_8_310_chunk OWNER TO morgan;

--
-- TOC entry 457 (class 1259 OID 601403)
-- Name: _hyper_8_311_chunk; Type: TABLE; Schema: _timescaledb_internal; Owner: morgan
--

CREATE TABLE _timescaledb_internal._hyper_8_311_chunk (
    CONSTRAINT constraint_311 CHECK ((("timestamp" >= '2017-02-09 00:00:00'::timestamp without time zone) AND ("timestamp" < '2017-02-16 00:00:00'::timestamp without time zone)))
)
INHERITS (public.new_sample);


ALTER TABLE _timescaledb_internal._hyper_8_311_chunk OWNER TO morgan;

--
-- TOC entry 458 (class 1259 OID 601408)
-- Name: _hyper_8_312_chunk; Type: TABLE; Schema: _timescaledb_internal; Owner: morgan
--

CREATE TABLE _timescaledb_internal._hyper_8_312_chunk (
    CONSTRAINT constraint_312 CHECK ((("timestamp" >= '2017-02-23 00:00:00'::timestamp without time zone) AND ("timestamp" < '2017-03-02 00:00:00'::timestamp without time zone)))
)
INHERITS (public.new_sample);


ALTER TABLE _timescaledb_internal._hyper_8_312_chunk OWNER TO morgan;

--
-- TOC entry 459 (class 1259 OID 601413)
-- Name: _hyper_8_313_chunk; Type: TABLE; Schema: _timescaledb_internal; Owner: morgan
--

CREATE TABLE _timescaledb_internal._hyper_8_313_chunk (
    CONSTRAINT constraint_313 CHECK ((("timestamp" >= '2017-02-16 00:00:00'::timestamp without time zone) AND ("timestamp" < '2017-02-23 00:00:00'::timestamp without time zone)))
)
INHERITS (public.new_sample);


ALTER TABLE _timescaledb_internal._hyper_8_313_chunk OWNER TO morgan;

--
-- TOC entry 460 (class 1259 OID 601418)
-- Name: _hyper_8_314_chunk; Type: TABLE; Schema: _timescaledb_internal; Owner: morgan
--

CREATE TABLE _timescaledb_internal._hyper_8_314_chunk (
    CONSTRAINT constraint_314 CHECK ((("timestamp" >= '2017-03-02 00:00:00'::timestamp without time zone) AND ("timestamp" < '2017-03-09 00:00:00'::timestamp without time zone)))
)
INHERITS (public.new_sample);


ALTER TABLE _timescaledb_internal._hyper_8_314_chunk OWNER TO morgan;

--
-- TOC entry 461 (class 1259 OID 601423)
-- Name: _hyper_8_315_chunk; Type: TABLE; Schema: _timescaledb_internal; Owner: morgan
--

CREATE TABLE _timescaledb_internal._hyper_8_315_chunk (
    CONSTRAINT constraint_315 CHECK ((("timestamp" >= '2017-03-09 00:00:00'::timestamp without time zone) AND ("timestamp" < '2017-03-16 00:00:00'::timestamp without time zone)))
)
INHERITS (public.new_sample);


ALTER TABLE _timescaledb_internal._hyper_8_315_chunk OWNER TO morgan;

--
-- TOC entry 462 (class 1259 OID 601428)
-- Name: _hyper_8_316_chunk; Type: TABLE; Schema: _timescaledb_internal; Owner: morgan
--

CREATE TABLE _timescaledb_internal._hyper_8_316_chunk (
    CONSTRAINT constraint_316 CHECK ((("timestamp" >= '2017-03-16 00:00:00'::timestamp without time zone) AND ("timestamp" < '2017-03-23 00:00:00'::timestamp without time zone)))
)
INHERITS (public.new_sample);


ALTER TABLE _timescaledb_internal._hyper_8_316_chunk OWNER TO morgan;

--
-- TOC entry 463 (class 1259 OID 601433)
-- Name: _hyper_8_317_chunk; Type: TABLE; Schema: _timescaledb_internal; Owner: morgan
--

CREATE TABLE _timescaledb_internal._hyper_8_317_chunk (
    CONSTRAINT constraint_317 CHECK ((("timestamp" >= '2017-03-23 00:00:00'::timestamp without time zone) AND ("timestamp" < '2017-03-30 00:00:00'::timestamp without time zone)))
)
INHERITS (public.new_sample);


ALTER TABLE _timescaledb_internal._hyper_8_317_chunk OWNER TO morgan;

--
-- TOC entry 464 (class 1259 OID 601438)
-- Name: _hyper_8_318_chunk; Type: TABLE; Schema: _timescaledb_internal; Owner: morgan
--

CREATE TABLE _timescaledb_internal._hyper_8_318_chunk (
    CONSTRAINT constraint_318 CHECK ((("timestamp" >= '2017-03-30 00:00:00'::timestamp without time zone) AND ("timestamp" < '2017-04-06 00:00:00'::timestamp without time zone)))
)
INHERITS (public.new_sample);


ALTER TABLE _timescaledb_internal._hyper_8_318_chunk OWNER TO morgan;

--
-- TOC entry 465 (class 1259 OID 601443)
-- Name: _hyper_8_319_chunk; Type: TABLE; Schema: _timescaledb_internal; Owner: morgan
--

CREATE TABLE _timescaledb_internal._hyper_8_319_chunk (
    CONSTRAINT constraint_319 CHECK ((("timestamp" >= '2017-04-06 00:00:00'::timestamp without time zone) AND ("timestamp" < '2017-04-13 00:00:00'::timestamp without time zone)))
)
INHERITS (public.new_sample);


ALTER TABLE _timescaledb_internal._hyper_8_319_chunk OWNER TO morgan;

--
-- TOC entry 466 (class 1259 OID 601448)
-- Name: _hyper_8_320_chunk; Type: TABLE; Schema: _timescaledb_internal; Owner: morgan
--

CREATE TABLE _timescaledb_internal._hyper_8_320_chunk (
    CONSTRAINT constraint_320 CHECK ((("timestamp" >= '2017-04-13 00:00:00'::timestamp without time zone) AND ("timestamp" < '2017-04-20 00:00:00'::timestamp without time zone)))
)
INHERITS (public.new_sample);


ALTER TABLE _timescaledb_internal._hyper_8_320_chunk OWNER TO morgan;

--
-- TOC entry 467 (class 1259 OID 601453)
-- Name: _hyper_8_321_chunk; Type: TABLE; Schema: _timescaledb_internal; Owner: morgan
--

CREATE TABLE _timescaledb_internal._hyper_8_321_chunk (
    CONSTRAINT constraint_321 CHECK ((("timestamp" >= '2017-04-20 00:00:00'::timestamp without time zone) AND ("timestamp" < '2017-04-27 00:00:00'::timestamp without time zone)))
)
INHERITS (public.new_sample);


ALTER TABLE _timescaledb_internal._hyper_8_321_chunk OWNER TO morgan;

--
-- TOC entry 468 (class 1259 OID 601458)
-- Name: _hyper_8_322_chunk; Type: TABLE; Schema: _timescaledb_internal; Owner: morgan
--

CREATE TABLE _timescaledb_internal._hyper_8_322_chunk (
    CONSTRAINT constraint_322 CHECK ((("timestamp" >= '2013-01-31 00:00:00'::timestamp without time zone) AND ("timestamp" < '2013-02-07 00:00:00'::timestamp without time zone)))
)
INHERITS (public.new_sample);


ALTER TABLE _timescaledb_internal._hyper_8_322_chunk OWNER TO morgan;

--
-- TOC entry 469 (class 1259 OID 601463)
-- Name: _hyper_8_323_chunk; Type: TABLE; Schema: _timescaledb_internal; Owner: morgan
--

CREATE TABLE _timescaledb_internal._hyper_8_323_chunk (
    CONSTRAINT constraint_323 CHECK ((("timestamp" >= '2011-04-14 00:00:00'::timestamp without time zone) AND ("timestamp" < '2011-04-21 00:00:00'::timestamp without time zone)))
)
INHERITS (public.new_sample);


ALTER TABLE _timescaledb_internal._hyper_8_323_chunk OWNER TO morgan;

--
-- TOC entry 470 (class 1259 OID 601468)
-- Name: _hyper_8_324_chunk; Type: TABLE; Schema: _timescaledb_internal; Owner: morgan
--

CREATE TABLE _timescaledb_internal._hyper_8_324_chunk (
    CONSTRAINT constraint_324 CHECK ((("timestamp" >= '2011-04-21 00:00:00'::timestamp without time zone) AND ("timestamp" < '2011-04-28 00:00:00'::timestamp without time zone)))
)
INHERITS (public.new_sample);


ALTER TABLE _timescaledb_internal._hyper_8_324_chunk OWNER TO morgan;

--
-- TOC entry 471 (class 1259 OID 601473)
-- Name: _hyper_8_325_chunk; Type: TABLE; Schema: _timescaledb_internal; Owner: morgan
--

CREATE TABLE _timescaledb_internal._hyper_8_325_chunk (
    CONSTRAINT constraint_325 CHECK ((("timestamp" >= '2011-04-28 00:00:00'::timestamp without time zone) AND ("timestamp" < '2011-05-05 00:00:00'::timestamp without time zone)))
)
INHERITS (public.new_sample);


ALTER TABLE _timescaledb_internal._hyper_8_325_chunk OWNER TO morgan;

--
-- TOC entry 472 (class 1259 OID 601478)
-- Name: _hyper_8_326_chunk; Type: TABLE; Schema: _timescaledb_internal; Owner: morgan
--

CREATE TABLE _timescaledb_internal._hyper_8_326_chunk (
    CONSTRAINT constraint_326 CHECK ((("timestamp" >= '2011-05-05 00:00:00'::timestamp without time zone) AND ("timestamp" < '2011-05-12 00:00:00'::timestamp without time zone)))
)
INHERITS (public.new_sample);


ALTER TABLE _timescaledb_internal._hyper_8_326_chunk OWNER TO morgan;

--
-- TOC entry 473 (class 1259 OID 601483)
-- Name: _hyper_8_327_chunk; Type: TABLE; Schema: _timescaledb_internal; Owner: morgan
--

CREATE TABLE _timescaledb_internal._hyper_8_327_chunk (
    CONSTRAINT constraint_327 CHECK ((("timestamp" >= '2011-05-19 00:00:00'::timestamp without time zone) AND ("timestamp" < '2011-05-26 00:00:00'::timestamp without time zone)))
)
INHERITS (public.new_sample);


ALTER TABLE _timescaledb_internal._hyper_8_327_chunk OWNER TO morgan;

--
-- TOC entry 474 (class 1259 OID 601488)
-- Name: _hyper_8_328_chunk; Type: TABLE; Schema: _timescaledb_internal; Owner: morgan
--

CREATE TABLE _timescaledb_internal._hyper_8_328_chunk (
    CONSTRAINT constraint_328 CHECK ((("timestamp" >= '2011-05-12 00:00:00'::timestamp without time zone) AND ("timestamp" < '2011-05-19 00:00:00'::timestamp without time zone)))
)
INHERITS (public.new_sample);


ALTER TABLE _timescaledb_internal._hyper_8_328_chunk OWNER TO morgan;

--
-- TOC entry 475 (class 1259 OID 601493)
-- Name: _hyper_8_329_chunk; Type: TABLE; Schema: _timescaledb_internal; Owner: morgan
--

CREATE TABLE _timescaledb_internal._hyper_8_329_chunk (
    CONSTRAINT constraint_329 CHECK ((("timestamp" >= '2011-05-26 00:00:00'::timestamp without time zone) AND ("timestamp" < '2011-06-02 00:00:00'::timestamp without time zone)))
)
INHERITS (public.new_sample);


ALTER TABLE _timescaledb_internal._hyper_8_329_chunk OWNER TO morgan;

--
-- TOC entry 476 (class 1259 OID 601498)
-- Name: _hyper_8_330_chunk; Type: TABLE; Schema: _timescaledb_internal; Owner: morgan
--

CREATE TABLE _timescaledb_internal._hyper_8_330_chunk (
    CONSTRAINT constraint_330 CHECK ((("timestamp" >= '2011-06-02 00:00:00'::timestamp without time zone) AND ("timestamp" < '2011-06-09 00:00:00'::timestamp without time zone)))
)
INHERITS (public.new_sample);


ALTER TABLE _timescaledb_internal._hyper_8_330_chunk OWNER TO morgan;

--
-- TOC entry 477 (class 1259 OID 601503)
-- Name: _hyper_8_331_chunk; Type: TABLE; Schema: _timescaledb_internal; Owner: morgan
--

CREATE TABLE _timescaledb_internal._hyper_8_331_chunk (
    CONSTRAINT constraint_331 CHECK ((("timestamp" >= '2011-06-09 00:00:00'::timestamp without time zone) AND ("timestamp" < '2011-06-16 00:00:00'::timestamp without time zone)))
)
INHERITS (public.new_sample);


ALTER TABLE _timescaledb_internal._hyper_8_331_chunk OWNER TO morgan;

--
-- TOC entry 478 (class 1259 OID 601510)
-- Name: _hyper_8_332_chunk; Type: TABLE; Schema: _timescaledb_internal; Owner: morgan
--

CREATE TABLE _timescaledb_internal._hyper_8_332_chunk (
    CONSTRAINT constraint_332 CHECK ((("timestamp" >= '2017-10-26 00:00:00'::timestamp without time zone) AND ("timestamp" < '2017-11-02 00:00:00'::timestamp without time zone)))
)
INHERITS (public.new_sample);


ALTER TABLE _timescaledb_internal._hyper_8_332_chunk OWNER TO morgan;

--
-- TOC entry 479 (class 1259 OID 601515)
-- Name: _hyper_8_333_chunk; Type: TABLE; Schema: _timescaledb_internal; Owner: morgan
--

CREATE TABLE _timescaledb_internal._hyper_8_333_chunk (
    CONSTRAINT constraint_333 CHECK ((("timestamp" >= '2017-11-02 00:00:00'::timestamp without time zone) AND ("timestamp" < '2017-11-09 00:00:00'::timestamp without time zone)))
)
INHERITS (public.new_sample);


ALTER TABLE _timescaledb_internal._hyper_8_333_chunk OWNER TO morgan;

--
-- TOC entry 480 (class 1259 OID 601520)
-- Name: _hyper_8_334_chunk; Type: TABLE; Schema: _timescaledb_internal; Owner: morgan
--

CREATE TABLE _timescaledb_internal._hyper_8_334_chunk (
    CONSTRAINT constraint_334 CHECK ((("timestamp" >= '2017-11-09 00:00:00'::timestamp without time zone) AND ("timestamp" < '2017-11-16 00:00:00'::timestamp without time zone)))
)
INHERITS (public.new_sample);


ALTER TABLE _timescaledb_internal._hyper_8_334_chunk OWNER TO morgan;

--
-- TOC entry 481 (class 1259 OID 601525)
-- Name: _hyper_8_335_chunk; Type: TABLE; Schema: _timescaledb_internal; Owner: morgan
--

CREATE TABLE _timescaledb_internal._hyper_8_335_chunk (
    CONSTRAINT constraint_335 CHECK ((("timestamp" >= '2017-11-16 00:00:00'::timestamp without time zone) AND ("timestamp" < '2017-11-23 00:00:00'::timestamp without time zone)))
)
INHERITS (public.new_sample);


ALTER TABLE _timescaledb_internal._hyper_8_335_chunk OWNER TO morgan;

--
-- TOC entry 482 (class 1259 OID 601530)
-- Name: _hyper_8_336_chunk; Type: TABLE; Schema: _timescaledb_internal; Owner: morgan
--

CREATE TABLE _timescaledb_internal._hyper_8_336_chunk (
    CONSTRAINT constraint_336 CHECK ((("timestamp" >= '2017-11-23 00:00:00'::timestamp without time zone) AND ("timestamp" < '2017-11-30 00:00:00'::timestamp without time zone)))
)
INHERITS (public.new_sample);


ALTER TABLE _timescaledb_internal._hyper_8_336_chunk OWNER TO morgan;

--
-- TOC entry 483 (class 1259 OID 601535)
-- Name: _hyper_8_337_chunk; Type: TABLE; Schema: _timescaledb_internal; Owner: morgan
--

CREATE TABLE _timescaledb_internal._hyper_8_337_chunk (
    CONSTRAINT constraint_337 CHECK ((("timestamp" >= '2017-11-30 00:00:00'::timestamp without time zone) AND ("timestamp" < '2017-12-07 00:00:00'::timestamp without time zone)))
)
INHERITS (public.new_sample);


ALTER TABLE _timescaledb_internal._hyper_8_337_chunk OWNER TO morgan;

--
-- TOC entry 484 (class 1259 OID 601540)
-- Name: _hyper_8_338_chunk; Type: TABLE; Schema: _timescaledb_internal; Owner: morgan
--

CREATE TABLE _timescaledb_internal._hyper_8_338_chunk (
    CONSTRAINT constraint_338 CHECK ((("timestamp" >= '2017-12-07 00:00:00'::timestamp without time zone) AND ("timestamp" < '2017-12-14 00:00:00'::timestamp without time zone)))
)
INHERITS (public.new_sample);


ALTER TABLE _timescaledb_internal._hyper_8_338_chunk OWNER TO morgan;

--
-- TOC entry 485 (class 1259 OID 601545)
-- Name: _hyper_8_339_chunk; Type: TABLE; Schema: _timescaledb_internal; Owner: morgan
--

CREATE TABLE _timescaledb_internal._hyper_8_339_chunk (
    CONSTRAINT constraint_339 CHECK ((("timestamp" >= '2017-12-14 00:00:00'::timestamp without time zone) AND ("timestamp" < '2017-12-21 00:00:00'::timestamp without time zone)))
)
INHERITS (public.new_sample);


ALTER TABLE _timescaledb_internal._hyper_8_339_chunk OWNER TO morgan;

--
-- TOC entry 486 (class 1259 OID 601550)
-- Name: _hyper_8_340_chunk; Type: TABLE; Schema: _timescaledb_internal; Owner: morgan
--

CREATE TABLE _timescaledb_internal._hyper_8_340_chunk (
    CONSTRAINT constraint_340 CHECK ((("timestamp" >= '2017-12-21 00:00:00'::timestamp without time zone) AND ("timestamp" < '2017-12-28 00:00:00'::timestamp without time zone)))
)
INHERITS (public.new_sample);


ALTER TABLE _timescaledb_internal._hyper_8_340_chunk OWNER TO morgan;

--
-- TOC entry 487 (class 1259 OID 601555)
-- Name: _hyper_8_341_chunk; Type: TABLE; Schema: _timescaledb_internal; Owner: morgan
--

CREATE TABLE _timescaledb_internal._hyper_8_341_chunk (
    CONSTRAINT constraint_341 CHECK ((("timestamp" >= '2017-12-28 00:00:00'::timestamp without time zone) AND ("timestamp" < '2018-01-04 00:00:00'::timestamp without time zone)))
)
INHERITS (public.new_sample);


ALTER TABLE _timescaledb_internal._hyper_8_341_chunk OWNER TO morgan;

--
-- TOC entry 488 (class 1259 OID 601560)
-- Name: _hyper_8_342_chunk; Type: TABLE; Schema: _timescaledb_internal; Owner: morgan
--

CREATE TABLE _timescaledb_internal._hyper_8_342_chunk (
    CONSTRAINT constraint_342 CHECK ((("timestamp" >= '2018-01-04 00:00:00'::timestamp without time zone) AND ("timestamp" < '2018-01-11 00:00:00'::timestamp without time zone)))
)
INHERITS (public.new_sample);


ALTER TABLE _timescaledb_internal._hyper_8_342_chunk OWNER TO morgan;

--
-- TOC entry 489 (class 1259 OID 601565)
-- Name: _hyper_8_343_chunk; Type: TABLE; Schema: _timescaledb_internal; Owner: morgan
--

CREATE TABLE _timescaledb_internal._hyper_8_343_chunk (
    CONSTRAINT constraint_343 CHECK ((("timestamp" >= '2018-01-11 00:00:00'::timestamp without time zone) AND ("timestamp" < '2018-01-18 00:00:00'::timestamp without time zone)))
)
INHERITS (public.new_sample);


ALTER TABLE _timescaledb_internal._hyper_8_343_chunk OWNER TO morgan;

--
-- TOC entry 490 (class 1259 OID 601570)
-- Name: _hyper_8_344_chunk; Type: TABLE; Schema: _timescaledb_internal; Owner: morgan
--

CREATE TABLE _timescaledb_internal._hyper_8_344_chunk (
    CONSTRAINT constraint_344 CHECK ((("timestamp" >= '2018-01-18 00:00:00'::timestamp without time zone) AND ("timestamp" < '2018-01-25 00:00:00'::timestamp without time zone)))
)
INHERITS (public.new_sample);


ALTER TABLE _timescaledb_internal._hyper_8_344_chunk OWNER TO morgan;

--
-- TOC entry 491 (class 1259 OID 601575)
-- Name: _hyper_8_345_chunk; Type: TABLE; Schema: _timescaledb_internal; Owner: morgan
--

CREATE TABLE _timescaledb_internal._hyper_8_345_chunk (
    CONSTRAINT constraint_345 CHECK ((("timestamp" >= '2018-01-25 00:00:00'::timestamp without time zone) AND ("timestamp" < '2018-02-01 00:00:00'::timestamp without time zone)))
)
INHERITS (public.new_sample);


ALTER TABLE _timescaledb_internal._hyper_8_345_chunk OWNER TO morgan;

--
-- TOC entry 492 (class 1259 OID 601580)
-- Name: _hyper_8_346_chunk; Type: TABLE; Schema: _timescaledb_internal; Owner: morgan
--

CREATE TABLE _timescaledb_internal._hyper_8_346_chunk (
    CONSTRAINT constraint_346 CHECK ((("timestamp" >= '2018-02-01 00:00:00'::timestamp without time zone) AND ("timestamp" < '2018-02-08 00:00:00'::timestamp without time zone)))
)
INHERITS (public.new_sample);


ALTER TABLE _timescaledb_internal._hyper_8_346_chunk OWNER TO morgan;

--
-- TOC entry 493 (class 1259 OID 601585)
-- Name: _hyper_8_347_chunk; Type: TABLE; Schema: _timescaledb_internal; Owner: morgan
--

CREATE TABLE _timescaledb_internal._hyper_8_347_chunk (
    CONSTRAINT constraint_347 CHECK ((("timestamp" >= '2018-02-15 00:00:00'::timestamp without time zone) AND ("timestamp" < '2018-02-22 00:00:00'::timestamp without time zone)))
)
INHERITS (public.new_sample);


ALTER TABLE _timescaledb_internal._hyper_8_347_chunk OWNER TO morgan;

--
-- TOC entry 494 (class 1259 OID 601590)
-- Name: _hyper_8_348_chunk; Type: TABLE; Schema: _timescaledb_internal; Owner: morgan
--

CREATE TABLE _timescaledb_internal._hyper_8_348_chunk (
    CONSTRAINT constraint_348 CHECK ((("timestamp" >= '2018-02-22 00:00:00'::timestamp without time zone) AND ("timestamp" < '2018-03-01 00:00:00'::timestamp without time zone)))
)
INHERITS (public.new_sample);


ALTER TABLE _timescaledb_internal._hyper_8_348_chunk OWNER TO morgan;

--
-- TOC entry 495 (class 1259 OID 601595)
-- Name: _hyper_8_349_chunk; Type: TABLE; Schema: _timescaledb_internal; Owner: morgan
--

CREATE TABLE _timescaledb_internal._hyper_8_349_chunk (
    CONSTRAINT constraint_349 CHECK ((("timestamp" >= '2018-03-22 00:00:00'::timestamp without time zone) AND ("timestamp" < '2018-03-29 00:00:00'::timestamp without time zone)))
)
INHERITS (public.new_sample);


ALTER TABLE _timescaledb_internal._hyper_8_349_chunk OWNER TO morgan;

--
-- TOC entry 496 (class 1259 OID 601600)
-- Name: _hyper_8_350_chunk; Type: TABLE; Schema: _timescaledb_internal; Owner: morgan
--

CREATE TABLE _timescaledb_internal._hyper_8_350_chunk (
    CONSTRAINT constraint_350 CHECK ((("timestamp" >= '2018-03-29 00:00:00'::timestamp without time zone) AND ("timestamp" < '2018-04-05 00:00:00'::timestamp without time zone)))
)
INHERITS (public.new_sample);


ALTER TABLE _timescaledb_internal._hyper_8_350_chunk OWNER TO morgan;

--
-- TOC entry 236 (class 1259 OID 600298)
-- Name: _hyper_8_90_chunk; Type: TABLE; Schema: _timescaledb_internal; Owner: morgan
--

CREATE TABLE _timescaledb_internal._hyper_8_90_chunk (
    CONSTRAINT constraint_90 CHECK ((("timestamp" >= '2014-06-26 00:00:00'::timestamp without time zone) AND ("timestamp" < '2014-07-03 00:00:00'::timestamp without time zone)))
)
INHERITS (public.new_sample);


ALTER TABLE _timescaledb_internal._hyper_8_90_chunk OWNER TO morgan;

--
-- TOC entry 237 (class 1259 OID 600303)
-- Name: _hyper_8_91_chunk; Type: TABLE; Schema: _timescaledb_internal; Owner: morgan
--

CREATE TABLE _timescaledb_internal._hyper_8_91_chunk (
    CONSTRAINT constraint_91 CHECK ((("timestamp" >= '2014-07-03 00:00:00'::timestamp without time zone) AND ("timestamp" < '2014-07-10 00:00:00'::timestamp without time zone)))
)
INHERITS (public.new_sample);


ALTER TABLE _timescaledb_internal._hyper_8_91_chunk OWNER TO morgan;

--
-- TOC entry 238 (class 1259 OID 600308)
-- Name: _hyper_8_92_chunk; Type: TABLE; Schema: _timescaledb_internal; Owner: morgan
--

CREATE TABLE _timescaledb_internal._hyper_8_92_chunk (
    CONSTRAINT constraint_92 CHECK ((("timestamp" >= '2014-07-10 00:00:00'::timestamp without time zone) AND ("timestamp" < '2014-07-17 00:00:00'::timestamp without time zone)))
)
INHERITS (public.new_sample);


ALTER TABLE _timescaledb_internal._hyper_8_92_chunk OWNER TO morgan;

--
-- TOC entry 239 (class 1259 OID 600313)
-- Name: _hyper_8_93_chunk; Type: TABLE; Schema: _timescaledb_internal; Owner: morgan
--

CREATE TABLE _timescaledb_internal._hyper_8_93_chunk (
    CONSTRAINT constraint_93 CHECK ((("timestamp" >= '2014-07-17 00:00:00'::timestamp without time zone) AND ("timestamp" < '2014-07-24 00:00:00'::timestamp without time zone)))
)
INHERITS (public.new_sample);


ALTER TABLE _timescaledb_internal._hyper_8_93_chunk OWNER TO morgan;

--
-- TOC entry 240 (class 1259 OID 600318)
-- Name: _hyper_8_94_chunk; Type: TABLE; Schema: _timescaledb_internal; Owner: morgan
--

CREATE TABLE _timescaledb_internal._hyper_8_94_chunk (
    CONSTRAINT constraint_94 CHECK ((("timestamp" >= '2014-07-24 00:00:00'::timestamp without time zone) AND ("timestamp" < '2014-07-31 00:00:00'::timestamp without time zone)))
)
INHERITS (public.new_sample);


ALTER TABLE _timescaledb_internal._hyper_8_94_chunk OWNER TO morgan;

--
-- TOC entry 241 (class 1259 OID 600323)
-- Name: _hyper_8_95_chunk; Type: TABLE; Schema: _timescaledb_internal; Owner: morgan
--

CREATE TABLE _timescaledb_internal._hyper_8_95_chunk (
    CONSTRAINT constraint_95 CHECK ((("timestamp" >= '2014-07-31 00:00:00'::timestamp without time zone) AND ("timestamp" < '2014-08-07 00:00:00'::timestamp without time zone)))
)
INHERITS (public.new_sample);


ALTER TABLE _timescaledb_internal._hyper_8_95_chunk OWNER TO morgan;

--
-- TOC entry 242 (class 1259 OID 600328)
-- Name: _hyper_8_96_chunk; Type: TABLE; Schema: _timescaledb_internal; Owner: morgan
--

CREATE TABLE _timescaledb_internal._hyper_8_96_chunk (
    CONSTRAINT constraint_96 CHECK ((("timestamp" >= '2014-08-07 00:00:00'::timestamp without time zone) AND ("timestamp" < '2014-08-14 00:00:00'::timestamp without time zone)))
)
INHERITS (public.new_sample);


ALTER TABLE _timescaledb_internal._hyper_8_96_chunk OWNER TO morgan;

--
-- TOC entry 243 (class 1259 OID 600333)
-- Name: _hyper_8_97_chunk; Type: TABLE; Schema: _timescaledb_internal; Owner: morgan
--

CREATE TABLE _timescaledb_internal._hyper_8_97_chunk (
    CONSTRAINT constraint_97 CHECK ((("timestamp" >= '2014-08-14 00:00:00'::timestamp without time zone) AND ("timestamp" < '2014-08-21 00:00:00'::timestamp without time zone)))
)
INHERITS (public.new_sample);


ALTER TABLE _timescaledb_internal._hyper_8_97_chunk OWNER TO morgan;

--
-- TOC entry 244 (class 1259 OID 600338)
-- Name: _hyper_8_98_chunk; Type: TABLE; Schema: _timescaledb_internal; Owner: morgan
--

CREATE TABLE _timescaledb_internal._hyper_8_98_chunk (
    CONSTRAINT constraint_98 CHECK ((("timestamp" >= '2014-08-21 00:00:00'::timestamp without time zone) AND ("timestamp" < '2014-08-28 00:00:00'::timestamp without time zone)))
)
INHERITS (public.new_sample);


ALTER TABLE _timescaledb_internal._hyper_8_98_chunk OWNER TO morgan;

--
-- TOC entry 245 (class 1259 OID 600343)
-- Name: _hyper_8_99_chunk; Type: TABLE; Schema: _timescaledb_internal; Owner: morgan
--

CREATE TABLE _timescaledb_internal._hyper_8_99_chunk (
    CONSTRAINT constraint_99 CHECK ((("timestamp" >= '2014-08-28 00:00:00'::timestamp without time zone) AND ("timestamp" < '2014-09-04 00:00:00'::timestamp without time zone)))
)
INHERITS (public.new_sample);


ALTER TABLE _timescaledb_internal._hyper_8_99_chunk OWNER TO morgan;

--
-- TOC entry 201 (class 1259 OID 27516)
-- Name: aggregate; Type: TABLE; Schema: public; Owner: morgan
--

CREATE TABLE public.aggregate (
    id bigint NOT NULL,
    parent_id bigint
);


ALTER TABLE public.aggregate OWNER TO morgan;

--
-- TOC entry 202 (class 1259 OID 27519)
-- Name: alembic_version; Type: TABLE; Schema: public; Owner: morgan
--

CREATE TABLE public.alembic_version (
    version_num character varying(32) NOT NULL
);


ALTER TABLE public.alembic_version OWNER TO morgan;

--
-- TOC entry 203 (class 1259 OID 27522)
-- Name: appliance; Type: TABLE; Schema: public; Owner: morgan
--

CREATE TABLE public.appliance (
    id bigint NOT NULL,
    aggregate_id bigint,
    appliance_type_id bigint
);


ALTER TABLE public.appliance OWNER TO morgan;

--
-- TOC entry 204 (class 1259 OID 27525)
-- Name: appliance_type; Type: TABLE; Schema: public; Owner: morgan
--

CREATE TABLE public.appliance_type (
    id bigint NOT NULL,
    appliance_type_name text,
    aliases text[],
    max_power real,
    min_off_duration real,
    min_on_duration real,
    on_power_threshold real
);


ALTER TABLE public.appliance_type OWNER TO morgan;

--
-- TOC entry 205 (class 1259 OID 27531)
-- Name: appliance_type_id_seq; Type: SEQUENCE; Schema: public; Owner: morgan
--

CREATE SEQUENCE public.appliance_type_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.appliance_type_id_seq OWNER TO morgan;

--
-- TOC entry 4794 (class 0 OID 0)
-- Dependencies: 205
-- Name: appliance_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: morgan
--

ALTER SEQUENCE public.appliance_type_id_seq OWNED BY public.appliance_type.id;


--
-- TOC entry 233 (class 1259 OID 369355)
-- Name: greenant_meter; Type: TABLE; Schema: public; Owner: morgan
--

CREATE TABLE public.greenant_meter (
    id bigint NOT NULL,
    receiver_uid text NOT NULL,
    "power_source_phase_A" bigint,
    "power_source_phase_B" bigint,
    "power_source_phase_C" bigint,
    "last_sync_phase_A" timestamp without time zone,
    "last_sync_phase_B" timestamp without time zone,
    "last_sync_phase_C" timestamp without time zone
);


ALTER TABLE public.greenant_meter OWNER TO morgan;

--
-- TOC entry 234 (class 1259 OID 369363)
-- Name: greenant_meter_id_seq; Type: SEQUENCE; Schema: public; Owner: morgan
--

CREATE SEQUENCE public.greenant_meter_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.greenant_meter_id_seq OWNER TO morgan;

--
-- TOC entry 206 (class 1259 OID 27533)
-- Name: origin_dataset; Type: TABLE; Schema: public; Owner: morgan
--

CREATE TABLE public.origin_dataset (
    id integer NOT NULL,
    dataset_name text NOT NULL,
    dataset_description text NOT NULL,
    geo_location text,
    other text,
    rights_list text,
    timezone text
);


ALTER TABLE public.origin_dataset OWNER TO morgan;

--
-- TOC entry 207 (class 1259 OID 27539)
-- Name: origin_dataset_id_seq; Type: SEQUENCE; Schema: public; Owner: morgan
--

CREATE SEQUENCE public.origin_dataset_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.origin_dataset_id_seq OWNER TO morgan;

--
-- TOC entry 4795 (class 0 OID 0)
-- Dependencies: 207
-- Name: origin_dataset_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: morgan
--

ALTER SEQUENCE public.origin_dataset_id_seq OWNED BY public.origin_dataset.id;


--
-- TOC entry 208 (class 1259 OID 27541)
-- Name: physical_quantity; Type: TABLE; Schema: public; Owner: morgan
--

CREATE TABLE public.physical_quantity (
    id bigint NOT NULL,
    quantity_name text NOT NULL
);


ALTER TABLE public.physical_quantity OWNER TO morgan;

--
-- TOC entry 209 (class 1259 OID 27547)
-- Name: physical_quantity_id_seq; Type: SEQUENCE; Schema: public; Owner: morgan
--

CREATE SEQUENCE public.physical_quantity_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.physical_quantity_id_seq OWNER TO morgan;

--
-- TOC entry 4796 (class 0 OID 0)
-- Dependencies: 209
-- Name: physical_quantity_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: morgan
--

ALTER SEQUENCE public.physical_quantity_id_seq OWNED BY public.physical_quantity.id;


--
-- TOC entry 210 (class 1259 OID 27549)
-- Name: power_source; Type: TABLE; Schema: public; Owner: morgan
--

CREATE TABLE public.power_source (
    id bigint NOT NULL,
    description text,
    origin_dataset_id integer,
    power_source_type text,
    location text,
    sampling_period integer
);


ALTER TABLE public.power_source OWNER TO morgan;

--
-- TOC entry 211 (class 1259 OID 27555)
-- Name: power_source_id_seq; Type: SEQUENCE; Schema: public; Owner: morgan
--

CREATE SEQUENCE public.power_source_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.power_source_id_seq OWNER TO morgan;

--
-- TOC entry 4797 (class 0 OID 0)
-- Dependencies: 211
-- Name: power_source_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: morgan
--

ALTER SEQUENCE public.power_source_id_seq OWNED BY public.power_source.id;


--
-- TOC entry 212 (class 1259 OID 27557)
-- Name: sample; Type: TABLE; Schema: public; Owner: morgan
--

CREATE TABLE public.sample (
    id bigint NOT NULL,
    power_source_id bigint,
    measurement double precision,
    "timestamp" timestamp without time zone,
    physical_quantity_id bigint,
    is_on boolean
);


ALTER TABLE public.sample OWNER TO morgan;

--
-- TOC entry 213 (class 1259 OID 27560)
-- Name: sample_id_seq; Type: SEQUENCE; Schema: public; Owner: morgan
--

CREATE SEQUENCE public.sample_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.sample_id_seq OWNER TO morgan;

--
-- TOC entry 4798 (class 0 OID 0)
-- Dependencies: 213
-- Name: sample_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: morgan
--

ALTER SEQUENCE public.sample_id_seq OWNED BY public.sample.id;


--
-- TOC entry 4052 (class 2604 OID 27562)
-- Name: appliance_type id; Type: DEFAULT; Schema: public; Owner: morgan
--

ALTER TABLE ONLY public.appliance_type ALTER COLUMN id SET DEFAULT nextval('public.appliance_type_id_seq'::regclass);


--
-- TOC entry 4053 (class 2604 OID 27563)
-- Name: origin_dataset id; Type: DEFAULT; Schema: public; Owner: morgan
--

ALTER TABLE ONLY public.origin_dataset ALTER COLUMN id SET DEFAULT nextval('public.origin_dataset_id_seq'::regclass);


--
-- TOC entry 4054 (class 2604 OID 27564)
-- Name: physical_quantity id; Type: DEFAULT; Schema: public; Owner: morgan
--

ALTER TABLE ONLY public.physical_quantity ALTER COLUMN id SET DEFAULT nextval('public.physical_quantity_id_seq'::regclass);


--
-- TOC entry 4055 (class 2604 OID 27565)
-- Name: power_source id; Type: DEFAULT; Schema: public; Owner: morgan
--

ALTER TABLE ONLY public.power_source ALTER COLUMN id SET DEFAULT nextval('public.power_source_id_seq'::regclass);


--
-- TOC entry 4056 (class 2604 OID 27566)
-- Name: sample id; Type: DEFAULT; Schema: public; Owner: morgan
--

ALTER TABLE ONLY public.sample ALTER COLUMN id SET DEFAULT nextval('public.sample_id_seq'::regclass);


--
-- TOC entry 4334 (class 2606 OID 27568)
-- Name: aggregate aggregate_id_key; Type: CONSTRAINT; Schema: public; Owner: morgan
--

ALTER TABLE ONLY public.aggregate
    ADD CONSTRAINT aggregate_id_key UNIQUE (id);


--
-- TOC entry 4336 (class 2606 OID 27570)
-- Name: aggregate aggregate_pkey; Type: CONSTRAINT; Schema: public; Owner: morgan
--

ALTER TABLE ONLY public.aggregate
    ADD CONSTRAINT aggregate_pkey PRIMARY KEY (id);


--
-- TOC entry 4338 (class 2606 OID 27572)
-- Name: alembic_version alembic_version_pkc; Type: CONSTRAINT; Schema: public; Owner: morgan
--

ALTER TABLE ONLY public.alembic_version
    ADD CONSTRAINT alembic_version_pkc PRIMARY KEY (version_num);


--
-- TOC entry 4340 (class 2606 OID 27574)
-- Name: appliance appliance_pkey; Type: CONSTRAINT; Schema: public; Owner: morgan
--

ALTER TABLE ONLY public.appliance
    ADD CONSTRAINT appliance_pkey PRIMARY KEY (id);


--
-- TOC entry 4342 (class 2606 OID 27576)
-- Name: appliance_type appliance_type_appliance_type_name_key; Type: CONSTRAINT; Schema: public; Owner: morgan
--

ALTER TABLE ONLY public.appliance_type
    ADD CONSTRAINT appliance_type_appliance_type_name_key UNIQUE (appliance_type_name);


--
-- TOC entry 4344 (class 2606 OID 27578)
-- Name: appliance_type appliance_type_pkey; Type: CONSTRAINT; Schema: public; Owner: morgan
--

ALTER TABLE ONLY public.appliance_type
    ADD CONSTRAINT appliance_type_pkey PRIMARY KEY (id);


--
-- TOC entry 4395 (class 2606 OID 369362)
-- Name: greenant_meter greenant_meter_pkey; Type: CONSTRAINT; Schema: public; Owner: morgan
--

ALTER TABLE ONLY public.greenant_meter
    ADD CONSTRAINT greenant_meter_pkey PRIMARY KEY (id);


--
-- TOC entry 4346 (class 2606 OID 27580)
-- Name: origin_dataset origin_dataset_pkey; Type: CONSTRAINT; Schema: public; Owner: morgan
--

ALTER TABLE ONLY public.origin_dataset
    ADD CONSTRAINT origin_dataset_pkey PRIMARY KEY (id);


--
-- TOC entry 4348 (class 2606 OID 27582)
-- Name: physical_quantity physical_quantity_pkey; Type: CONSTRAINT; Schema: public; Owner: morgan
--

ALTER TABLE ONLY public.physical_quantity
    ADD CONSTRAINT physical_quantity_pkey PRIMARY KEY (id);


--
-- TOC entry 4350 (class 2606 OID 27584)
-- Name: power_source power_source_id_key; Type: CONSTRAINT; Schema: public; Owner: morgan
--

ALTER TABLE ONLY public.power_source
    ADD CONSTRAINT power_source_id_key UNIQUE (id);


--
-- TOC entry 4352 (class 2606 OID 27586)
-- Name: power_source power_source_pkey; Type: CONSTRAINT; Schema: public; Owner: morgan
--

ALTER TABLE ONLY public.power_source
    ADD CONSTRAINT power_source_pkey PRIMARY KEY (id);


--
-- TOC entry 4355 (class 2606 OID 27588)
-- Name: sample sample_pkey; Type: CONSTRAINT; Schema: public; Owner: morgan
--

ALTER TABLE ONLY public.sample
    ADD CONSTRAINT sample_pkey PRIMARY KEY (id);


--
-- TOC entry 4407 (class 1259 OID 600352)
-- Name: _hyper_8_100_chunk_new_sample_timestamp_idx; Type: INDEX; Schema: _timescaledb_internal; Owner: morgan
--

CREATE INDEX _hyper_8_100_chunk_new_sample_timestamp_idx ON _timescaledb_internal._hyper_8_100_chunk USING btree ("timestamp" DESC);


--
-- TOC entry 4408 (class 1259 OID 600357)
-- Name: _hyper_8_101_chunk_new_sample_timestamp_idx; Type: INDEX; Schema: _timescaledb_internal; Owner: morgan
--

CREATE INDEX _hyper_8_101_chunk_new_sample_timestamp_idx ON _timescaledb_internal._hyper_8_101_chunk USING btree ("timestamp" DESC);


--
-- TOC entry 4409 (class 1259 OID 600362)
-- Name: _hyper_8_102_chunk_new_sample_timestamp_idx; Type: INDEX; Schema: _timescaledb_internal; Owner: morgan
--

CREATE INDEX _hyper_8_102_chunk_new_sample_timestamp_idx ON _timescaledb_internal._hyper_8_102_chunk USING btree ("timestamp" DESC);


--
-- TOC entry 4410 (class 1259 OID 600367)
-- Name: _hyper_8_103_chunk_new_sample_timestamp_idx; Type: INDEX; Schema: _timescaledb_internal; Owner: morgan
--

CREATE INDEX _hyper_8_103_chunk_new_sample_timestamp_idx ON _timescaledb_internal._hyper_8_103_chunk USING btree ("timestamp" DESC);


--
-- TOC entry 4411 (class 1259 OID 600372)
-- Name: _hyper_8_104_chunk_new_sample_timestamp_idx; Type: INDEX; Schema: _timescaledb_internal; Owner: morgan
--

CREATE INDEX _hyper_8_104_chunk_new_sample_timestamp_idx ON _timescaledb_internal._hyper_8_104_chunk USING btree ("timestamp" DESC);


--
-- TOC entry 4412 (class 1259 OID 600377)
-- Name: _hyper_8_105_chunk_new_sample_timestamp_idx; Type: INDEX; Schema: _timescaledb_internal; Owner: morgan
--

CREATE INDEX _hyper_8_105_chunk_new_sample_timestamp_idx ON _timescaledb_internal._hyper_8_105_chunk USING btree ("timestamp" DESC);


--
-- TOC entry 4413 (class 1259 OID 600382)
-- Name: _hyper_8_106_chunk_new_sample_timestamp_idx; Type: INDEX; Schema: _timescaledb_internal; Owner: morgan
--

CREATE INDEX _hyper_8_106_chunk_new_sample_timestamp_idx ON _timescaledb_internal._hyper_8_106_chunk USING btree ("timestamp" DESC);


--
-- TOC entry 4414 (class 1259 OID 600387)
-- Name: _hyper_8_107_chunk_new_sample_timestamp_idx; Type: INDEX; Schema: _timescaledb_internal; Owner: morgan
--

CREATE INDEX _hyper_8_107_chunk_new_sample_timestamp_idx ON _timescaledb_internal._hyper_8_107_chunk USING btree ("timestamp" DESC);


--
-- TOC entry 4415 (class 1259 OID 600392)
-- Name: _hyper_8_108_chunk_new_sample_timestamp_idx; Type: INDEX; Schema: _timescaledb_internal; Owner: morgan
--

CREATE INDEX _hyper_8_108_chunk_new_sample_timestamp_idx ON _timescaledb_internal._hyper_8_108_chunk USING btree ("timestamp" DESC);


--
-- TOC entry 4416 (class 1259 OID 600397)
-- Name: _hyper_8_109_chunk_new_sample_timestamp_idx; Type: INDEX; Schema: _timescaledb_internal; Owner: morgan
--

CREATE INDEX _hyper_8_109_chunk_new_sample_timestamp_idx ON _timescaledb_internal._hyper_8_109_chunk USING btree ("timestamp" DESC);


--
-- TOC entry 4417 (class 1259 OID 600402)
-- Name: _hyper_8_110_chunk_new_sample_timestamp_idx; Type: INDEX; Schema: _timescaledb_internal; Owner: morgan
--

CREATE INDEX _hyper_8_110_chunk_new_sample_timestamp_idx ON _timescaledb_internal._hyper_8_110_chunk USING btree ("timestamp" DESC);


--
-- TOC entry 4418 (class 1259 OID 600407)
-- Name: _hyper_8_111_chunk_new_sample_timestamp_idx; Type: INDEX; Schema: _timescaledb_internal; Owner: morgan
--

CREATE INDEX _hyper_8_111_chunk_new_sample_timestamp_idx ON _timescaledb_internal._hyper_8_111_chunk USING btree ("timestamp" DESC);


--
-- TOC entry 4419 (class 1259 OID 600412)
-- Name: _hyper_8_112_chunk_new_sample_timestamp_idx; Type: INDEX; Schema: _timescaledb_internal; Owner: morgan
--

CREATE INDEX _hyper_8_112_chunk_new_sample_timestamp_idx ON _timescaledb_internal._hyper_8_112_chunk USING btree ("timestamp" DESC);


--
-- TOC entry 4420 (class 1259 OID 600417)
-- Name: _hyper_8_113_chunk_new_sample_timestamp_idx; Type: INDEX; Schema: _timescaledb_internal; Owner: morgan
--

CREATE INDEX _hyper_8_113_chunk_new_sample_timestamp_idx ON _timescaledb_internal._hyper_8_113_chunk USING btree ("timestamp" DESC);


--
-- TOC entry 4421 (class 1259 OID 600422)
-- Name: _hyper_8_114_chunk_new_sample_timestamp_idx; Type: INDEX; Schema: _timescaledb_internal; Owner: morgan
--

CREATE INDEX _hyper_8_114_chunk_new_sample_timestamp_idx ON _timescaledb_internal._hyper_8_114_chunk USING btree ("timestamp" DESC);


--
-- TOC entry 4422 (class 1259 OID 600427)
-- Name: _hyper_8_115_chunk_new_sample_timestamp_idx; Type: INDEX; Schema: _timescaledb_internal; Owner: morgan
--

CREATE INDEX _hyper_8_115_chunk_new_sample_timestamp_idx ON _timescaledb_internal._hyper_8_115_chunk USING btree ("timestamp" DESC);


--
-- TOC entry 4423 (class 1259 OID 600432)
-- Name: _hyper_8_116_chunk_new_sample_timestamp_idx; Type: INDEX; Schema: _timescaledb_internal; Owner: morgan
--

CREATE INDEX _hyper_8_116_chunk_new_sample_timestamp_idx ON _timescaledb_internal._hyper_8_116_chunk USING btree ("timestamp" DESC);


--
-- TOC entry 4424 (class 1259 OID 600437)
-- Name: _hyper_8_117_chunk_new_sample_timestamp_idx; Type: INDEX; Schema: _timescaledb_internal; Owner: morgan
--

CREATE INDEX _hyper_8_117_chunk_new_sample_timestamp_idx ON _timescaledb_internal._hyper_8_117_chunk USING btree ("timestamp" DESC);


--
-- TOC entry 4425 (class 1259 OID 600442)
-- Name: _hyper_8_118_chunk_new_sample_timestamp_idx; Type: INDEX; Schema: _timescaledb_internal; Owner: morgan
--

CREATE INDEX _hyper_8_118_chunk_new_sample_timestamp_idx ON _timescaledb_internal._hyper_8_118_chunk USING btree ("timestamp" DESC);


--
-- TOC entry 4426 (class 1259 OID 600447)
-- Name: _hyper_8_119_chunk_new_sample_timestamp_idx; Type: INDEX; Schema: _timescaledb_internal; Owner: morgan
--

CREATE INDEX _hyper_8_119_chunk_new_sample_timestamp_idx ON _timescaledb_internal._hyper_8_119_chunk USING btree ("timestamp" DESC);


--
-- TOC entry 4427 (class 1259 OID 600452)
-- Name: _hyper_8_120_chunk_new_sample_timestamp_idx; Type: INDEX; Schema: _timescaledb_internal; Owner: morgan
--

CREATE INDEX _hyper_8_120_chunk_new_sample_timestamp_idx ON _timescaledb_internal._hyper_8_120_chunk USING btree ("timestamp" DESC);


--
-- TOC entry 4428 (class 1259 OID 600457)
-- Name: _hyper_8_121_chunk_new_sample_timestamp_idx; Type: INDEX; Schema: _timescaledb_internal; Owner: morgan
--

CREATE INDEX _hyper_8_121_chunk_new_sample_timestamp_idx ON _timescaledb_internal._hyper_8_121_chunk USING btree ("timestamp" DESC);


--
-- TOC entry 4429 (class 1259 OID 600462)
-- Name: _hyper_8_122_chunk_new_sample_timestamp_idx; Type: INDEX; Schema: _timescaledb_internal; Owner: morgan
--

CREATE INDEX _hyper_8_122_chunk_new_sample_timestamp_idx ON _timescaledb_internal._hyper_8_122_chunk USING btree ("timestamp" DESC);


--
-- TOC entry 4430 (class 1259 OID 600467)
-- Name: _hyper_8_123_chunk_new_sample_timestamp_idx; Type: INDEX; Schema: _timescaledb_internal; Owner: morgan
--

CREATE INDEX _hyper_8_123_chunk_new_sample_timestamp_idx ON _timescaledb_internal._hyper_8_123_chunk USING btree ("timestamp" DESC);


--
-- TOC entry 4431 (class 1259 OID 600472)
-- Name: _hyper_8_124_chunk_new_sample_timestamp_idx; Type: INDEX; Schema: _timescaledb_internal; Owner: morgan
--

CREATE INDEX _hyper_8_124_chunk_new_sample_timestamp_idx ON _timescaledb_internal._hyper_8_124_chunk USING btree ("timestamp" DESC);


--
-- TOC entry 4432 (class 1259 OID 600477)
-- Name: _hyper_8_125_chunk_new_sample_timestamp_idx; Type: INDEX; Schema: _timescaledb_internal; Owner: morgan
--

CREATE INDEX _hyper_8_125_chunk_new_sample_timestamp_idx ON _timescaledb_internal._hyper_8_125_chunk USING btree ("timestamp" DESC);


--
-- TOC entry 4433 (class 1259 OID 600482)
-- Name: _hyper_8_126_chunk_new_sample_timestamp_idx; Type: INDEX; Schema: _timescaledb_internal; Owner: morgan
--

CREATE INDEX _hyper_8_126_chunk_new_sample_timestamp_idx ON _timescaledb_internal._hyper_8_126_chunk USING btree ("timestamp" DESC);


--
-- TOC entry 4434 (class 1259 OID 600487)
-- Name: _hyper_8_127_chunk_new_sample_timestamp_idx; Type: INDEX; Schema: _timescaledb_internal; Owner: morgan
--

CREATE INDEX _hyper_8_127_chunk_new_sample_timestamp_idx ON _timescaledb_internal._hyper_8_127_chunk USING btree ("timestamp" DESC);


--
-- TOC entry 4435 (class 1259 OID 600492)
-- Name: _hyper_8_128_chunk_new_sample_timestamp_idx; Type: INDEX; Schema: _timescaledb_internal; Owner: morgan
--

CREATE INDEX _hyper_8_128_chunk_new_sample_timestamp_idx ON _timescaledb_internal._hyper_8_128_chunk USING btree ("timestamp" DESC);


--
-- TOC entry 4436 (class 1259 OID 600497)
-- Name: _hyper_8_129_chunk_new_sample_timestamp_idx; Type: INDEX; Schema: _timescaledb_internal; Owner: morgan
--

CREATE INDEX _hyper_8_129_chunk_new_sample_timestamp_idx ON _timescaledb_internal._hyper_8_129_chunk USING btree ("timestamp" DESC);


--
-- TOC entry 4437 (class 1259 OID 600502)
-- Name: _hyper_8_130_chunk_new_sample_timestamp_idx; Type: INDEX; Schema: _timescaledb_internal; Owner: morgan
--

CREATE INDEX _hyper_8_130_chunk_new_sample_timestamp_idx ON _timescaledb_internal._hyper_8_130_chunk USING btree ("timestamp" DESC);


--
-- TOC entry 4438 (class 1259 OID 600507)
-- Name: _hyper_8_131_chunk_new_sample_timestamp_idx; Type: INDEX; Schema: _timescaledb_internal; Owner: morgan
--

CREATE INDEX _hyper_8_131_chunk_new_sample_timestamp_idx ON _timescaledb_internal._hyper_8_131_chunk USING btree ("timestamp" DESC);


--
-- TOC entry 4439 (class 1259 OID 600512)
-- Name: _hyper_8_132_chunk_new_sample_timestamp_idx; Type: INDEX; Schema: _timescaledb_internal; Owner: morgan
--

CREATE INDEX _hyper_8_132_chunk_new_sample_timestamp_idx ON _timescaledb_internal._hyper_8_132_chunk USING btree ("timestamp" DESC);


--
-- TOC entry 4440 (class 1259 OID 600517)
-- Name: _hyper_8_133_chunk_new_sample_timestamp_idx; Type: INDEX; Schema: _timescaledb_internal; Owner: morgan
--

CREATE INDEX _hyper_8_133_chunk_new_sample_timestamp_idx ON _timescaledb_internal._hyper_8_133_chunk USING btree ("timestamp" DESC);


--
-- TOC entry 4441 (class 1259 OID 600522)
-- Name: _hyper_8_134_chunk_new_sample_timestamp_idx; Type: INDEX; Schema: _timescaledb_internal; Owner: morgan
--

CREATE INDEX _hyper_8_134_chunk_new_sample_timestamp_idx ON _timescaledb_internal._hyper_8_134_chunk USING btree ("timestamp" DESC);


--
-- TOC entry 4442 (class 1259 OID 600527)
-- Name: _hyper_8_135_chunk_new_sample_timestamp_idx; Type: INDEX; Schema: _timescaledb_internal; Owner: morgan
--

CREATE INDEX _hyper_8_135_chunk_new_sample_timestamp_idx ON _timescaledb_internal._hyper_8_135_chunk USING btree ("timestamp" DESC);


--
-- TOC entry 4443 (class 1259 OID 600532)
-- Name: _hyper_8_136_chunk_new_sample_timestamp_idx; Type: INDEX; Schema: _timescaledb_internal; Owner: morgan
--

CREATE INDEX _hyper_8_136_chunk_new_sample_timestamp_idx ON _timescaledb_internal._hyper_8_136_chunk USING btree ("timestamp" DESC);


--
-- TOC entry 4444 (class 1259 OID 600537)
-- Name: _hyper_8_137_chunk_new_sample_timestamp_idx; Type: INDEX; Schema: _timescaledb_internal; Owner: morgan
--

CREATE INDEX _hyper_8_137_chunk_new_sample_timestamp_idx ON _timescaledb_internal._hyper_8_137_chunk USING btree ("timestamp" DESC);


--
-- TOC entry 4445 (class 1259 OID 600542)
-- Name: _hyper_8_138_chunk_new_sample_timestamp_idx; Type: INDEX; Schema: _timescaledb_internal; Owner: morgan
--

CREATE INDEX _hyper_8_138_chunk_new_sample_timestamp_idx ON _timescaledb_internal._hyper_8_138_chunk USING btree ("timestamp" DESC);


--
-- TOC entry 4446 (class 1259 OID 600547)
-- Name: _hyper_8_139_chunk_new_sample_timestamp_idx; Type: INDEX; Schema: _timescaledb_internal; Owner: morgan
--

CREATE INDEX _hyper_8_139_chunk_new_sample_timestamp_idx ON _timescaledb_internal._hyper_8_139_chunk USING btree ("timestamp" DESC);


--
-- TOC entry 4447 (class 1259 OID 600552)
-- Name: _hyper_8_140_chunk_new_sample_timestamp_idx; Type: INDEX; Schema: _timescaledb_internal; Owner: morgan
--

CREATE INDEX _hyper_8_140_chunk_new_sample_timestamp_idx ON _timescaledb_internal._hyper_8_140_chunk USING btree ("timestamp" DESC);


--
-- TOC entry 4448 (class 1259 OID 600557)
-- Name: _hyper_8_141_chunk_new_sample_timestamp_idx; Type: INDEX; Schema: _timescaledb_internal; Owner: morgan
--

CREATE INDEX _hyper_8_141_chunk_new_sample_timestamp_idx ON _timescaledb_internal._hyper_8_141_chunk USING btree ("timestamp" DESC);


--
-- TOC entry 4449 (class 1259 OID 600562)
-- Name: _hyper_8_142_chunk_new_sample_timestamp_idx; Type: INDEX; Schema: _timescaledb_internal; Owner: morgan
--

CREATE INDEX _hyper_8_142_chunk_new_sample_timestamp_idx ON _timescaledb_internal._hyper_8_142_chunk USING btree ("timestamp" DESC);


--
-- TOC entry 4450 (class 1259 OID 600567)
-- Name: _hyper_8_143_chunk_new_sample_timestamp_idx; Type: INDEX; Schema: _timescaledb_internal; Owner: morgan
--

CREATE INDEX _hyper_8_143_chunk_new_sample_timestamp_idx ON _timescaledb_internal._hyper_8_143_chunk USING btree ("timestamp" DESC);


--
-- TOC entry 4451 (class 1259 OID 600572)
-- Name: _hyper_8_144_chunk_new_sample_timestamp_idx; Type: INDEX; Schema: _timescaledb_internal; Owner: morgan
--

CREATE INDEX _hyper_8_144_chunk_new_sample_timestamp_idx ON _timescaledb_internal._hyper_8_144_chunk USING btree ("timestamp" DESC);


--
-- TOC entry 4452 (class 1259 OID 600577)
-- Name: _hyper_8_145_chunk_new_sample_timestamp_idx; Type: INDEX; Schema: _timescaledb_internal; Owner: morgan
--

CREATE INDEX _hyper_8_145_chunk_new_sample_timestamp_idx ON _timescaledb_internal._hyper_8_145_chunk USING btree ("timestamp" DESC);


--
-- TOC entry 4453 (class 1259 OID 600582)
-- Name: _hyper_8_146_chunk_new_sample_timestamp_idx; Type: INDEX; Schema: _timescaledb_internal; Owner: morgan
--

CREATE INDEX _hyper_8_146_chunk_new_sample_timestamp_idx ON _timescaledb_internal._hyper_8_146_chunk USING btree ("timestamp" DESC);


--
-- TOC entry 4454 (class 1259 OID 600587)
-- Name: _hyper_8_147_chunk_new_sample_timestamp_idx; Type: INDEX; Schema: _timescaledb_internal; Owner: morgan
--

CREATE INDEX _hyper_8_147_chunk_new_sample_timestamp_idx ON _timescaledb_internal._hyper_8_147_chunk USING btree ("timestamp" DESC);


--
-- TOC entry 4455 (class 1259 OID 600592)
-- Name: _hyper_8_148_chunk_new_sample_timestamp_idx; Type: INDEX; Schema: _timescaledb_internal; Owner: morgan
--

CREATE INDEX _hyper_8_148_chunk_new_sample_timestamp_idx ON _timescaledb_internal._hyper_8_148_chunk USING btree ("timestamp" DESC);


--
-- TOC entry 4456 (class 1259 OID 600597)
-- Name: _hyper_8_149_chunk_new_sample_timestamp_idx; Type: INDEX; Schema: _timescaledb_internal; Owner: morgan
--

CREATE INDEX _hyper_8_149_chunk_new_sample_timestamp_idx ON _timescaledb_internal._hyper_8_149_chunk USING btree ("timestamp" DESC);


--
-- TOC entry 4457 (class 1259 OID 600602)
-- Name: _hyper_8_150_chunk_new_sample_timestamp_idx; Type: INDEX; Schema: _timescaledb_internal; Owner: morgan
--

CREATE INDEX _hyper_8_150_chunk_new_sample_timestamp_idx ON _timescaledb_internal._hyper_8_150_chunk USING btree ("timestamp" DESC);


--
-- TOC entry 4458 (class 1259 OID 600607)
-- Name: _hyper_8_151_chunk_new_sample_timestamp_idx; Type: INDEX; Schema: _timescaledb_internal; Owner: morgan
--

CREATE INDEX _hyper_8_151_chunk_new_sample_timestamp_idx ON _timescaledb_internal._hyper_8_151_chunk USING btree ("timestamp" DESC);


--
-- TOC entry 4459 (class 1259 OID 600612)
-- Name: _hyper_8_152_chunk_new_sample_timestamp_idx; Type: INDEX; Schema: _timescaledb_internal; Owner: morgan
--

CREATE INDEX _hyper_8_152_chunk_new_sample_timestamp_idx ON _timescaledb_internal._hyper_8_152_chunk USING btree ("timestamp" DESC);


--
-- TOC entry 4460 (class 1259 OID 600617)
-- Name: _hyper_8_153_chunk_new_sample_timestamp_idx; Type: INDEX; Schema: _timescaledb_internal; Owner: morgan
--

CREATE INDEX _hyper_8_153_chunk_new_sample_timestamp_idx ON _timescaledb_internal._hyper_8_153_chunk USING btree ("timestamp" DESC);


--
-- TOC entry 4461 (class 1259 OID 600622)
-- Name: _hyper_8_154_chunk_new_sample_timestamp_idx; Type: INDEX; Schema: _timescaledb_internal; Owner: morgan
--

CREATE INDEX _hyper_8_154_chunk_new_sample_timestamp_idx ON _timescaledb_internal._hyper_8_154_chunk USING btree ("timestamp" DESC);


--
-- TOC entry 4462 (class 1259 OID 600627)
-- Name: _hyper_8_155_chunk_new_sample_timestamp_idx; Type: INDEX; Schema: _timescaledb_internal; Owner: morgan
--

CREATE INDEX _hyper_8_155_chunk_new_sample_timestamp_idx ON _timescaledb_internal._hyper_8_155_chunk USING btree ("timestamp" DESC);


--
-- TOC entry 4463 (class 1259 OID 600632)
-- Name: _hyper_8_156_chunk_new_sample_timestamp_idx; Type: INDEX; Schema: _timescaledb_internal; Owner: morgan
--

CREATE INDEX _hyper_8_156_chunk_new_sample_timestamp_idx ON _timescaledb_internal._hyper_8_156_chunk USING btree ("timestamp" DESC);


--
-- TOC entry 4464 (class 1259 OID 600637)
-- Name: _hyper_8_157_chunk_new_sample_timestamp_idx; Type: INDEX; Schema: _timescaledb_internal; Owner: morgan
--

CREATE INDEX _hyper_8_157_chunk_new_sample_timestamp_idx ON _timescaledb_internal._hyper_8_157_chunk USING btree ("timestamp" DESC);


--
-- TOC entry 4465 (class 1259 OID 600642)
-- Name: _hyper_8_158_chunk_new_sample_timestamp_idx; Type: INDEX; Schema: _timescaledb_internal; Owner: morgan
--

CREATE INDEX _hyper_8_158_chunk_new_sample_timestamp_idx ON _timescaledb_internal._hyper_8_158_chunk USING btree ("timestamp" DESC);


--
-- TOC entry 4466 (class 1259 OID 600647)
-- Name: _hyper_8_159_chunk_new_sample_timestamp_idx; Type: INDEX; Schema: _timescaledb_internal; Owner: morgan
--

CREATE INDEX _hyper_8_159_chunk_new_sample_timestamp_idx ON _timescaledb_internal._hyper_8_159_chunk USING btree ("timestamp" DESC);


--
-- TOC entry 4467 (class 1259 OID 600652)
-- Name: _hyper_8_160_chunk_new_sample_timestamp_idx; Type: INDEX; Schema: _timescaledb_internal; Owner: morgan
--

CREATE INDEX _hyper_8_160_chunk_new_sample_timestamp_idx ON _timescaledb_internal._hyper_8_160_chunk USING btree ("timestamp" DESC);


--
-- TOC entry 4468 (class 1259 OID 600657)
-- Name: _hyper_8_161_chunk_new_sample_timestamp_idx; Type: INDEX; Schema: _timescaledb_internal; Owner: morgan
--

CREATE INDEX _hyper_8_161_chunk_new_sample_timestamp_idx ON _timescaledb_internal._hyper_8_161_chunk USING btree ("timestamp" DESC);


--
-- TOC entry 4469 (class 1259 OID 600662)
-- Name: _hyper_8_162_chunk_new_sample_timestamp_idx; Type: INDEX; Schema: _timescaledb_internal; Owner: morgan
--

CREATE INDEX _hyper_8_162_chunk_new_sample_timestamp_idx ON _timescaledb_internal._hyper_8_162_chunk USING btree ("timestamp" DESC);


--
-- TOC entry 4470 (class 1259 OID 600667)
-- Name: _hyper_8_163_chunk_new_sample_timestamp_idx; Type: INDEX; Schema: _timescaledb_internal; Owner: morgan
--

CREATE INDEX _hyper_8_163_chunk_new_sample_timestamp_idx ON _timescaledb_internal._hyper_8_163_chunk USING btree ("timestamp" DESC);


--
-- TOC entry 4471 (class 1259 OID 600672)
-- Name: _hyper_8_164_chunk_new_sample_timestamp_idx; Type: INDEX; Schema: _timescaledb_internal; Owner: morgan
--

CREATE INDEX _hyper_8_164_chunk_new_sample_timestamp_idx ON _timescaledb_internal._hyper_8_164_chunk USING btree ("timestamp" DESC);


--
-- TOC entry 4472 (class 1259 OID 600677)
-- Name: _hyper_8_165_chunk_new_sample_timestamp_idx; Type: INDEX; Schema: _timescaledb_internal; Owner: morgan
--

CREATE INDEX _hyper_8_165_chunk_new_sample_timestamp_idx ON _timescaledb_internal._hyper_8_165_chunk USING btree ("timestamp" DESC);


--
-- TOC entry 4473 (class 1259 OID 600682)
-- Name: _hyper_8_166_chunk_new_sample_timestamp_idx; Type: INDEX; Schema: _timescaledb_internal; Owner: morgan
--

CREATE INDEX _hyper_8_166_chunk_new_sample_timestamp_idx ON _timescaledb_internal._hyper_8_166_chunk USING btree ("timestamp" DESC);


--
-- TOC entry 4474 (class 1259 OID 600687)
-- Name: _hyper_8_167_chunk_new_sample_timestamp_idx; Type: INDEX; Schema: _timescaledb_internal; Owner: morgan
--

CREATE INDEX _hyper_8_167_chunk_new_sample_timestamp_idx ON _timescaledb_internal._hyper_8_167_chunk USING btree ("timestamp" DESC);


--
-- TOC entry 4475 (class 1259 OID 600692)
-- Name: _hyper_8_168_chunk_new_sample_timestamp_idx; Type: INDEX; Schema: _timescaledb_internal; Owner: morgan
--

CREATE INDEX _hyper_8_168_chunk_new_sample_timestamp_idx ON _timescaledb_internal._hyper_8_168_chunk USING btree ("timestamp" DESC);


--
-- TOC entry 4476 (class 1259 OID 600697)
-- Name: _hyper_8_169_chunk_new_sample_timestamp_idx; Type: INDEX; Schema: _timescaledb_internal; Owner: morgan
--

CREATE INDEX _hyper_8_169_chunk_new_sample_timestamp_idx ON _timescaledb_internal._hyper_8_169_chunk USING btree ("timestamp" DESC);


--
-- TOC entry 4477 (class 1259 OID 600702)
-- Name: _hyper_8_170_chunk_new_sample_timestamp_idx; Type: INDEX; Schema: _timescaledb_internal; Owner: morgan
--

CREATE INDEX _hyper_8_170_chunk_new_sample_timestamp_idx ON _timescaledb_internal._hyper_8_170_chunk USING btree ("timestamp" DESC);


--
-- TOC entry 4478 (class 1259 OID 600707)
-- Name: _hyper_8_171_chunk_new_sample_timestamp_idx; Type: INDEX; Schema: _timescaledb_internal; Owner: morgan
--

CREATE INDEX _hyper_8_171_chunk_new_sample_timestamp_idx ON _timescaledb_internal._hyper_8_171_chunk USING btree ("timestamp" DESC);


--
-- TOC entry 4479 (class 1259 OID 600712)
-- Name: _hyper_8_172_chunk_new_sample_timestamp_idx; Type: INDEX; Schema: _timescaledb_internal; Owner: morgan
--

CREATE INDEX _hyper_8_172_chunk_new_sample_timestamp_idx ON _timescaledb_internal._hyper_8_172_chunk USING btree ("timestamp" DESC);


--
-- TOC entry 4480 (class 1259 OID 600717)
-- Name: _hyper_8_173_chunk_new_sample_timestamp_idx; Type: INDEX; Schema: _timescaledb_internal; Owner: morgan
--

CREATE INDEX _hyper_8_173_chunk_new_sample_timestamp_idx ON _timescaledb_internal._hyper_8_173_chunk USING btree ("timestamp" DESC);


--
-- TOC entry 4481 (class 1259 OID 600722)
-- Name: _hyper_8_174_chunk_new_sample_timestamp_idx; Type: INDEX; Schema: _timescaledb_internal; Owner: morgan
--

CREATE INDEX _hyper_8_174_chunk_new_sample_timestamp_idx ON _timescaledb_internal._hyper_8_174_chunk USING btree ("timestamp" DESC);


--
-- TOC entry 4482 (class 1259 OID 600727)
-- Name: _hyper_8_175_chunk_new_sample_timestamp_idx; Type: INDEX; Schema: _timescaledb_internal; Owner: morgan
--

CREATE INDEX _hyper_8_175_chunk_new_sample_timestamp_idx ON _timescaledb_internal._hyper_8_175_chunk USING btree ("timestamp" DESC);


--
-- TOC entry 4483 (class 1259 OID 600732)
-- Name: _hyper_8_176_chunk_new_sample_timestamp_idx; Type: INDEX; Schema: _timescaledb_internal; Owner: morgan
--

CREATE INDEX _hyper_8_176_chunk_new_sample_timestamp_idx ON _timescaledb_internal._hyper_8_176_chunk USING btree ("timestamp" DESC);


--
-- TOC entry 4484 (class 1259 OID 600737)
-- Name: _hyper_8_177_chunk_new_sample_timestamp_idx; Type: INDEX; Schema: _timescaledb_internal; Owner: morgan
--

CREATE INDEX _hyper_8_177_chunk_new_sample_timestamp_idx ON _timescaledb_internal._hyper_8_177_chunk USING btree ("timestamp" DESC);


--
-- TOC entry 4485 (class 1259 OID 600742)
-- Name: _hyper_8_178_chunk_new_sample_timestamp_idx; Type: INDEX; Schema: _timescaledb_internal; Owner: morgan
--

CREATE INDEX _hyper_8_178_chunk_new_sample_timestamp_idx ON _timescaledb_internal._hyper_8_178_chunk USING btree ("timestamp" DESC);


--
-- TOC entry 4486 (class 1259 OID 600747)
-- Name: _hyper_8_179_chunk_new_sample_timestamp_idx; Type: INDEX; Schema: _timescaledb_internal; Owner: morgan
--

CREATE INDEX _hyper_8_179_chunk_new_sample_timestamp_idx ON _timescaledb_internal._hyper_8_179_chunk USING btree ("timestamp" DESC);


--
-- TOC entry 4487 (class 1259 OID 600752)
-- Name: _hyper_8_180_chunk_new_sample_timestamp_idx; Type: INDEX; Schema: _timescaledb_internal; Owner: morgan
--

CREATE INDEX _hyper_8_180_chunk_new_sample_timestamp_idx ON _timescaledb_internal._hyper_8_180_chunk USING btree ("timestamp" DESC);


--
-- TOC entry 4488 (class 1259 OID 600757)
-- Name: _hyper_8_181_chunk_new_sample_timestamp_idx; Type: INDEX; Schema: _timescaledb_internal; Owner: morgan
--

CREATE INDEX _hyper_8_181_chunk_new_sample_timestamp_idx ON _timescaledb_internal._hyper_8_181_chunk USING btree ("timestamp" DESC);


--
-- TOC entry 4489 (class 1259 OID 600762)
-- Name: _hyper_8_182_chunk_new_sample_timestamp_idx; Type: INDEX; Schema: _timescaledb_internal; Owner: morgan
--

CREATE INDEX _hyper_8_182_chunk_new_sample_timestamp_idx ON _timescaledb_internal._hyper_8_182_chunk USING btree ("timestamp" DESC);


--
-- TOC entry 4490 (class 1259 OID 600767)
-- Name: _hyper_8_183_chunk_new_sample_timestamp_idx; Type: INDEX; Schema: _timescaledb_internal; Owner: morgan
--

CREATE INDEX _hyper_8_183_chunk_new_sample_timestamp_idx ON _timescaledb_internal._hyper_8_183_chunk USING btree ("timestamp" DESC);


--
-- TOC entry 4491 (class 1259 OID 600772)
-- Name: _hyper_8_184_chunk_new_sample_timestamp_idx; Type: INDEX; Schema: _timescaledb_internal; Owner: morgan
--

CREATE INDEX _hyper_8_184_chunk_new_sample_timestamp_idx ON _timescaledb_internal._hyper_8_184_chunk USING btree ("timestamp" DESC);


--
-- TOC entry 4492 (class 1259 OID 600777)
-- Name: _hyper_8_185_chunk_new_sample_timestamp_idx; Type: INDEX; Schema: _timescaledb_internal; Owner: morgan
--

CREATE INDEX _hyper_8_185_chunk_new_sample_timestamp_idx ON _timescaledb_internal._hyper_8_185_chunk USING btree ("timestamp" DESC);


--
-- TOC entry 4493 (class 1259 OID 600782)
-- Name: _hyper_8_186_chunk_new_sample_timestamp_idx; Type: INDEX; Schema: _timescaledb_internal; Owner: morgan
--

CREATE INDEX _hyper_8_186_chunk_new_sample_timestamp_idx ON _timescaledb_internal._hyper_8_186_chunk USING btree ("timestamp" DESC);


--
-- TOC entry 4494 (class 1259 OID 600787)
-- Name: _hyper_8_187_chunk_new_sample_timestamp_idx; Type: INDEX; Schema: _timescaledb_internal; Owner: morgan
--

CREATE INDEX _hyper_8_187_chunk_new_sample_timestamp_idx ON _timescaledb_internal._hyper_8_187_chunk USING btree ("timestamp" DESC);


--
-- TOC entry 4495 (class 1259 OID 600792)
-- Name: _hyper_8_188_chunk_new_sample_timestamp_idx; Type: INDEX; Schema: _timescaledb_internal; Owner: morgan
--

CREATE INDEX _hyper_8_188_chunk_new_sample_timestamp_idx ON _timescaledb_internal._hyper_8_188_chunk USING btree ("timestamp" DESC);


--
-- TOC entry 4496 (class 1259 OID 600797)
-- Name: _hyper_8_189_chunk_new_sample_timestamp_idx; Type: INDEX; Schema: _timescaledb_internal; Owner: morgan
--

CREATE INDEX _hyper_8_189_chunk_new_sample_timestamp_idx ON _timescaledb_internal._hyper_8_189_chunk USING btree ("timestamp" DESC);


--
-- TOC entry 4497 (class 1259 OID 600802)
-- Name: _hyper_8_190_chunk_new_sample_timestamp_idx; Type: INDEX; Schema: _timescaledb_internal; Owner: morgan
--

CREATE INDEX _hyper_8_190_chunk_new_sample_timestamp_idx ON _timescaledb_internal._hyper_8_190_chunk USING btree ("timestamp" DESC);


--
-- TOC entry 4498 (class 1259 OID 600807)
-- Name: _hyper_8_191_chunk_new_sample_timestamp_idx; Type: INDEX; Schema: _timescaledb_internal; Owner: morgan
--

CREATE INDEX _hyper_8_191_chunk_new_sample_timestamp_idx ON _timescaledb_internal._hyper_8_191_chunk USING btree ("timestamp" DESC);


--
-- TOC entry 4499 (class 1259 OID 600812)
-- Name: _hyper_8_192_chunk_new_sample_timestamp_idx; Type: INDEX; Schema: _timescaledb_internal; Owner: morgan
--

CREATE INDEX _hyper_8_192_chunk_new_sample_timestamp_idx ON _timescaledb_internal._hyper_8_192_chunk USING btree ("timestamp" DESC);


--
-- TOC entry 4500 (class 1259 OID 600817)
-- Name: _hyper_8_193_chunk_new_sample_timestamp_idx; Type: INDEX; Schema: _timescaledb_internal; Owner: morgan
--

CREATE INDEX _hyper_8_193_chunk_new_sample_timestamp_idx ON _timescaledb_internal._hyper_8_193_chunk USING btree ("timestamp" DESC);


--
-- TOC entry 4501 (class 1259 OID 600822)
-- Name: _hyper_8_194_chunk_new_sample_timestamp_idx; Type: INDEX; Schema: _timescaledb_internal; Owner: morgan
--

CREATE INDEX _hyper_8_194_chunk_new_sample_timestamp_idx ON _timescaledb_internal._hyper_8_194_chunk USING btree ("timestamp" DESC);


--
-- TOC entry 4502 (class 1259 OID 600827)
-- Name: _hyper_8_195_chunk_new_sample_timestamp_idx; Type: INDEX; Schema: _timescaledb_internal; Owner: morgan
--

CREATE INDEX _hyper_8_195_chunk_new_sample_timestamp_idx ON _timescaledb_internal._hyper_8_195_chunk USING btree ("timestamp" DESC);


--
-- TOC entry 4503 (class 1259 OID 600832)
-- Name: _hyper_8_196_chunk_new_sample_timestamp_idx; Type: INDEX; Schema: _timescaledb_internal; Owner: morgan
--

CREATE INDEX _hyper_8_196_chunk_new_sample_timestamp_idx ON _timescaledb_internal._hyper_8_196_chunk USING btree ("timestamp" DESC);


--
-- TOC entry 4504 (class 1259 OID 600837)
-- Name: _hyper_8_197_chunk_new_sample_timestamp_idx; Type: INDEX; Schema: _timescaledb_internal; Owner: morgan
--

CREATE INDEX _hyper_8_197_chunk_new_sample_timestamp_idx ON _timescaledb_internal._hyper_8_197_chunk USING btree ("timestamp" DESC);


--
-- TOC entry 4505 (class 1259 OID 600842)
-- Name: _hyper_8_198_chunk_new_sample_timestamp_idx; Type: INDEX; Schema: _timescaledb_internal; Owner: morgan
--

CREATE INDEX _hyper_8_198_chunk_new_sample_timestamp_idx ON _timescaledb_internal._hyper_8_198_chunk USING btree ("timestamp" DESC);


--
-- TOC entry 4506 (class 1259 OID 600847)
-- Name: _hyper_8_199_chunk_new_sample_timestamp_idx; Type: INDEX; Schema: _timescaledb_internal; Owner: morgan
--

CREATE INDEX _hyper_8_199_chunk_new_sample_timestamp_idx ON _timescaledb_internal._hyper_8_199_chunk USING btree ("timestamp" DESC);


--
-- TOC entry 4507 (class 1259 OID 600852)
-- Name: _hyper_8_200_chunk_new_sample_timestamp_idx; Type: INDEX; Schema: _timescaledb_internal; Owner: morgan
--

CREATE INDEX _hyper_8_200_chunk_new_sample_timestamp_idx ON _timescaledb_internal._hyper_8_200_chunk USING btree ("timestamp" DESC);


--
-- TOC entry 4508 (class 1259 OID 600857)
-- Name: _hyper_8_201_chunk_new_sample_timestamp_idx; Type: INDEX; Schema: _timescaledb_internal; Owner: morgan
--

CREATE INDEX _hyper_8_201_chunk_new_sample_timestamp_idx ON _timescaledb_internal._hyper_8_201_chunk USING btree ("timestamp" DESC);


--
-- TOC entry 4509 (class 1259 OID 600862)
-- Name: _hyper_8_202_chunk_new_sample_timestamp_idx; Type: INDEX; Schema: _timescaledb_internal; Owner: morgan
--

CREATE INDEX _hyper_8_202_chunk_new_sample_timestamp_idx ON _timescaledb_internal._hyper_8_202_chunk USING btree ("timestamp" DESC);


--
-- TOC entry 4510 (class 1259 OID 600867)
-- Name: _hyper_8_203_chunk_new_sample_timestamp_idx; Type: INDEX; Schema: _timescaledb_internal; Owner: morgan
--

CREATE INDEX _hyper_8_203_chunk_new_sample_timestamp_idx ON _timescaledb_internal._hyper_8_203_chunk USING btree ("timestamp" DESC);


--
-- TOC entry 4511 (class 1259 OID 600872)
-- Name: _hyper_8_204_chunk_new_sample_timestamp_idx; Type: INDEX; Schema: _timescaledb_internal; Owner: morgan
--

CREATE INDEX _hyper_8_204_chunk_new_sample_timestamp_idx ON _timescaledb_internal._hyper_8_204_chunk USING btree ("timestamp" DESC);


--
-- TOC entry 4512 (class 1259 OID 600877)
-- Name: _hyper_8_205_chunk_new_sample_timestamp_idx; Type: INDEX; Schema: _timescaledb_internal; Owner: morgan
--

CREATE INDEX _hyper_8_205_chunk_new_sample_timestamp_idx ON _timescaledb_internal._hyper_8_205_chunk USING btree ("timestamp" DESC);


--
-- TOC entry 4513 (class 1259 OID 600882)
-- Name: _hyper_8_206_chunk_new_sample_timestamp_idx; Type: INDEX; Schema: _timescaledb_internal; Owner: morgan
--

CREATE INDEX _hyper_8_206_chunk_new_sample_timestamp_idx ON _timescaledb_internal._hyper_8_206_chunk USING btree ("timestamp" DESC);


--
-- TOC entry 4514 (class 1259 OID 600887)
-- Name: _hyper_8_207_chunk_new_sample_timestamp_idx; Type: INDEX; Schema: _timescaledb_internal; Owner: morgan
--

CREATE INDEX _hyper_8_207_chunk_new_sample_timestamp_idx ON _timescaledb_internal._hyper_8_207_chunk USING btree ("timestamp" DESC);


--
-- TOC entry 4515 (class 1259 OID 600892)
-- Name: _hyper_8_208_chunk_new_sample_timestamp_idx; Type: INDEX; Schema: _timescaledb_internal; Owner: morgan
--

CREATE INDEX _hyper_8_208_chunk_new_sample_timestamp_idx ON _timescaledb_internal._hyper_8_208_chunk USING btree ("timestamp" DESC);


--
-- TOC entry 4516 (class 1259 OID 600897)
-- Name: _hyper_8_209_chunk_new_sample_timestamp_idx; Type: INDEX; Schema: _timescaledb_internal; Owner: morgan
--

CREATE INDEX _hyper_8_209_chunk_new_sample_timestamp_idx ON _timescaledb_internal._hyper_8_209_chunk USING btree ("timestamp" DESC);


--
-- TOC entry 4517 (class 1259 OID 600902)
-- Name: _hyper_8_210_chunk_new_sample_timestamp_idx; Type: INDEX; Schema: _timescaledb_internal; Owner: morgan
--

CREATE INDEX _hyper_8_210_chunk_new_sample_timestamp_idx ON _timescaledb_internal._hyper_8_210_chunk USING btree ("timestamp" DESC);


--
-- TOC entry 4518 (class 1259 OID 600907)
-- Name: _hyper_8_211_chunk_new_sample_timestamp_idx; Type: INDEX; Schema: _timescaledb_internal; Owner: morgan
--

CREATE INDEX _hyper_8_211_chunk_new_sample_timestamp_idx ON _timescaledb_internal._hyper_8_211_chunk USING btree ("timestamp" DESC);


--
-- TOC entry 4519 (class 1259 OID 600912)
-- Name: _hyper_8_212_chunk_new_sample_timestamp_idx; Type: INDEX; Schema: _timescaledb_internal; Owner: morgan
--

CREATE INDEX _hyper_8_212_chunk_new_sample_timestamp_idx ON _timescaledb_internal._hyper_8_212_chunk USING btree ("timestamp" DESC);


--
-- TOC entry 4520 (class 1259 OID 600917)
-- Name: _hyper_8_213_chunk_new_sample_timestamp_idx; Type: INDEX; Schema: _timescaledb_internal; Owner: morgan
--

CREATE INDEX _hyper_8_213_chunk_new_sample_timestamp_idx ON _timescaledb_internal._hyper_8_213_chunk USING btree ("timestamp" DESC);


--
-- TOC entry 4521 (class 1259 OID 600922)
-- Name: _hyper_8_214_chunk_new_sample_timestamp_idx; Type: INDEX; Schema: _timescaledb_internal; Owner: morgan
--

CREATE INDEX _hyper_8_214_chunk_new_sample_timestamp_idx ON _timescaledb_internal._hyper_8_214_chunk USING btree ("timestamp" DESC);


--
-- TOC entry 4522 (class 1259 OID 600927)
-- Name: _hyper_8_215_chunk_new_sample_timestamp_idx; Type: INDEX; Schema: _timescaledb_internal; Owner: morgan
--

CREATE INDEX _hyper_8_215_chunk_new_sample_timestamp_idx ON _timescaledb_internal._hyper_8_215_chunk USING btree ("timestamp" DESC);


--
-- TOC entry 4523 (class 1259 OID 600932)
-- Name: _hyper_8_216_chunk_new_sample_timestamp_idx; Type: INDEX; Schema: _timescaledb_internal; Owner: morgan
--

CREATE INDEX _hyper_8_216_chunk_new_sample_timestamp_idx ON _timescaledb_internal._hyper_8_216_chunk USING btree ("timestamp" DESC);


--
-- TOC entry 4524 (class 1259 OID 600937)
-- Name: _hyper_8_217_chunk_new_sample_timestamp_idx; Type: INDEX; Schema: _timescaledb_internal; Owner: morgan
--

CREATE INDEX _hyper_8_217_chunk_new_sample_timestamp_idx ON _timescaledb_internal._hyper_8_217_chunk USING btree ("timestamp" DESC);


--
-- TOC entry 4525 (class 1259 OID 600942)
-- Name: _hyper_8_218_chunk_new_sample_timestamp_idx; Type: INDEX; Schema: _timescaledb_internal; Owner: morgan
--

CREATE INDEX _hyper_8_218_chunk_new_sample_timestamp_idx ON _timescaledb_internal._hyper_8_218_chunk USING btree ("timestamp" DESC);


--
-- TOC entry 4526 (class 1259 OID 600947)
-- Name: _hyper_8_219_chunk_new_sample_timestamp_idx; Type: INDEX; Schema: _timescaledb_internal; Owner: morgan
--

CREATE INDEX _hyper_8_219_chunk_new_sample_timestamp_idx ON _timescaledb_internal._hyper_8_219_chunk USING btree ("timestamp" DESC);


--
-- TOC entry 4527 (class 1259 OID 600952)
-- Name: _hyper_8_220_chunk_new_sample_timestamp_idx; Type: INDEX; Schema: _timescaledb_internal; Owner: morgan
--

CREATE INDEX _hyper_8_220_chunk_new_sample_timestamp_idx ON _timescaledb_internal._hyper_8_220_chunk USING btree ("timestamp" DESC);


--
-- TOC entry 4528 (class 1259 OID 600957)
-- Name: _hyper_8_221_chunk_new_sample_timestamp_idx; Type: INDEX; Schema: _timescaledb_internal; Owner: morgan
--

CREATE INDEX _hyper_8_221_chunk_new_sample_timestamp_idx ON _timescaledb_internal._hyper_8_221_chunk USING btree ("timestamp" DESC);


--
-- TOC entry 4529 (class 1259 OID 600962)
-- Name: _hyper_8_222_chunk_new_sample_timestamp_idx; Type: INDEX; Schema: _timescaledb_internal; Owner: morgan
--

CREATE INDEX _hyper_8_222_chunk_new_sample_timestamp_idx ON _timescaledb_internal._hyper_8_222_chunk USING btree ("timestamp" DESC);


--
-- TOC entry 4530 (class 1259 OID 600967)
-- Name: _hyper_8_223_chunk_new_sample_timestamp_idx; Type: INDEX; Schema: _timescaledb_internal; Owner: morgan
--

CREATE INDEX _hyper_8_223_chunk_new_sample_timestamp_idx ON _timescaledb_internal._hyper_8_223_chunk USING btree ("timestamp" DESC);


--
-- TOC entry 4531 (class 1259 OID 600972)
-- Name: _hyper_8_224_chunk_new_sample_timestamp_idx; Type: INDEX; Schema: _timescaledb_internal; Owner: morgan
--

CREATE INDEX _hyper_8_224_chunk_new_sample_timestamp_idx ON _timescaledb_internal._hyper_8_224_chunk USING btree ("timestamp" DESC);


--
-- TOC entry 4532 (class 1259 OID 600977)
-- Name: _hyper_8_225_chunk_new_sample_timestamp_idx; Type: INDEX; Schema: _timescaledb_internal; Owner: morgan
--

CREATE INDEX _hyper_8_225_chunk_new_sample_timestamp_idx ON _timescaledb_internal._hyper_8_225_chunk USING btree ("timestamp" DESC);


--
-- TOC entry 4533 (class 1259 OID 600982)
-- Name: _hyper_8_226_chunk_new_sample_timestamp_idx; Type: INDEX; Schema: _timescaledb_internal; Owner: morgan
--

CREATE INDEX _hyper_8_226_chunk_new_sample_timestamp_idx ON _timescaledb_internal._hyper_8_226_chunk USING btree ("timestamp" DESC);


--
-- TOC entry 4534 (class 1259 OID 600987)
-- Name: _hyper_8_227_chunk_new_sample_timestamp_idx; Type: INDEX; Schema: _timescaledb_internal; Owner: morgan
--

CREATE INDEX _hyper_8_227_chunk_new_sample_timestamp_idx ON _timescaledb_internal._hyper_8_227_chunk USING btree ("timestamp" DESC);


--
-- TOC entry 4535 (class 1259 OID 600992)
-- Name: _hyper_8_228_chunk_new_sample_timestamp_idx; Type: INDEX; Schema: _timescaledb_internal; Owner: morgan
--

CREATE INDEX _hyper_8_228_chunk_new_sample_timestamp_idx ON _timescaledb_internal._hyper_8_228_chunk USING btree ("timestamp" DESC);


--
-- TOC entry 4536 (class 1259 OID 600997)
-- Name: _hyper_8_229_chunk_new_sample_timestamp_idx; Type: INDEX; Schema: _timescaledb_internal; Owner: morgan
--

CREATE INDEX _hyper_8_229_chunk_new_sample_timestamp_idx ON _timescaledb_internal._hyper_8_229_chunk USING btree ("timestamp" DESC);


--
-- TOC entry 4537 (class 1259 OID 601002)
-- Name: _hyper_8_230_chunk_new_sample_timestamp_idx; Type: INDEX; Schema: _timescaledb_internal; Owner: morgan
--

CREATE INDEX _hyper_8_230_chunk_new_sample_timestamp_idx ON _timescaledb_internal._hyper_8_230_chunk USING btree ("timestamp" DESC);


--
-- TOC entry 4538 (class 1259 OID 601007)
-- Name: _hyper_8_231_chunk_new_sample_timestamp_idx; Type: INDEX; Schema: _timescaledb_internal; Owner: morgan
--

CREATE INDEX _hyper_8_231_chunk_new_sample_timestamp_idx ON _timescaledb_internal._hyper_8_231_chunk USING btree ("timestamp" DESC);


--
-- TOC entry 4539 (class 1259 OID 601012)
-- Name: _hyper_8_232_chunk_new_sample_timestamp_idx; Type: INDEX; Schema: _timescaledb_internal; Owner: morgan
--

CREATE INDEX _hyper_8_232_chunk_new_sample_timestamp_idx ON _timescaledb_internal._hyper_8_232_chunk USING btree ("timestamp" DESC);


--
-- TOC entry 4540 (class 1259 OID 601017)
-- Name: _hyper_8_233_chunk_new_sample_timestamp_idx; Type: INDEX; Schema: _timescaledb_internal; Owner: morgan
--

CREATE INDEX _hyper_8_233_chunk_new_sample_timestamp_idx ON _timescaledb_internal._hyper_8_233_chunk USING btree ("timestamp" DESC);


--
-- TOC entry 4541 (class 1259 OID 601022)
-- Name: _hyper_8_234_chunk_new_sample_timestamp_idx; Type: INDEX; Schema: _timescaledb_internal; Owner: morgan
--

CREATE INDEX _hyper_8_234_chunk_new_sample_timestamp_idx ON _timescaledb_internal._hyper_8_234_chunk USING btree ("timestamp" DESC);


--
-- TOC entry 4542 (class 1259 OID 601027)
-- Name: _hyper_8_235_chunk_new_sample_timestamp_idx; Type: INDEX; Schema: _timescaledb_internal; Owner: morgan
--

CREATE INDEX _hyper_8_235_chunk_new_sample_timestamp_idx ON _timescaledb_internal._hyper_8_235_chunk USING btree ("timestamp" DESC);


--
-- TOC entry 4543 (class 1259 OID 601032)
-- Name: _hyper_8_236_chunk_new_sample_timestamp_idx; Type: INDEX; Schema: _timescaledb_internal; Owner: morgan
--

CREATE INDEX _hyper_8_236_chunk_new_sample_timestamp_idx ON _timescaledb_internal._hyper_8_236_chunk USING btree ("timestamp" DESC);


--
-- TOC entry 4544 (class 1259 OID 601037)
-- Name: _hyper_8_237_chunk_new_sample_timestamp_idx; Type: INDEX; Schema: _timescaledb_internal; Owner: morgan
--

CREATE INDEX _hyper_8_237_chunk_new_sample_timestamp_idx ON _timescaledb_internal._hyper_8_237_chunk USING btree ("timestamp" DESC);


--
-- TOC entry 4545 (class 1259 OID 601042)
-- Name: _hyper_8_238_chunk_new_sample_timestamp_idx; Type: INDEX; Schema: _timescaledb_internal; Owner: morgan
--

CREATE INDEX _hyper_8_238_chunk_new_sample_timestamp_idx ON _timescaledb_internal._hyper_8_238_chunk USING btree ("timestamp" DESC);


--
-- TOC entry 4546 (class 1259 OID 601047)
-- Name: _hyper_8_239_chunk_new_sample_timestamp_idx; Type: INDEX; Schema: _timescaledb_internal; Owner: morgan
--

CREATE INDEX _hyper_8_239_chunk_new_sample_timestamp_idx ON _timescaledb_internal._hyper_8_239_chunk USING btree ("timestamp" DESC);


--
-- TOC entry 4547 (class 1259 OID 601052)
-- Name: _hyper_8_240_chunk_new_sample_timestamp_idx; Type: INDEX; Schema: _timescaledb_internal; Owner: morgan
--

CREATE INDEX _hyper_8_240_chunk_new_sample_timestamp_idx ON _timescaledb_internal._hyper_8_240_chunk USING btree ("timestamp" DESC);


--
-- TOC entry 4548 (class 1259 OID 601057)
-- Name: _hyper_8_241_chunk_new_sample_timestamp_idx; Type: INDEX; Schema: _timescaledb_internal; Owner: morgan
--

CREATE INDEX _hyper_8_241_chunk_new_sample_timestamp_idx ON _timescaledb_internal._hyper_8_241_chunk USING btree ("timestamp" DESC);


--
-- TOC entry 4549 (class 1259 OID 601062)
-- Name: _hyper_8_242_chunk_new_sample_timestamp_idx; Type: INDEX; Schema: _timescaledb_internal; Owner: morgan
--

CREATE INDEX _hyper_8_242_chunk_new_sample_timestamp_idx ON _timescaledb_internal._hyper_8_242_chunk USING btree ("timestamp" DESC);


--
-- TOC entry 4550 (class 1259 OID 601067)
-- Name: _hyper_8_243_chunk_new_sample_timestamp_idx; Type: INDEX; Schema: _timescaledb_internal; Owner: morgan
--

CREATE INDEX _hyper_8_243_chunk_new_sample_timestamp_idx ON _timescaledb_internal._hyper_8_243_chunk USING btree ("timestamp" DESC);


--
-- TOC entry 4551 (class 1259 OID 601072)
-- Name: _hyper_8_244_chunk_new_sample_timestamp_idx; Type: INDEX; Schema: _timescaledb_internal; Owner: morgan
--

CREATE INDEX _hyper_8_244_chunk_new_sample_timestamp_idx ON _timescaledb_internal._hyper_8_244_chunk USING btree ("timestamp" DESC);


--
-- TOC entry 4552 (class 1259 OID 601077)
-- Name: _hyper_8_245_chunk_new_sample_timestamp_idx; Type: INDEX; Schema: _timescaledb_internal; Owner: morgan
--

CREATE INDEX _hyper_8_245_chunk_new_sample_timestamp_idx ON _timescaledb_internal._hyper_8_245_chunk USING btree ("timestamp" DESC);


--
-- TOC entry 4553 (class 1259 OID 601082)
-- Name: _hyper_8_246_chunk_new_sample_timestamp_idx; Type: INDEX; Schema: _timescaledb_internal; Owner: morgan
--

CREATE INDEX _hyper_8_246_chunk_new_sample_timestamp_idx ON _timescaledb_internal._hyper_8_246_chunk USING btree ("timestamp" DESC);


--
-- TOC entry 4554 (class 1259 OID 601087)
-- Name: _hyper_8_247_chunk_new_sample_timestamp_idx; Type: INDEX; Schema: _timescaledb_internal; Owner: morgan
--

CREATE INDEX _hyper_8_247_chunk_new_sample_timestamp_idx ON _timescaledb_internal._hyper_8_247_chunk USING btree ("timestamp" DESC);


--
-- TOC entry 4555 (class 1259 OID 601092)
-- Name: _hyper_8_248_chunk_new_sample_timestamp_idx; Type: INDEX; Schema: _timescaledb_internal; Owner: morgan
--

CREATE INDEX _hyper_8_248_chunk_new_sample_timestamp_idx ON _timescaledb_internal._hyper_8_248_chunk USING btree ("timestamp" DESC);


--
-- TOC entry 4556 (class 1259 OID 601097)
-- Name: _hyper_8_249_chunk_new_sample_timestamp_idx; Type: INDEX; Schema: _timescaledb_internal; Owner: morgan
--

CREATE INDEX _hyper_8_249_chunk_new_sample_timestamp_idx ON _timescaledb_internal._hyper_8_249_chunk USING btree ("timestamp" DESC);


--
-- TOC entry 4557 (class 1259 OID 601102)
-- Name: _hyper_8_250_chunk_new_sample_timestamp_idx; Type: INDEX; Schema: _timescaledb_internal; Owner: morgan
--

CREATE INDEX _hyper_8_250_chunk_new_sample_timestamp_idx ON _timescaledb_internal._hyper_8_250_chunk USING btree ("timestamp" DESC);


--
-- TOC entry 4558 (class 1259 OID 601107)
-- Name: _hyper_8_251_chunk_new_sample_timestamp_idx; Type: INDEX; Schema: _timescaledb_internal; Owner: morgan
--

CREATE INDEX _hyper_8_251_chunk_new_sample_timestamp_idx ON _timescaledb_internal._hyper_8_251_chunk USING btree ("timestamp" DESC);


--
-- TOC entry 4559 (class 1259 OID 601112)
-- Name: _hyper_8_252_chunk_new_sample_timestamp_idx; Type: INDEX; Schema: _timescaledb_internal; Owner: morgan
--

CREATE INDEX _hyper_8_252_chunk_new_sample_timestamp_idx ON _timescaledb_internal._hyper_8_252_chunk USING btree ("timestamp" DESC);


--
-- TOC entry 4560 (class 1259 OID 601117)
-- Name: _hyper_8_253_chunk_new_sample_timestamp_idx; Type: INDEX; Schema: _timescaledb_internal; Owner: morgan
--

CREATE INDEX _hyper_8_253_chunk_new_sample_timestamp_idx ON _timescaledb_internal._hyper_8_253_chunk USING btree ("timestamp" DESC);


--
-- TOC entry 4561 (class 1259 OID 601122)
-- Name: _hyper_8_254_chunk_new_sample_timestamp_idx; Type: INDEX; Schema: _timescaledb_internal; Owner: morgan
--

CREATE INDEX _hyper_8_254_chunk_new_sample_timestamp_idx ON _timescaledb_internal._hyper_8_254_chunk USING btree ("timestamp" DESC);


--
-- TOC entry 4562 (class 1259 OID 601127)
-- Name: _hyper_8_255_chunk_new_sample_timestamp_idx; Type: INDEX; Schema: _timescaledb_internal; Owner: morgan
--

CREATE INDEX _hyper_8_255_chunk_new_sample_timestamp_idx ON _timescaledb_internal._hyper_8_255_chunk USING btree ("timestamp" DESC);


--
-- TOC entry 4563 (class 1259 OID 601132)
-- Name: _hyper_8_256_chunk_new_sample_timestamp_idx; Type: INDEX; Schema: _timescaledb_internal; Owner: morgan
--

CREATE INDEX _hyper_8_256_chunk_new_sample_timestamp_idx ON _timescaledb_internal._hyper_8_256_chunk USING btree ("timestamp" DESC);


--
-- TOC entry 4564 (class 1259 OID 601137)
-- Name: _hyper_8_257_chunk_new_sample_timestamp_idx; Type: INDEX; Schema: _timescaledb_internal; Owner: morgan
--

CREATE INDEX _hyper_8_257_chunk_new_sample_timestamp_idx ON _timescaledb_internal._hyper_8_257_chunk USING btree ("timestamp" DESC);


--
-- TOC entry 4565 (class 1259 OID 601142)
-- Name: _hyper_8_258_chunk_new_sample_timestamp_idx; Type: INDEX; Schema: _timescaledb_internal; Owner: morgan
--

CREATE INDEX _hyper_8_258_chunk_new_sample_timestamp_idx ON _timescaledb_internal._hyper_8_258_chunk USING btree ("timestamp" DESC);


--
-- TOC entry 4566 (class 1259 OID 601147)
-- Name: _hyper_8_259_chunk_new_sample_timestamp_idx; Type: INDEX; Schema: _timescaledb_internal; Owner: morgan
--

CREATE INDEX _hyper_8_259_chunk_new_sample_timestamp_idx ON _timescaledb_internal._hyper_8_259_chunk USING btree ("timestamp" DESC);


--
-- TOC entry 4567 (class 1259 OID 601152)
-- Name: _hyper_8_260_chunk_new_sample_timestamp_idx; Type: INDEX; Schema: _timescaledb_internal; Owner: morgan
--

CREATE INDEX _hyper_8_260_chunk_new_sample_timestamp_idx ON _timescaledb_internal._hyper_8_260_chunk USING btree ("timestamp" DESC);


--
-- TOC entry 4568 (class 1259 OID 601157)
-- Name: _hyper_8_261_chunk_new_sample_timestamp_idx; Type: INDEX; Schema: _timescaledb_internal; Owner: morgan
--

CREATE INDEX _hyper_8_261_chunk_new_sample_timestamp_idx ON _timescaledb_internal._hyper_8_261_chunk USING btree ("timestamp" DESC);


--
-- TOC entry 4569 (class 1259 OID 601162)
-- Name: _hyper_8_262_chunk_new_sample_timestamp_idx; Type: INDEX; Schema: _timescaledb_internal; Owner: morgan
--

CREATE INDEX _hyper_8_262_chunk_new_sample_timestamp_idx ON _timescaledb_internal._hyper_8_262_chunk USING btree ("timestamp" DESC);


--
-- TOC entry 4570 (class 1259 OID 601167)
-- Name: _hyper_8_263_chunk_new_sample_timestamp_idx; Type: INDEX; Schema: _timescaledb_internal; Owner: morgan
--

CREATE INDEX _hyper_8_263_chunk_new_sample_timestamp_idx ON _timescaledb_internal._hyper_8_263_chunk USING btree ("timestamp" DESC);


--
-- TOC entry 4571 (class 1259 OID 601172)
-- Name: _hyper_8_264_chunk_new_sample_timestamp_idx; Type: INDEX; Schema: _timescaledb_internal; Owner: morgan
--

CREATE INDEX _hyper_8_264_chunk_new_sample_timestamp_idx ON _timescaledb_internal._hyper_8_264_chunk USING btree ("timestamp" DESC);


--
-- TOC entry 4572 (class 1259 OID 601177)
-- Name: _hyper_8_265_chunk_new_sample_timestamp_idx; Type: INDEX; Schema: _timescaledb_internal; Owner: morgan
--

CREATE INDEX _hyper_8_265_chunk_new_sample_timestamp_idx ON _timescaledb_internal._hyper_8_265_chunk USING btree ("timestamp" DESC);


--
-- TOC entry 4573 (class 1259 OID 601182)
-- Name: _hyper_8_266_chunk_new_sample_timestamp_idx; Type: INDEX; Schema: _timescaledb_internal; Owner: morgan
--

CREATE INDEX _hyper_8_266_chunk_new_sample_timestamp_idx ON _timescaledb_internal._hyper_8_266_chunk USING btree ("timestamp" DESC);


--
-- TOC entry 4574 (class 1259 OID 601187)
-- Name: _hyper_8_267_chunk_new_sample_timestamp_idx; Type: INDEX; Schema: _timescaledb_internal; Owner: morgan
--

CREATE INDEX _hyper_8_267_chunk_new_sample_timestamp_idx ON _timescaledb_internal._hyper_8_267_chunk USING btree ("timestamp" DESC);


--
-- TOC entry 4575 (class 1259 OID 601192)
-- Name: _hyper_8_268_chunk_new_sample_timestamp_idx; Type: INDEX; Schema: _timescaledb_internal; Owner: morgan
--

CREATE INDEX _hyper_8_268_chunk_new_sample_timestamp_idx ON _timescaledb_internal._hyper_8_268_chunk USING btree ("timestamp" DESC);


--
-- TOC entry 4576 (class 1259 OID 601197)
-- Name: _hyper_8_269_chunk_new_sample_timestamp_idx; Type: INDEX; Schema: _timescaledb_internal; Owner: morgan
--

CREATE INDEX _hyper_8_269_chunk_new_sample_timestamp_idx ON _timescaledb_internal._hyper_8_269_chunk USING btree ("timestamp" DESC);


--
-- TOC entry 4577 (class 1259 OID 601202)
-- Name: _hyper_8_270_chunk_new_sample_timestamp_idx; Type: INDEX; Schema: _timescaledb_internal; Owner: morgan
--

CREATE INDEX _hyper_8_270_chunk_new_sample_timestamp_idx ON _timescaledb_internal._hyper_8_270_chunk USING btree ("timestamp" DESC);


--
-- TOC entry 4578 (class 1259 OID 601207)
-- Name: _hyper_8_271_chunk_new_sample_timestamp_idx; Type: INDEX; Schema: _timescaledb_internal; Owner: morgan
--

CREATE INDEX _hyper_8_271_chunk_new_sample_timestamp_idx ON _timescaledb_internal._hyper_8_271_chunk USING btree ("timestamp" DESC);


--
-- TOC entry 4579 (class 1259 OID 601212)
-- Name: _hyper_8_272_chunk_new_sample_timestamp_idx; Type: INDEX; Schema: _timescaledb_internal; Owner: morgan
--

CREATE INDEX _hyper_8_272_chunk_new_sample_timestamp_idx ON _timescaledb_internal._hyper_8_272_chunk USING btree ("timestamp" DESC);


--
-- TOC entry 4580 (class 1259 OID 601217)
-- Name: _hyper_8_273_chunk_new_sample_timestamp_idx; Type: INDEX; Schema: _timescaledb_internal; Owner: morgan
--

CREATE INDEX _hyper_8_273_chunk_new_sample_timestamp_idx ON _timescaledb_internal._hyper_8_273_chunk USING btree ("timestamp" DESC);


--
-- TOC entry 4581 (class 1259 OID 601222)
-- Name: _hyper_8_274_chunk_new_sample_timestamp_idx; Type: INDEX; Schema: _timescaledb_internal; Owner: morgan
--

CREATE INDEX _hyper_8_274_chunk_new_sample_timestamp_idx ON _timescaledb_internal._hyper_8_274_chunk USING btree ("timestamp" DESC);


--
-- TOC entry 4582 (class 1259 OID 601227)
-- Name: _hyper_8_275_chunk_new_sample_timestamp_idx; Type: INDEX; Schema: _timescaledb_internal; Owner: morgan
--

CREATE INDEX _hyper_8_275_chunk_new_sample_timestamp_idx ON _timescaledb_internal._hyper_8_275_chunk USING btree ("timestamp" DESC);


--
-- TOC entry 4583 (class 1259 OID 601232)
-- Name: _hyper_8_276_chunk_new_sample_timestamp_idx; Type: INDEX; Schema: _timescaledb_internal; Owner: morgan
--

CREATE INDEX _hyper_8_276_chunk_new_sample_timestamp_idx ON _timescaledb_internal._hyper_8_276_chunk USING btree ("timestamp" DESC);


--
-- TOC entry 4584 (class 1259 OID 601237)
-- Name: _hyper_8_277_chunk_new_sample_timestamp_idx; Type: INDEX; Schema: _timescaledb_internal; Owner: morgan
--

CREATE INDEX _hyper_8_277_chunk_new_sample_timestamp_idx ON _timescaledb_internal._hyper_8_277_chunk USING btree ("timestamp" DESC);


--
-- TOC entry 4585 (class 1259 OID 601242)
-- Name: _hyper_8_278_chunk_new_sample_timestamp_idx; Type: INDEX; Schema: _timescaledb_internal; Owner: morgan
--

CREATE INDEX _hyper_8_278_chunk_new_sample_timestamp_idx ON _timescaledb_internal._hyper_8_278_chunk USING btree ("timestamp" DESC);


--
-- TOC entry 4586 (class 1259 OID 601247)
-- Name: _hyper_8_279_chunk_new_sample_timestamp_idx; Type: INDEX; Schema: _timescaledb_internal; Owner: morgan
--

CREATE INDEX _hyper_8_279_chunk_new_sample_timestamp_idx ON _timescaledb_internal._hyper_8_279_chunk USING btree ("timestamp" DESC);


--
-- TOC entry 4587 (class 1259 OID 601252)
-- Name: _hyper_8_280_chunk_new_sample_timestamp_idx; Type: INDEX; Schema: _timescaledb_internal; Owner: morgan
--

CREATE INDEX _hyper_8_280_chunk_new_sample_timestamp_idx ON _timescaledb_internal._hyper_8_280_chunk USING btree ("timestamp" DESC);


--
-- TOC entry 4588 (class 1259 OID 601257)
-- Name: _hyper_8_281_chunk_new_sample_timestamp_idx; Type: INDEX; Schema: _timescaledb_internal; Owner: morgan
--

CREATE INDEX _hyper_8_281_chunk_new_sample_timestamp_idx ON _timescaledb_internal._hyper_8_281_chunk USING btree ("timestamp" DESC);


--
-- TOC entry 4589 (class 1259 OID 601262)
-- Name: _hyper_8_282_chunk_new_sample_timestamp_idx; Type: INDEX; Schema: _timescaledb_internal; Owner: morgan
--

CREATE INDEX _hyper_8_282_chunk_new_sample_timestamp_idx ON _timescaledb_internal._hyper_8_282_chunk USING btree ("timestamp" DESC);


--
-- TOC entry 4590 (class 1259 OID 601267)
-- Name: _hyper_8_283_chunk_new_sample_timestamp_idx; Type: INDEX; Schema: _timescaledb_internal; Owner: morgan
--

CREATE INDEX _hyper_8_283_chunk_new_sample_timestamp_idx ON _timescaledb_internal._hyper_8_283_chunk USING btree ("timestamp" DESC);


--
-- TOC entry 4591 (class 1259 OID 601272)
-- Name: _hyper_8_284_chunk_new_sample_timestamp_idx; Type: INDEX; Schema: _timescaledb_internal; Owner: morgan
--

CREATE INDEX _hyper_8_284_chunk_new_sample_timestamp_idx ON _timescaledb_internal._hyper_8_284_chunk USING btree ("timestamp" DESC);


--
-- TOC entry 4592 (class 1259 OID 601277)
-- Name: _hyper_8_285_chunk_new_sample_timestamp_idx; Type: INDEX; Schema: _timescaledb_internal; Owner: morgan
--

CREATE INDEX _hyper_8_285_chunk_new_sample_timestamp_idx ON _timescaledb_internal._hyper_8_285_chunk USING btree ("timestamp" DESC);


--
-- TOC entry 4593 (class 1259 OID 601282)
-- Name: _hyper_8_286_chunk_new_sample_timestamp_idx; Type: INDEX; Schema: _timescaledb_internal; Owner: morgan
--

CREATE INDEX _hyper_8_286_chunk_new_sample_timestamp_idx ON _timescaledb_internal._hyper_8_286_chunk USING btree ("timestamp" DESC);


--
-- TOC entry 4594 (class 1259 OID 601287)
-- Name: _hyper_8_287_chunk_new_sample_timestamp_idx; Type: INDEX; Schema: _timescaledb_internal; Owner: morgan
--

CREATE INDEX _hyper_8_287_chunk_new_sample_timestamp_idx ON _timescaledb_internal._hyper_8_287_chunk USING btree ("timestamp" DESC);


--
-- TOC entry 4595 (class 1259 OID 601292)
-- Name: _hyper_8_288_chunk_new_sample_timestamp_idx; Type: INDEX; Schema: _timescaledb_internal; Owner: morgan
--

CREATE INDEX _hyper_8_288_chunk_new_sample_timestamp_idx ON _timescaledb_internal._hyper_8_288_chunk USING btree ("timestamp" DESC);


--
-- TOC entry 4596 (class 1259 OID 601297)
-- Name: _hyper_8_289_chunk_new_sample_timestamp_idx; Type: INDEX; Schema: _timescaledb_internal; Owner: morgan
--

CREATE INDEX _hyper_8_289_chunk_new_sample_timestamp_idx ON _timescaledb_internal._hyper_8_289_chunk USING btree ("timestamp" DESC);


--
-- TOC entry 4597 (class 1259 OID 601302)
-- Name: _hyper_8_290_chunk_new_sample_timestamp_idx; Type: INDEX; Schema: _timescaledb_internal; Owner: morgan
--

CREATE INDEX _hyper_8_290_chunk_new_sample_timestamp_idx ON _timescaledb_internal._hyper_8_290_chunk USING btree ("timestamp" DESC);


--
-- TOC entry 4598 (class 1259 OID 601307)
-- Name: _hyper_8_291_chunk_new_sample_timestamp_idx; Type: INDEX; Schema: _timescaledb_internal; Owner: morgan
--

CREATE INDEX _hyper_8_291_chunk_new_sample_timestamp_idx ON _timescaledb_internal._hyper_8_291_chunk USING btree ("timestamp" DESC);


--
-- TOC entry 4599 (class 1259 OID 601312)
-- Name: _hyper_8_292_chunk_new_sample_timestamp_idx; Type: INDEX; Schema: _timescaledb_internal; Owner: morgan
--

CREATE INDEX _hyper_8_292_chunk_new_sample_timestamp_idx ON _timescaledb_internal._hyper_8_292_chunk USING btree ("timestamp" DESC);


--
-- TOC entry 4600 (class 1259 OID 601317)
-- Name: _hyper_8_293_chunk_new_sample_timestamp_idx; Type: INDEX; Schema: _timescaledb_internal; Owner: morgan
--

CREATE INDEX _hyper_8_293_chunk_new_sample_timestamp_idx ON _timescaledb_internal._hyper_8_293_chunk USING btree ("timestamp" DESC);


--
-- TOC entry 4601 (class 1259 OID 601322)
-- Name: _hyper_8_294_chunk_new_sample_timestamp_idx; Type: INDEX; Schema: _timescaledb_internal; Owner: morgan
--

CREATE INDEX _hyper_8_294_chunk_new_sample_timestamp_idx ON _timescaledb_internal._hyper_8_294_chunk USING btree ("timestamp" DESC);


--
-- TOC entry 4602 (class 1259 OID 601327)
-- Name: _hyper_8_295_chunk_new_sample_timestamp_idx; Type: INDEX; Schema: _timescaledb_internal; Owner: morgan
--

CREATE INDEX _hyper_8_295_chunk_new_sample_timestamp_idx ON _timescaledb_internal._hyper_8_295_chunk USING btree ("timestamp" DESC);


--
-- TOC entry 4603 (class 1259 OID 601332)
-- Name: _hyper_8_296_chunk_new_sample_timestamp_idx; Type: INDEX; Schema: _timescaledb_internal; Owner: morgan
--

CREATE INDEX _hyper_8_296_chunk_new_sample_timestamp_idx ON _timescaledb_internal._hyper_8_296_chunk USING btree ("timestamp" DESC);


--
-- TOC entry 4604 (class 1259 OID 601337)
-- Name: _hyper_8_297_chunk_new_sample_timestamp_idx; Type: INDEX; Schema: _timescaledb_internal; Owner: morgan
--

CREATE INDEX _hyper_8_297_chunk_new_sample_timestamp_idx ON _timescaledb_internal._hyper_8_297_chunk USING btree ("timestamp" DESC);


--
-- TOC entry 4605 (class 1259 OID 601342)
-- Name: _hyper_8_298_chunk_new_sample_timestamp_idx; Type: INDEX; Schema: _timescaledb_internal; Owner: morgan
--

CREATE INDEX _hyper_8_298_chunk_new_sample_timestamp_idx ON _timescaledb_internal._hyper_8_298_chunk USING btree ("timestamp" DESC);


--
-- TOC entry 4606 (class 1259 OID 601347)
-- Name: _hyper_8_299_chunk_new_sample_timestamp_idx; Type: INDEX; Schema: _timescaledb_internal; Owner: morgan
--

CREATE INDEX _hyper_8_299_chunk_new_sample_timestamp_idx ON _timescaledb_internal._hyper_8_299_chunk USING btree ("timestamp" DESC);


--
-- TOC entry 4607 (class 1259 OID 601352)
-- Name: _hyper_8_300_chunk_new_sample_timestamp_idx; Type: INDEX; Schema: _timescaledb_internal; Owner: morgan
--

CREATE INDEX _hyper_8_300_chunk_new_sample_timestamp_idx ON _timescaledb_internal._hyper_8_300_chunk USING btree ("timestamp" DESC);


--
-- TOC entry 4608 (class 1259 OID 601357)
-- Name: _hyper_8_301_chunk_new_sample_timestamp_idx; Type: INDEX; Schema: _timescaledb_internal; Owner: morgan
--

CREATE INDEX _hyper_8_301_chunk_new_sample_timestamp_idx ON _timescaledb_internal._hyper_8_301_chunk USING btree ("timestamp" DESC);


--
-- TOC entry 4609 (class 1259 OID 601362)
-- Name: _hyper_8_302_chunk_new_sample_timestamp_idx; Type: INDEX; Schema: _timescaledb_internal; Owner: morgan
--

CREATE INDEX _hyper_8_302_chunk_new_sample_timestamp_idx ON _timescaledb_internal._hyper_8_302_chunk USING btree ("timestamp" DESC);


--
-- TOC entry 4610 (class 1259 OID 601367)
-- Name: _hyper_8_303_chunk_new_sample_timestamp_idx; Type: INDEX; Schema: _timescaledb_internal; Owner: morgan
--

CREATE INDEX _hyper_8_303_chunk_new_sample_timestamp_idx ON _timescaledb_internal._hyper_8_303_chunk USING btree ("timestamp" DESC);


--
-- TOC entry 4611 (class 1259 OID 601372)
-- Name: _hyper_8_304_chunk_new_sample_timestamp_idx; Type: INDEX; Schema: _timescaledb_internal; Owner: morgan
--

CREATE INDEX _hyper_8_304_chunk_new_sample_timestamp_idx ON _timescaledb_internal._hyper_8_304_chunk USING btree ("timestamp" DESC);


--
-- TOC entry 4612 (class 1259 OID 601377)
-- Name: _hyper_8_305_chunk_new_sample_timestamp_idx; Type: INDEX; Schema: _timescaledb_internal; Owner: morgan
--

CREATE INDEX _hyper_8_305_chunk_new_sample_timestamp_idx ON _timescaledb_internal._hyper_8_305_chunk USING btree ("timestamp" DESC);


--
-- TOC entry 4613 (class 1259 OID 601382)
-- Name: _hyper_8_306_chunk_new_sample_timestamp_idx; Type: INDEX; Schema: _timescaledb_internal; Owner: morgan
--

CREATE INDEX _hyper_8_306_chunk_new_sample_timestamp_idx ON _timescaledb_internal._hyper_8_306_chunk USING btree ("timestamp" DESC);


--
-- TOC entry 4614 (class 1259 OID 601387)
-- Name: _hyper_8_307_chunk_new_sample_timestamp_idx; Type: INDEX; Schema: _timescaledb_internal; Owner: morgan
--

CREATE INDEX _hyper_8_307_chunk_new_sample_timestamp_idx ON _timescaledb_internal._hyper_8_307_chunk USING btree ("timestamp" DESC);


--
-- TOC entry 4615 (class 1259 OID 601392)
-- Name: _hyper_8_308_chunk_new_sample_timestamp_idx; Type: INDEX; Schema: _timescaledb_internal; Owner: morgan
--

CREATE INDEX _hyper_8_308_chunk_new_sample_timestamp_idx ON _timescaledb_internal._hyper_8_308_chunk USING btree ("timestamp" DESC);


--
-- TOC entry 4616 (class 1259 OID 601397)
-- Name: _hyper_8_309_chunk_new_sample_timestamp_idx; Type: INDEX; Schema: _timescaledb_internal; Owner: morgan
--

CREATE INDEX _hyper_8_309_chunk_new_sample_timestamp_idx ON _timescaledb_internal._hyper_8_309_chunk USING btree ("timestamp" DESC);


--
-- TOC entry 4617 (class 1259 OID 601402)
-- Name: _hyper_8_310_chunk_new_sample_timestamp_idx; Type: INDEX; Schema: _timescaledb_internal; Owner: morgan
--

CREATE INDEX _hyper_8_310_chunk_new_sample_timestamp_idx ON _timescaledb_internal._hyper_8_310_chunk USING btree ("timestamp" DESC);


--
-- TOC entry 4618 (class 1259 OID 601407)
-- Name: _hyper_8_311_chunk_new_sample_timestamp_idx; Type: INDEX; Schema: _timescaledb_internal; Owner: morgan
--

CREATE INDEX _hyper_8_311_chunk_new_sample_timestamp_idx ON _timescaledb_internal._hyper_8_311_chunk USING btree ("timestamp" DESC);


--
-- TOC entry 4619 (class 1259 OID 601412)
-- Name: _hyper_8_312_chunk_new_sample_timestamp_idx; Type: INDEX; Schema: _timescaledb_internal; Owner: morgan
--

CREATE INDEX _hyper_8_312_chunk_new_sample_timestamp_idx ON _timescaledb_internal._hyper_8_312_chunk USING btree ("timestamp" DESC);


--
-- TOC entry 4620 (class 1259 OID 601417)
-- Name: _hyper_8_313_chunk_new_sample_timestamp_idx; Type: INDEX; Schema: _timescaledb_internal; Owner: morgan
--

CREATE INDEX _hyper_8_313_chunk_new_sample_timestamp_idx ON _timescaledb_internal._hyper_8_313_chunk USING btree ("timestamp" DESC);


--
-- TOC entry 4621 (class 1259 OID 601422)
-- Name: _hyper_8_314_chunk_new_sample_timestamp_idx; Type: INDEX; Schema: _timescaledb_internal; Owner: morgan
--

CREATE INDEX _hyper_8_314_chunk_new_sample_timestamp_idx ON _timescaledb_internal._hyper_8_314_chunk USING btree ("timestamp" DESC);


--
-- TOC entry 4622 (class 1259 OID 601427)
-- Name: _hyper_8_315_chunk_new_sample_timestamp_idx; Type: INDEX; Schema: _timescaledb_internal; Owner: morgan
--

CREATE INDEX _hyper_8_315_chunk_new_sample_timestamp_idx ON _timescaledb_internal._hyper_8_315_chunk USING btree ("timestamp" DESC);


--
-- TOC entry 4623 (class 1259 OID 601432)
-- Name: _hyper_8_316_chunk_new_sample_timestamp_idx; Type: INDEX; Schema: _timescaledb_internal; Owner: morgan
--

CREATE INDEX _hyper_8_316_chunk_new_sample_timestamp_idx ON _timescaledb_internal._hyper_8_316_chunk USING btree ("timestamp" DESC);


--
-- TOC entry 4624 (class 1259 OID 601437)
-- Name: _hyper_8_317_chunk_new_sample_timestamp_idx; Type: INDEX; Schema: _timescaledb_internal; Owner: morgan
--

CREATE INDEX _hyper_8_317_chunk_new_sample_timestamp_idx ON _timescaledb_internal._hyper_8_317_chunk USING btree ("timestamp" DESC);


--
-- TOC entry 4625 (class 1259 OID 601442)
-- Name: _hyper_8_318_chunk_new_sample_timestamp_idx; Type: INDEX; Schema: _timescaledb_internal; Owner: morgan
--

CREATE INDEX _hyper_8_318_chunk_new_sample_timestamp_idx ON _timescaledb_internal._hyper_8_318_chunk USING btree ("timestamp" DESC);


--
-- TOC entry 4626 (class 1259 OID 601447)
-- Name: _hyper_8_319_chunk_new_sample_timestamp_idx; Type: INDEX; Schema: _timescaledb_internal; Owner: morgan
--

CREATE INDEX _hyper_8_319_chunk_new_sample_timestamp_idx ON _timescaledb_internal._hyper_8_319_chunk USING btree ("timestamp" DESC);


--
-- TOC entry 4627 (class 1259 OID 601452)
-- Name: _hyper_8_320_chunk_new_sample_timestamp_idx; Type: INDEX; Schema: _timescaledb_internal; Owner: morgan
--

CREATE INDEX _hyper_8_320_chunk_new_sample_timestamp_idx ON _timescaledb_internal._hyper_8_320_chunk USING btree ("timestamp" DESC);


--
-- TOC entry 4628 (class 1259 OID 601457)
-- Name: _hyper_8_321_chunk_new_sample_timestamp_idx; Type: INDEX; Schema: _timescaledb_internal; Owner: morgan
--

CREATE INDEX _hyper_8_321_chunk_new_sample_timestamp_idx ON _timescaledb_internal._hyper_8_321_chunk USING btree ("timestamp" DESC);


--
-- TOC entry 4629 (class 1259 OID 601462)
-- Name: _hyper_8_322_chunk_new_sample_timestamp_idx; Type: INDEX; Schema: _timescaledb_internal; Owner: morgan
--

CREATE INDEX _hyper_8_322_chunk_new_sample_timestamp_idx ON _timescaledb_internal._hyper_8_322_chunk USING btree ("timestamp" DESC);


--
-- TOC entry 4630 (class 1259 OID 601467)
-- Name: _hyper_8_323_chunk_new_sample_timestamp_idx; Type: INDEX; Schema: _timescaledb_internal; Owner: morgan
--

CREATE INDEX _hyper_8_323_chunk_new_sample_timestamp_idx ON _timescaledb_internal._hyper_8_323_chunk USING btree ("timestamp" DESC);


--
-- TOC entry 4631 (class 1259 OID 601472)
-- Name: _hyper_8_324_chunk_new_sample_timestamp_idx; Type: INDEX; Schema: _timescaledb_internal; Owner: morgan
--

CREATE INDEX _hyper_8_324_chunk_new_sample_timestamp_idx ON _timescaledb_internal._hyper_8_324_chunk USING btree ("timestamp" DESC);


--
-- TOC entry 4632 (class 1259 OID 601477)
-- Name: _hyper_8_325_chunk_new_sample_timestamp_idx; Type: INDEX; Schema: _timescaledb_internal; Owner: morgan
--

CREATE INDEX _hyper_8_325_chunk_new_sample_timestamp_idx ON _timescaledb_internal._hyper_8_325_chunk USING btree ("timestamp" DESC);


--
-- TOC entry 4633 (class 1259 OID 601482)
-- Name: _hyper_8_326_chunk_new_sample_timestamp_idx; Type: INDEX; Schema: _timescaledb_internal; Owner: morgan
--

CREATE INDEX _hyper_8_326_chunk_new_sample_timestamp_idx ON _timescaledb_internal._hyper_8_326_chunk USING btree ("timestamp" DESC);


--
-- TOC entry 4634 (class 1259 OID 601487)
-- Name: _hyper_8_327_chunk_new_sample_timestamp_idx; Type: INDEX; Schema: _timescaledb_internal; Owner: morgan
--

CREATE INDEX _hyper_8_327_chunk_new_sample_timestamp_idx ON _timescaledb_internal._hyper_8_327_chunk USING btree ("timestamp" DESC);


--
-- TOC entry 4635 (class 1259 OID 601492)
-- Name: _hyper_8_328_chunk_new_sample_timestamp_idx; Type: INDEX; Schema: _timescaledb_internal; Owner: morgan
--

CREATE INDEX _hyper_8_328_chunk_new_sample_timestamp_idx ON _timescaledb_internal._hyper_8_328_chunk USING btree ("timestamp" DESC);


--
-- TOC entry 4636 (class 1259 OID 601497)
-- Name: _hyper_8_329_chunk_new_sample_timestamp_idx; Type: INDEX; Schema: _timescaledb_internal; Owner: morgan
--

CREATE INDEX _hyper_8_329_chunk_new_sample_timestamp_idx ON _timescaledb_internal._hyper_8_329_chunk USING btree ("timestamp" DESC);


--
-- TOC entry 4637 (class 1259 OID 601502)
-- Name: _hyper_8_330_chunk_new_sample_timestamp_idx; Type: INDEX; Schema: _timescaledb_internal; Owner: morgan
--

CREATE INDEX _hyper_8_330_chunk_new_sample_timestamp_idx ON _timescaledb_internal._hyper_8_330_chunk USING btree ("timestamp" DESC);


--
-- TOC entry 4638 (class 1259 OID 601507)
-- Name: _hyper_8_331_chunk_new_sample_timestamp_idx; Type: INDEX; Schema: _timescaledb_internal; Owner: morgan
--

CREATE INDEX _hyper_8_331_chunk_new_sample_timestamp_idx ON _timescaledb_internal._hyper_8_331_chunk USING btree ("timestamp" DESC);


--
-- TOC entry 4639 (class 1259 OID 601514)
-- Name: _hyper_8_332_chunk_new_sample_timestamp_idx; Type: INDEX; Schema: _timescaledb_internal; Owner: morgan
--

CREATE INDEX _hyper_8_332_chunk_new_sample_timestamp_idx ON _timescaledb_internal._hyper_8_332_chunk USING btree ("timestamp" DESC);


--
-- TOC entry 4640 (class 1259 OID 601519)
-- Name: _hyper_8_333_chunk_new_sample_timestamp_idx; Type: INDEX; Schema: _timescaledb_internal; Owner: morgan
--

CREATE INDEX _hyper_8_333_chunk_new_sample_timestamp_idx ON _timescaledb_internal._hyper_8_333_chunk USING btree ("timestamp" DESC);


--
-- TOC entry 4641 (class 1259 OID 601524)
-- Name: _hyper_8_334_chunk_new_sample_timestamp_idx; Type: INDEX; Schema: _timescaledb_internal; Owner: morgan
--

CREATE INDEX _hyper_8_334_chunk_new_sample_timestamp_idx ON _timescaledb_internal._hyper_8_334_chunk USING btree ("timestamp" DESC);


--
-- TOC entry 4642 (class 1259 OID 601529)
-- Name: _hyper_8_335_chunk_new_sample_timestamp_idx; Type: INDEX; Schema: _timescaledb_internal; Owner: morgan
--

CREATE INDEX _hyper_8_335_chunk_new_sample_timestamp_idx ON _timescaledb_internal._hyper_8_335_chunk USING btree ("timestamp" DESC);


--
-- TOC entry 4643 (class 1259 OID 601534)
-- Name: _hyper_8_336_chunk_new_sample_timestamp_idx; Type: INDEX; Schema: _timescaledb_internal; Owner: morgan
--

CREATE INDEX _hyper_8_336_chunk_new_sample_timestamp_idx ON _timescaledb_internal._hyper_8_336_chunk USING btree ("timestamp" DESC);


--
-- TOC entry 4644 (class 1259 OID 601539)
-- Name: _hyper_8_337_chunk_new_sample_timestamp_idx; Type: INDEX; Schema: _timescaledb_internal; Owner: morgan
--

CREATE INDEX _hyper_8_337_chunk_new_sample_timestamp_idx ON _timescaledb_internal._hyper_8_337_chunk USING btree ("timestamp" DESC);


--
-- TOC entry 4645 (class 1259 OID 601544)
-- Name: _hyper_8_338_chunk_new_sample_timestamp_idx; Type: INDEX; Schema: _timescaledb_internal; Owner: morgan
--

CREATE INDEX _hyper_8_338_chunk_new_sample_timestamp_idx ON _timescaledb_internal._hyper_8_338_chunk USING btree ("timestamp" DESC);


--
-- TOC entry 4646 (class 1259 OID 601549)
-- Name: _hyper_8_339_chunk_new_sample_timestamp_idx; Type: INDEX; Schema: _timescaledb_internal; Owner: morgan
--

CREATE INDEX _hyper_8_339_chunk_new_sample_timestamp_idx ON _timescaledb_internal._hyper_8_339_chunk USING btree ("timestamp" DESC);


--
-- TOC entry 4647 (class 1259 OID 601554)
-- Name: _hyper_8_340_chunk_new_sample_timestamp_idx; Type: INDEX; Schema: _timescaledb_internal; Owner: morgan
--

CREATE INDEX _hyper_8_340_chunk_new_sample_timestamp_idx ON _timescaledb_internal._hyper_8_340_chunk USING btree ("timestamp" DESC);


--
-- TOC entry 4648 (class 1259 OID 601559)
-- Name: _hyper_8_341_chunk_new_sample_timestamp_idx; Type: INDEX; Schema: _timescaledb_internal; Owner: morgan
--

CREATE INDEX _hyper_8_341_chunk_new_sample_timestamp_idx ON _timescaledb_internal._hyper_8_341_chunk USING btree ("timestamp" DESC);


--
-- TOC entry 4649 (class 1259 OID 601564)
-- Name: _hyper_8_342_chunk_new_sample_timestamp_idx; Type: INDEX; Schema: _timescaledb_internal; Owner: morgan
--

CREATE INDEX _hyper_8_342_chunk_new_sample_timestamp_idx ON _timescaledb_internal._hyper_8_342_chunk USING btree ("timestamp" DESC);


--
-- TOC entry 4650 (class 1259 OID 601569)
-- Name: _hyper_8_343_chunk_new_sample_timestamp_idx; Type: INDEX; Schema: _timescaledb_internal; Owner: morgan
--

CREATE INDEX _hyper_8_343_chunk_new_sample_timestamp_idx ON _timescaledb_internal._hyper_8_343_chunk USING btree ("timestamp" DESC);


--
-- TOC entry 4651 (class 1259 OID 601574)
-- Name: _hyper_8_344_chunk_new_sample_timestamp_idx; Type: INDEX; Schema: _timescaledb_internal; Owner: morgan
--

CREATE INDEX _hyper_8_344_chunk_new_sample_timestamp_idx ON _timescaledb_internal._hyper_8_344_chunk USING btree ("timestamp" DESC);


--
-- TOC entry 4652 (class 1259 OID 601579)
-- Name: _hyper_8_345_chunk_new_sample_timestamp_idx; Type: INDEX; Schema: _timescaledb_internal; Owner: morgan
--

CREATE INDEX _hyper_8_345_chunk_new_sample_timestamp_idx ON _timescaledb_internal._hyper_8_345_chunk USING btree ("timestamp" DESC);


--
-- TOC entry 4653 (class 1259 OID 601584)
-- Name: _hyper_8_346_chunk_new_sample_timestamp_idx; Type: INDEX; Schema: _timescaledb_internal; Owner: morgan
--

CREATE INDEX _hyper_8_346_chunk_new_sample_timestamp_idx ON _timescaledb_internal._hyper_8_346_chunk USING btree ("timestamp" DESC);


--
-- TOC entry 4654 (class 1259 OID 601589)
-- Name: _hyper_8_347_chunk_new_sample_timestamp_idx; Type: INDEX; Schema: _timescaledb_internal; Owner: morgan
--

CREATE INDEX _hyper_8_347_chunk_new_sample_timestamp_idx ON _timescaledb_internal._hyper_8_347_chunk USING btree ("timestamp" DESC);


--
-- TOC entry 4655 (class 1259 OID 601594)
-- Name: _hyper_8_348_chunk_new_sample_timestamp_idx; Type: INDEX; Schema: _timescaledb_internal; Owner: morgan
--

CREATE INDEX _hyper_8_348_chunk_new_sample_timestamp_idx ON _timescaledb_internal._hyper_8_348_chunk USING btree ("timestamp" DESC);


--
-- TOC entry 4656 (class 1259 OID 601599)
-- Name: _hyper_8_349_chunk_new_sample_timestamp_idx; Type: INDEX; Schema: _timescaledb_internal; Owner: morgan
--

CREATE INDEX _hyper_8_349_chunk_new_sample_timestamp_idx ON _timescaledb_internal._hyper_8_349_chunk USING btree ("timestamp" DESC);


--
-- TOC entry 4657 (class 1259 OID 601604)
-- Name: _hyper_8_350_chunk_new_sample_timestamp_idx; Type: INDEX; Schema: _timescaledb_internal; Owner: morgan
--

CREATE INDEX _hyper_8_350_chunk_new_sample_timestamp_idx ON _timescaledb_internal._hyper_8_350_chunk USING btree ("timestamp" DESC);


--
-- TOC entry 4397 (class 1259 OID 600302)
-- Name: _hyper_8_90_chunk_new_sample_timestamp_idx; Type: INDEX; Schema: _timescaledb_internal; Owner: morgan
--

CREATE INDEX _hyper_8_90_chunk_new_sample_timestamp_idx ON _timescaledb_internal._hyper_8_90_chunk USING btree ("timestamp" DESC);


--
-- TOC entry 4398 (class 1259 OID 600307)
-- Name: _hyper_8_91_chunk_new_sample_timestamp_idx; Type: INDEX; Schema: _timescaledb_internal; Owner: morgan
--

CREATE INDEX _hyper_8_91_chunk_new_sample_timestamp_idx ON _timescaledb_internal._hyper_8_91_chunk USING btree ("timestamp" DESC);


--
-- TOC entry 4399 (class 1259 OID 600312)
-- Name: _hyper_8_92_chunk_new_sample_timestamp_idx; Type: INDEX; Schema: _timescaledb_internal; Owner: morgan
--

CREATE INDEX _hyper_8_92_chunk_new_sample_timestamp_idx ON _timescaledb_internal._hyper_8_92_chunk USING btree ("timestamp" DESC);


--
-- TOC entry 4400 (class 1259 OID 600317)
-- Name: _hyper_8_93_chunk_new_sample_timestamp_idx; Type: INDEX; Schema: _timescaledb_internal; Owner: morgan
--

CREATE INDEX _hyper_8_93_chunk_new_sample_timestamp_idx ON _timescaledb_internal._hyper_8_93_chunk USING btree ("timestamp" DESC);


--
-- TOC entry 4401 (class 1259 OID 600322)
-- Name: _hyper_8_94_chunk_new_sample_timestamp_idx; Type: INDEX; Schema: _timescaledb_internal; Owner: morgan
--

CREATE INDEX _hyper_8_94_chunk_new_sample_timestamp_idx ON _timescaledb_internal._hyper_8_94_chunk USING btree ("timestamp" DESC);


--
-- TOC entry 4402 (class 1259 OID 600327)
-- Name: _hyper_8_95_chunk_new_sample_timestamp_idx; Type: INDEX; Schema: _timescaledb_internal; Owner: morgan
--

CREATE INDEX _hyper_8_95_chunk_new_sample_timestamp_idx ON _timescaledb_internal._hyper_8_95_chunk USING btree ("timestamp" DESC);


--
-- TOC entry 4403 (class 1259 OID 600332)
-- Name: _hyper_8_96_chunk_new_sample_timestamp_idx; Type: INDEX; Schema: _timescaledb_internal; Owner: morgan
--

CREATE INDEX _hyper_8_96_chunk_new_sample_timestamp_idx ON _timescaledb_internal._hyper_8_96_chunk USING btree ("timestamp" DESC);


--
-- TOC entry 4404 (class 1259 OID 600337)
-- Name: _hyper_8_97_chunk_new_sample_timestamp_idx; Type: INDEX; Schema: _timescaledb_internal; Owner: morgan
--

CREATE INDEX _hyper_8_97_chunk_new_sample_timestamp_idx ON _timescaledb_internal._hyper_8_97_chunk USING btree ("timestamp" DESC);


--
-- TOC entry 4405 (class 1259 OID 600342)
-- Name: _hyper_8_98_chunk_new_sample_timestamp_idx; Type: INDEX; Schema: _timescaledb_internal; Owner: morgan
--

CREATE INDEX _hyper_8_98_chunk_new_sample_timestamp_idx ON _timescaledb_internal._hyper_8_98_chunk USING btree ("timestamp" DESC);


--
-- TOC entry 4406 (class 1259 OID 600347)
-- Name: _hyper_8_99_chunk_new_sample_timestamp_idx; Type: INDEX; Schema: _timescaledb_internal; Owner: morgan
--

CREATE INDEX _hyper_8_99_chunk_new_sample_timestamp_idx ON _timescaledb_internal._hyper_8_99_chunk USING btree ("timestamp" DESC);


--
-- TOC entry 4396 (class 1259 OID 600297)
-- Name: new_sample_timestamp_idx; Type: INDEX; Schema: public; Owner: morgan
--

CREATE INDEX new_sample_timestamp_idx ON public.new_sample USING btree ("timestamp" DESC);


--
-- TOC entry 4353 (class 1259 OID 182228)
-- Name: old_sample_physical_quantity_id_power_source_id_timestamp_idx; Type: INDEX; Schema: public; Owner: morgan
--

CREATE INDEX old_sample_physical_quantity_id_power_source_id_timestamp_idx ON public.sample USING btree (physical_quantity_id, power_source_id, "timestamp");


--
-- TOC entry 4666 (class 2620 OID 600296)
-- Name: new_sample ts_insert_blocker; Type: TRIGGER; Schema: public; Owner: morgan
--

CREATE TRIGGER ts_insert_blocker BEFORE INSERT ON public.new_sample FOR EACH ROW EXECUTE PROCEDURE _timescaledb_internal.insert_blocker();


--
-- TOC entry 4659 (class 2606 OID 27590)
-- Name: aggregate aggregate_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: morgan
--

ALTER TABLE ONLY public.aggregate
    ADD CONSTRAINT aggregate_id_fkey FOREIGN KEY (id) REFERENCES public.power_source(id);


--
-- TOC entry 4658 (class 2606 OID 501477)
-- Name: aggregate aggregate_parent_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: morgan
--

ALTER TABLE ONLY public.aggregate
    ADD CONSTRAINT aggregate_parent_id_fkey FOREIGN KEY (parent_id) REFERENCES public.aggregate(id);


--
-- TOC entry 4662 (class 2606 OID 27595)
-- Name: appliance appliance_aggregate_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: morgan
--

ALTER TABLE ONLY public.appliance
    ADD CONSTRAINT appliance_aggregate_id_fkey FOREIGN KEY (aggregate_id) REFERENCES public.aggregate(id);


--
-- TOC entry 4661 (class 2606 OID 27600)
-- Name: appliance appliance_appliance_type_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: morgan
--

ALTER TABLE ONLY public.appliance
    ADD CONSTRAINT appliance_appliance_type_id_fkey FOREIGN KEY (appliance_type_id) REFERENCES public.appliance_type(id);


--
-- TOC entry 4660 (class 2606 OID 27605)
-- Name: appliance appliance_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: morgan
--

ALTER TABLE ONLY public.appliance
    ADD CONSTRAINT appliance_id_fkey FOREIGN KEY (id) REFERENCES public.power_source(id);


--
-- TOC entry 4663 (class 2606 OID 27610)
-- Name: power_source power_source_origin_dataset_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: morgan
--

ALTER TABLE ONLY public.power_source
    ADD CONSTRAINT power_source_origin_dataset_id_fkey FOREIGN KEY (origin_dataset_id) REFERENCES public.origin_dataset(id);


--
-- TOC entry 4665 (class 2606 OID 27615)
-- Name: sample sample_physical_quantity_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: morgan
--

ALTER TABLE ONLY public.sample
    ADD CONSTRAINT sample_physical_quantity_id_fkey FOREIGN KEY (physical_quantity_id) REFERENCES public.physical_quantity(id);


--
-- TOC entry 4664 (class 2606 OID 27620)
-- Name: sample sample_power_source_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: morgan
--

ALTER TABLE ONLY public.sample
    ADD CONSTRAINT sample_power_source_id_fkey FOREIGN KEY (power_source_id) REFERENCES public.power_source(id);


-- Completed on 2019-06-25 17:41:00

--
-- PostgreSQL database dump complete
--

