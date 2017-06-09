insert into roles (id,title) values (1,'User');
insert into roles (id,title) values (2,'Supervisor');
insert into roles (id,title) values (3,'Division Supervisor');
insert into roles (id,title) values (4,'Commissioner');
insert into roles (id,title) values (5,'Governor');

insert into eventoutcome (id,description) values (1,'Pre-Trip');
insert into eventoutcome (id,description) values (2,'Trip');
insert into eventoutcome (id,description) values (3,'Post-Trip');
insert into eventoutcome (id,description) values (4,'Finalized');

insert into event (id,name) values (1,'Start TA');
insert into event (id,name) values (2,'Sent to Travel Coordinator');
insert into event (id,name) values (3,'E-Travel Itinerary Research');
insert into event (id,name) values (4,'Waiting for Div Approval');
insert into event (id,name) values (5,'Waiting for Dept Approval');
insert into event (id,name) values (6,'Travel Envelope Preparation');
insert into event (id,name) values (7,'Finalize TA');
insert into event (id,name) values (8,'TA Submission');
insert into event (id,name) values (9,'Reconciliation');
insert into event (id,name) values (10,'Submit for Certification');

insert into staffrole (id,description) values (1,'Travel Coordinator');
insert into staffrole (id,description) values (2,'Divisional Approver');
insert into staffrole (id,description) values (3,'Departmental Approver');
insert into staffrole (id,description) values (4,'Governor');

Insert into STAFF (ID,FIRSTNAME,LASTNAME,EMAIL,DATEJOINED,DATELEFT,OTHERDETAILS,FK_STAFFROLEID) values (321333,'Jeremey','Hustman','jeremey.hustman@alaska.gov',to_date('04-MAR-14','DD-MON-RR'),null,null,1);

insert into users (id, username, didlogin, fk_roleid) values (123456, 'testuser', 'N', 1);
