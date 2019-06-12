-- 删除三天以前的日志
DELETE FROM log WHERE DATE(create_time) <= DATE(DATE_SUB(NOW(),INTERVAL 3 day));

-- 存储过程AutoDeleteLogs：自动删除3天以前的DEBUG和INFO级别的日志
DELIMITER //
CREATE PROCEDURE AutoDeleteLogs()
	BEGIN
		DELETE FROM log WHERE DATE(create_time) <= DATE(DATE_SUB(NOW(),INTERVAL 3 DAY)) AND (type = 'DEBUG' OR type = 'INFO');
	END //
DELIMITER ;

-- 创建事件，制定每天执行AutoDeleteLogs存储过程
CREATE EVENT event_AutoDeleteLogs
ON SCHEDULE EVERY 1 DAY STARTS '2019-04-25 00:00:00'
ON COMPLETION NOT PRESERVE ENABLE DO CALL AutoDeleteLogs(); 

-- 开启事件计划
SET GLOBAL event_scheduler = 1; 

-- 关闭事件计划
SET GLOBAL event_scheduler = 0; 

-- 查看当前开启的事件
SHOW PROCESSLIST;﻿​

-- 事件的开启与关闭
-- 开启
ALTER EVENT event_AutoDeleteLogs ON COMPLETION PRESERVE ENABLE;
-- 关闭
ALTER EVENT event_AutoDeleteLogs ON COMPLETION PRESERVE DISABLE;

-- 删除存储过程
DROP PROCEDURE AutoDeleteLogs

-- 删除事件
DROP EVENT event_AutoDeleteLogs