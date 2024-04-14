select * from airlines;
select * from airports;
select * from planes;
SELECT * FROM weather;
SELECT * from flights;







CREATE TABLE `airlines` (
  `carrier` varchar(2) NOT NULL,
  `name` varchar(45) NOT NULL,
  PRIMARY KEY (`carrier`),
  KEY `ix_name` (`name`)
);


CREATE TABLE `airports` (
  `origin` varchar(3) NOT NULL,
  `name` varchar(60) NOT NULL,
  `lat` DECIMAL(9,7) NOT NULL,
  `lon` DECIMAL(9,7) NOT NULL,
  `alt` int NOT NULL,
  `tz` int NOT NULL,
  `dst` varchar(1) NOT NULL,
  `tzone` varchar(20) NOT NULL,
  PRIMARY KEY (`origin`),
  KEY `ix_name` (`name`)
);

CREATE TABLE `planes` (
  `tailnum` varchar(6) NOT NULL,
  `year` int NOT NULL,
  `type` varchar(25) NOT NULL,
  `manufacturer` varchar(50) NOT NULL,
  `model` varchar(20) NOT NULL,
  `engines` int NOT NULL,
  `seats` int NOT NULL,
  `speed` int NOT NULL,
  `engine` varchar(20) NOT NULL,
  PRIMARY KEY (`tailnum`)
);


CREATE TABLE `weather` (
  `origin` varchar(3) NOT NULL,
  `year` int NOT NULL,
  `month` int NOT NULL,
  `day` int NOT NULL,
  `hour` int NOT NULL,
  `temp` float NOT NULL,
  `dewp` float NOT NULL,
  `humid` float NOT NULL,
  `wind_dir` float NOT NULL,
  `wind_speed` float NOT NULL,
  `wind_gust` float NOT NULL,
  `precip` float NOT NULL,
  `pressure` float NOT NULL,
  `visib` float NOT NULL,
  `time_hour` datetime NOT NULL, 
  PRIMARY KEY (`origin`,`year`,`month`,`day`,`hour`) 
);

CREATE TABLE `flights` (  
  `year` int NOT NULL,
  `month` int NOT NULL,
  `day` int NOT NULL,  
  `dep_time` int NOT NULL,
  `sched_dep_time` int NOT NULL,
  `dep_delay` int NOT NULL,
  `arr_time` int NOT NULL,
  `sched_arr_time` int NOT NULL,
  `arr_delay` int NOT NULL,
  `carrier` varchar(2) NOT NULL,
  `flight` int NOT NULL,
  `tailnum` varchar(6) NOT NULL,
  `origin` varchar(3) NOT NULL,
  `dest` varchar(3) NOT NULL,
  `air_time` int NOT NULL,
  `distance` int NOT NULL,
  `hour` int NOT NULL,
  `minute` int NOT NULL, 
  `time_hour` datetime NOT NULL,
  PRIMARY KEY (`origin`,`year`,`month`,`day`,`hour`,`flight`,`dest`,`tailnum`,`carrier`)
);




---- Creación de llaves ----------------------
alter table `flights` 
add constraint `carrier` foreign key (`carrier`) references `airlines` (`carrier`)
;

alter table `flights` 
add constraint `origin` foreign key (`origin`) references `airports` (`origin`)
;

alter table `flights` 
add constraint `tailnum` foreign key (`tailnum`) references `planes` (`tailnum`)
;

alter table `flights` 
add constraint `flights_weather` foreign key (`origin`,`year`,`month`,`day`,`hour`) references `weather` (`origin`,`year`,`month`,`day`,`hour`)
;



















CONSTRAINT `flights_airlines` FOREIGN KEY (`carrier`) REFERENCES `airlines` (`carrier`),
  CONSTRAINT `flights_airports` FOREIGN KEY (`origin`) REFERENCES `airports` (`faa`),
  CONSTRAINT `flights_planes` FOREIGN KEY (`tailnum`) REFERENCES `planes` (`tailnum`),
  CONSTRAINT `flights_weather` FOREIGN KEY (`origin`,`year`,`month`,`day`,`hour`) REFERENCES `weather` (`origin`,`year`,`month`,`day`,`hour`)





----------------------------------
CREATE TABLE `airlines` (
  `carrier` varchar(2) NOT NULL,
  `name` varchar(45) NOT NULL,
  PRIMARY KEY (`carrier`),
  KEY `ix_name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `airports` (
  `faa` varchar(3) NOT NULL,
  `name` varchar(60) NOT NULL,
  `lat` DECIMAL(9,7) NOT NULL,
  `lon` DECIMAL(9,7) NOT NULL,
  `alt` int NOT NULL,
  `tz` int NOT NULL,
  `dst` varchar(1) NOT NULL,
  `tzone` varchar(20) NOT NULL,
  PRIMARY KEY (`faa`),
  KEY `ix_name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


CREATE TABLE `planes` (
  `tailnum` varchar(6) NOT NULL,
  `year` int NOT NULL,
  `type` varchar(25) NOT NULL,
  `manufacturer` varchar(50) NOT NULL,
  `model` varchar(20) NOT NULL,
  `engines` int NOT NULL,
  `seats` int NOT NULL,
  `speed` int NOT NULL,
  `engine` varchar(20) NOT NULL,
  PRIMARY KEY (`tailnum`) 
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


CREATE TABLE `weather` (
  `origin` varchar(3) NOT NULL,
  `year` int NOT NULL,
  `month` int NOT NULL,
  `day` int NOT NULL,
  `hour` int NOT NULL,
  `temp` float NOT NULL,
  `dewp` float NOT NULL,
  `humid` float NOT NULL,
  `wind_dir` float NOT NULL,
  `wind_speed` float NOT NULL,
  `wind_gust` float NOT NULL,
  `precip` float NOT NULL,
  `pressure` float NOT NULL,
  `visib` float NOT NULL,
  `time_hour` varchar(20) NOT NULL, 
  PRIMARY KEY (`origin`,`year`,`month`,`day`,`hour`) 
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `flights` (  
  `year` int NOT NULL,
  `month` int NOT NULL,
  `day` int NOT NULL,  
  `dep_time` int NOT NULL,
  `sched_dep_time` int NOT NULL,
  `dep_delay` int NOT NULL,
  `arr_time` int NOT NULL,
  `sched_arr_time` int NOT NULL,
  `arr_delay` int NOT NULL,
  `carrier` varchar(2) NOT NULL,
  `flight` int NOT NULL,
  `tailnum` varchar(6) NOT NULL,
  `origin` varchar(3) NOT NULL,
  `dest` varchar(3) NOT NULL,
  `air_time` int NOT NULL,
  `distance` int NOT NULL,
  `hour` int NOT NULL,
  `minute` int NOT NULL, 
  `time_hour` datetime NOT NULL,
  PRIMARY KEY (`origin`,`year`,`month`,`day`,`hour`,`flight`,`dest`,`tailnum`,`carrier`), 
  CONSTRAINT `flights_airlines` FOREIGN KEY (`carrier`) REFERENCES `airlines` (`carrier`),
  CONSTRAINT `flights_airports` FOREIGN KEY (`origin`) REFERENCES `airports` (`faa`),
  CONSTRAINT `flights_planes` FOREIGN KEY (`tailnum`) REFERENCES `planes` (`tailnum`),
  CONSTRAINT `flights_weather` FOREIGN KEY (`origin`,`year`,`month`,`day`,`hour`) REFERENCES `weather` (`origin`,`year`,`month`,`day`,`hour`)
); 

ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;












----------------------------
CREATE TABLE `airlines` (
  `carrier` varchar(2) NOT NULL,
  `name` varchar(45) NOT NULL,
  PRIMARY KEY (`carrier`),
  KEY `ix_name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


CREATE TABLE `airports` (
  `faa` varchar(3) NOT NULL,
  `name` varchar(60) NOT NULL,
  `lat` DECIMAL(9,7) NOT NULL,
  `lon` DECIMAL(9,7) NOT NULL,
  `alt` int NOT NULL,
  `tz` int NOT NULL,
  `dst` varchar(1) NOT NULL,
  `tzone` varchar(20) NOT NULL,
  PRIMARY KEY (`faa`),
  KEY `ix_name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


CREATE TABLE `planes` (
  `tailnum` varchar(6) NOT NULL,
  `year` int NOT NULL,
  `type` varchar(25) NOT NULL,
  `manufacturer` varchar(50) NOT NULL,
  `model` varchar(20) NOT NULL,
  `engines` int NOT NULL,
  `seats` int NOT NULL,
  `speed` int NOT NULL,
  `engine` varchar(20) NOT NULL,
  PRIMARY KEY (`tailnum`) 
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `weather` (
  `origin` varchar(3) NOT NULL,
  `year` int NOT NULL,
  `month` int NOT NULL,
  `day` int NOT NULL,
  `hour` int NOT NULL,
  `temp` float NOT NULL,
  `dewp` float NOT NULL,
  `humid` float NOT NULL,
  `wind_dir` float NOT NULL,
  `wind_speed` float NOT NULL,
  `wind_gust` float NOT NULL,
  `precip` float NOT NULL,
  `pressure` float NOT NULL,
  `visib` float NOT NULL,
  `time_hour` varchar(20) NOT NULL, 
  PRIMARY KEY (`origin`,`year`,`month`,`day`,`hour`,`temp`,`dewp`,`humid`,`wind_dir`,`wind_speed`,`wind_gust`,`precip`,`pressure`,`visib`,`time_hour`  ) 
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;







CREATE TABLE `flights` (  
  `year` int NOT NULL,
  `month` int NOT NULL,
  `day` int NOT NULL,  
  `dep_time` int NOT NULL,
  `sched_dep_time` int NOT NULL,
  `dep_delay` int NOT NULL,
  `arr_time` int NOT NULL,
  `sched_arr_time` int NOT NULL,
  `arr_delay` int NOT NULL,
  `carrier` varchar(2) NOT NULL,
  `flight` int NOT NULL,
  `tailnum` varchar(6) NOT NULL,
  `origin` varchar(3) NOT NULL,
  `dest` varchar(3) NOT NULL,
  `air_time` int NOT NULL,
  `distance` int NOT NULL,
  `hour` int NOT NULL,
  `minute` int NOT NULL, 
  `time_hour` datetime NOT NULL,
  PRIMARY KEY (`origin`,`year`,`month`,`day`,`hour`,`flight`,`dest`,`tailnum`,`carrier`), 
  CONSTRAINT `flights_airlines` FOREIGN KEY (`carrier`) REFERENCES `airlines` (`carrier`),
  CONSTRAINT `flights_airports` FOREIGN KEY (`origin`) REFERENCES `airports` (`faa`),
  CONSTRAINT `flights_planes` FOREIGN KEY (`tailnum`) REFERENCES `planes` (`tailnum`),
  CONSTRAINT `flights_weather` FOREIGN KEY (`origin`,`year`,`month`) REFERENCES `weather` (`origin`,`year`,`month`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;