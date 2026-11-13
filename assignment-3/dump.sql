-- PostgreSQL database dump
-- Generated for Assignment 3: Playlists

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

--
-- Table structure for table `songs`
--

CREATE TABLE public.songs (
    id integer NOT NULL,
    title character varying(150) NOT NULL,
    artist character varying(100) NOT NULL,
    duration interval NOT NULL
);

ALTER TABLE public.songs OWNER TO postgres;

CREATE SEQUENCE public.songs_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

ALTER TABLE public.songs_id_seq OWNER TO postgres;
ALTER SEQUENCE public.songs_id_seq OWNED BY public.songs.id;

--
-- Table structure for table `playlists`
--

CREATE TABLE public.playlists (
    id integer NOT NULL,
    name character varying(100) NOT NULL
);

ALTER TABLE public.playlists OWNER TO postgres;

CREATE SEQUENCE public.playlists_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

ALTER TABLE public.playlists_id_seq OWNER TO postgres;
ALTER SEQUENCE public.playlists_id_seq OWNED BY public.playlists.id;

--
-- Table structure for table `playlist_songs`
--

CREATE TABLE public.playlist_songs (
    playlist_id integer NOT NULL,
    song_id integer NOT NULL,
    position integer NOT NULL
);

ALTER TABLE public.playlist_songs OWNER TO postgres;

--
-- Data for Name: songs;
--

INSERT INTO public.songs (id, title, artist, duration) VALUES (1, 'Numb', 'Linkin Park', '00:03:07');
INSERT INTO public.songs (id, title, artist, duration) VALUES (2, 'In the End', 'Linkin Park', '00:03:36');
INSERT INTO public.songs (id, title, artist, duration) VALUES (3, 'Faint', 'Linkin Park', '00:02:42');
INSERT INTO public.songs (id, title, artist, duration) VALUES (4, 'Bohemian Rhapsody', 'Queen', '00:05:55');
INSERT INTO public.songs (id, title, artist, duration) VALUES (5, 'Dont Stop Me Now', 'Queen', '00:03:29');
INSERT INTO public.songs (id, title, artist, duration) VALUES (6, 'Smells Like Teen Spirit', 'Nirvana', '00:05:01');
INSERT INTO public.songs (id, title, artist, duration) VALUES (7, 'Come As You Are', 'Nirvana', '00:03:39');
INSERT INTO public.songs (id, title, artist, duration) VALUES (8, 'Blinding Lights', 'The Weeknd', '00:03:20');

--
-- Data for Name: playlists;
--

INSERT INTO public.playlists (id, name) VALUES (1, 'Gym & Workout');
INSERT INTO public.playlists (id, name) VALUES (2, 'Late Night Chill');

--
-- Data for Name: playlist_songs;
--

INSERT INTO public.playlist_songs (playlist_id, song_id, position) VALUES (1, 3, 1);
INSERT INTO public.playlist_songs (playlist_id, song_id, position) VALUES (1, 1, 2);
INSERT INTO public.playlist_songs (playlist_id, song_id, position) VALUES (1, 6, 3);
INSERT INTO public.playlist_songs (playlist_id, song_id, position) VALUES (1, 5, 4);
INSERT INTO public.playlist_songs (playlist_id, song_id, position) VALUES (1, 8, 5);
INSERT INTO public.playlist_songs (playlist_id, song_id, position) VALUES (2, 4, 1);
INSERT INTO public.playlist_songs (playlist_id, song_id, position) VALUES (2, 7, 2);
INSERT INTO public.playlist_songs (playlist_id, song_id, position) VALUES (2, 8, 3);
INSERT INTO public.playlist_songs (playlist_id, song_id, position) VALUES (2, 1, 4);

--
-- Primary Keys and Constraints
--

ALTER TABLE ONLY public.playlists ALTER COLUMN id SET DEFAULT nextval('public.playlists_id_seq'::regclass);
ALTER TABLE ONLY public.songs ALTER COLUMN id SET DEFAULT nextval('public.songs_id_seq'::regclass);

ALTER TABLE ONLY public.playlists ADD CONSTRAINT playlists_pkey PRIMARY KEY (id);
ALTER TABLE ONLY public.playlist_songs ADD CONSTRAINT playlist_songs_pkey PRIMARY KEY (playlist_id, song_id);
ALTER TABLE ONLY public.playlist_songs ADD CONSTRAINT playlist_songs_playlist_id_position_key UNIQUE (playlist_id, position);
ALTER TABLE ONLY public.songs ADD CONSTRAINT songs_pkey PRIMARY KEY (id);

ALTER TABLE ONLY public.playlist_songs ADD CONSTRAINT playlist_songs_playlist_id_fkey FOREIGN KEY (playlist_id) REFERENCES public.playlists(id) ON DELETE CASCADE;
ALTER TABLE ONLY public.playlist_songs ADD CONSTRAINT playlist_songs_song_id_fkey FOREIGN KEY (song_id) REFERENCES public.songs(id) ON DELETE CASCADE;
