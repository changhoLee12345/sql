CREATE OR REPLACE PACKAGE pkg_encrypt_decrypt IS
    --암호화 함수 
    FUNCTION encrypt(v_input_string IN VARCHAR2
                    ,v_key          IN VARCHAR2 := '비밀키') 
    RETURN RAW; --원시형 데이터 리턴 (암호화된 알수없는값)
    --복호화 함수
    FUNCTION decrypt(v_input_string IN VARCHAR2
                    ,v_key          IN VARCHAR2 := '비밀키') 
    RETURN VARCHAR2; --복호화된 데이터 리턴 (해독된 원래의 상태)
END pkg_encrypt_decrypt;

CREATE OR REPLACE PACKAGE BODY PKG_ENCRYPT_DECRYPT
IS
    V_KEY_RAW RAW(64);   --전역변수 (암호화 복호화 FUNCTION에서 모두 사용)
--암호화  FUNCTION
FUNCTION ENCRYPT(V_INPUT_STRING IN VARCHAR2 ,V_KEY IN VARCHAR2 := '비밀키')  
  RETURN RAW
    IS
         V_ORIGINAL_RAW  RAW(64);
         V_ENCRYTED_RAW  RAW(64);
    BEGIN 
         V_ORIGINAL_RAW := UTL_I18N.STRING_TO_RAW(V_INPUT_STRING,'AL32UTF8'); 
         --입력된 암호를 RAW타입으로 변경
         V_KEY_RAW := UTL_I18N.STRING_TO_RAW(V_KEY,'AL32UTF8');
         --오라클에서 제공해주는 패키지 함수 (문자열을 RAW타입으로 바꿔준다.)         
          V_ENCRYTED_RAW := DBMS_CRYPTO.ENCRYPT     --암호화
                             ( src => V_ORIGINAL_RAW             
                              ,typ => DBMS_CRYPTO.DES_CBC_PKCS5
                              ,key => V_KEY_RAW
                              ,iv => NULL
                             );
      RETURN V_ENCRYTED_RAW;  --암호화된 값 리턴
    END ENCRYPT;   
            /*
            RAW타입알아보기
            --SYS에서
            SELECT USERNAME, PASSWORD  --암호화된 데이터 보기
            FROM DBA_USERS;
            DESC DBA_USERS;
            --SYS끝
            */
--복호화 FUNCTION
FUNCTION DECRYPT(V_INPUT_STRING IN VARCHAR2 ,V_KEY IN VARCHAR2 := '비밀키')
  return varchar2
    is
      V_DECRYPTED_RAW      VARCHAR2(64);  --해독되어진 값이므로  VARCHAR2
      V_DECRYPTED_CHAR    VARCHAR2(64);  --해독된 값 저장 변수
    BEGIN
       V_KEY_RAW := UTL_I18N.STRING_TO_RAW(V_KEY,'AL32UTF8');  
       V_DECRYPTED_RAW := DBMS_CRYPTO.DECRYPT    --복호화 변수에 저장
        (
         src => V_INPUT_STRING
        ,typ => DBMS_CRYPTO.DES_CBC_PKCS5
        ,key => V_KEY_RAW
        ,iv => NULL
        );
        V_DECRYPTED_CHAR := UTL_I18N.RAW_TO_CHAR(V_DECRYPTED_RAW, 'AL32UTF8'); --해독 되어진 값 저장
        RETURN V_DECRYPTED_CHAR; --해독된 값 리턴
    END DECRYPT;
END PKG_ENCRYPT_DECRYPT;
