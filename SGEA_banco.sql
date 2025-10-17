CREATE TABLE institution(
  id INTEGER PRIMARY KEY,
  name TEXT NOT NULL,
  phone TEXT
);

CREATE TABLE location(
  id INTEGER PRIMARY KEY,
  name TEXT NOT NULL,
  address TEXT
);

CREATE TABLE user_account(
  id INTEGER PRIMARY KEY,
  username TEXT UNIQUE NOT NULL,
  password_hash TEXT NOT NULL,
  full_name TEXT NOT NULL,
  role TEXT NOT NULL,
  institution_id INTEGER,
  FOREIGN KEY(institution_id) REFERENCES institution(id)
);

CREATE TABLE event(
  id INTEGER PRIMARY KEY,
  title TEXT NOT NULL,
  kind TEXT NOT NULL,
  starts_at TEXT NOT NULL,
  ends_at TEXT NOT NULL,
  place_id INTEGER,
  capacity INTEGER NOT NULL,
  organizer_id INTEGER NOT NULL,
  FOREIGN KEY(place_id) REFERENCES location(id),
  FOREIGN KEY(organizer_id) REFERENCES user_account(id)
);

CREATE TABLE enrollment(
  id INTEGER PRIMARY KEY,
  user_id INTEGER NOT NULL,
  event_id INTEGER NOT NULL,
  status TEXT NOT NULL,
  UNIQUE(user_id, event_id),
  FOREIGN KEY(user_id) REFERENCES user_account(id),
  FOREIGN KEY(event_id) REFERENCES event(id)
);

CREATE TABLE certificate(
  id INTEGER PRIMARY KEY,
  enrollment_id INTEGER UNIQUE NOT NULL,
  code TEXT UNIQUE NOT NULL,
  issued_at TEXT NOT NULL,
  FOREIGN KEY(enrollment_id) REFERENCES enrollment(id)
);

INSERT INTO institution(id,name,phone) VALUES
(1,'Universidade Alfa','(61)3333-0001'),
(2,'Instituto Beta','(61)3333-0002');

INSERT INTO location(id,name,address) VALUES
(1,'Auditório Central','Campus Norte'),
(2,'Sala Multiuso','Campus Sul');

INSERT INTO user_account(id,username,password_hash,full_name,role,institution_id) VALUES
(1,'org1','hash1','Maria Silva','organizer',1),
(2,'aluno1','hash2','Pedro Klein','student',1),
(3,'prof1','hash3','Rafael Souza','teacher',2);

INSERT INTO event(id,title,kind,starts_at,ends_at,place_id,capacity,organizer_id) VALUES
(1,'Semana Acadêmica de Computação','week','2025-09-10 08:00','2025-09-14 18:00',1,200,1),
(2,'Minicurso de Django','course','2025-10-05 09:00','2025-10-05 12:00',2,40,1);

INSERT INTO enrollment(id,user_id,event_id,status) VALUES
(1,2,1,'confirmed'),
(2,3,2,'confirmed');

INSERT INTO certificate(id,enrollment_id,code,issued_at) VALUES
(1,1,'SGEA-ABC123','2025-09-14 19:00');