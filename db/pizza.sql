PGDMP                         y            pizza    10.15    10.15 P    I           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                       false            J           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                       false            K           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                       false            L           1262    16393    pizza    DATABASE     ?   CREATE DATABASE pizza WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'English_United States.1252' LC_CTYPE = 'English_United States.1252';
    DROP DATABASE pizza;
             postgres    false                        2615    2200    public    SCHEMA        CREATE SCHEMA public;
    DROP SCHEMA public;
             postgres    false            M           0    0    SCHEMA public    COMMENT     6   COMMENT ON SCHEMA public IS 'standard public schema';
                  postgres    false    3                        3079    12924    plpgsql 	   EXTENSION     ?   CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;
    DROP EXTENSION plpgsql;
                  false            N           0    0    EXTENSION plpgsql    COMMENT     @   COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';
                       false    1            ?            1255    16473 N   add_customer(integer, character varying, character varying, character varying)    FUNCTION     u  CREATE FUNCTION public.add_customer(cus_id integer, customer_name character varying, address character varying, phone character varying) RETURNS character varying
    LANGUAGE plpgsql
    AS $$
BEGIN 
INSERT INTO public."customer"(
	 cus_id, customer_name, address, phone)
	VALUES (cus_id, customer_name, address, phone);
return 'Customer added successfully!';	
	
END;
$$;
 ?   DROP FUNCTION public.add_customer(cus_id integer, customer_name character varying, address character varying, phone character varying);
       public       postgres    false    3    1            ?            1255    16394 *   add_ingredient(character varying, boolean)    FUNCTION       CREATE FUNCTION public.add_ingredient(name character varying, is_hidden boolean) RETURNS character varying
    LANGUAGE plpgsql
    AS $$
BEGIN 

INSERT INTO ingredient(name, is_hidden) VALUES (name, is_hidden);

return 'Ingredient added successfully!';

END;
$$;
 P   DROP FUNCTION public.add_ingredient(name character varying, is_hidden boolean);
       public       postgres    false    1    3            ?            1255    16395 q   add_ingredient_detail(integer, character varying, double precision, double precision, character varying, boolean)    FUNCTION     ?  CREATE FUNCTION public.add_ingredient_detail(ing_id integer, province character varying, price double precision, quantity double precision, supplier character varying, is_hidden boolean) RETURNS character varying
    LANGUAGE plpgsql
    AS $$
BEGIN 
INSERT INTO public."ingredient_detail"(
	 ing_id, province, price, quantity, supplier, is_hidden)
	VALUES ( ing_id, province, price, quantity, supplier, is_hidden);
	return 'Added Successfully';
END;
$$;
 ?   DROP FUNCTION public.add_ingredient_detail(ing_id integer, province character varying, price double precision, quantity double precision, supplier character varying, is_hidden boolean);
       public       postgres    false    1    3            ?            1255    16498 I   add_new_customer(character varying, character varying, character varying)    FUNCTION     Y  CREATE FUNCTION public.add_new_customer(customer_name character varying, address character varying, phone character varying) RETURNS character varying
    LANGUAGE plpgsql
    AS $$
BEGIN 
INSERT INTO public."customer"(
	 customer_name, address, phone)
	VALUES (customer_name, address, phone);
return 'Customer added successfully!';	
	
END;
$$;
 |   DROP FUNCTION public.add_new_customer(customer_name character varying, address character varying, phone character varying);
       public       postgres    false    3    1            ?            1255    16472 ;   add_new_pizza(character varying, integer, double precision)    FUNCTION     5  CREATE FUNCTION public.add_new_pizza(pizza_name character varying, size integer, price double precision) RETURNS character varying
    LANGUAGE plpgsql
    AS $$
BEGIN 
INSERT INTO public."pizza"(
	 pizza_name, size,price)
	VALUES (pizza_name,size, price);
return 'New pizza added successfully!';	
	
END;
$$;
 h   DROP FUNCTION public.add_new_pizza(pizza_name character varying, size integer, price double precision);
       public       postgres    false    1    3            ?            1255    16396 [   add_order(integer, character varying, double precision, double precision, double precision)    FUNCTION     ?  CREATE FUNCTION public.add_order(pizza_size integer, ingredients character varying, pizza_price double precision, ing_price double precision, total_price double precision) RETURNS character varying
    LANGUAGE plpgsql
    AS $$
BEGIN 
INSERT INTO public."order"(
	 pizza_size, ingredients, pizza_price, ing_price, total_price)
	VALUES (pizza_size, ingredients, pizza_price, ing_price, total_price);
return 'Ordered successfully!';	
	
END;
$$;
 ?   DROP FUNCTION public.add_order(pizza_size integer, ingredients character varying, pizza_price double precision, ing_price double precision, total_price double precision);
       public       postgres    false    3    1            ?            1255    16397 $   add_pizza(integer, double precision)    FUNCTION     ?   CREATE FUNCTION public.add_pizza(size integer, price double precision) RETURNS character varying
    LANGUAGE plpgsql
    AS $$
BEGIN 
INSERT INTO public."pizza"(
	 size, price)
	VALUES (size, price);
return 'New pizza added successfully!';	
	
END;
$$;
 F   DROP FUNCTION public.add_pizza(size integer, price double precision);
       public       postgres    false    1    3            ?            1255    16398 ;   add_supplier(character varying, character varying, boolean)    FUNCTION     H  CREATE FUNCTION public.add_supplier(name character varying, ingredients character varying, is_hidden boolean) RETURNS character varying
    LANGUAGE plpgsql
    AS $$
BEGIN 
INSERT INTO public."supplier"(
	 name, ingredients, is_hidden)
	VALUES (name,ingredients, is_hidden);
return 'New supplier added successfully!';
END;
$$;
 m   DROP FUNCTION public.add_supplier(name character varying, ingredients character varying, is_hidden boolean);
       public       postgres    false    1    3            ?            1255    16399 $   delete_ing_detail_by_ing_id(integer)    FUNCTION     	  CREATE FUNCTION public.delete_ing_detail_by_ing_id(ingredient_id integer) RETURNS character varying
    LANGUAGE plpgsql
    AS $$
BEGIN 
DELETE FROM public.ingredient_detail
	WHERE ingredient_detail.ing_id = ingredient_id;
	return 'deleted successfully';
END;
$$;
 I   DROP FUNCTION public.delete_ing_detail_by_ing_id(ingredient_id integer);
       public       postgres    false    3    1            ?            1255    16400    delete_ingredient(integer)    FUNCTION     ?   CREATE FUNCTION public.delete_ingredient(ing_id integer) RETURNS character varying
    LANGUAGE plpgsql
    AS $$
BEGIN
  DELETE
  FROM
  ingredient
  WHERE ingredient.id = ing_id;
  RETURN 'Ingredient removed successfully!';
END;
$$;
 8   DROP FUNCTION public.delete_ingredient(ing_id integer);
       public       postgres    false    3    1            ?            1255    16401 !   delete_ingredient_detail(integer)    FUNCTION       CREATE FUNCTION public.delete_ingredient_detail(ing_detail_id integer) RETURNS character varying
    LANGUAGE plpgsql
    AS $$
BEGIN 
DELETE FROM public.ingredient_detail
	WHERE ingredient_detail.id = ing_detail_id;
	return 'deleted successfully';
END;
$$;
 F   DROP FUNCTION public.delete_ingredient_detail(ing_detail_id integer);
       public       postgres    false    3    1            ?            1255    16402    delete_supplier(integer)    FUNCTION     ?   CREATE FUNCTION public.delete_supplier(sid integer) RETURNS character varying
    LANGUAGE plpgsql
    AS $$
BEGIN
  DELETE
  FROM
  supplier
  WHERE supplier.id = sid;
  RETURN 'Supplier removed successfully!';
END;
$$;
 3   DROP FUNCTION public.delete_supplier(sid integer);
       public       postgres    false    3    1            ?            1255    16403    fetch_all_ingredient()    FUNCTION     ?   CREATE FUNCTION public.fetch_all_ingredient() RETURNS TABLE(id integer, name character varying, is_hidden boolean)
    LANGUAGE plpgsql
    AS $$
begin
	return query 
		select * from ingredient order by ingredient.id asc;
end;
$$;
 -   DROP FUNCTION public.fetch_all_ingredient();
       public       postgres    false    3    1            ?            1255    16404    fetch_all_ingredient_detail()    FUNCTION     ^  CREATE FUNCTION public.fetch_all_ingredient_detail() RETURNS TABLE(id integer, ing_detail_id integer, name character varying, province character varying, price double precision)
    LANGUAGE plpgsql
    AS $$
begin
	return query 
		SELECT  ingredient.id ,  ingredient_detail.id as ing_detail_id, ingredient.name,   ingredient_detail.province,  ingredient_detail.price  FROM  ingredient_detail INNER JOIN ingredient  
on ingredient_detail.ing_id=ingredient.id where ingredient.is_hidden = false and ingredient_detail.is_hidden = false
and ingredient_detail.quantity > 0 order by ingredient.id asc;
end;
$$;
 4   DROP FUNCTION public.fetch_all_ingredient_detail();
       public       postgres    false    3    1            ?            1255    16499    fetch_all_order()    FUNCTION     5  CREATE FUNCTION public.fetch_all_order() RETURNS TABLE(id integer, pizza_size integer, ingredients character varying, pizza_price double precision, ing_price double precision, total_price double precision)
    LANGUAGE plpgsql
    AS $$
begin
	return query 
		select * from "order" order by id desc;
end;
$$;
 (   DROP FUNCTION public.fetch_all_order();
       public       postgres    false    3    1            ?            1255    16406    fetch_all_pizza()    FUNCTION     ?   CREATE FUNCTION public.fetch_all_pizza() RETURNS TABLE(id integer, size integer, price double precision)
    LANGUAGE plpgsql
    AS $$
begin
	return query 
		select * from pizza;
end;
$$;
 (   DROP FUNCTION public.fetch_all_pizza();
       public       postgres    false    1    3            ?            1255    16407    fetch_all_supplier()    FUNCTION     ?   CREATE FUNCTION public.fetch_all_supplier() RETURNS TABLE(id integer, name character varying, ingredients character varying, is_hidden boolean)
    LANGUAGE plpgsql
    AS $$
begin
	return query 
		select * from supplier order by supplier.id;
end;
$$;
 +   DROP FUNCTION public.fetch_all_supplier();
       public       postgres    false    3    1            ?            1255    16408    fetch_available_ingredient()    FUNCTION       CREATE FUNCTION public.fetch_available_ingredient() RETURNS TABLE(id integer, name character varying, is_hidden boolean)
    LANGUAGE plpgsql
    AS $$
begin
	return query 
		select * from ingredient where ingredient.is_hidden = false order by ingredient.id asc;
end;
$$;
 3   DROP FUNCTION public.fetch_available_ingredient();
       public       postgres    false    3    1            ?            1255    16409 #   fetch_available_ingredient_detail()    FUNCTION     ?  CREATE FUNCTION public.fetch_available_ingredient_detail() RETURNS TABLE(id integer, ing_id integer, province character varying, price double precision, quantity double precision, supplier character varying, is_hidden boolean)
    LANGUAGE plpgsql
    AS $$
BEGIN 
return query 
		select * from ingredient_detail where ingredient_detail.quantity > 0 AND ingredient_detail.is_hidden = false;
END;
$$;
 :   DROP FUNCTION public.fetch_available_ingredient_detail();
       public       postgres    false    3    1            ?            1255    16410    fetch_available_supplier()    FUNCTION       CREATE FUNCTION public.fetch_available_supplier() RETURNS TABLE(id integer, name character varying, ingredients character varying, is_hidden boolean)
    LANGUAGE plpgsql
    AS $$
begin
	return query 
		select * from supplier where supplier.is_hidden = false;
end;
$$;
 1   DROP FUNCTION public.fetch_available_supplier();
       public       postgres    false    3    1            ?            1255    16411    fetch_ingredient(integer)    FUNCTION     ?   CREATE FUNCTION public.fetch_ingredient(ing_id integer) RETURNS TABLE(id integer, name character varying, is_hidden boolean)
    LANGUAGE plpgsql
    AS $$
begin
	return query 
		select * from ingredient where ingredient.id = ing_id;
end;
$$;
 7   DROP FUNCTION public.fetch_ingredient(ing_id integer);
       public       postgres    false    3    1            ?            1255    16412 *   fetch_ingredient_detail_by_ing_id(integer)    FUNCTION     ?  CREATE FUNCTION public.fetch_ingredient_detail_by_ing_id(ingd_id integer) RETURNS TABLE(id integer, ing_id integer, province character varying, price double precision, quantity double precision, supplier character varying, is_hidden boolean)
    LANGUAGE plpgsql
    AS $$
BEGIN 
return query 
		select * from ingredient_detail where ingredient_detail.ing_id = ingd_id order by ingredient_detail.id asc;
END;
$$;
 I   DROP FUNCTION public.fetch_ingredient_detail_by_ing_id(ingd_id integer);
       public       postgres    false    3    1            ?            1255    16413    fetch_supplier(integer)    FUNCTION       CREATE FUNCTION public.fetch_supplier(sid integer) RETURNS TABLE(id integer, name character varying, ingredients character varying, is_hidden boolean)
    LANGUAGE plpgsql
    AS $$
begin
	return query 
		select * from supplier where supplier.id = sid;
end;
$$;
 2   DROP FUNCTION public.fetch_supplier(sid integer);
       public       postgres    false    1    3            ?            1255    16414 /   fetch_supplier_by_ingredient(character varying)    FUNCTION     P  CREATE FUNCTION public.fetch_supplier_by_ingredient(ingredient character varying) RETURNS TABLE(id integer, name character varying, ingredients character varying, is_hidden boolean)
    LANGUAGE plpgsql
    AS $$
begin
	return query 
		SELECT * FROM supplier WHERE UPPER(supplier.ingredients) LIKE UPPER('%'||ingredient||'%');
end;
$$;
 Q   DROP FUNCTION public.fetch_supplier_by_ingredient(ingredient character varying);
       public       postgres    false    1    3            ?            1255    16415 7   restock_ingredient(integer, character varying, integer)    FUNCTION     Z  CREATE FUNCTION public.restock_ingredient(ing_detail_id integer, sup_name character varying, ing_quantity integer) RETURNS character varying
    LANGUAGE plpgsql
    AS $$
BEGIN	
  UPDATE ingredient_detail
  SET supplier = sup_name, quantity = ing_quantity
  WHERE ingredient_detail.id = ing_detail_id;
  RETURN 'INGREDIENT RESTOCKED!';
END;
$$;
 r   DROP FUNCTION public.restock_ingredient(ing_detail_id integer, sup_name character varying, ing_quantity integer);
       public       postgres    false    1    3            ?            1255    16496    show_all_pizza()    FUNCTION     ?   CREATE FUNCTION public.show_all_pizza() RETURNS TABLE(id integer, size integer, price double precision, pizza_name character varying)
    LANGUAGE plpgsql
    AS $$
begin
	return query 
		select * from pizza;
end;
$$;
 '   DROP FUNCTION public.show_all_pizza();
       public       postgres    false    1    3            ?            1255    16416 6   update_ingredient(integer, character varying, boolean)    FUNCTION     G  CREATE FUNCTION public.update_ingredient(ing_id integer, ing_name character varying, ing_is_hidden boolean) RETURNS character varying
    LANGUAGE plpgsql
    AS $$
BEGIN	
  UPDATE ingredient
  SET name = ing_name, is_hidden = ing_is_hidden
  WHERE ingredient.id = ing_id;
  RETURN 'Ingredient updated successfully!';
END;
$$;
 k   DROP FUNCTION public.update_ingredient(ing_id integer, ing_name character varying, ing_is_hidden boolean);
       public       postgres    false    1    3            ?            1255    16417 <   update_ingredient_detail(integer, double precision, boolean)    FUNCTION     P  CREATE FUNCTION public.update_ingredient_detail(ing_detail_id integer, ing_price double precision, ing_is_hidden boolean) RETURNS character varying
    LANGUAGE plpgsql
    AS $$
BEGIN 
UPDATE public.ingredient_detail
	SET price = ing_price, is_hidden = ing_is_hidden
	WHERE id = ing_detail_id;
	return 'updated successfully';
END;
$$;
 y   DROP FUNCTION public.update_ingredient_detail(ing_detail_id integer, ing_price double precision, ing_is_hidden boolean);
       public       postgres    false    3    1            ?            1255    16418 #   update_ingredient_quantity(integer)    FUNCTION       CREATE FUNCTION public.update_ingredient_quantity(ing_detail_id integer) RETURNS character varying
    LANGUAGE plpgsql
    AS $$
BEGIN	
  UPDATE ingredient_detail
  SET quantity = quantity -1
  WHERE id = ing_detail_id;
  RETURN 'INGREDIENT UPDATED!';
END;
$$;
 H   DROP FUNCTION public.update_ingredient_quantity(ing_detail_id integer);
       public       postgres    false    1    3            ?            1255    16419 G   update_supplier(integer, character varying, character varying, boolean)    FUNCTION       CREATE FUNCTION public.update_supplier(sup_id integer, sup_name character varying, sup_ingredients character varying, sup_ishidden boolean) RETURNS character varying
    LANGUAGE plpgsql
    AS $$
BEGIN	
  UPDATE supplier
  SET name = sup_name, ingredients = sup_ingredients, is_hidden = sup_ishidden
  WHERE supplier.id = sup_id;
  RETURN 'Supplier updated successfully!';
END;
$$;
 ?   DROP FUNCTION public.update_supplier(sup_id integer, sup_name character varying, sup_ingredients character varying, sup_ishidden boolean);
       public       postgres    false    1    3            ?            1259    16481    customer    TABLE     ?   CREATE TABLE public.customer (
    cus_id integer NOT NULL,
    customer_name character varying NOT NULL,
    address character varying NOT NULL,
    phone character varying NOT NULL
);
    DROP TABLE public.customer;
       public         postgres    false    3            ?            1259    16479    customer_cus_id_seq    SEQUENCE     ?   CREATE SEQUENCE public.customer_cus_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE public.customer_cus_id_seq;
       public       postgres    false    207    3            O           0    0    customer_cus_id_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE public.customer_cus_id_seq OWNED BY public.customer.cus_id;
            public       postgres    false    206            ?            1259    16420 
   ingredient    TABLE     ?   CREATE TABLE public.ingredient (
    id integer NOT NULL,
    name character varying NOT NULL,
    is_hidden boolean NOT NULL
);
    DROP TABLE public.ingredient;
       public         postgres    false    3            ?            1259    16426    ingredient_detail    TABLE       CREATE TABLE public.ingredient_detail (
    id integer NOT NULL,
    ing_id integer NOT NULL,
    province character varying NOT NULL,
    price double precision NOT NULL,
    quantity double precision NOT NULL,
    supplier character varying NOT NULL,
    is_hidden boolean NOT NULL
);
 %   DROP TABLE public.ingredient_detail;
       public         postgres    false    3            ?            1259    16432    ingredient_detail_id_seq    SEQUENCE     ?   CREATE SEQUENCE public.ingredient_detail_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public.ingredient_detail_id_seq;
       public       postgres    false    3    197            P           0    0    ingredient_detail_id_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE public.ingredient_detail_id_seq OWNED BY public.ingredient_detail.id;
            public       postgres    false    198            ?            1259    16434    ingredient_id_seq    SEQUENCE     z   CREATE SEQUENCE public.ingredient_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.ingredient_id_seq;
       public       postgres    false    196    3            Q           0    0    ingredient_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public.ingredient_id_seq OWNED BY public.ingredient.id;
            public       postgres    false    199            ?            1259    16436    order    TABLE       CREATE TABLE public."order" (
    id integer NOT NULL,
    pizza_size integer NOT NULL,
    ingredients character varying NOT NULL,
    pizza_price double precision NOT NULL,
    ing_price double precision NOT NULL,
    total_price double precision NOT NULL
);
    DROP TABLE public."order";
       public         postgres    false    3            ?            1259    16442    order_id_seq    SEQUENCE     u   CREATE SEQUENCE public.order_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.order_id_seq;
       public       postgres    false    200    3            R           0    0    order_id_seq    SEQUENCE OWNED BY     ?   ALTER SEQUENCE public.order_id_seq OWNED BY public."order".id;
            public       postgres    false    201            ?            1259    16444    pizza    TABLE     ?   CREATE TABLE public.pizza (
    id integer NOT NULL,
    size integer NOT NULL,
    price double precision NOT NULL,
    pizza_name character varying
);
    DROP TABLE public.pizza;
       public         postgres    false    3            ?            1259    16447    pizza_id_seq    SEQUENCE     u   CREATE SEQUENCE public.pizza_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.pizza_id_seq;
       public       postgres    false    3    202            S           0    0    pizza_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE public.pizza_id_seq OWNED BY public.pizza.id;
            public       postgres    false    203            ?            1259    16449    supplier    TABLE     ?   CREATE TABLE public.supplier (
    id integer NOT NULL,
    name character varying NOT NULL,
    ingredients character varying NOT NULL,
    is_hidden boolean NOT NULL
);
    DROP TABLE public.supplier;
       public         postgres    false    3            ?            1259    16455    supplier_id_seq    SEQUENCE     x   CREATE SEQUENCE public.supplier_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.supplier_id_seq;
       public       postgres    false    3    204            T           0    0    supplier_id_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE public.supplier_id_seq OWNED BY public.supplier.id;
            public       postgres    false    205            ?
           2604    16484    customer cus_id    DEFAULT     r   ALTER TABLE ONLY public.customer ALTER COLUMN cus_id SET DEFAULT nextval('public.customer_cus_id_seq'::regclass);
 >   ALTER TABLE public.customer ALTER COLUMN cus_id DROP DEFAULT;
       public       postgres    false    206    207    207            ?
           2604    16457    ingredient id    DEFAULT     n   ALTER TABLE ONLY public.ingredient ALTER COLUMN id SET DEFAULT nextval('public.ingredient_id_seq'::regclass);
 <   ALTER TABLE public.ingredient ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    199    196            ?
           2604    16458    ingredient_detail id    DEFAULT     |   ALTER TABLE ONLY public.ingredient_detail ALTER COLUMN id SET DEFAULT nextval('public.ingredient_detail_id_seq'::regclass);
 C   ALTER TABLE public.ingredient_detail ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    198    197            ?
           2604    16459    order id    DEFAULT     f   ALTER TABLE ONLY public."order" ALTER COLUMN id SET DEFAULT nextval('public.order_id_seq'::regclass);
 9   ALTER TABLE public."order" ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    201    200            ?
           2604    16460    pizza id    DEFAULT     d   ALTER TABLE ONLY public.pizza ALTER COLUMN id SET DEFAULT nextval('public.pizza_id_seq'::regclass);
 7   ALTER TABLE public.pizza ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    203    202            ?
           2604    16461    supplier id    DEFAULT     j   ALTER TABLE ONLY public.supplier ALTER COLUMN id SET DEFAULT nextval('public.supplier_id_seq'::regclass);
 :   ALTER TABLE public.supplier ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    205    204            F          0    16481    customer 
   TABLE DATA               I   COPY public.customer (cus_id, customer_name, address, phone) FROM stdin;
    public       postgres    false    207    v       ;          0    16420 
   ingredient 
   TABLE DATA               9   COPY public.ingredient (id, name, is_hidden) FROM stdin;
    public       postgres    false    196   {v       <          0    16426    ingredient_detail 
   TABLE DATA               g   COPY public.ingredient_detail (id, ing_id, province, price, quantity, supplier, is_hidden) FROM stdin;
    public       postgres    false    197   ?v       ?          0    16436    order 
   TABLE DATA               c   COPY public."order" (id, pizza_size, ingredients, pizza_price, ing_price, total_price) FROM stdin;
    public       postgres    false    200   rw       A          0    16444    pizza 
   TABLE DATA               <   COPY public.pizza (id, size, price, pizza_name) FROM stdin;
    public       postgres    false    202   ?x       C          0    16449    supplier 
   TABLE DATA               D   COPY public.supplier (id, name, ingredients, is_hidden) FROM stdin;
    public       postgres    false    204   uy       U           0    0    customer_cus_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.customer_cus_id_seq', 5, true);
            public       postgres    false    206            V           0    0    ingredient_detail_id_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public.ingredient_detail_id_seq', 36, true);
            public       postgres    false    198            W           0    0    ingredient_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.ingredient_id_seq', 12, true);
            public       postgres    false    199            X           0    0    order_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('public.order_id_seq', 34, true);
            public       postgres    false    201            Y           0    0    pizza_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('public.pizza_id_seq', 14, true);
            public       postgres    false    203            Z           0    0    supplier_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.supplier_id_seq', 27, true);
            public       postgres    false    205            ?
           2606    16489    customer customer_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.customer
    ADD CONSTRAINT customer_pkey PRIMARY KEY (cus_id);
 @   ALTER TABLE ONLY public.customer DROP CONSTRAINT customer_pkey;
       public         postgres    false    207            ?
           2606    16463 !   ingredient_detail ingredient_pkey 
   CONSTRAINT     _   ALTER TABLE ONLY public.ingredient_detail
    ADD CONSTRAINT ingredient_pkey PRIMARY KEY (id);
 K   ALTER TABLE ONLY public.ingredient_detail DROP CONSTRAINT ingredient_pkey;
       public         postgres    false    197            ?
           2606    16465    ingredient ingredient_pkey1 
   CONSTRAINT     Y   ALTER TABLE ONLY public.ingredient
    ADD CONSTRAINT ingredient_pkey1 PRIMARY KEY (id);
 E   ALTER TABLE ONLY public.ingredient DROP CONSTRAINT ingredient_pkey1;
       public         postgres    false    196            ?
           2606    16467    order order_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public."order"
    ADD CONSTRAINT order_pkey PRIMARY KEY (id);
 <   ALTER TABLE ONLY public."order" DROP CONSTRAINT order_pkey;
       public         postgres    false    200            ?
           2606    16469    pizza pizza_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.pizza
    ADD CONSTRAINT pizza_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.pizza DROP CONSTRAINT pizza_pkey;
       public         postgres    false    202            ?
           2606    16471    supplier supplier_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.supplier
    ADD CONSTRAINT supplier_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.supplier DROP CONSTRAINT supplier_pkey;
       public         postgres    false    204            F   K   x?3?LKK??4?t ??e?????ZR?X??i`hjdhdh`aj?e?P????锘??1J???q??qqq ~?      ;   I   x???tN,QH??O?L???LLL҆??9?9
???٩y !C??Sjj?o?霟?
d?q?T?p??qqq ???      <   ?   x?Uͽ
?0???>A??I?1
q+????????з78??NXX?2???8?A??1??$?F?^?g?sNW.?!????Sw_?d8?|? ??U???5?cч?_??r?5?A??;_???[?*?p??/c???1-      ?   x  x??TMO?0=ۿ??MBU?iz? ????
2mZY?????g?j[?Z+?~~?[C?R?%&F???mV??.|?ӛ??7ɬmߓ?CXԫ?)???D??#??H??/F?=???p??n??z?w?6u#pN?,F
lY?K,?(?~?~"C?3f5?28?ߖo:??h?K?&;?Z"??-Qz鬾?õ?????RW?$??؇D????ڇ6za??&?'wb
??ߣ?\D?53H?&??????4???dkWj	?N%x$?^??dH?N?v?4(5r ??E?2?Ǻ???6?Y???+1?? ??1??Dtj?e??v??-?"?#?U?I??R????~??9SP????dR???u_XA?U(????UM??5E????Y?      A   k   x?U˱
?0?Y???;7N??;?ulc?
???"4<膸l???Q??"????R
?+???~Dk?w???;%?1Ơ???sR"4A????>??:??4>??~??      C   ?   x?5???0?g?)? C??i??P??,V??(i??#?ۓ
?پ??W??J)y?(g7?????Q?'?z?z?p?pF??	?????ֆhd3?????@??????52MN?g_Q?<???s?;Y?????a6??Oy ??rI????Y?ÝP*
Сv??.???#Ţ?VUU}?BE?     