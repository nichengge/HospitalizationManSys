/**
*paracode表-->>category表触发器
*在paracode表增加、修改、删除一个病房类型时，同时增加、修改、删除category表的病房类型
*/
delimiter || 
DROP TRIGGER IF EXISTS insert_trigger_on_paracode ||
CREATE TRIGGER insert_trigger_on_paracode
AFTER INSERT ON paracode
FOR EACH ROW
BEGIN
IF (new.code = '003') THEN
insert into category(type,name) values(new.parameter_values,new.parameter_name);
END IF;
END||
delimiter 

delimiter || 
DROP TRIGGER IF EXISTS delete_trigger_on_paracode||
CREATE TRIGGER delete_trigger_on_paracode
AFTER DELETE ON paracode
FOR EACH ROW
BEGIN
IF (old.code = '003') THEN
delete from category where type=old.parameter_values;
END IF;
END||

delimiter || 
DROP TRIGGER IF EXISTS update_trigger_on_paracode||
CREATE TRIGGER update_trigger_on_paracode
AFTER UPDATE ON paracode
FOR EACH ROW
BEGIN
IF (new.code = '003') THEN
update category set type=new.parameter_values,name=new.parameter_name where type=new.parameter_values;
END IF;
END||



/*
*paracode表-->>bed表触发器
*在paracode表中删除一个病房时，同时触发删除bed表中的该病房的所有房间
*/
delimiter || 
DROP TRIGGER IF EXISTS delete_trigger_on_paracode||
CREATE TRIGGER delete_trigger_on_paracode
AFTER DELETE ON paracode
FOR EACH ROW
BEGIN
IF (old.code = '004') THEN
delete from bed where ward=old.parameter_values;
END IF;
END||