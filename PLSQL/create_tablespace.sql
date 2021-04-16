/* FIRST Step: Run as SYSTEM or SYS or DBA user to set container and create tablespace PLSQLTBS  */
alter session set container = pdb1;
create tablespace plsqltbs datafile size 1g; 

