SELECT *
FROM   tab;

SELECT *
FROM   members;

SELECT *
FROM   proj_applicants
WHERE  proj_no = 27;

SELECT *
FROM   projects
WHERE  proj_no = 27;

SELECT *
FROM   files
WHERE  1 = 1
      --AND    files_group_no IS NULL
AND    members_no = 3;

SELECT b.*
FROM   (SELECT a.*
              ,ROWNUM rn
        FROM   (SELECT files_no
                      ,files_title
                      ,files_comment
                      ,members_no
                      ,files_group_no
                      ,files_upload_date
                      ,files_type
                      ,files_size
                      ,files_import
                      ,files_trash
                FROM   files
                WHERE  1 = 1
                AND    files_group_no IS NULL
                AND    proj_no = 1
                ORDER  BY files_no) a) b
WHERE  rn BETWEEN 1 AND 10;

SELECT b.*
FROM   (SELECT a.*
              ,ROWNUM rn
        FROM   (SELECT files_no
                      ,files_title
                      ,files_comment
                      ,members_no
                      ,files_group_no
                      ,files_upload_date
                      ,files_type
                      ,files_size
                      ,files_import
                      ,files_trash
                FROM   files
                WHERE  1 = 1
                AND    files_group_no IS NULL
                AND    proj_no = 1
                ORDER  BY files_no) a) b
WHERE  rn BETWEEN 1 AND 10;

SELECT *
FROM   projects;

SELECT COUNT(*)
      ,files_group_no
FROM   files
--WHERE  proj_no = 10000
--AND    files_title = p_files_title
GROUP  BY files_group_no;
