MICRO DESAFIO 1

select movies_db.series.title  as "Series" , movies_db.genres.name as "Nombres"
from movies_db.series 
inner join movies_db.genres on movies_db.genres.id  = movies_db.series.id; 

select episodes.title, concat(actors.first_name,' ', actors.last_name) as "Nombre y Apellido"
from episodes
inner join actor_episode on episodes.id =actor_episode.episode_id 
inner join actors on actor_episode.actor_id =actors.id;


-----------------------------------------------------------------------------
MICRO DESAFIO 2

select distinct concat(movies_db.actors.first_name, " " ,movies_db.actors.last_name) as "Nombre y Apellido", movies_db.movies.title as "Pelicula"
from movies_db.actor_movie 
inner join movies_db.actors on movies_db.actor_movie.id = movies_db.actors.id
inner join movies_db.movies on movies_db.actor_movie.movie_id = movies_db.movies.id 
where movies_db.movies.title like "%La Guerra de las galaxias%"; 


-----------------------------------------------------------------------------
MICRO DESAFIO 3

select movies_db.movies.title, coalesce(movies_db.genres.name, "No tiene genero") as "Generos" 
from movies_db.movies 
left join movies_db.genres on movies_db.movies.genre_id  = movies_db.genres.id
order by movies_db.movies.genre_id  ;


-----------------------------------------------------------------------------
MICRO DESAFIO 4

select title, datediff(end_date,release_date) as Duracion from series;


-----------------------------------------------------------------------------
MICRO DESAFIO 5

select  concat(movies_db.actors.first_name, " " ,movies_db.actors.last_name) as "Nombre y Apellido"
from movies_db.actors
where length(movies_db.actors.first_name) > 6
order by movies_db.actors.last_name;

select count(*) as 'Total de Episodios' from episodes;

select movies_db.series.title as "Titulo", count(movies_db.seasons.serie_id) as "Total de Temporadas"
from movies_db.series
inner join movies_db.seasons on movies_db.series.id = movies_db.seasons.serie_id 
group by movies_db.series.title;

select distinct  movies_db.genres.name  as "Genero", count(movies_db.movies.id) as  "Cantidad de Peliculas"
from movies_db.genres
inner join movies_db.movies on movies_db.genres.id = movies_db.movies.genre_id 
group by movies_db.genres.name
having count(movies_db.movies.id) >= 3;