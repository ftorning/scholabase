drop table scholarship_criteria;
drop table scholarship_applications;
drop table student;
drop table collegemajors;
drop table college;
drop table high_school;
drop table scholarship;
drop table company;
drop table majors;
drop table ethnicity;
drop table states;

CREATE TABLE states
(
	state_abbr char(2) PRIMARY KEY,
	state_name varchar(30)
);

CREATE TABLE ethnicity
(
	ethnicity varchar(25) PRIMARY KEY,
	continental_origin varchar(25) NOT NULL,
	is_minority boolean NOT NULL
);

CREATE TABLE majors
(
	major_id serial PRIMARY KEY,
	type varchar(120) NOT NULL,
	title varchar(120) NOT NULL,
	is_stem boolean NOT NULL
);

CREATE TABLE company
(
	company_id serial PRIMARY KEY,
	name varchar(50) NOT NULL,
	company_state varchar(2) REFERENCES states (state_abbr),
	industry varchar(120),
	is_publicly_held boolean
);

CREATE TABLE scholarship
(
	sco_id serial PRIMARY KEY,
	title varchar(120) NOT NULL,
	dollar_value decimal(10,2) NOT NULL,
	company_id integer REFERENCES company (company_id) not null
);

CREATE TABLE high_school
(
	school_id varchar(20) PRIMARY KEY,
	hs_state varchar(2) REFERENCES states (state_abbr) NOT NULL,
	name varchar(120) NOT NULL,
	is_impoverished boolean NOT NULL,
	is_public boolean NOT NULL
);

CREATE TABLE college
(
	college_id varchar(20) PRIMARY KEY,
	is_public boolean NOT NULL,
	college_name varchar(120),
	college_state varchar(2) REFERENCES states (state_abbr) NOT NULL
);

CREATE TABLE collegemajors
(
	college_id varchar(20) REFERENCES college (college_id),
	major_id integer REFERENCES majors (major_id),
	national_rank integer,
	PRIMARY KEY (college_id, major_id)
);

CREATE TABLE student
(
	ssn numeric(9,0) PRIMARY KEY,
	name varchar(120) NOT NULL,
	street varchar(120) NOT NULL,
	city varchar(120) NOT NULL,
	res_state varchar(2) REFERENCES states (state_abbr) NOT NULL,
	sex varchar(10),
	us_citizen boolean,
	dob date NOT NULL,
	ethnicity varchar(25) REFERENCES ethnicity (ethnicity),
	college_major integer references majors (major_id),
	college varchar(20) references college (college_id) not null,
	college_gpa double precision,
	academic_probation boolean,
	high_school varchar(20) references high_school (school_id) not null,
	hs_grad_year integer,
	hs_gpa double precision,
	hs_class_rank integer
);

create table scholarship_applications (
	short_essay text NOT NULL,
	reference_name varchar(120),
	reference_email varchar(120),
	reference_type varchar(30), --should limit to academic, personal, and professional
	reference_verified boolean,
	application_date date not null,
	applicant numeric(9,0) references student (ssn) not null,
	scholarship integer references scholarship (sco_id) not null,
	primary key (applicant, scholarship)
);

insert into ethnicity values
('ENGLISH', 'EURASIA', FALSE),
('GERMAN', 'EURASIA', FALSE),
('KENYAN', 'AFRICA', TRUE),
('JAPANESE', 'ASIAN', TRUE),
('MEXICAN', 'AMERICAS', TRUE),
('ITALIAN', 'EURASIAN', FALSE),
('THAI', 'SOUTHEAST ASIAN', TRUE),
('INDIAN', 'INDIAN SUBCONTINENT', TRUE),
('BRAZILIAN', 'AMERICAS', TRUE);

INSERT into states VALUES('AL', 'Alabama');
INSERT into states VALUES('AK', 'Alaska');
INSERT into states VALUES('AZ', 'Arizona');
INSERT into states VALUES('AR', 'Arkansas');
INSERT into states VALUES('CA', 'California');
INSERT into states VALUES('CO', 'Colorado');
INSERT into states VALUES('CT', 'Connecticut');
INSERT into states VALUES('DE', 'Delaware');
INSERT into states VALUES('FL', 'Florida');
INSERT into states VALUES('GA', 'Georgia');
INSERT into states VALUES('HI', 'Hawaii');
INSERT into states VALUES('ID', 'Idaho');
INSERT into states VALUES('IL', 'Illinois');
INSERT into states VALUES('IN', 'Indiana');
INSERT into states VALUES('IA', 'Iowa');
INSERT into states VALUES('KS', 'Kansas');
INSERT into states VALUES('KY', 'Kentucky');
INSERT into states VALUES('LA', 'Louisiana');
INSERT into states VALUES('ME', 'Maine');
INSERT into states VALUES('MD', 'Maryland');
INSERT into states VALUES('MA', 'Massachusetts');
INSERT into states VALUES('MI', 'Michigan');
INSERT into states VALUES('MN', 'Minnesota');
INSERT into states VALUES('MS', 'Mississippi');
INSERT into states VALUES('MO', 'Missouri');
INSERT into states VALUES('MT', 'Montana');
INSERT into states VALUES('NE', 'Nebraska');
INSERT into states VALUES('NV', 'Nevada');
INSERT into states VALUES('NH', 'New Hampshire');
INSERT into states VALUES('NJ', 'New Jersey');
INSERT into states VALUES('NM', 'New Mexico');
INSERT into states VALUES('NY', 'New York');
INSERT into states VALUES('NC', 'North Carolina');
INSERT into states VALUES('ND', 'North Dakota');
INSERT into states VALUES('OH', 'Ohio');
INSERT into states VALUES('OK', 'Oklahoma');
INSERT into states VALUES('OR', 'Oregon');
INSERT into states VALUES('PA', 'Pennsylvania');
INSERT into states VALUES('RI', 'Rhode Island');
INSERT into states VALUES('SC', 'South Carolina');
INSERT into states VALUES('SD', 'South Dakota');
INSERT into states VALUES('TN', 'Tennessee');
INSERT into states VALUES('TX', 'Texas');
INSERT into states VALUES('UT', 'Utah');
INSERT into states VALUES('VT', 'Vermont');
INSERT into states VALUES('VA', 'Virginia');
INSERT into states VALUES('WA', 'Washington');
INSERT into states VALUES('DC', 'Washington, D.C.');
INSERT into states VALUES('WV', 'West Virginia');
INSERT into states VALUES('WI', 'Wisconsin');
INSERT into states VALUES('WY', 'Wyoming');

INSERT INTO majors VALUES ( DEFAULT, 'STEM', 'Bachelor of Science, Computer Science', TRUE);
INSERT INTO majors VALUES ( DEFAULT, 'STEM', 'Bachelor of Science, Chemistry', TRUE);
INSERT INTO majors VALUES ( DEFAULT, 'STEM', 'Bachelor of Science, Biology', TRUE);
INSERT INTO majors VALUES ( DEFAULT, 'STEM', 'Bachelor of Science, Physics', TRUE);
INSERT INTO majors VALUES ( DEFAULT, 'STEM', 'Bachelor of Science, Cyber Security', TRUE);
INSERT INTO majors VALUES ( DEFAULT, 'STEM', 'Bachelor of Science, Electrical Engineering', TRUE);
INSERT INTO majors VALUES ( DEFAULT, 'BUSINESS', 'Bachelor of the Fine Arts, Fashion Marketing', FALSE);
INSERT INTO majors VALUES ( DEFAULT, 'ART', 'Bachelor of the Fine Arts, Illustration', FALSE);
INSERT INTO majors VALUES ( DEFAULT, 'LIBERAL ARTS', 'Bachelor of the Arts, Economics', FALSE);
INSERT INTO majors VALUES ( DEFAULT, 'ART', 'Bachelor of the Arts, Graphic Design', FALSE);
INSERT INTO majors VALUES ( DEFAULT, 'BUSINESS', 'Bachelor of the Arts, Marketing', FALSE);
INSERT INTO majors VALUES ( DEFAULT, 'LIBERAL ARTS', 'Bachelor of the Arts, Education', FALSE);
INSERT INTO majors VALUES ( DEFAULT, 'BUSINESS', 'Bachelor of the Arts, Business Administration', FALSE);
INSERT INTO majors VALUES ( DEFAULT, 'BUSINESS', 'Bachelor of the Arts, Finanace', FALSE);

insert into company (name, company_state, industry, is_publicly_held) values
('Nasty Gal', 'CA', 'Fashion', false),
('Google Inc', 'CA', 'Technology', true),
('The Coca-Cola Company', 'GA', 'Food and Beverage', true),
('Campbells Soup Company',  'NJ', 'Food and Beverage', TRUE),
('Ford Motor Company', 'MI', 'Automotive', true),
('Wells Fargo & Company', 'NY', 'Financial Services', true),
('Penguin Random House', 'NY', 'Publishing', false),
('Microsoft', 'WA', 'Technology', true),
('Comcast', 'PA', 'Telecommunications', true),
('Facebook', 'CA', 'Social Media', true),
('Lockheed Martin', 'MD', 'Aerospace', true);


insert into scholarship (title, dollar_value, company_id)
values
('#GIRLBOSS', 2500, 1),
('Generation Google Scholarship', 15000, 2),
('Venkat Panchapakesan Memorial Scholarship', 10000, 2),
('Anita Borg Memorial Scholarship', 10000, 2),
('Campbells Soup Foundation Scholarship', 1000, 4),
('Pay It Forward Scholarship', 5000, 3),
('Coca Cola Leaders of Promise', 1500, 3),
('Random House Scholars Package', 6000, 7),
('Financial Genius Scholarship', 4000, 6),
('Engineers For America Scholarship Fund', 7000, 5),
('Leaders & Achievers', 1000, 9),
('Microsoft Tuition Scholarship', 30000, 8),
('Diversity Conference Scholarship', 45000, 8),
('Lockheed Martin Employee Sponsored Scholarship Program', 2000, 11),
('Take Flight!', 12000, 11);

INSERT INTO high_school VALUES ( '370201000884', 'NC', 'HARNETT CENTRAL HIGH' , FALSE,  TRUE);
INSERT INTO high_school VALUES ( '90123000187', 'CT', 'EAST HAMPTON HIGH SCHOOL' , TRUE,  TRUE);
INSERT INTO high_school VALUES ( '370162002384', 'NC', 'FORESTVIEW HIGH' , TRUE,  TRUE);
INSERT INTO high_school VALUES ( '120093002073', 'FL', 'WABASSO SCHOOL' , FALSE,  TRUE);
INSERT INTO high_school VALUES ( '362721003704', 'NY', 'COLONIE CENTRAL HIGH SCHOOL' , TRUE,  TRUE);
INSERT INTO high_school VALUES ( '510273001159', 'VA', 'NORTHUMBERLAND HIGH' , TRUE,  TRUE);
INSERT INTO high_school VALUES ( 'A9900418', 'CA', 'GREEN PASTURES CULTIVATION ACA' , TRUE,  FALSE);
INSERT INTO high_school VALUES ( '80336000389', 'CO', 'NORTH HIGH SCHOOL' , FALSE,  TRUE);
INSERT INTO high_school VALUES ( '40497000404', 'AZ', 'MESA HIGH SCHOOL' , FALSE,  TRUE);
INSERT INTO high_school VALUES ( '60133512419', 'CA', 'PACIFIC TECHNOLOGY SCHOOL SANTA ANA' , TRUE,  TRUE);
INSERT INTO high_school VALUES ( '510324001373', 'VA', 'OPEN HIGH' , TRUE,  TRUE);
INSERT INTO high_school VALUES ( 'A0903306', 'PA', 'WOODLYNDE SCHOOL' , TRUE,  FALSE);
INSERT INTO high_school VALUES ( '400771000540', 'OK', 'CIMARRON HS' , TRUE,  TRUE);
INSERT INTO high_school VALUES ( '292355001371', 'MO', 'PARK HILL HIGH' , TRUE,  TRUE);
INSERT INTO high_school VALUES ( '484314004902', 'TX', 'TRENTON H S' , TRUE,  TRUE);
INSERT INTO high_school VALUES ( '40088103394', 'AZ', 'BASIS PHOENIX CENTRAL PRIMARY' , TRUE,  TRUE);
INSERT INTO high_school VALUES ( '403195001764', 'OK', 'WAUKOMIS HS' , TRUE,  TRUE);
INSERT INTO high_school VALUES ( '263426006966', 'MI', 'TROY HIGH SCHOOL' , TRUE,  TRUE);
INSERT INTO high_school VALUES ( '340693000512', 'NJ', 'HASBROUCK HEIGHTS HIGH SCHOOL' , TRUE,  TRUE);
INSERT INTO high_school VALUES ( '10204000783', 'AL', 'LAWRENCE CO HIGH SCH' , FALSE,  TRUE);
INSERT INTO high_school VALUES ( 'A9106158', 'SC', 'BARNWELL CHRISTIAN SCHOOL' , TRUE,  FALSE);
INSERT INTO high_school VALUES ( 'AA000231', 'VA', 'CENTERVILLE CHRISTIAN SCHOOL' , TRUE,  FALSE);
INSERT INTO high_school VALUES ( '422169003117', 'PA', 'SMETHPORT AREA JSHS' , TRUE,  TRUE);
INSERT INTO high_school VALUES ( '00909503', 'NM', 'SANDIA PREPARATORY SCHOOL' , TRUE,  FALSE);
INSERT INTO high_school VALUES ( '422040007238', 'PA', 'RINGGOLD SHS' , TRUE,  TRUE);
INSERT INTO high_school VALUES ( '01464163', 'WA', 'WALLA WALLA VALLEY ACADEMY' , TRUE,  FALSE);
INSERT INTO high_school VALUES ( 'A0103241', 'IN', 'HORIZON CHRISTIAN SCHOOL' , TRUE,  FALSE);
INSERT INTO high_school VALUES ( '60897000901', 'CA', 'JOHANNA ECHOLS-HANSEN HIGH (CONTINUATION)' , TRUE,  TRUE);
INSERT INTO high_school VALUES ( '61455001737', 'CA', 'HERBERT HOOVER HIGH' , FALSE,  TRUE);
INSERT INTO high_school VALUES ( 'A9101527', 'CO', 'DENVER CHRISTIAN SCHOOLS' , TRUE,  FALSE);
INSERT INTO high_school VALUES ( '272295001121', 'MN', 'MOUNDS VIEW SENIOR HIGH' , TRUE,  TRUE);
INSERT INTO high_school VALUES ( '62308010656', 'CA', 'NIPOMO HIGH' , FALSE,  TRUE);
INSERT INTO high_school VALUES ( '560299000168', 'WY', 'TORRINGTON HIGH SCHOOL' , TRUE,  TRUE);
INSERT INTO high_school VALUES ( '470014801178', 'TN', 'WHITE STATION HIGH SCHOOL' , TRUE,  TRUE);
INSERT INTO high_school VALUES ( '422397000753', 'PA', 'TUSSEY MOUNTAIN HS' , TRUE,  TRUE);
INSERT INTO high_school VALUES ( '340001900269', 'NJ', 'CHARTER~TECH HIGH SCHOOL FOR THE PERFORMING ARTS' , TRUE,  TRUE);
INSERT INTO high_school VALUES ( '220054000340', 'LA', 'ARLINGTON PREPARATORY ACADEMY' , FALSE,  TRUE);
INSERT INTO high_school VALUES ( '317309001195', 'NE', 'LOUP CITY HIGH SCHOOL' , FALSE,  TRUE);
INSERT INTO high_school VALUES ( '00343467', 'IL', 'MARIST HIGH SCHOOL' , TRUE,  FALSE);
INSERT INTO high_school VALUES ( '270028703631', 'MN', 'PLAINVIEW-ELGIN-MILLVILLE HIGH' , TRUE,  TRUE);
INSERT INTO high_school VALUES ( '61806002228', 'CA', 'FOUNTAIN VALLEY HIGH' , TRUE,  TRUE);
INSERT INTO high_school VALUES ( '421827001406', 'PA', 'OWEN J ROBERTS HS' , TRUE,  TRUE);
INSERT INTO high_school VALUES ( '02020466', 'FL', 'GRACE CHRISTIAN SCHOOL OF PASC' , TRUE,  FALSE);
INSERT INTO high_school VALUES ( '450000401402', 'SC', 'CEDAR SPRINGS ACADEMY' , FALSE,  TRUE);
INSERT INTO high_school VALUES ( '130186000853', 'GA', 'LITHIA SPRINGS COMPREHENSIVE HIGH SCHOOL' , FALSE,  TRUE);
INSERT INTO high_school VALUES ( '484317004904', 'TX', 'TRINIDAD SCHOOL' , FALSE,  TRUE);
INSERT INTO high_school VALUES ( '490021000105', 'UT', 'BOUNTIFUL HIGH' , TRUE,  TRUE);
INSERT INTO high_school VALUES ( '461032000105', 'SD', 'CANISTOTA HIGH SCHOOL - 01' , TRUE,  TRUE);
INSERT INTO high_school VALUES ( '172307006062', 'IL', 'LINCOLN WAY WEST' , TRUE,  TRUE);
INSERT INTO high_school VALUES ( '69102109234', 'CA', 'WELLINGTON M. SMITH, JR.' , FALSE,  TRUE);
INSERT INTO high_school VALUES ( '69105213710', 'CA', 'TIOGA COMMUNITY' , TRUE,  TRUE);
INSERT INTO high_school VALUES ( '370120003154', 'NC', 'DUPLIN EARLY COLLEGE HIGH' , FALSE,  TRUE);
INSERT INTO high_school VALUES ( '69106310762', 'CA', 'ELK CREEK' , FALSE,  TRUE);
INSERT INTO high_school VALUES ( '390054405256', 'OH', 'P.A.C.E. HIGH SCHOOL' , FALSE,  TRUE);
INSERT INTO high_school VALUES ( '01645547', 'VA', 'WESTOVER CHRISTIAN ACADEMY' , TRUE,  FALSE);
INSERT INTO high_school VALUES ( '61443001699', 'CA', 'MONTA VISTA HIGH' , TRUE,  TRUE);
INSERT INTO high_school VALUES ( '360012205980', 'NY', 'NORTH QUEENS COMMUNITY HIGH SCHOOL' , FALSE,  TRUE);
INSERT INTO high_school VALUES ( '40625000589', 'AZ', 'SUNRISE MOUNTAIN HIGH SCHOOL' , TRUE,  TRUE);
INSERT INTO high_school VALUES ( 'A9101894', 'FL', 'THE LITTLE COUNTRY SCHOOL' , TRUE,  FALSE);
INSERT INTO high_school VALUES ( '291194000445', 'MO', 'MID-BUCHANAN SR. HIGH' , TRUE,  TRUE);
INSERT INTO high_school VALUES ( 'A0302433', 'NC', 'VICTORY CHRISTIAN SCHOOL' , TRUE,  FALSE);
INSERT INTO high_school VALUES ( '341170001182', 'NJ', 'NORTHERN BURLINGTON COUNTY REGIONAL HIGH SCHOOL' , TRUE,  TRUE);
INSERT INTO high_school VALUES ( '390466802621', 'OH', 'TRI-VILLAGE HIGH SCHOOL' , TRUE,  TRUE);
INSERT INTO high_school VALUES ( '210408001864', 'KY', 'MENIFEE CO. ACADEMY ALTERNATIVE SCHOOL' , FALSE,  TRUE);
INSERT INTO high_school VALUES ( '00298434', 'GA', 'TRINITY CHRISTIAN SCHOOL' , TRUE,  FALSE);
INSERT INTO high_school VALUES ( '60797005777', 'CA', 'CENTRAL HIGH EAST CAMPUS' , FALSE,  TRUE);
INSERT INTO high_school VALUES ( '120147001473', 'FL', 'ST. CLOUD HIGH SCHOOL' , FALSE,  TRUE);
INSERT INTO high_school VALUES ( '00940135', 'NY', 'EMMANUEL BAPTIST ACADEMY' , TRUE,  FALSE);
INSERT INTO high_school VALUES ( '00331178', 'ID', 'GREENLEAF FRIENDS ACADEMY' , TRUE,  FALSE);
INSERT INTO high_school VALUES ( '410801001284', 'OR', 'MCMINNVILLE HIGH SCHOOL' , TRUE,  TRUE);
INSERT INTO high_school VALUES ( '00080982', 'CA', 'ARMY & NAVY ACADEMY' , TRUE,  FALSE);
INSERT INTO high_school VALUES ( '261230001389', 'MI', 'RIVERSIDE ACADEMY' , FALSE,  TRUE);
INSERT INTO high_school VALUES ( '360007806146', 'NY', 'GLOBAL LEARNING COLLABORATIVE (THE)' , FALSE,  TRUE);
INSERT INTO high_school VALUES ( 'A0903543', 'TX', 'NEW FRONTIERS LIGHTHOUSE CHRIS' , TRUE,  FALSE);
INSERT INTO high_school VALUES ( '240069001309', 'MD', 'PARKSIDE HIGH' , TRUE,  TRUE);
INSERT INTO high_school VALUES ( '550717000783', 'WI', 'JOHNSON CREEK MIDDLE AND HIGH' , TRUE,  TRUE);
INSERT INTO high_school VALUES ( '450069000012', 'SC', 'DIXIE HIGH' , FALSE,  TRUE);
INSERT INTO high_school VALUES ( 'A9701131', 'FL', 'MEADOWBROOK ACADEMY' , TRUE,  FALSE);
INSERT INTO high_school VALUES ( '363129004190', 'NY', 'WHITEHALL JUNIOR-SENIOR HIGH SCHOOL' , TRUE,  TRUE);
INSERT INTO high_school VALUES ( '200354001868', 'KS', 'ATCHISON ALTERNATIVE SCHOOL' , FALSE,  TRUE);
INSERT INTO high_school VALUES ( '00939979', 'NY', 'COLUMBIA GRAMMAR & PREPARATORY' , TRUE,  FALSE);
INSERT INTO high_school VALUES ( '370261001094', 'NC', 'SOUTH LENOIR HIGH' , TRUE,  TRUE);
INSERT INTO high_school VALUES ( '63459005736', 'CA', 'SAN JOS+¬ HIGH' , FALSE,  TRUE);
INSERT INTO high_school VALUES ( '482001012192', 'TX', 'HERITAGE H S' , TRUE,  TRUE);
INSERT INTO high_school VALUES ( '482566002871', 'TX', 'KILLEEN H S' , FALSE,  TRUE);
INSERT INTO high_school VALUES ( '292064001108', 'MO', 'MEADVILLE HIGH' , TRUE,  TRUE);
INSERT INTO high_school VALUES ( '350001100973', 'NM', 'AZTEC YOUTH ACADEMY' , FALSE,  TRUE);
INSERT INTO high_school VALUES ( '530771002634', 'WA', 'EDUCATION SERVICE CENTERS' , TRUE,  TRUE);
INSERT INTO high_school VALUES ( '00296506', 'GA', 'WINDSOR ACADEMY' , TRUE,  FALSE);
INSERT INTO high_school VALUES ( '317752001650', 'NE', 'SUTTON SECONDARY SCHOOL' , TRUE,  TRUE);
INSERT INTO high_school VALUES ( '340810005935', 'NJ', 'LACEY TOWNSHIP HIGH SCHOOL' , TRUE,  TRUE);
INSERT INTO high_school VALUES ( '260627004247', 'MI', 'BLOOMINGDALE MIDDLE AND HIGH SCHOOL' , FALSE,  TRUE);
INSERT INTO high_school VALUES ( '480020208505', 'TX', 'WINFREE ACADEMY CHARTER SCHOOL (RICHARDSON)' , FALSE,  TRUE);
INSERT INTO high_school VALUES ( '551305001910', 'WI', 'RENAISSANCE CHARTER ACADEMY' , TRUE,  TRUE);
INSERT INTO high_school VALUES ( '301359000411', 'MT', 'HAVRE HIGH SCHOOL' , TRUE,  TRUE);
INSERT INTO high_school VALUES ( '10024001408', 'AL', 'AUTAUGAVILLE SCH' , FALSE,  TRUE);
INSERT INTO high_school VALUES ( 'A0790011', 'AR', 'ARKANSAS BAPTIST SCHOOL SYSTEM' , TRUE,  FALSE);
INSERT INTO high_school VALUES ( '171281005157', 'IL', 'DOLAN CTR MARYVILLE FARM CAMPUS' , FALSE,  TRUE);

INSERT INTO college VALUES ( 138947, FALSE, 'Clark Atlanta University', 'GA');
INSERT INTO college VALUES ( 152798, FALSE, 'Allen College', 'IA');
INSERT INTO college VALUES ( 457174, FALSE, 'Remington College-Columbia Campus', 'SC');
INSERT INTO college VALUES ( 174136, TRUE, 'Minneapolis Community and Technical College', 'MN');
INSERT INTO college VALUES ( 125222, TRUE, 'West Valley Mission Community College District Office', 'CA');
INSERT INTO college VALUES ( 226152, TRUE, 'Texas A & M International University', 'TX');
INSERT INTO college VALUES ( 231873, TRUE, 'Dabney S Lancaster Community College', 'VA');
INSERT INTO college VALUES ( 237950, TRUE, 'West Virginia University Institute of Technology', 'WV');
INSERT INTO college VALUES ( 175263, TRUE, 'Minnesota State College-Southeast Technical', 'MN');
INSERT INTO college VALUES ( 188641, FALSE, 'Alfred University', 'NY');
INSERT INTO college VALUES ( 228529, TRUE, 'Tarleton State University', 'TX');
INSERT INTO college VALUES ( 444413, FALSE, 'Beis Medrash Heichal Dovid', 'NY');
INSERT INTO college VALUES ( 366447, TRUE, 'Altamaha Technical College', 'GA');
INSERT INTO college VALUES ( 418515, TRUE, 'Lenape Technical School Practical Nursing Program', 'PA');
INSERT INTO college VALUES ( 177542, FALSE, 'Hannibal-LaGrange University', 'MO');
INSERT INTO college VALUES ( 107983, TRUE, 'Southern Arkansas University Main Campus', 'AR');
INSERT INTO college VALUES ( 101143, TRUE, 'Enterprise State Community College', 'AL');
INSERT INTO college VALUES ( 140447, FALSE, 'Mercer University', 'GA');
INSERT INTO college VALUES ( 216597, FALSE, 'Villanova University', 'PA');
INSERT INTO college VALUES ( 418603, TRUE, 'Clarion County Career Center Practical Nursing Program', 'PA');
INSERT INTO college VALUES ( 202523, FALSE, 'Denison University', 'OH');
INSERT INTO college VALUES ( 146977, FALSE, 'McCormick Theological Seminary', 'IL');
INSERT INTO college VALUES ( 228158, TRUE, 'South Plains College', 'TX');
INSERT INTO college VALUES ( 214157, FALSE, 'Moravian College', 'PA');
INSERT INTO college VALUES ( 159948, FALSE, 'New Orleans Baptist Theological Seminary', 'LA');
INSERT INTO college VALUES ( 217475, TRUE, 'Community College of Rhode Island', 'RI');
INSERT INTO college VALUES ( 155052, TRUE, 'Flint Hills Technical College', 'KS');
INSERT INTO college VALUES ( 199582, FALSE, 'Saint Augustine University', 'NC');
INSERT INTO college VALUES ( 124487, FALSE, 'Epic Bible College', 'CA');
INSERT INTO college VALUES ( 221971, FALSE, 'Union University', 'TN');
INSERT INTO college VALUES ( 126012, FALSE, 'The Wright Institute', 'CA');
INSERT INTO college VALUES ( 230162, TRUE, 'Davis Applied Technology College', 'UT');
INSERT INTO college VALUES ( 439446, FALSE, 'Atlantic Institute of Oriental Medicine', 'FL');
INSERT INTO college VALUES ( 238616, FALSE, 'Concordia University-Wisconsin', 'WI');
INSERT INTO college VALUES ( 130493, TRUE, 'Southern Connecticut State University', 'CT');
INSERT INTO college VALUES ( 110608, TRUE, 'California State University-Northridge', 'CA');
INSERT INTO college VALUES ( 226019, TRUE, 'Kilgore College', 'TX');
INSERT INTO college VALUES ( 457484, FALSE, 'New Hope Christian College-Honolulu', 'HI');
INSERT INTO college VALUES ( 152363, FALSE, 'Saint Josephs College', 'IN');
INSERT INTO college VALUES ( 179867, FALSE, 'Washington University in St Louis', 'MO');
INSERT INTO college VALUES ( 190248, FALSE, 'Concordia College-New York', 'NY');
INSERT INTO college VALUES ( 119058, FALSE, 'Monterey Institute of International Studies', 'CA');
INSERT INTO college VALUES ( 231059, FALSE, 'Saint Michael College', 'VT');
INSERT INTO college VALUES ( 174792, FALSE, 'Saint Johns University', 'MN');
INSERT INTO college VALUES ( 451583, TRUE, 'Dixie Applied Technology College', 'UT');
INSERT INTO college VALUES ( 215628, FALSE, 'Reformed Presbyterian Theological Seminary', 'PA');
INSERT INTO college VALUES ( 440828, TRUE, 'Oregon State University-Cascades Campus', 'OR');
INSERT INTO college VALUES ( 417637, TRUE, 'South Central Career Center', 'MO');
INSERT INTO college VALUES ( 175652, TRUE, 'East Mississippi Community College', 'MS');
INSERT INTO college VALUES ( 166018, FALSE, 'Hampshire College', 'MA');
INSERT INTO college VALUES ( 228468, FALSE, 'Southwestern Adventist University', 'TX');
INSERT INTO college VALUES ( 172918, TRUE, 'Alexandria Technical & Community College', 'MN');
INSERT INTO college VALUES ( 155292, TRUE, 'Kansas City Kansas Community College', 'KS');
INSERT INTO college VALUES ( 172954, TRUE, 'Anoka Technical College', 'MN');
INSERT INTO college VALUES ( 439613, FALSE, 'Crossroads Bible College', 'IN');
INSERT INTO college VALUES ( 228866, FALSE, 'Texas Chiropractic College Foundation Inc', 'TX');
INSERT INTO college VALUES ( 207342, TRUE, 'University of Oklahoma-Health Sciences Center', 'OK');
INSERT INTO college VALUES ( 221388, TRUE, 'Tennessee College of Applied Technology-Ripley', 'TN');
INSERT INTO college VALUES ( 448248, TRUE, 'Mountainland Applied Technology College', 'UT');
INSERT INTO college VALUES ( 153384, FALSE, 'Grinnell College', 'IA');
INSERT INTO college VALUES ( 124113, TRUE, 'Taft College', 'CA');
INSERT INTO college VALUES ( 442392, FALSE, 'Antioch University-PhD Program in Leadership and Change', 'OH');
INSERT INTO college VALUES ( 204477, TRUE, 'Northeast Ohio Medical University', 'OH');
INSERT INTO college VALUES ( 153296, TRUE, 'Ellsworth Community College', 'IA');
INSERT INTO college VALUES ( 161341, TRUE, 'University of Maine at Presque Isle', 'ME');
INSERT INTO college VALUES ( 214564, FALSE, 'Salus University', 'PA');
INSERT INTO college VALUES ( 236577, FALSE, 'Seattle Pacific University', 'WA');
INSERT INTO college VALUES ( 234377, TRUE, 'Wytheville Community College', 'VA');
INSERT INTO college VALUES ( 217615, TRUE, 'Aiken Technical College', 'SC');
INSERT INTO college VALUES ( 224350, TRUE, 'Del Mar College', 'TX');
INSERT INTO college VALUES ( 228316, TRUE, 'Southwest Texas Junior College', 'TX');
INSERT INTO college VALUES ( 224271, FALSE, 'Dallas Institute of Funeral Service', 'TX');
INSERT INTO college VALUES ( 439817, FALSE, 'Northeastern Seminary', 'NY');
INSERT INTO college VALUES ( 179812, FALSE, 'Kansas City University of Medicine and Biosciences', 'MO');
INSERT INTO college VALUES ( 461306, TRUE, 'D A Dorsey Educational Center', 'FL');
INSERT INTO college VALUES ( 166407, FALSE, 'Lawrence Memorial Hospital School of Nursing', 'MA');
INSERT INTO college VALUES ( 448886, TRUE, 'Arizona State University-Downtown Phoenix', 'AZ');
INSERT INTO college VALUES ( 234951, TRUE, 'Clover Park Technical College', 'WA');
INSERT INTO college VALUES ( 110246, TRUE, 'Butte College', 'CA');
INSERT INTO college VALUES ( 417992, TRUE, 'Orange Ulster BOCES-Practical Nursing Program', 'NY');
INSERT INTO college VALUES ( 201140, FALSE, 'Athenaeum of Ohio', 'OH');
INSERT INTO college VALUES ( 113096, TRUE, 'Cosumnes River College', 'CA');
INSERT INTO college VALUES ( 149329, FALSE, 'Telshe Yeshiva-Chicago', 'IL');
INSERT INTO college VALUES ( 171881, FALSE, 'Kuyper College', 'MI');
INSERT INTO college VALUES ( 248624, TRUE, 'Fayette County Career & Technical Institute Practical Nursing Program', 'PA');
INSERT INTO college VALUES ( 179043, FALSE, 'Rockhurst University', 'MO');
INSERT INTO college VALUES ( 363165, TRUE, 'Metro Technology Centers', 'OK');
INSERT INTO college VALUES ( 199731, TRUE, 'Southwestern Community College', 'NC');
INSERT INTO college VALUES ( 217925, FALSE, 'Columbia International University', 'SC');
INSERT INTO college VALUES ( 216463, FALSE, 'Trinity Episcopal School for Ministry', 'PA');
INSERT INTO college VALUES ( 232609, FALSE, 'Lynchburg College', 'VA');
INSERT INTO college VALUES ( 175810, TRUE, 'Holmes Community College', 'MS');
INSERT INTO college VALUES ( 444398, FALSE, 'Baptist University of the Americas', 'TX');
INSERT INTO college VALUES ( 198251, TRUE, 'Central Carolina Community College', 'NC');
INSERT INTO college VALUES ( 129756, TRUE, 'Middlesex Community College', 'CT');
INSERT INTO college VALUES ( 176354, TRUE, 'Southwest Mississippi Community College', 'MS');
INSERT INTO college VALUES ( 155210, TRUE, 'Johnson County Community College', 'KS');
INSERT INTO college VALUES ( 168546, FALSE, 'Albion College', 'MI');

INSERT INTO majors VALUES ( DEFAULT, 'STEM', 'Bachelor of Science, Computer Science', TRUE);
INSERT INTO majors VALUES ( DEFAULT, 'STEM', 'Bachelor of Science, Chemistry', TRUE);
INSERT INTO majors VALUES ( DEFAULT, 'STEM', 'Bachelor of Science, Biology', TRUE);
INSERT INTO majors VALUES ( DEFAULT, 'STEM', 'Bachelor of Science, Physics', TRUE);
INSERT INTO majors VALUES ( DEFAULT, 'STEM', 'Bachelor of Science, Cyber Security', TRUE);
INSERT INTO majors VALUES ( DEFAULT, 'STEM', 'Bachelor of Science, Electrical Engineering', TRUE);
INSERT INTO majors VALUES ( DEFAULT, 'BUSINESS', 'Bachelor of the Fine Arts, Fashion Marketing', FALSE);
INSERT INTO majors VALUES ( DEFAULT, 'ART', 'Bachelor of the Fine Arts, Illustration', FALSE);
INSERT INTO majors VALUES ( DEFAULT, 'LIBERAL ARTS', 'Bachelor of the Arts, Economics', FALSE);
INSERT INTO majors VALUES ( DEFAULT, 'ART', 'Bachelor of the Arts, Graphic Design', FALSE);
INSERT INTO majors VALUES ( DEFAULT, 'BUSINESS', 'Bachelor of the Arts, Marketing', FALSE);
INSERT INTO majors VALUES ( DEFAULT, 'LIBERAL ARTS', 'Bachelor of the Arts, Education', FALSE);
INSERT INTO majors VALUES ( DEFAULT, 'BUSINESS', 'Bachelor of the Arts, Business Administration', FALSE);
INSERT INTO majors VALUES ( DEFAULT, 'BUSINESS', 'Bachelor of the Arts, Finanace', FALSE);

insert into student values 
('123456789', 'John Harper', '2820 Pine St', 'Seattle', 'WA', 'MALE', TRUE, '1993-11-10', 'ENGLISH', 14, '236577', 3.1, FALSE, '01464163', 2011, 3.0, 140),
('234567891', 'Janet Diedrich', '4225 Williams Ave', 'Fleming Island', 'FL', 'FEMALE', TRUE, '1994-03-15', 'GERMAN', 5, '461306', 3.5, FALSE, 'A9101894', 2012, 2.9, 170),
('345678912', 'Jasmel Patel', '23 Race St', 'Philadelphia', 'PA', 'MALE', FALSE, '1992-07-03', 'INDIAN', 7, '216597', 2.9, FALSE, '340693000512', 2010, 3.2, 120),
('456789123', 'Marcel Nehls', '114 Flower St', 'Austin', 'TX', 'MALE', TRUE, '1990-04-12', 'BRAZILIAN', 3, '439817', 3.9, FALSE, 'A0903543', 2008, 4.0, 1),
('567891234', 'Marian Costa', '180 Raymond Dr', 'Sewell', 'NJ', 'FEMALE', TRUE, '1993-12-12', 'ITALIAN', 2, '214564', 2.6, FALSE, '340693000512', 2011, 2.5, 200),
('678912345', 'Dennis Ren', 'PO Box 670', 'Toledo', 'OH', 'MALE', TRUE, '1991-02-07', 'JAPANESE', 7, '155052', 1.9, TRUE, '390466802621', 2009, 2.2, 140),
('789123456', 'Elaine Price', '21 Hartford Ln', 'Denver', 'CO', NULL, TRUE, '1993-04-04', 'KENYAN', 8, '110608', 3.6, FALSE, 'A9101527', 2011, 3.1, 202),
('891234567', 'Taylor Flynn', '1888 Columbia Blvd', 'Anaheim', 'CA', NULL, TRUE, '1989-09-07', NULL, 12, '110608', 3.4, FALSE, '61443001699', 2007, 2.8, 250),
('912345678', 'Phillip Osterly', '12 Crestview Ct', 'Augusta', 'ME', 'MALE', TRUE, '1994-08-01', 'GERMAN', NULL, '161341', NULL, NULL, '00940135', NULL, NULL, NULL),
('120934879', 'Cindi DeJesus', '412 Clarion St Apt B', 'Minneapolis', 'MN', 'FEMALE', TRUE, '1997-06-11', 'MEXICAN', 4, '175263', 2.7, NULL, '270028703631', NULL, 2.7, NULL);



