PGDMP                         {            online-store    15.1    15.1 Z    j
           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            k
           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            l
           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            m
           1262    16398    online-store    DATABASE     �   CREATE DATABASE "online-store" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Russian_Russia.1251';
    DROP DATABASE "online-store";
                postgres    false            n
           0    0    DATABASE "online-store"    COMMENT     K   COMMENT ON DATABASE "online-store" IS 'for online store project reactapp';
                   postgres    false    3437            �            1259    24838    basket_devices    TABLE     k  CREATE TABLE public.basket_devices (
    id integer NOT NULL,
    name character varying(255),
    price integer NOT NULL,
    "numberOfDevices" character varying(255) NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL,
    "basketId" integer,
    "purchaseHistoryId" integer,
    "deviceId" integer
);
 "   DROP TABLE public.basket_devices;
       public         heap    postgres    false            �            1259    24837    basket_devices_id_seq    SEQUENCE     �   CREATE SEQUENCE public.basket_devices_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ,   DROP SEQUENCE public.basket_devices_id_seq;
       public          postgres    false    233            o
           0    0    basket_devices_id_seq    SEQUENCE OWNED BY     O   ALTER SEQUENCE public.basket_devices_id_seq OWNED BY public.basket_devices.id;
          public          postgres    false    232            �            1259    16412    baskets    TABLE     �   CREATE TABLE public.baskets (
    id integer NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL,
    "userId" integer
);
    DROP TABLE public.baskets;
       public         heap    postgres    false            �            1259    16411    baskets_id_seq    SEQUENCE     �   CREATE SEQUENCE public.baskets_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE public.baskets_id_seq;
       public          postgres    false    217            p
           0    0    baskets_id_seq    SEQUENCE OWNED BY     A   ALTER SEQUENCE public.baskets_id_seq OWNED BY public.baskets.id;
          public          postgres    false    216            �            1259    16433    brands    TABLE     �   CREATE TABLE public.brands (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);
    DROP TABLE public.brands;
       public         heap    postgres    false            �            1259    16432 
   brands_id_seq    SEQUENCE     �   CREATE SEQUENCE public.brands_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE public.brands_id_seq;
       public          postgres    false    221            q
           0    0 
   brands_id_seq    SEQUENCE OWNED BY     ?   ALTER SEQUENCE public.brands_id_seq OWNED BY public.brands.id;
          public          postgres    false    220            �            1259    16581    device_infos    TABLE       CREATE TABLE public.device_infos (
    id integer NOT NULL,
    title character varying(255) NOT NULL,
    description character varying(255) NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL,
    "deviceId" integer
);
     DROP TABLE public.device_infos;
       public         heap    postgres    false            �            1259    16580    device_infos_id_seq    SEQUENCE     �   CREATE SEQUENCE public.device_infos_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE public.device_infos_id_seq;
       public          postgres    false    229            r
           0    0    device_infos_id_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE public.device_infos_id_seq OWNED BY public.device_infos.id;
          public          postgres    false    228            �            1259    16559    devices    TABLE     Y  CREATE TABLE public.devices (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    price integer NOT NULL,
    rating integer DEFAULT 0,
    img character varying(255) NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL,
    "typeId" integer,
    "brandId" integer
);
    DROP TABLE public.devices;
       public         heap    postgres    false            �            1259    16558    devices_id_seq    SEQUENCE     �   CREATE SEQUENCE public.devices_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE public.devices_id_seq;
       public          postgres    false    227            s
           0    0    devices_id_seq    SEQUENCE OWNED BY     A   ALTER SEQUENCE public.devices_id_seq OWNED BY public.devices.id;
          public          postgres    false    226            �            1259    24831    purchase_histories    TABLE     �   CREATE TABLE public.purchase_histories (
    id integer NOT NULL,
    "totalAmount" integer NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);
 &   DROP TABLE public.purchase_histories;
       public         heap    postgres    false            �            1259    24830    purchase_histories_id_seq    SEQUENCE     �   CREATE SEQUENCE public.purchase_histories_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 0   DROP SEQUENCE public.purchase_histories_id_seq;
       public          postgres    false    231            t
           0    0    purchase_histories_id_seq    SEQUENCE OWNED BY     W   ALTER SEQUENCE public.purchase_histories_id_seq OWNED BY public.purchase_histories.id;
          public          postgres    false    230            �            1259    16470    ratings    TABLE     �   CREATE TABLE public.ratings (
    id integer NOT NULL,
    rate integer NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL,
    "userId" integer
);
    DROP TABLE public.ratings;
       public         heap    postgres    false            �            1259    16469    ratings_id_seq    SEQUENCE     �   CREATE SEQUENCE public.ratings_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE public.ratings_id_seq;
       public          postgres    false    223            u
           0    0    ratings_id_seq    SEQUENCE OWNED BY     A   ALTER SEQUENCE public.ratings_id_seq OWNED BY public.ratings.id;
          public          postgres    false    222            �            1259    16496 
   typeBrands    TABLE     �   CREATE TABLE public."typeBrands" (
    id integer NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL,
    "typeId" integer,
    "brandId" integer
);
     DROP TABLE public."typeBrands";
       public         heap    postgres    false            �            1259    16495    typeBrands_id_seq    SEQUENCE     �   CREATE SEQUENCE public."typeBrands_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE public."typeBrands_id_seq";
       public          postgres    false    225            v
           0    0    typeBrands_id_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE public."typeBrands_id_seq" OWNED BY public."typeBrands".id;
          public          postgres    false    224            �            1259    16424    types    TABLE     �   CREATE TABLE public.types (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);
    DROP TABLE public.types;
       public         heap    postgres    false            �            1259    16423    types_id_seq    SEQUENCE     �   CREATE SEQUENCE public.types_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.types_id_seq;
       public          postgres    false    219            w
           0    0    types_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE public.types_id_seq OWNED BY public.types.id;
          public          postgres    false    218            �            1259    16400    users    TABLE     '  CREATE TABLE public.users (
    id integer NOT NULL,
    email character varying(255),
    password character varying(255),
    role character varying(255) DEFAULT 'USER'::character varying,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);
    DROP TABLE public.users;
       public         heap    postgres    false            �            1259    16399    users_id_seq    SEQUENCE     �   CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.users_id_seq;
       public          postgres    false    215            x
           0    0    users_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;
          public          postgres    false    214            �           2604    24841    basket_devices id    DEFAULT     v   ALTER TABLE ONLY public.basket_devices ALTER COLUMN id SET DEFAULT nextval('public.basket_devices_id_seq'::regclass);
 @   ALTER TABLE public.basket_devices ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    233    232    233            �           2604    16415 
   baskets id    DEFAULT     h   ALTER TABLE ONLY public.baskets ALTER COLUMN id SET DEFAULT nextval('public.baskets_id_seq'::regclass);
 9   ALTER TABLE public.baskets ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    217    216    217            �           2604    16436 	   brands id    DEFAULT     f   ALTER TABLE ONLY public.brands ALTER COLUMN id SET DEFAULT nextval('public.brands_id_seq'::regclass);
 8   ALTER TABLE public.brands ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    220    221    221            �           2604    16584    device_infos id    DEFAULT     r   ALTER TABLE ONLY public.device_infos ALTER COLUMN id SET DEFAULT nextval('public.device_infos_id_seq'::regclass);
 >   ALTER TABLE public.device_infos ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    228    229    229            �           2604    16562 
   devices id    DEFAULT     h   ALTER TABLE ONLY public.devices ALTER COLUMN id SET DEFAULT nextval('public.devices_id_seq'::regclass);
 9   ALTER TABLE public.devices ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    226    227    227            �           2604    24834    purchase_histories id    DEFAULT     ~   ALTER TABLE ONLY public.purchase_histories ALTER COLUMN id SET DEFAULT nextval('public.purchase_histories_id_seq'::regclass);
 D   ALTER TABLE public.purchase_histories ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    230    231    231            �           2604    16473 
   ratings id    DEFAULT     h   ALTER TABLE ONLY public.ratings ALTER COLUMN id SET DEFAULT nextval('public.ratings_id_seq'::regclass);
 9   ALTER TABLE public.ratings ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    222    223    223            �           2604    16499 
   typeBrands id    DEFAULT     r   ALTER TABLE ONLY public."typeBrands" ALTER COLUMN id SET DEFAULT nextval('public."typeBrands_id_seq"'::regclass);
 >   ALTER TABLE public."typeBrands" ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    225    224    225            �           2604    16427    types id    DEFAULT     d   ALTER TABLE ONLY public.types ALTER COLUMN id SET DEFAULT nextval('public.types_id_seq'::regclass);
 7   ALTER TABLE public.types ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    218    219    219            �           2604    16403    users id    DEFAULT     d   ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);
 7   ALTER TABLE public.users ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    214    215    215            g
          0    24838    basket_devices 
   TABLE DATA           �   COPY public.basket_devices (id, name, price, "numberOfDevices", "createdAt", "updatedAt", "basketId", "purchaseHistoryId", "deviceId") FROM stdin;
    public          postgres    false    233   nk       W
          0    16412    baskets 
   TABLE DATA           I   COPY public.baskets (id, "createdAt", "updatedAt", "userId") FROM stdin;
    public          postgres    false    217   �l       [
          0    16433    brands 
   TABLE DATA           D   COPY public.brands (id, name, "createdAt", "updatedAt") FROM stdin;
    public          postgres    false    221   Zm       c
          0    16581    device_infos 
   TABLE DATA           d   COPY public.device_infos (id, title, description, "createdAt", "updatedAt", "deviceId") FROM stdin;
    public          postgres    false    229   �m       a
          0    16559    devices 
   TABLE DATA           n   COPY public.devices (id, name, price, rating, img, "createdAt", "updatedAt", "typeId", "brandId") FROM stdin;
    public          postgres    false    227   o       e
          0    24831    purchase_histories 
   TABLE DATA           Y   COPY public.purchase_histories (id, "totalAmount", "createdAt", "updatedAt") FROM stdin;
    public          postgres    false    231   %p       ]
          0    16470    ratings 
   TABLE DATA           O   COPY public.ratings (id, rate, "createdAt", "updatedAt", "userId") FROM stdin;
    public          postgres    false    223   �p       _
          0    16496 
   typeBrands 
   TABLE DATA           Y   COPY public."typeBrands" (id, "createdAt", "updatedAt", "typeId", "brandId") FROM stdin;
    public          postgres    false    225   �p       Y
          0    16424    types 
   TABLE DATA           C   COPY public.types (id, name, "createdAt", "updatedAt") FROM stdin;
    public          postgres    false    219   q       U
          0    16400    users 
   TABLE DATA           T   COPY public.users (id, email, password, role, "createdAt", "updatedAt") FROM stdin;
    public          postgres    false    215   �q       y
           0    0    basket_devices_id_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public.basket_devices_id_seq', 29, true);
          public          postgres    false    232            z
           0    0    baskets_id_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('public.baskets_id_seq', 8, true);
          public          postgres    false    216            {
           0    0 
   brands_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('public.brands_id_seq', 4, true);
          public          postgres    false    220            |
           0    0    device_infos_id_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public.device_infos_id_seq', 45, true);
          public          postgres    false    228            }
           0    0    devices_id_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('public.devices_id_seq', 4, true);
          public          postgres    false    226            ~
           0    0    purchase_histories_id_seq    SEQUENCE SET     H   SELECT pg_catalog.setval('public.purchase_histories_id_seq', 11, true);
          public          postgres    false    230            
           0    0    ratings_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public.ratings_id_seq', 1, false);
          public          postgres    false    222            �
           0    0    typeBrands_id_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public."typeBrands_id_seq"', 1, false);
          public          postgres    false    224            �
           0    0    types_id_seq    SEQUENCE SET     :   SELECT pg_catalog.setval('public.types_id_seq', 6, true);
          public          postgres    false    218            �
           0    0    users_id_seq    SEQUENCE SET     :   SELECT pg_catalog.setval('public.users_id_seq', 8, true);
          public          postgres    false    214            �           2606    24845 "   basket_devices basket_devices_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY public.basket_devices
    ADD CONSTRAINT basket_devices_pkey PRIMARY KEY (id);
 L   ALTER TABLE ONLY public.basket_devices DROP CONSTRAINT basket_devices_pkey;
       public            postgres    false    233            �           2606    16417    baskets baskets_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.baskets
    ADD CONSTRAINT baskets_pkey PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.baskets DROP CONSTRAINT baskets_pkey;
       public            postgres    false    217            �           2606    16440    brands brands_name_key 
   CONSTRAINT     Q   ALTER TABLE ONLY public.brands
    ADD CONSTRAINT brands_name_key UNIQUE (name);
 @   ALTER TABLE ONLY public.brands DROP CONSTRAINT brands_name_key;
       public            postgres    false    221            �           2606    16438    brands brands_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public.brands
    ADD CONSTRAINT brands_pkey PRIMARY KEY (id);
 <   ALTER TABLE ONLY public.brands DROP CONSTRAINT brands_pkey;
       public            postgres    false    221            �           2606    16588    device_infos device_infos_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.device_infos
    ADD CONSTRAINT device_infos_pkey PRIMARY KEY (id);
 H   ALTER TABLE ONLY public.device_infos DROP CONSTRAINT device_infos_pkey;
       public            postgres    false    229            �           2606    16569    devices devices_name_key 
   CONSTRAINT     S   ALTER TABLE ONLY public.devices
    ADD CONSTRAINT devices_name_key UNIQUE (name);
 B   ALTER TABLE ONLY public.devices DROP CONSTRAINT devices_name_key;
       public            postgres    false    227            �           2606    16567    devices devices_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.devices
    ADD CONSTRAINT devices_pkey PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.devices DROP CONSTRAINT devices_pkey;
       public            postgres    false    227            �           2606    24836 *   purchase_histories purchase_histories_pkey 
   CONSTRAINT     h   ALTER TABLE ONLY public.purchase_histories
    ADD CONSTRAINT purchase_histories_pkey PRIMARY KEY (id);
 T   ALTER TABLE ONLY public.purchase_histories DROP CONSTRAINT purchase_histories_pkey;
       public            postgres    false    231            �           2606    16475    ratings ratings_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.ratings
    ADD CONSTRAINT ratings_pkey PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.ratings DROP CONSTRAINT ratings_pkey;
       public            postgres    false    223            �           2606    16501    typeBrands typeBrands_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public."typeBrands"
    ADD CONSTRAINT "typeBrands_pkey" PRIMARY KEY (id);
 H   ALTER TABLE ONLY public."typeBrands" DROP CONSTRAINT "typeBrands_pkey";
       public            postgres    false    225            �           2606    16503 (   typeBrands typeBrands_typeId_brandId_key 
   CONSTRAINT     v   ALTER TABLE ONLY public."typeBrands"
    ADD CONSTRAINT "typeBrands_typeId_brandId_key" UNIQUE ("typeId", "brandId");
 V   ALTER TABLE ONLY public."typeBrands" DROP CONSTRAINT "typeBrands_typeId_brandId_key";
       public            postgres    false    225    225            �           2606    16431    types types_name_key 
   CONSTRAINT     O   ALTER TABLE ONLY public.types
    ADD CONSTRAINT types_name_key UNIQUE (name);
 >   ALTER TABLE ONLY public.types DROP CONSTRAINT types_name_key;
       public            postgres    false    219            �           2606    16429    types types_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.types
    ADD CONSTRAINT types_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.types DROP CONSTRAINT types_pkey;
       public            postgres    false    219            �           2606    16410    users users_email_key 
   CONSTRAINT     Q   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key UNIQUE (email);
 ?   ALTER TABLE ONLY public.users DROP CONSTRAINT users_email_key;
       public            postgres    false    215            �           2606    16408    users users_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.users DROP CONSTRAINT users_pkey;
       public            postgres    false    215            �           2606    24846 +   basket_devices basket_devices_basketId_fkey 
   FK CONSTRAINT     �   ALTER TABLE ONLY public.basket_devices
    ADD CONSTRAINT "basket_devices_basketId_fkey" FOREIGN KEY ("basketId") REFERENCES public.baskets(id) ON UPDATE CASCADE ON DELETE SET NULL;
 W   ALTER TABLE ONLY public.basket_devices DROP CONSTRAINT "basket_devices_basketId_fkey";
       public          postgres    false    217    233    3235            �           2606    24856 +   basket_devices basket_devices_deviceId_fkey 
   FK CONSTRAINT     �   ALTER TABLE ONLY public.basket_devices
    ADD CONSTRAINT "basket_devices_deviceId_fkey" FOREIGN KEY ("deviceId") REFERENCES public.devices(id) ON UPDATE CASCADE ON DELETE SET NULL;
 W   ALTER TABLE ONLY public.basket_devices DROP CONSTRAINT "basket_devices_deviceId_fkey";
       public          postgres    false    233    227    3253            �           2606    24851 4   basket_devices basket_devices_purchaseHistoryId_fkey 
   FK CONSTRAINT     �   ALTER TABLE ONLY public.basket_devices
    ADD CONSTRAINT "basket_devices_purchaseHistoryId_fkey" FOREIGN KEY ("purchaseHistoryId") REFERENCES public.purchase_histories(id) ON UPDATE CASCADE ON DELETE SET NULL;
 `   ALTER TABLE ONLY public.basket_devices DROP CONSTRAINT "basket_devices_purchaseHistoryId_fkey";
       public          postgres    false    3257    231    233            �           2606    16418    baskets baskets_userId_fkey 
   FK CONSTRAINT     �   ALTER TABLE ONLY public.baskets
    ADD CONSTRAINT "baskets_userId_fkey" FOREIGN KEY ("userId") REFERENCES public.users(id) ON UPDATE CASCADE ON DELETE SET NULL;
 G   ALTER TABLE ONLY public.baskets DROP CONSTRAINT "baskets_userId_fkey";
       public          postgres    false    217    3233    215            �           2606    16589 '   device_infos device_infos_deviceId_fkey 
   FK CONSTRAINT     �   ALTER TABLE ONLY public.device_infos
    ADD CONSTRAINT "device_infos_deviceId_fkey" FOREIGN KEY ("deviceId") REFERENCES public.devices(id) ON UPDATE CASCADE ON DELETE SET NULL;
 S   ALTER TABLE ONLY public.device_infos DROP CONSTRAINT "device_infos_deviceId_fkey";
       public          postgres    false    227    229    3253            �           2606    16575    devices devices_brandId_fkey 
   FK CONSTRAINT     �   ALTER TABLE ONLY public.devices
    ADD CONSTRAINT "devices_brandId_fkey" FOREIGN KEY ("brandId") REFERENCES public.brands(id) ON UPDATE CASCADE ON DELETE SET NULL;
 H   ALTER TABLE ONLY public.devices DROP CONSTRAINT "devices_brandId_fkey";
       public          postgres    false    221    227    3243            �           2606    16570    devices devices_typeId_fkey 
   FK CONSTRAINT     �   ALTER TABLE ONLY public.devices
    ADD CONSTRAINT "devices_typeId_fkey" FOREIGN KEY ("typeId") REFERENCES public.types(id) ON UPDATE CASCADE ON DELETE SET NULL;
 G   ALTER TABLE ONLY public.devices DROP CONSTRAINT "devices_typeId_fkey";
       public          postgres    false    3239    227    219            �           2606    16476    ratings ratings_userId_fkey 
   FK CONSTRAINT     �   ALTER TABLE ONLY public.ratings
    ADD CONSTRAINT "ratings_userId_fkey" FOREIGN KEY ("userId") REFERENCES public.users(id) ON UPDATE CASCADE ON DELETE SET NULL;
 G   ALTER TABLE ONLY public.ratings DROP CONSTRAINT "ratings_userId_fkey";
       public          postgres    false    215    3233    223            �           2606    16509 "   typeBrands typeBrands_brandId_fkey 
   FK CONSTRAINT     �   ALTER TABLE ONLY public."typeBrands"
    ADD CONSTRAINT "typeBrands_brandId_fkey" FOREIGN KEY ("brandId") REFERENCES public.brands(id) ON UPDATE CASCADE ON DELETE CASCADE;
 P   ALTER TABLE ONLY public."typeBrands" DROP CONSTRAINT "typeBrands_brandId_fkey";
       public          postgres    false    221    225    3243            �           2606    16504 !   typeBrands typeBrands_typeId_fkey 
   FK CONSTRAINT     �   ALTER TABLE ONLY public."typeBrands"
    ADD CONSTRAINT "typeBrands_typeId_fkey" FOREIGN KEY ("typeId") REFERENCES public.types(id) ON UPDATE CASCADE ON DELETE CASCADE;
 O   ALTER TABLE ONLY public."typeBrands" DROP CONSTRAINT "typeBrands_typeId_fkey";
       public          postgres    false    3239    219    225            g
   C  x����J1���)��\2�u��Tb#h���N��g/�fa�?���0;ټF �[Џ&��}!p�o u����"����t������x��
=,��x�El�B'�k�,Ұ*Ұ��*�yy9?��M��'�"���π�H��7;ώK�$�v�!5t��6�/B�Z諍�T-�aA)���m���*�ZbG8��w���A�c^�Q2A�t�b�Hh	G�D2m��dbU���0IոC��K���������K jI�Qp�V�����U-��
U-��(�3k�u���Ys��x.$.�ךE�����Ȗ<Nf�?�S+�      W
   �   x�}�K
�P@�q]E�%���\K���fP��p嗐�Irl��x�������iq�Characters.txt��$��YE~
�YR���*�A���I�X�f9�!n����J���O
��Rz��f9(����C7L�YZ�A �8�U�      [
   b   x�3��q�4202�50�56T02�20�Characters.txt��365�6��#�e��J�^C�����Ҽt2��p�����C���)Z�[����"�c������ 71      c
   8  x����N1���St�L�G��g�a�BA��ڝ�K@H����}#o����tz��{O)pO#:GCC̄�Z�ώ����頬K�&튪�':~KF+�-�E�~/�(��5
��+���q?I������	h��#�t�v�.Ѡ�o����l�`���;�h@#a�U��lhM6|�0�x�k,� 4Q|�.4�!�E6�������J�*\�Z6]�H�s=0�#���n�͞���
K�ņ��C�Ai�L����V�]�]x��O(/���ª�=?�'�s���S�$'������8n�BDsjc�lS*����"���J^�R�w`��      a
     x�}�=KA�z�WL/Y2����9�kԫ�fgg�F��_9x�-�&��$��Fg��n�Q��$� �V��� ��	-�6}8Bb� <q�P4Ϛ����0�{;?���Һ�g?����b���ױ�f����(����دx�`��3�3RG���џ�5���b"J��8V[O��ҵ��0��G�G+A
���п�9�Ƚ�T���ӣ�xa׵q�� [Z@�d^l��ZJQv,��?� �)�n�����y����e#      e
   �   x�}�K!��5=�{c�ڳx�s��h`蘰��iʥ;!����X��B��N�OI�Yc���9�V]�ވ���B7^���^sƮ5���q�PG�v�k��q�cB�Nr�k�~�͐�S�K0.x
v��>%�K.
]�ɯ	�JK��`B������6�;b�#����� ���      ]
   
   x������ � �      _
   
   x������ � �      Y
   �   x�}�A
�@������S���H�U�.�Q(�z��FfQD��|��G��Y���V��KFm]���G.�
q�e^��O�����r5��-�u/����w��H��U?������͠A�O+
�<Յ�P���ޜ�`�
�0Sw      U
   O  x�u�˒�@�5<�,f�
���iVAEEE�R� "�����d2�'�8��!WEU��?r?�	eͽ�����a0$�UU\V�e}��ӳ	ܭG�s�vc���,�;8�fЄc�pKK�s ��� �@Q�L�L`������[W�;?K4a�l���qwםO�a0���%:k��.0A]'�1s*YKO�1-��YB�H�6�1�1_��x�k٪�&�7�p�ɖ7�����D�a�L q{�sF�L�:�ǩ���䡐*PR �(�-�/r��> a�	���<�='�4=�o��<7cu�t��ԛcA!r:�P�Q�AԆ��(	�y�x��Q����X��8s�sp���>��ԗ��N˞�Q`̺$q�,9�����+�_0��."�6�1�%���!{m�,V��w�9
�`v��h�S�:����L_��W9�vC���\�� ��=�"�~@>���TS�}�o�#M����{��
7�i�����B�U�:%B�H�%H����IB��ǈ�F��w�+�_�w���u��>it��Qdg�:~;��������8KC����ܟ�Ѷ�1�
<����l     