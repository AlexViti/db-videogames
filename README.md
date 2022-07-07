# DATABASE VIDEOGAMES
## [Drawsql link](https://drawsql.app/boolean-7/diagrams/db-videogames)
![alt](db-videogames.png)

Table videogame:
- id: bigint, unsigned, not null, unique, autoincrement
- name: varchar(200), not null
- plot: text
- release_date: date, not null
- pegi: tinyint, unsigned, not null