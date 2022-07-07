# DATABASE VIDEOGAMES
## [Drawsql link](https://drawsql.app/boolean-7/diagrams/db-videogames)
![alt](db-videogames.png)

Table videogame:
- **id**: bigint, unsigned, not null, autoincrement, unique, **primary key**
- **name**: varchar(200), not null
- **plot**: text
- **release_date**: date, not null
- **pegi**: tinyint, unsigned, not null

Table platform:
- **id**: bigint, unsigned, not null, autoincrement, unique, **primary key**
- **name**: varchar(50), not null

Pivot table videogame_platform:
- **videogame_id**: bigint, unsigned, not null, **foreign key**
- **platform_id**: bigint, unsigned, not null, **foreign key**

Table genre:
- **id**: bigint, unsigned, not null, autoincrement, unique, **primary key**
- **name**: varchar(50), not null

Pivot table genre_videogame:
- **videogame_id**: bigint, unsigned, not null, **foreign key**
- **genre_id**: bigint, unsigned, not null, **foreign key**

content_descriptor:
- **id**: bigint, unsigned, not null, autoincrement, unique, **primary key**
- **name**: varchar(60), not null

Pivot table videogame_content_descriptor:
- **videogame_id**: bigint, unsigned, not null, **foreign key**
- **content_descriptor_id**: bigint, unsigned, not null, **foreign key**

Table award:
- **id**: bigint, unsigned, not null, autoincrement, unique, **primary key**
- **name**: varchar(50), not null
- **year**: year, not null
- **category**: varchar(50), not null
- **videogame_id**: bigint, unsigned, not null, **foreign key**

Table tournament:
- **id**: bigint, unsigned, not null, autoincrement, unique, **primary key**
- **name**: varchar(50), not null
- **year**: year, not null
- **city**: varchar(50), not null
- **videogame_id**: bigint, unsigned, not null, **foreign key**

Table player:
- **id**: bigint, unsigned, not null, autoincrement, unique, **primary key**
- **name**: varchar(50), not null
- **surname**: varchar(50), not null
- **nickname**: varchar(50), not null, unique
- **city**: varchar(50), not null

Pivot table player_tournament:
- **player_id**: bigint, unsigned, not null, **foreign key**
- **tournament_id**: bigint, unsigned, not null, **foreign key**
