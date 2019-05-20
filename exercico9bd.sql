use curso_etec;
go
/*4*/
/*a*/
create view prof_vlhora
as select id_cur, nm_prof, vl_hora_prof	
from professor;

select * from prof_vlhora;
/*b*/
sp_help prof_vlhora;

/*c*/
select id_cur 'Curso', nm_prof 'Professor',vl_hora_prof 'Valor por hora' 
	from prof_vlhora;

/*d*/
drop view prof_vlhora;

/*5*/
/*a*/
select * 
from professor 
where vl_hora_prof > (select avg(vl_hora_prof)
						from professor)
						order by vl_hora_prof desc;
/*b*/
select * 
from professor 
where vl_hora_prof <= (select avg(vl_hora_prof)
						from professor)
						order by vl_hora_prof asc;

/*c*/
select * 
from aluno
where dt_nas_alu > (select dt_nas_alu 
					from aluno
					where pn_alu like 'Silvio');

/*d*/
update professor
set vl_hora_prof = vl_hora_prof * 1.5
where vl_hora_prof <= (select avg(vl_hora_prof)
						from professor);


--teste						
select vl_hora_prof 
from professor
where vl_hora_prof <= (select avg(vl_hora_prof)
						from professor);

/*e*/
create view prof_vlhora_aumento
as select nm_prof 'Professor', vl_hora_prof 'Salário hora', vl_hora_prof * 1.5 '5% de aumento'
from professor
where id_cur =	3 and vl_hora_prof < (select avg(vl_hora_prof)
										from professor);

select * from prof_vlhora_aumento

drop view prof_vlhora_aumento

