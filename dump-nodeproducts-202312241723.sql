PGDMP  :                    {            nodeproducts    16.1    16.1     �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            �           1262    16401    nodeproducts    DATABASE     �   CREATE DATABASE nodeproducts WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Portuguese_Brazil.1252';
    DROP DATABASE nodeproducts;
                postgres    false                        2615    2200    public    SCHEMA        CREATE SCHEMA public;
    DROP SCHEMA public;
                pg_database_owner    false            �           0    0    SCHEMA public    COMMENT     6   COMMENT ON SCHEMA public IS 'standard public schema';
                   pg_database_owner    false    4            �            1259    24607    city    TABLE     [   CREATE TABLE public.city (
    id integer NOT NULL,
    name character varying NOT NULL
);
    DROP TABLE public.city;
       public         heap    educc    false    4            �            1259    24606    city_id_seq    SEQUENCE     �   CREATE SEQUENCE public.city_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 "   DROP SEQUENCE public.city_id_seq;
       public          educc    false    220    4            �           0    0    city_id_seq    SEQUENCE OWNED BY     ;   ALTER SEQUENCE public.city_id_seq OWNED BY public.city.id;
          public          educc    false    219            �            1259    24577 
   migrations    TABLE     �   CREATE TABLE public.migrations (
    id integer NOT NULL,
    "timestamp" bigint NOT NULL,
    name character varying NOT NULL
);
    DROP TABLE public.migrations;
       public         heap    educc    false    4            �            1259    24576    migrations_id_seq    SEQUENCE     �   CREATE SEQUENCE public.migrations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.migrations_id_seq;
       public          educc    false    4    216            �           0    0    migrations_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public.migrations_id_seq OWNED BY public.migrations.id;
          public          educc    false    215            �            1259    24586    product    TABLE     �  CREATE TABLE public.product (
    id integer NOT NULL,
    name character varying NOT NULL,
    category character varying NOT NULL,
    status character varying DEFAULT 'ACTIVE'::character varying NOT NULL,
    quantity integer NOT NULL,
    created_at timestamp without time zone DEFAULT now() NOT NULL,
    updated_at timestamp without time zone DEFAULT now() NOT NULL,
    deleted_at timestamp without time zone
);
    DROP TABLE public.product;
       public         heap    educc    false    4            �            1259    24585    product_id_seq    SEQUENCE     �   CREATE SEQUENCE public.product_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE public.product_id_seq;
       public          educc    false    4    218            �           0    0    product_id_seq    SEQUENCE OWNED BY     A   ALTER SEQUENCE public.product_id_seq OWNED BY public.product.id;
          public          educc    false    217            )           2604    24610    city id    DEFAULT     b   ALTER TABLE ONLY public.city ALTER COLUMN id SET DEFAULT nextval('public.city_id_seq'::regclass);
 6   ALTER TABLE public.city ALTER COLUMN id DROP DEFAULT;
       public          educc    false    219    220    220            $           2604    24580    migrations id    DEFAULT     n   ALTER TABLE ONLY public.migrations ALTER COLUMN id SET DEFAULT nextval('public.migrations_id_seq'::regclass);
 <   ALTER TABLE public.migrations ALTER COLUMN id DROP DEFAULT;
       public          educc    false    216    215    216            %           2604    24589 
   product id    DEFAULT     h   ALTER TABLE ONLY public.product ALTER COLUMN id SET DEFAULT nextval('public.product_id_seq'::regclass);
 9   ALTER TABLE public.product ALTER COLUMN id DROP DEFAULT;
       public          educc    false    217    218    218            �          0    24607    city 
   TABLE DATA           (   COPY public.city (id, name) FROM stdin;
    public          educc    false    220   �       �          0    24577 
   migrations 
   TABLE DATA           ;   COPY public.migrations (id, "timestamp", name) FROM stdin;
    public          educc    false    216   �       �          0    24586    product 
   TABLE DATA           k   COPY public.product (id, name, category, status, quantity, created_at, updated_at, deleted_at) FROM stdin;
    public          educc    false    218   �       �           0    0    city_id_seq    SEQUENCE SET     :   SELECT pg_catalog.setval('public.city_id_seq', 92, true);
          public          educc    false    219            �           0    0    migrations_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.migrations_id_seq', 3, true);
          public          educc    false    215            �           0    0    product_id_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('public.product_id_seq', 2, true);
          public          educc    false    217            +           2606    24584 )   migrations PK_8c82d7f526340ab734260ea46be 
   CONSTRAINT     i   ALTER TABLE ONLY public.migrations
    ADD CONSTRAINT "PK_8c82d7f526340ab734260ea46be" PRIMARY KEY (id);
 U   ALTER TABLE ONLY public.migrations DROP CONSTRAINT "PK_8c82d7f526340ab734260ea46be";
       public            educc    false    216            /           2606    24614 #   city PK_b222f51ce26f7e5ca86944a6739 
   CONSTRAINT     c   ALTER TABLE ONLY public.city
    ADD CONSTRAINT "PK_b222f51ce26f7e5ca86944a6739" PRIMARY KEY (id);
 O   ALTER TABLE ONLY public.city DROP CONSTRAINT "PK_b222f51ce26f7e5ca86944a6739";
       public            educc    false    220            -           2606    24596 &   product PK_bebc9158e480b949565b4dc7a82 
   CONSTRAINT     f   ALTER TABLE ONLY public.product
    ADD CONSTRAINT "PK_bebc9158e480b949565b4dc7a82" PRIMARY KEY (id);
 R   ALTER TABLE ONLY public.product DROP CONSTRAINT "PK_bebc9158e480b949565b4dc7a82";
       public            educc    false    218            �   �  x�UT�n�8<��B?���[:���A��w���KKb&$qL�F��	r0 ��)W�X�%{���t�~TW+V���8꬏����I;��O���cx`�`j�)�������.O�����T wl��sc�Tg����8��Q���y�L�:��;���~�oԙ�Kv�(�WO��%«�>Y��DI����J��F\Ԉ�r(΀Mh�9L�'�Oq����ǎ;����!ڱ?�3<R\ʣ��Kg;�0!�'�WƉ��#e-�p�F{�$1%�KIÛ�8+�l�%(؎�6Ϭ�E68@��!�2S��0�!�p����T�?ǣ������_b]8;Nf��T��'���J�:p�����V¡]�n���ر��=S��e[�Ei*6t�x��3���\]
n(-�k��e:� �D/���Ī�
����u�m`�GD�LA�p�i�ϔ%j����,��p!S{s��z�9ˁ8n��PWto0IMY��L??�
�*x�v�wCY���=�Z������
=�c�<V��B-��dq�oۛ͢ ��4=P����`ۿCM��\��^�:�e@�)�z�}^��u���m��Z��b�p�ب�Z�Ű��M8	�=�*Ru��pDE������h&KE�x�=CCE�8dt�[��(�C����VDc��EyE�nDܑ�C~;�5�^n͎���>:̟���X݈�/ ���v9�ߎ�����'a�LW`g��Q���V��.;������*��d�,^p??	�O��/��ޠt��N���Z�t�<��D�����d����O��Wh��;�\�������3-\�d�8/߬
-��t6��*W�P{@�U�nE-/*�Ju���k�XIL�� �_���VҊpE��s��6T�p�G
̲N��cr׺�����߉�'5���      �   N   x�3�44706112776�4����,�L���L/J,���C��2��636�417š*�eUmihabhf�C5T�+F��� t$�      �   �   x���1
�@E��S�Yf&;��v,,b�fa�X$+!��
�Bl���A�ǡH�8�9�K�6.�5Ϸ�9����B`�$.�$�U��J��u�D��eV�_�0���lz���(aܦ�N��ګ�_Hb gB�
}gzk�y �k=�     