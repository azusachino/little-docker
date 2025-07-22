/*!50530 SET @@SESSION.PSEUDO_SLAVE_MODE=1*/;
/*!50003 SET @OLD_COMPLETION_TYPE=@@COMPLETION_TYPE,COMPLETION_TYPE=0*/;
DELIMITER /*!*/;
# at 4
#250407 19:48:51 server id 1  end_log_pos 123 CRC32 0x3306bb34 	Start: binlog v 4, server v 5.7.43-log created 250407 19:48:51 at startup
# Warning: this binlog is either in use or was not closed properly.
ROLLBACK/*!*/;
BINLOG '
k63zZw8BAAAAdwAAAHsAAAABAAQANS43LjQzLWxvZwAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAACTrfNnEzgNAAgAEgAEBAQEEgAAXwAEGggAAAAICAgCAAAACgoKKioAEjQA
ATS7BjM=
'/*!*/;
# at 123
#250407 19:48:51 server id 1  end_log_pos 154 CRC32 0x64da0e1f 	Previous-GTIDs
# [empty]
# at 154
#250407 19:49:43 server id 1  end_log_pos 219 CRC32 0x0a8079af 	Anonymous_GTID	last_committed=0	sequence_number=1	rbr_only=no
SET @@SESSION.GTID_NEXT= 'ANONYMOUS'/*!*/;
# at 219
#250407 19:49:43 server id 1  end_log_pos 308 CRC32 0xf2e93445 	Query	thread_id=8	exec_time=0	error_code=0
SET TIMESTAMP=1744022983/*!*/;
SET @@session.pseudo_thread_id=8/*!*/;
SET @@session.foreign_key_checks=1, @@session.sql_auto_is_null=0, @@session.unique_checks=1, @@session.autocommit=1/*!*/;
SET @@session.sql_mode=1436549152/*!*/;
SET @@session.auto_increment_increment=1, @@session.auto_increment_offset=1/*!*/;
/*!\C utf8mb4 *//*!*/;
SET @@session.character_set_client=45,@@session.collation_connection=45,@@session.collation_server=45/*!*/;
SET @@session.lc_time_names=0/*!*/;
SET @@session.collation_database=DEFAULT/*!*/;
BEGIN
/*!*/;
# at 308
# at 340
#250407 19:49:43 server id 1  end_log_pos 340 CRC32 0x7c534b33 	Intvar
SET INSERT_ID=6/*!*/;
#250407 19:49:43 server id 1  end_log_pos 569 CRC32 0xe3499180 	Query	thread_id=8	exec_time=0	error_code=0
use `haru_test`/*!*/;
SET TIMESTAMP=1744022983/*!*/;
/* ApplicationName=DBeaver 25.0.0 - SQLEditor <Script.sql> */ INSERT INTO sample_tbl (name, age) VALUES
('Grace', 32),
('Henry', 27),
('Ivy', 38)
/*!*/;
# at 569
#250407 19:49:43 server id 1  end_log_pos 600 CRC32 0x0995c6fd 	Xid = 47
COMMIT/*!*/;
SET @@SESSION.GTID_NEXT= 'AUTOMATIC' /* added by mysqlbinlog */ /*!*/;
DELIMITER ;
# End of log file
/*!50003 SET COMPLETION_TYPE=@OLD_COMPLETION_TYPE*/;
/*!50530 SET @@SESSION.PSEUDO_SLAVE_MODE=0*/;
