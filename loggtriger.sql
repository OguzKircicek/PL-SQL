CREATE OR REPLACE TRIGGER L_trg 
AFTER
LOGON ON DATABASE
declare 
  
BEGIN
    
    INSERT INTO LOGON_LOGS
      ( 
        LOGÝN_USER ,             
        IP,                 
        MODULE_NAME,  
        OS_USERNAME,
        CLÝENT_NAME
        LOGON_TÝME         
                             
       )
    VALUES
      (USER,
       SYS_CONTEXT('USERENV', 'IP_ADDRESS'),
       
       SYS_CONTEXT('USERENV', 'SERVER_HOST'),
       SYS_CONTEXT('USERENV', 'OS_USER'), 
       SYS_CONTEXT('USERENV', 'SESSION_USER'),
       SYSDATE 
       );
       
       commit;
END L_trg;