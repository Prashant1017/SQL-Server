--		Snapshot Database		--


create database Snap on
(name = Test, filename = 'D:\Snapshot\SnapshotFile.ss')
as snapshot of Test


select * from Employee_Financial


select * from Snap.dbo.Employee_Financial


SELECT
    name AS SnapshotName,
    physical_name AS SnapshotFile
FROM sys.master_files
WHERE type = 5; -- 5 represents database snapshots
