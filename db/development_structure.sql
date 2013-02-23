--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = off;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET escape_string_warning = off;

SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: alternativas; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE alternativas (
    id integer NOT NULL,
    grupo_de_questoes_id integer,
    descricao character varying(255),
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    numero integer
);


--
-- Name: alternativas_dados_demograficos; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE alternativas_dados_demograficos (
    id integer NOT NULL,
    dado_demografico_id integer,
    descricao character varying(255),
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    numero integer
);


--
-- Name: alternativas_dados_demograficos_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE alternativas_dados_demograficos_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- Name: alternativas_dados_demograficos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE alternativas_dados_demograficos_id_seq OWNED BY alternativas_dados_demograficos.id;


--
-- Name: alternativas_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE alternativas_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- Name: alternativas_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE alternativas_id_seq OWNED BY alternativas.id;


--
-- Name: dados_demograficos; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE dados_demograficos (
    id integer NOT NULL,
    pesquisa_id integer,
    questao character varying(255),
    tipo character varying(255),
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    questao_obrigatoria boolean,
    numero integer
);


--
-- Name: dados_demograficos_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE dados_demograficos_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- Name: dados_demograficos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE dados_demograficos_id_seq OWNED BY dados_demograficos.id;


--
-- Name: grupos_de_questoes; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE grupos_de_questoes (
    id integer NOT NULL,
    descricao character varying(255),
    tipo character varying(255),
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    pesquisa_id integer
);


--
-- Name: grupos_de_questoes_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE grupos_de_questoes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- Name: grupos_de_questoes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE grupos_de_questoes_id_seq OWNED BY grupos_de_questoes.id;


--
-- Name: pesquisas; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE pesquisas (
    id integer NOT NULL,
    titulo character varying(255),
    texto_introdutorio text,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


--
-- Name: pesquisas_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE pesquisas_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- Name: pesquisas_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE pesquisas_id_seq OWNED BY pesquisas.id;


--
-- Name: questoes; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE questoes (
    id integer NOT NULL,
    descricao text,
    grupo_de_questoes_id integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    questao_obrigatoria boolean,
    numero integer
);


--
-- Name: questoes_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE questoes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- Name: questoes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE questoes_id_seq OWNED BY questoes.id;


--
-- Name: respostas_dados_demograficos; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE respostas_dados_demograficos (
    id integer NOT NULL,
    dado_demografico_id integer,
    alternativa_dado_demografico_id integer,
    respostas_pesquisa_id integer,
    resposta character varying(255),
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


--
-- Name: respostas_dados_demograficos_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE respostas_dados_demograficos_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- Name: respostas_dados_demograficos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE respostas_dados_demograficos_id_seq OWNED BY respostas_dados_demograficos.id;


--
-- Name: respostas_pesquisas; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE respostas_pesquisas (
    id integer NOT NULL,
    pesquisa_id integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


--
-- Name: respostas_pesquisas_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE respostas_pesquisas_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- Name: respostas_pesquisas_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE respostas_pesquisas_id_seq OWNED BY respostas_pesquisas.id;


--
-- Name: respostas_questoes; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE respostas_questoes (
    id integer NOT NULL,
    questao_id integer,
    alternativa_id integer,
    respostas_pesquisa_id integer,
    resposta character varying(255),
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


--
-- Name: respostas_questoes_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE respostas_questoes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- Name: respostas_questoes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE respostas_questoes_id_seq OWNED BY respostas_questoes.id;


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE schema_migrations (
    version character varying(255) NOT NULL
);


--
-- Name: usuarios; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE usuarios (
    id integer NOT NULL,
    usuario character varying(255),
    senha character varying(255),
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


--
-- Name: usuarios_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE usuarios_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- Name: usuarios_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE usuarios_id_seq OWNED BY usuarios.id;


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE alternativas ALTER COLUMN id SET DEFAULT nextval('alternativas_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE alternativas_dados_demograficos ALTER COLUMN id SET DEFAULT nextval('alternativas_dados_demograficos_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE dados_demograficos ALTER COLUMN id SET DEFAULT nextval('dados_demograficos_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE grupos_de_questoes ALTER COLUMN id SET DEFAULT nextval('grupos_de_questoes_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE pesquisas ALTER COLUMN id SET DEFAULT nextval('pesquisas_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE questoes ALTER COLUMN id SET DEFAULT nextval('questoes_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE respostas_dados_demograficos ALTER COLUMN id SET DEFAULT nextval('respostas_dados_demograficos_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE respostas_pesquisas ALTER COLUMN id SET DEFAULT nextval('respostas_pesquisas_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE respostas_questoes ALTER COLUMN id SET DEFAULT nextval('respostas_questoes_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE usuarios ALTER COLUMN id SET DEFAULT nextval('usuarios_id_seq'::regclass);


--
-- Name: alternativas_dados_demograficos_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY alternativas_dados_demograficos
    ADD CONSTRAINT alternativas_dados_demograficos_pkey PRIMARY KEY (id);


--
-- Name: alternativas_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY alternativas
    ADD CONSTRAINT alternativas_pkey PRIMARY KEY (id);


--
-- Name: dados_demograficos_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY dados_demograficos
    ADD CONSTRAINT dados_demograficos_pkey PRIMARY KEY (id);


--
-- Name: grupos_de_questoes_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY grupos_de_questoes
    ADD CONSTRAINT grupos_de_questoes_pkey PRIMARY KEY (id);


--
-- Name: pesquisas_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY pesquisas
    ADD CONSTRAINT pesquisas_pkey PRIMARY KEY (id);


--
-- Name: questoes_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY questoes
    ADD CONSTRAINT questoes_pkey PRIMARY KEY (id);


--
-- Name: respostas_dados_demograficos_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY respostas_dados_demograficos
    ADD CONSTRAINT respostas_dados_demograficos_pkey PRIMARY KEY (id);


--
-- Name: respostas_pesquisas_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY respostas_pesquisas
    ADD CONSTRAINT respostas_pesquisas_pkey PRIMARY KEY (id);


--
-- Name: respostas_questoes_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY respostas_questoes
    ADD CONSTRAINT respostas_questoes_pkey PRIMARY KEY (id);


--
-- Name: usuarios_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY usuarios
    ADD CONSTRAINT usuarios_pkey PRIMARY KEY (id);


--
-- Name: unique_schema_migrations; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE UNIQUE INDEX unique_schema_migrations ON schema_migrations USING btree (version);


--
-- Name: fk_alternativas_dados_demograficos_dado_demografico_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternativas_dados_demograficos
    ADD CONSTRAINT fk_alternativas_dados_demograficos_dado_demografico_id FOREIGN KEY (dado_demografico_id) REFERENCES dados_demograficos(id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: fk_alternativas_grupo_de_questoes_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternativas
    ADD CONSTRAINT fk_alternativas_grupo_de_questoes_id FOREIGN KEY (grupo_de_questoes_id) REFERENCES grupos_de_questoes(id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: fk_dados_demograficos_pesquisa_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dados_demograficos
    ADD CONSTRAINT fk_dados_demograficos_pesquisa_id FOREIGN KEY (pesquisa_id) REFERENCES pesquisas(id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: fk_grupos_de_questoes_pesquisa_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY grupos_de_questoes
    ADD CONSTRAINT fk_grupos_de_questoes_pesquisa_id FOREIGN KEY (pesquisa_id) REFERENCES pesquisas(id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: fk_questoes_grupo_de_questoes_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY questoes
    ADD CONSTRAINT fk_questoes_grupo_de_questoes_id FOREIGN KEY (grupo_de_questoes_id) REFERENCES grupos_de_questoes(id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: fk_respostas_dados_demograficos_alternativa_dado_demografico_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY respostas_dados_demograficos
    ADD CONSTRAINT fk_respostas_dados_demograficos_alternativa_dado_demografico_id FOREIGN KEY (alternativa_dado_demografico_id) REFERENCES alternativas_dados_demograficos(id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: fk_respostas_dados_demograficos_dado_demografico_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY respostas_dados_demograficos
    ADD CONSTRAINT fk_respostas_dados_demograficos_dado_demografico_id FOREIGN KEY (dado_demografico_id) REFERENCES dados_demograficos(id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: fk_respostas_dados_demograficos_respostas_pesquisa_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY respostas_dados_demograficos
    ADD CONSTRAINT fk_respostas_dados_demograficos_respostas_pesquisa_id FOREIGN KEY (respostas_pesquisa_id) REFERENCES respostas_pesquisas(id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: fk_respostas_pesquisas_pesquisa_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY respostas_pesquisas
    ADD CONSTRAINT fk_respostas_pesquisas_pesquisa_id FOREIGN KEY (pesquisa_id) REFERENCES pesquisas(id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: fk_respostas_questoes_alternativa_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY respostas_questoes
    ADD CONSTRAINT fk_respostas_questoes_alternativa_id FOREIGN KEY (alternativa_id) REFERENCES alternativas(id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: fk_respostas_questoes_questao_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY respostas_questoes
    ADD CONSTRAINT fk_respostas_questoes_questao_id FOREIGN KEY (questao_id) REFERENCES questoes(id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: fk_respostas_questoes_respostas_pesquisa_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY respostas_questoes
    ADD CONSTRAINT fk_respostas_questoes_respostas_pesquisa_id FOREIGN KEY (respostas_pesquisa_id) REFERENCES respostas_pesquisas(id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- PostgreSQL database dump complete
--

INSERT INTO schema_migrations (version) VALUES ('20090406235433');

INSERT INTO schema_migrations (version) VALUES ('20090521004718');

INSERT INTO schema_migrations (version) VALUES ('20090521014044');

INSERT INTO schema_migrations (version) VALUES ('20090616231152');

INSERT INTO schema_migrations (version) VALUES ('20090616233847');

INSERT INTO schema_migrations (version) VALUES ('20090617235846');

INSERT INTO schema_migrations (version) VALUES ('20090618002131');

INSERT INTO schema_migrations (version) VALUES ('20090710005708');

INSERT INTO schema_migrations (version) VALUES ('20090710010816');

INSERT INTO schema_migrations (version) VALUES ('20090710012112');

INSERT INTO schema_migrations (version) VALUES ('20090718142541');

INSERT INTO schema_migrations (version) VALUES ('20090718145740');

INSERT INTO schema_migrations (version) VALUES ('20090718145816');

INSERT INTO schema_migrations (version) VALUES ('20090718145826');

INSERT INTO schema_migrations (version) VALUES ('20090725120639');

INSERT INTO schema_migrations (version) VALUES ('20090725120708');

INSERT INTO schema_migrations (version) VALUES ('20090725120717');

INSERT INTO schema_migrations (version) VALUES ('20090725120737');

INSERT INTO schema_migrations (version) VALUES ('20090725125026');

INSERT INTO schema_migrations (version) VALUES ('20090916235916');

INSERT INTO schema_migrations (version) VALUES ('20090928231223');

INSERT INTO schema_migrations (version) VALUES ('20091121212833');

INSERT INTO schema_migrations (version) VALUES ('20091201225416');