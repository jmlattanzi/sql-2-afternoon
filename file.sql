select * from invoice_line where unit_price > 0.99;

select 
    i.invoice_date, 
    c.first_name, 
    c.last_name, 
    total 
from invoice i 
join customer c on i.customer_id = c.customer_id;

select c.first_name, c.last_name, e.first_name, e.last_name from customer c join employee e on c.support_rep_id = e.employee_id;

select artist.name, album.title from artist
join album on artist.artist_id = album.artist_id;

select pt.track_id from playlist_track pt
join playlist on pt.playlist_id = playlist.playlist_id
where playlist.name = 'Music';

select track.name from track join playlist on track.track_id = playlist.playlist_id;

select t.name, p.name from track t
join playlist_track pt on t.track_id = pt.track_id
join playlist p on pt.playlist_id = p.playlist_id;

select track.name, album.title from track
join album on track.album_id = album.album_id
join genre on genre.genre_id = track.genre_id
where genre.name = 'Alternative & Punk';

select * from invoice_line where unit_price > 0.99;

select * from playlist where playlist_id in (
	select playlist_id from playlist where name = 'Music'
);

select name from track where track_id in (
	select track_id from playlist_track where playlist_id = 5
);

select * from track where genre_id in (
	select genre_id from genre where name = 'Comedy'
);

select * from track where album_id in (
	select album_id from album where title = 'Fireball'
);

select * from track where album_id in (
	select album_id from album where artist_id in(
  	select artist_id from artist where name = 'Queen'
  )
);

update customer set fax = null where fax is not null

update customer set company = 'Self' where company is null;

update customer 
set last_name = 'Thompson' 
where first_name = 'Julia Barnett' and last_name = 'Barnett';

update customer set support_rep_id = 4 where email = 'luisrojas@yahoo.cl';

update track set composer = 'the darkness around us' where genre_id in (
	select name from genre where name = 'Metal'
) and composer is null;

select count(*), genre.name from track 
join genre on genre.genre_id = track.track_id
group by genre.name

select count(*), genre.name from track 
join genre on genre.genre_id = track.genre_id
where genre.name = 'Pop' and genre.name = 'Rock'
group by genre.name;

select count(*), artist.name from artist
join album 
on album.artist_id = artist.artist_id
group by artist.name;

select distinct composer from track;

select distinct billing_postal_code from invoice;

select distinct company from customer;

delete from practice_delete where type = 'bronze';

delete from practice_delete where type = 'silver';

delete from practice_delete where value = 150;

create table users (
	user_id serial,
  name text,
  email text
);

create table product (
	product_id serial,
  name text,
  price int
);

create table orders (
	order_id serial,
  ref_id int
);

insert into users (name, email) values ('ugh', 'my wrist hurts');
insert into users (name, email) values ('oof', 'my brain hurts');
insert into users (name, email) values ('ouch', 'my eyes hurt');

insert into product (name, price) values ('trash', 12);
insert into product (name, price) values ('garbage', 13);
insert into product (name, price) values ('sand', 14);

insert into orders (ref_id) values (1);
insert into orders (ref_id) values (2);
insert into orders (ref_id) values (3);

select product.name from product 
join orders on orders.ref_id = product.product_id;

select * from orders;

select sum(product.price) 
from product join orders on orders.ref_id = product.product_id
where orders.ref_id = 1;

alter table orders add column user_id int

alter table orders add foreign key (user_id) references users(user_id);

select * from orders 
join users on users.user_id = orders.user_id
where users.name = 'ouch';

select count(*), users.name from orders 
join users on users.user_id = orders.user_id
group by users.name;