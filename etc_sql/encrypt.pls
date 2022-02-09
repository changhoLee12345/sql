CREATE OR REPLACE PACKAGE pkg_encrypt_decrypt IS
    --��ȣȭ �Լ� 
    FUNCTION encrypt(v_input_string IN VARCHAR2
                    ,v_key          IN VARCHAR2 := '���Ű') 
    RETURN RAW; --������ ������ ���� (��ȣȭ�� �˼����°�)
    --��ȣȭ �Լ�
    FUNCTION decrypt(v_input_string IN VARCHAR2
                    ,v_key          IN VARCHAR2 := '���Ű') 
    RETURN VARCHAR2; --��ȣȭ�� ������ ���� (�ص��� ������ ����)
END pkg_encrypt_decrypt;

CREATE OR REPLACE PACKAGE BODY PKG_ENCRYPT_DECRYPT
IS
    V_KEY_RAW RAW(64);   --�������� (��ȣȭ ��ȣȭ FUNCTION���� ��� ���)
--��ȣȭ  FUNCTION
FUNCTION ENCRYPT(V_INPUT_STRING IN VARCHAR2 ,V_KEY IN VARCHAR2 := '���Ű')  
  RETURN RAW
    IS
         V_ORIGINAL_RAW  RAW(64);
         V_ENCRYTED_RAW  RAW(64);
    BEGIN 
         V_ORIGINAL_RAW := UTL_I18N.STRING_TO_RAW(V_INPUT_STRING,'AL32UTF8'); 
         --�Էµ� ��ȣ�� RAWŸ������ ����
         V_KEY_RAW := UTL_I18N.STRING_TO_RAW(V_KEY,'AL32UTF8');
         --����Ŭ���� �������ִ� ��Ű�� �Լ� (���ڿ��� RAWŸ������ �ٲ��ش�.)         
          V_ENCRYTED_RAW := DBMS_CRYPTO.ENCRYPT     --��ȣȭ
                             ( src => V_ORIGINAL_RAW             
                              ,typ => DBMS_CRYPTO.DES_CBC_PKCS5
                              ,key => V_KEY_RAW
                              ,iv => NULL
                             );
      RETURN V_ENCRYTED_RAW;  --��ȣȭ�� �� ����
    END ENCRYPT;   
            /*
            RAWŸ�Ծ˾ƺ���
            --SYS����
            SELECT USERNAME, PASSWORD  --��ȣȭ�� ������ ����
            FROM DBA_USERS;
            DESC DBA_USERS;
            --SYS��
            */
--��ȣȭ FUNCTION
FUNCTION DECRYPT(V_INPUT_STRING IN VARCHAR2 ,V_KEY IN VARCHAR2 := '���Ű')
  return varchar2
    is
      V_DECRYPTED_RAW      VARCHAR2(64);  --�ص��Ǿ��� ���̹Ƿ�  VARCHAR2
      V_DECRYPTED_CHAR    VARCHAR2(64);  --�ص��� �� ���� ����
    BEGIN
       V_KEY_RAW := UTL_I18N.STRING_TO_RAW(V_KEY,'AL32UTF8');  
       V_DECRYPTED_RAW := DBMS_CRYPTO.DECRYPT    --��ȣȭ ������ ����
        (
         src => V_INPUT_STRING
        ,typ => DBMS_CRYPTO.DES_CBC_PKCS5
        ,key => V_KEY_RAW
        ,iv => NULL
        );
        V_DECRYPTED_CHAR := UTL_I18N.RAW_TO_CHAR(V_DECRYPTED_RAW, 'AL32UTF8'); --�ص� �Ǿ��� �� ����
        RETURN V_DECRYPTED_CHAR; --�ص��� �� ����
    END DECRYPT;
END PKG_ENCRYPT_DECRYPT;
