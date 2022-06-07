-- Création des tables

CREATE TABLE user(
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR (50) NOT NULL UNIQUE,
    nom VARCHAR(50) NOT NULL,
    prenom VARCHAR(50) NOT NULL,
    email VARCHAR(50) NOT NULL UNIQUE,
    avatar VARCHAR(100) NOT NULL
    );

CREATE TABLE photos(
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    url_image VARCHAR (100) NOT NULL,
    id_user INT,
    FOREIGN KEY(id_user) REFERENCES user(id) ON DELETE CASCADE 
    );

CREATE TABLE likes(
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    id_user INT,
    id_photo INT, 
    FOREIGN KEY(id_user) REFERENCES user(id) ON DELETE SET NULL,
    FOREIGN KEY(id_photo) REFERENCES photos(id) ON DELETE CASCADE
    );

CREATE TABLE commentaire(
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    contenu VARCHAR(100),
    id_user INT,
    id_photo INT, 
    FOREIGN KEY(id_user) REFERENCES user(id) ON DELETE SET NULL,
    FOREIGN KEY(id_photo) REFERENCES photos(id) ON DELETE CASCADE
    );

    -- Remplissage de la table user

insert into user (id, username, nom, prenom, email, avatar) values (1, 'ccarleton0', 'Carleton', 'Carolynn', 'ccarleton0@psu.edu', 'https://robohash.org/enimnecessitatibuseaque.png?size=50x50&set=set1');
insert into user (id, username, nom, prenom, email, avatar) values (2, 'rbaudry1', 'Baudry', 'Ramsay', 'rbaudry1@flavors.me', 'https://robohash.org/dolorautvoluptatibus.png?size=50x50&set=set1');
insert into user (id, username, nom, prenom, email, avatar) values (3, 'cleyrroyd2', 'Leyrroyd', 'Cyrus', 'cleyrroyd2@smugmug.com', 'https://robohash.org/verosintid.png?size=50x50&set=set1');
insert into user (id, username, nom, prenom, email, avatar) values (4, 'dfibbens3', 'Fibbens', 'Diahann', 'dfibbens3@dmoz.org', 'https://robohash.org/accusamusexpeditanulla.png?size=50x50&set=set1');
insert into user (id, username, nom, prenom, email, avatar) values (5, 'bdy4', 'Dy', 'Basile', 'bdy4@addtoany.com', 'https://robohash.org/sitvoluptatemperferendis.png?size=50x50&set=set1');
insert into user (id, username, nom, prenom, email, avatar) values (6, 'sstoakes5', 'Stoakes', 'Saunders', 'sstoakes5@theguardian.com', 'https://robohash.org/laboriosamatqueautem.png?size=50x50&set=set1');
insert into user (id, username, nom, prenom, email, avatar) values (7, 'amanshaw6', 'Manshaw', 'Allie', 'amanshaw6@mysql.com', 'https://robohash.org/quoexpeditavero.png?size=50x50&set=set1');
insert into user (id, username, nom, prenom, email, avatar) values (8, 'avallance7', 'Vallance', 'Alessandra', 'avallance7@amazon.com', 'https://robohash.org/nesciunttemporeomnis.png?size=50x50&set=set1');
insert into user (id, username, nom, prenom, email, avatar) values (9, 'thefford8', 'Hefford', 'Tildie', 'thefford8@columbia.edu', 'https://robohash.org/etaperiammagni.png?size=50x50&set=set1');
insert into user (id, username, nom, prenom, email, avatar) values (10, 'dlynas9', 'Lynas', 'Duncan', 'dlynas9@1688.com', 'https://robohash.org/velitutrerum.png?size=50x50&set=set1');
insert into user (id, username, nom, prenom, email, avatar) values (11, 'pokierana', 'O''Kieran', 'Paul', 'pokierana@joomla.org', 'https://robohash.org/placeatutdoloribus.png?size=50x50&set=set1');
insert into user (id, username, nom, prenom, email, avatar) values (12, 'gattewellb', 'Attewell', 'Georgeta', 'gattewellb@cornell.edu', 'https://robohash.org/dolorumnemonostrum.png?size=50x50&set=set1');
insert into user (id, username, nom, prenom, email, avatar) values (13, 'cwhopplesc', 'Whopples', 'Catharina', 'cwhopplesc@china.com.cn', 'https://robohash.org/officiiseligendiea.png?size=50x50&set=set1');
insert into user (id, username, nom, prenom, email, avatar) values (14, 'koscandalld', 'O''Scandall', 'Kaila', 'koscandalld@wikia.com', 'https://robohash.org/praesentiumofficiisconsequatur.png?size=50x50&set=set1');
insert into user (id, username, nom, prenom, email, avatar) values (15, 'kduchennee', 'Duchenne', 'Knox', 'kduchennee@xinhuanet.com', 'https://robohash.org/sitlaboriosamsuscipit.png?size=50x50&set=set1');
insert into user (id, username, nom, prenom, email, avatar) values (16, 'tchatresf', 'Chatres', 'Thalia', 'tchatresf@livejournal.com', 'https://robohash.org/molestiaevoluptatemsuscipit.png?size=50x50&set=set1');
insert into user (id, username, nom, prenom, email, avatar) values (17, 'mgeeraertg', 'Geeraert', 'Mickey', 'mgeeraertg@google.it', 'https://robohash.org/etoditducimus.png?size=50x50&set=set1');
insert into user (id, username, nom, prenom, email, avatar) values (18, 'dbrittlesh', 'Brittles', 'D''arcy', 'dbrittlesh@yelp.com', 'https://robohash.org/invitaeea.png?size=50x50&set=set1');
insert into user (id, username, nom, prenom, email, avatar) values (19, 'tvondraseki', 'Vondrasek', 'Tania', 'tvondraseki@surveymonkey.com', 'https://robohash.org/assumendaauta.png?size=50x50&set=set1');
insert into user (id, username, nom, prenom, email, avatar) values (20, 'ccastanej', 'Castane', 'Ceil', 'ccastanej@webeden.co.uk', 'https://robohash.org/minusquoea.png?size=50x50&set=set1');


-- Remplissage de la table photos

insert into photos (id, url_image, id_user) values (1, 'http://dummyimage.com/223x100.png/dddddd/000000', 14);
insert into photos (id, url_image, id_user) values (2, 'http://dummyimage.com/146x100.png/ff4444/ffffff', 13);
insert into photos (id, url_image, id_user) values (3, 'http://dummyimage.com/109x100.png/5fa2dd/ffffff', 4);
insert into photos (id, url_image, id_user) values (4, 'http://dummyimage.com/233x100.png/ff4444/ffffff', 6);
insert into photos (id, url_image, id_user) values (5, 'http://dummyimage.com/188x100.png/ff4444/ffffff', 17);
insert into photos (id, url_image, id_user) values (6, 'http://dummyimage.com/165x100.png/ff4444/ffffff', 11);
insert into photos (id, url_image, id_user) values (7, 'http://dummyimage.com/110x100.png/cc0000/ffffff', 7);
insert into photos (id, url_image, id_user) values (8, 'http://dummyimage.com/147x100.png/ff4444/ffffff', 16);
insert into photos (id, url_image, id_user) values (9, 'http://dummyimage.com/140x100.png/ff4444/ffffff', 12);
insert into photos (id, url_image, id_user) values (10, 'http://dummyimage.com/155x100.png/5fa2dd/ffffff', 4);
insert into photos (id, url_image, id_user) values (11, 'http://dummyimage.com/105x100.png/ff4444/ffffff', 5);
insert into photos (id, url_image, id_user) values (12, 'http://dummyimage.com/247x100.png/ff4444/ffffff', 8);
insert into photos (id, url_image, id_user) values (13, 'http://dummyimage.com/126x100.png/5fa2dd/ffffff', 12);
insert into photos (id, url_image, id_user) values (14, 'http://dummyimage.com/102x100.png/ff4444/ffffff', 4);
insert into photos (id, url_image, id_user) values (15, 'http://dummyimage.com/107x100.png/ff4444/ffffff', 12);
insert into photos (id, url_image, id_user) values (16, 'http://dummyimage.com/106x100.png/5fa2dd/ffffff', 10);
insert into photos (id, url_image, id_user) values (17, 'http://dummyimage.com/220x100.png/dddddd/000000', 20);
insert into photos (id, url_image, id_user) values (18, 'http://dummyimage.com/131x100.png/ff4444/ffffff', 16);
insert into photos (id, url_image, id_user) values (19, 'http://dummyimage.com/145x100.png/cc0000/ffffff', 16);
insert into photos (id, url_image, id_user) values (20, 'http://dummyimage.com/140x100.png/5fa2dd/ffffff', 7);
insert into photos (id, url_image, id_user) values (21, 'http://dummyimage.com/236x100.png/dddddd/000000', 2);
insert into photos (id, url_image, id_user) values (22, 'http://dummyimage.com/209x100.png/ff4444/ffffff', 12);
insert into photos (id, url_image, id_user) values (23, 'http://dummyimage.com/222x100.png/5fa2dd/ffffff', 2);
insert into photos (id, url_image, id_user) values (24, 'http://dummyimage.com/244x100.png/5fa2dd/ffffff', 19);
insert into photos (id, url_image, id_user) values (25, 'http://dummyimage.com/125x100.png/cc0000/ffffff', 17);
insert into photos (id, url_image, id_user) values (26, 'http://dummyimage.com/133x100.png/dddddd/000000', 16);
insert into photos (id, url_image, id_user) values (27, 'http://dummyimage.com/205x100.png/dddddd/000000', 9);
insert into photos (id, url_image, id_user) values (28, 'http://dummyimage.com/244x100.png/dddddd/000000', 19);
insert into photos (id, url_image, id_user) values (29, 'http://dummyimage.com/143x100.png/dddddd/000000', 6);
insert into photos (id, url_image, id_user) values (30, 'http://dummyimage.com/197x100.png/dddddd/000000', 17);
insert into photos (id, url_image, id_user) values (31, 'http://dummyimage.com/223x100.png/cc0000/ffffff', 20);
insert into photos (id, url_image, id_user) values (32, 'http://dummyimage.com/125x100.png/cc0000/ffffff', 15);
insert into photos (id, url_image, id_user) values (33, 'http://dummyimage.com/162x100.png/dddddd/000000', 17);
insert into photos (id, url_image, id_user) values (34, 'http://dummyimage.com/226x100.png/ff4444/ffffff', 17);
insert into photos (id, url_image, id_user) values (35, 'http://dummyimage.com/189x100.png/cc0000/ffffff', 12);
insert into photos (id, url_image, id_user) values (36, 'http://dummyimage.com/199x100.png/ff4444/ffffff', 1);
insert into photos (id, url_image, id_user) values (37, 'http://dummyimage.com/105x100.png/ff4444/ffffff', 16);
insert into photos (id, url_image, id_user) values (38, 'http://dummyimage.com/183x100.png/dddddd/000000', 14);
insert into photos (id, url_image, id_user) values (39, 'http://dummyimage.com/199x100.png/cc0000/ffffff', 11);
insert into photos (id, url_image, id_user) values (40, 'http://dummyimage.com/119x100.png/ff4444/ffffff', 5);
insert into photos (id, url_image, id_user) values (41, 'http://dummyimage.com/248x100.png/dddddd/000000', 14);
insert into photos (id, url_image, id_user) values (42, 'http://dummyimage.com/103x100.png/5fa2dd/ffffff', 9);
insert into photos (id, url_image, id_user) values (43, 'http://dummyimage.com/109x100.png/5fa2dd/ffffff', 12);
insert into photos (id, url_image, id_user) values (44, 'http://dummyimage.com/102x100.png/5fa2dd/ffffff', 12);
insert into photos (id, url_image, id_user) values (45, 'http://dummyimage.com/134x100.png/dddddd/000000', 3);
insert into photos (id, url_image, id_user) values (46, 'http://dummyimage.com/147x100.png/dddddd/000000', 9);
insert into photos (id, url_image, id_user) values (47, 'http://dummyimage.com/197x100.png/cc0000/ffffff', 2);
insert into photos (id, url_image, id_user) values (48, 'http://dummyimage.com/160x100.png/cc0000/ffffff', 9);
insert into photos (id, url_image, id_user) values (49, 'http://dummyimage.com/165x100.png/5fa2dd/ffffff', 15);
insert into photos (id, url_image, id_user) values (50, 'http://dummyimage.com/114x100.png/cc0000/ffffff', 1);
insert into photos (id, url_image, id_user) values (51, 'http://dummyimage.com/244x100.png/dddddd/000000', 12);
insert into photos (id, url_image, id_user) values (52, 'http://dummyimage.com/166x100.png/cc0000/ffffff', 12);
insert into photos (id, url_image, id_user) values (53, 'http://dummyimage.com/227x100.png/5fa2dd/ffffff', 16);
insert into photos (id, url_image, id_user) values (54, 'http://dummyimage.com/209x100.png/ff4444/ffffff', 20);
insert into photos (id, url_image, id_user) values (55, 'http://dummyimage.com/105x100.png/5fa2dd/ffffff', 12);
insert into photos (id, url_image, id_user) values (56, 'http://dummyimage.com/205x100.png/cc0000/ffffff', 5);
insert into photos (id, url_image, id_user) values (57, 'http://dummyimage.com/200x100.png/cc0000/ffffff', 2);
insert into photos (id, url_image, id_user) values (58, 'http://dummyimage.com/111x100.png/dddddd/000000', 6);
insert into photos (id, url_image, id_user) values (59, 'http://dummyimage.com/179x100.png/dddddd/000000', 11);
insert into photos (id, url_image, id_user) values (60, 'http://dummyimage.com/209x100.png/cc0000/ffffff', 18);

-- Remplissage de la table likes

insert into likes (id, id_user, id_photo) values (1, 9, 55);
insert into likes (id, id_user, id_photo) values (2, 8, 24);
insert into likes (id, id_user, id_photo) values (3, 2, 56);
insert into likes (id, id_user, id_photo) values (4, 18, 50);
insert into likes (id, id_user, id_photo) values (5, 18, 18);
insert into likes (id, id_user, id_photo) values (6, 18, 31);
insert into likes (id, id_user, id_photo) values (7, 8, 17);
insert into likes (id, id_user, id_photo) values (8, 6, 33);
insert into likes (id, id_user, id_photo) values (9, 2, 27);
insert into likes (id, id_user, id_photo) values (10, 19, 6);
insert into likes (id, id_user, id_photo) values (11, 1, 2);
insert into likes (id, id_user, id_photo) values (12, 18, 35);
insert into likes (id, id_user, id_photo) values (13, 16, 36);
insert into likes (id, id_user, id_photo) values (14, 18, 57);
insert into likes (id, id_user, id_photo) values (15, 13, 24);
insert into likes (id, id_user, id_photo) values (16, 14, 30);
insert into likes (id, id_user, id_photo) values (17, 10, 56);
insert into likes (id, id_user, id_photo) values (18, 17, 4);
insert into likes (id, id_user, id_photo) values (19, 13, 44);
insert into likes (id, id_user, id_photo) values (20, 17, 28);
insert into likes (id, id_user, id_photo) values (21, 14, 19);
insert into likes (id, id_user, id_photo) values (22, 9, 15);
insert into likes (id, id_user, id_photo) values (23, 14, 17);
insert into likes (id, id_user, id_photo) values (24, 16, 28);
insert into likes (id, id_user, id_photo) values (25, 16, 17);
insert into likes (id, id_user, id_photo) values (26, 18, 24);
insert into likes (id, id_user, id_photo) values (27, 16, 8);
insert into likes (id, id_user, id_photo) values (28, 1, 7);
insert into likes (id, id_user, id_photo) values (29, 6, 31);
insert into likes (id, id_user, id_photo) values (30, 14, 40);
insert into likes (id, id_user, id_photo) values (31, 12, 34);
insert into likes (id, id_user, id_photo) values (32, 8, 26);
insert into likes (id, id_user, id_photo) values (33, 2, 41);
insert into likes (id, id_user, id_photo) values (34, 6, 23);
insert into likes (id, id_user, id_photo) values (35, 1, 40);
insert into likes (id, id_user, id_photo) values (36, 17, 55);
insert into likes (id, id_user, id_photo) values (37, 9, 23);
insert into likes (id, id_user, id_photo) values (38, 4, 6);
insert into likes (id, id_user, id_photo) values (39, 14, 41);
insert into likes (id, id_user, id_photo) values (40, 11, 35);
insert into likes (id, id_user, id_photo) values (41, 20, 44);
insert into likes (id, id_user, id_photo) values (42, 11, 49);
insert into likes (id, id_user, id_photo) values (43, 12, 32);
insert into likes (id, id_user, id_photo) values (44, 7, 21);
insert into likes (id, id_user, id_photo) values (45, 8, 21);
insert into likes (id, id_user, id_photo) values (46, 6, 42);
insert into likes (id, id_user, id_photo) values (47, 20, 19);
insert into likes (id, id_user, id_photo) values (48, 7, 13);
insert into likes (id, id_user, id_photo) values (49, 7, 37);
insert into likes (id, id_user, id_photo) values (50, 5, 60);
insert into likes (id, id_user, id_photo) values (51, 6, 54);
insert into likes (id, id_user, id_photo) values (52, 2, 53);
insert into likes (id, id_user, id_photo) values (53, 10, 32);
insert into likes (id, id_user, id_photo) values (54, 11, 58);
insert into likes (id, id_user, id_photo) values (55, 11, 17);
insert into likes (id, id_user, id_photo) values (56, 7, 57);
insert into likes (id, id_user, id_photo) values (57, 11, 25);
insert into likes (id, id_user, id_photo) values (58, 8, 10);
insert into likes (id, id_user, id_photo) values (59, 20, 31);
insert into likes (id, id_user, id_photo) values (60, 1, 46);

-- Remplissage de la table commentaire

insert into commentaire (id, contenu, id_user, id_photo) values (1, 'ut massa quis augue luctus tincidunt nulla', 8, 51);
insert into commentaire (id, contenu, id_user, id_photo) values (2, 'massa tempor convallis nulla neque libero convallis eget eleifend luctus ultricies eu nibh quisque id', 4, 59);
insert into commentaire (id, contenu, id_user, id_photo) values (3, 'ante vel ipsum praesent blandit lacinia erat vestibulum sed magna at nunc commodo placerat praesent', 2, 40);
insert into commentaire (id, contenu, id_user, id_photo) values (4, 'montes nascetur ridiculus mus etiam vel augue vestibulum rutrum rutrum neque aenean auctor gravida', 5, 22);
insert into commentaire (id, contenu, id_user, id_photo) values (5, 'vel ipsum praesent blandit lacinia erat', 15, 34);
insert into commentaire (id, contenu, id_user, id_photo) values (6, 'sollicitudin mi sit amet lobortis sapien sapien non', 19, 35);
insert into commentaire (id, contenu, id_user, id_photo) values (7, 'at nulla suspendisse potenti cras in purus eu magna vulputate luctus cum sociis natoque', 11, 21);
insert into commentaire (id, contenu, id_user, id_photo) values (8, 'ipsum dolor sit amet consectetuer adipiscing', 3, 44);
insert into commentaire (id, contenu, id_user, id_photo) values (9, 'elit proin interdum mauris non ligula pellentesque ultrices', 20, 33);
insert into commentaire (id, contenu, id_user, id_photo) values (10, 'volutpat convallis morbi odio odio elementum eu interdum eu tincidunt in leo maecenas', 6, 12);
insert into commentaire (id, contenu, id_user, id_photo) values (11, 'ac lobortis vel dapibus at diam nam tristique tortor eu', 5, 50);
insert into commentaire (id, contenu, id_user, id_photo) values (12, 'id turpis integer aliquet massa', 20, 3);
insert into commentaire (id, contenu, id_user, id_photo) values (13, 'quam pede lobortis ligula sit amet eleifend pede libero quis orci nullam molestie', 13, 4);
insert into commentaire (id, contenu, id_user, id_photo) values (14, 'sapien sapien non mi integer', 20, 20);
insert into commentaire (id, contenu, id_user, id_photo) values (15, 'dapibus nulla suscipit ligula in lacus curabitur at', 5, 51);
insert into commentaire (id, contenu, id_user, id_photo) values (16, 'platea dictumst aliquam augue quam sollicitudin vitae', 17, 31);
insert into commentaire (id, contenu, id_user, id_photo) values (17, 'justo in blandit ultrices enim lorem ipsum dolor sit amet', 16, 25);
insert into commentaire (id, contenu, id_user, id_photo) values (18, 'duis ac nibh fusce lacus purus aliquet', 19, 23);
insert into commentaire (id, contenu, id_user, id_photo) values (19, 'eu magna vulputate luctus cum sociis natoque penatibus', 10, 7);
insert into commentaire (id, contenu, id_user, id_photo) values (20, 'cubilia curae donec pharetra magna vestibulum aliquet ultrices erat tortor', 2, 33);
insert into commentaire (id, contenu, id_user, id_photo) values (21, 'elementum ligula vehicula consequat morbi a ipsum integer a nibh in quis justo maecenas rhoncus', 16, 53);
insert into commentaire (id, contenu, id_user, id_photo) values (22, 'lorem id ligula suspendisse ornare consequat lectus', 17, 46);
insert into commentaire (id, contenu, id_user, id_photo) values (23, 'sapien iaculis congue vivamus metus', 19, 7);
insert into commentaire (id, contenu, id_user, id_photo) values (24, 'maecenas rhoncus aliquam lacus morbi quis tortor id nulla ultrices aliquet maecenas', 5, 59);
insert into commentaire (id, contenu, id_user, id_photo) values (25, 'quisque porta volutpat erat quisque erat eros viverra', 13, 17);
insert into commentaire (id, contenu, id_user, id_photo) values (26, 'diam erat fermentum justo nec condimentum neque sapien placerat ante', 16, 15);
insert into commentaire (id, contenu, id_user, id_photo) values (27, 'lobortis ligula sit amet eleifend pede libero quis orci nullam molestie nibh in', 17, 49);
insert into commentaire (id, contenu, id_user, id_photo) values (28, 'venenatis tristique fusce congue diam', 12, 40);
insert into commentaire (id, contenu, id_user, id_photo) values (29, 'nunc rhoncus dui vel sem sed sagittis nam congue risus semper porta', 15, 3);
insert into commentaire (id, contenu, id_user, id_photo) values (30, 'amet nulla quisque arcu libero rutrum ac', 13, 39);
insert into commentaire (id, contenu, id_user, id_photo) values (31, 'mollis molestie lorem quisque ut erat curabitur gravida nisi at nibh in', 10, 17);
insert into commentaire (id, contenu, id_user, id_photo) values (32, 'placerat ante nulla justo aliquam quis turpis eget elit', 16, 17);
insert into commentaire (id, contenu, id_user, id_photo) values (33, 'nulla nisl nunc nisl duis bibendum felis sed interdum venenatis', 17, 17);
insert into commentaire (id, contenu, id_user, id_photo) values (34, 'id sapien in sapien iaculis congue', 18, 13);
insert into commentaire (id, contenu, id_user, id_photo) values (35, 'nunc proin at turpis a pede posuere nonummy integer non velit donec diam neque', 6, 32);
insert into commentaire (id, contenu, id_user, id_photo) values (36, 'aenean lectus pellentesque eget nunc donec quis orci eget orci vehicula condimentum', 6, 44);
insert into commentaire (id, contenu, id_user, id_photo) values (37, 'vestibulum sit amet cursus id turpis integer aliquet massa id lobortis convallis tortor risus', 11, 20);
insert into commentaire (id, contenu, id_user, id_photo) values (38, 'ultrices mattis odio donec vitae nisi nam ultrices libero', 3, 35);
insert into commentaire (id, contenu, id_user, id_photo) values (39, 'hac habitasse platea dictumst maecenas ut massa quis augue', 11, 60);
insert into commentaire (id, contenu, id_user, id_photo) values (40, 'justo sit amet sapien dignissim vestibulum vestibulum ante ipsum primis', 17, 15);

-- 4. Pour tous les commentaires, montrer le contenu et le username de l'auteur

SELECT commentaire.id, user.username, commentaire.contenu
FROM user
JOIN commentaire
ON commentaire.id_user=user.id
;

-- 5. Pour chaque commentaire, afficher son contenu et l'url de la photo à laquel le commentaire a été ajouté

SELECT commentaire.id, photos.url_image , commentaire.contenu, user.username
FROM commentaire
JOIN user
ON user.id=commentaire.id_user
JOIN photos
ON user.id=photos.id_user
;

-- 6. Afficher l'url de chaque photo et le nom d'utilisateur de l'auteur

SELECT user.username, photos.url_image
FROM user
JOIN photos
ON photos.id_user=user.id
;

-- 7. Trouver tous les commentaires pour la photo d'id 3, avec le username de l'utilisateur qui a commenté

SELECT user.username, commentaire.contenu, photos.id
FROM commentaire
JOIN user
ON user.id=commentaire.id_user
JOIN photos
ON commentaire.id_photo=photos.id
WHERE photos.id=3
;

-- 8. Trouver tous les url des photos ainsi que tous les commentaire qui ont été posté par l'auteur de la photo id 3

SELECT user.username, commentaire.contenu, photos.id, photos.url_image
FROM commentaire
JOIN user
ON user.id=commentaire.id_user
JOIN photos
ON commentaire.id_photo=photos.id
WHERE photos.id_user=commentaire.id_user
;

-- 9. A l'exercice précedent afficher aussi le nom de l'utilisateur qui a commenté ses propres photos

-- CF au dessus

-- 10. Le nombre de likes pour la photo d’ID 4

SELECT count(*)
FROM likes
WHERE id_photo=4
;