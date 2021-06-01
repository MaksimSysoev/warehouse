CREATE TABLE IF NOT EXISTS users
(
	id bigserial
		constraint users_pk
			primary key,
	login varchar(50) not null unique ,
	password varchar(255) not null,
	role varchar(255) default 'USER' not null,
	status varchar(20) default 'ACTIVE'
);

CREATE TABLE IF NOT EXISTS categories
(
    id serial primary key,
    name varchar(100) not null,
    descr text not null
);

CREATE TABLE if not exists products (
	id serial primary key,
	name varchar(100) not null,
	descr text not null,
	price int not null,
	count int,
	img text,
	categories_id int references categories(id)
);






INSERT INTO USERS (id, login, password, role, status) SELECT 1, 'admin', '$2y$12$BEGX0VVOz7f5R5yWIQu4F..8LdjeKCBZ0tsXl.QE7kFC4O8z6.f16', 'ADMIN', 'ACTIVE'
WHERE NOT EXISTS (SELECT id FROM users WHERE id=1);


INSERT INTO USERS (id, login, password, role, status) SELECT 2, 'user', '$2y$12$FWzRhWxfzjfx4Ii2vid9GO5NLqVhwPSwqNq5OyHBpkOX.q3J9TqIi', 'USER', 'ACTIVE'
WHERE NOT EXISTS (SELECT id FROM users WHERE id=2);

/*
INSERT INTO categories (id, name, descr) SELECT
1,
'Авторитет',
'Автосалон "АВТОРИТЕТ" официальный дилер ПАО АВТОВАЗ в г. Архангельске приветствует Вас на сайте компании!
Наша компания является официальным дилером  ПАО  "АВТОВАЗ" с 1999 года и  за это время  и мы и тысячи наших клиентов убедились в том, что вся линейка LADA- достойный пример практичных, надежных и недорогих автомобилей.
Главное направление нашей работы - это продажа и сервисное обслуживание  автомобилей LADA, и мы постоянно следим и улучшаем качество работы  как в автосалоне, так и внашем специализированном сервисе. Все сотрудники, работающие у нас имеют сертификаты и проходят регулярное обучение по стандартам ПАО "АВТОВАЗ".'
WHERE NOT EXISTS (SELECT id FROM categories WHERE id = 1);

INSERT INTO categories (id, name, descr) SELECT
2,
'Автомир',
'Сеть «Автомир» – это автосалоны самых авторитетных мировых марок, где купить авто можно на выгодных и комфортных условиях. Планируете сменить общественный транспорт на собственный «экипаж»? Мечтаете о крутом внедорожнике? Пора обновить автопарк Вашей компании? Добро пожаловать в любой из наших дилерских центров!
Наши менеджеры с радостью предоставят экспертную консультацию по выбранной машине и организуют пробный заезд по улицам Архангельска. После этого Вы сможете буквально в течение часа оформить сделку купли-продажи и стать счастливым владельцем нового автомобиля.'
WHERE NOT EXISTS (SELECT id FROM categories WHERE id = 2);

INSERT INTO categories (id, name, descr) SELECT
3,
'Динамика',
'Единственный официальный дилер Hyundai в Архангельске с 2009 года.
Подберем для вас новый Hyundai и предложим комфортные условия его обслуживания.
В нашем салоне на постоянной основе действуют спецпредложения и различные программы лояльности.
Архангельск, пр.Московский, д.48.
Работаем ежедневно с 9 до 21 часа.'
WHERE NOT EXISTS (SELECT id FROM categories WHERE id = 3);

INSERT INTO categories (id, name, descr) SELECT
4,
'Авто браво',
'Обновление Официальный дилер ŠKODA — компания АВТО БРАВО работает в Архангельске с января 2008 г.
Единственный в Архангельске дилерский центр, построенный в полном соответствии со стандартами марки ŠKODA, располагает авторизованным сервисным центром, оснащенным ведущими европейскими производителями и шоу-румом на восемь автомобилей.
Сегодня мы готовы предложить Вам автомобили всего модельного ряда ŠKODA со склада и на заказ, кредитные и лизинговые программы, страхование и регистрацию автомобилей, trade-in и test-drive в любое, удобное для Вас время, гарантийное и послегарантийное обслуживание автомобилей ŠKODA, оригинальные запасные части и аксессуары.'
WHERE NOT EXISTS (SELECT id FROM categories WHERE id = 4);



INSERT INTO products (id, name, descr, price, count, img, categories_id)
SELECT 1,
'Рено Латитьюд',
'автомобиль бизнес-класса',
1500000,
1,
'1.jpg',
3
WHERE NOT EXISTS (SELECT id FROM products WHERE id = 1);

INSERT INTO products (id, name, descr, price, count, img, categories_id)
SELECT 2,
'Рено Логан',
'автомобиль эконом-класса',
680000,
10,
'2.jpg',
3
WHERE NOT EXISTS (SELECT id FROM products WHERE id = 2);

INSERT INTO products (id, name, descr, price, count, img, categories_id)
SELECT 3,
'Рено Клио',
'автомобиль класса супермини',
1100000,
10,
'3.jpg',
3
WHERE NOT EXISTS (SELECT id FROM products WHERE id = 3);

INSERT INTO products (id, name, descr, price, count, img, categories_id)
SELECT 4,
'Рено Каптюр',
'компактный кроссовер',
1100000,
4,
'4.jpg',
3
WHERE NOT EXISTS (SELECT id FROM products WHERE id = 4);

INSERT INTO products (id, name, descr, price, count, img, categories_id)
SELECT 5,
'Рено Меган',
'малый семейный автомобиль',
1100000,
2,
'5.jpg',
3
WHERE NOT EXISTS (SELECT id FROM products WHERE id = 5);

INSERT INTO products (id, name, descr, price, count, img, categories_id)
SELECT 6,
'Рено Лагуна',
'среднеразмерный автомобиль',
1200000,
1,
'6.jpg',
3
WHERE NOT EXISTS (SELECT id FROM products WHERE id = 6);

INSERT INTO products (id, name, descr, price, count, img, categories_id)
SELECT 7,
'Рено Флюенс',
'компактный автомобиль',
800000,
5,
'7.jpg',
3
WHERE NOT EXISTS (SELECT id FROM products WHERE id = 7);

INSERT INTO products (id, name, descr, price, count, img, categories_id)
SELECT 8,
'Рено Дастер',
'компактный кроссовер',
900000,
3,
'8.jpg',
3
WHERE NOT EXISTS (SELECT id FROM products WHERE id = 8);

INSERT INTO products (id, name, descr, price, count, img, categories_id)
SELECT 9,
'Рено Сандеро',
'субкомпактный хэтчбек',
680000,
6,
'9.jpg',
3
WHERE NOT EXISTS (SELECT id FROM products WHERE id = 9);

INSERT INTO products (id, name, descr, price, count, img, categories_id)
SELECT 10,
'Рено Колеос',
'компактный кроссовер',
2000000,
2,
'10.jpg',
3
WHERE NOT EXISTS (SELECT id FROM products WHERE id = 10);

INSERT INTO products (id, name, descr, price, count, img, categories_id)
SELECT 11,
'Рено Символ',
'автомобиль малого класса',
680000,
1,
'11.jpg',
3
WHERE NOT EXISTS (SELECT id FROM products WHERE id = 11);

INSERT INTO products (id, name, descr, price, count, img, categories_id)
SELECT 12,
'Рено Аркана',
'компактный кроссовер',
1400000,
3,
'12.jpg',
3
WHERE NOT EXISTS (SELECT id FROM products WHERE id = 12);

INSERT INTO products (id, name, descr, price, count, img, categories_id)
SELECT 13,
'Лада Гранта',
'бюджетный переднеприводный автомобиль',
500000,
10,
'13.jpg',
1
WHERE NOT EXISTS (SELECT id FROM products WHERE id = 13);

INSERT INTO products (id, name, descr, price, count, img, categories_id)
SELECT 14,
'Лада Веста',
'семейство российских автомобилей малого класса',
500000,
5,
'14.jpg',
1
WHERE NOT EXISTS (SELECT id FROM products WHERE id = 14);

INSERT INTO products (id, name, descr, price, count, img, categories_id)
SELECT 15,
'Уаз Патриот',
'полноприводный автомобиль повышенной проходимости',
900000,
2,
'15.jpg',
1
WHERE NOT EXISTS (SELECT id FROM products WHERE id = 15);

INSERT INTO products (id, name, descr, price, count, img, categories_id)
SELECT 16,
'Шевроле Нива',
'советский и российский автомобиль',
900000,
4,
'16.jpg',
1
WHERE NOT EXISTS (SELECT id FROM products WHERE id = 16)

*/





























































