CREATE OR REPLACE TRIGGER L_trg 
AFTER
LOGON ON DATABASE
declare 
  
BEGIN
    
    INSERT INTO LOGON_LOGS
      ( 
        LOG�N_USER ,             
        IP,                 
        MODULE_NAME,  
        OS_USERNAME,
        CL�ENT_NAME
        LOGON_T�ME         
                             
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