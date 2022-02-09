CREATE OR REPLACE PACKAGE pkg_encrypt_decrypt IS
    --암호화 함수
    FUNCTION encrypt(v_input_string IN VARCHAR2
                    ,v_key          IN VARCHAR2 := '비밀키') RETURN RAW; --원시형 데이터 리턴 (암호화된 알수없는값)
    --복호화 함수
    FUNCTION decrypt(v_input_string IN VARCHAR2
                    ,v_key          IN VARCHAR2 := '비밀키') RETURN VARCHAR2; --복호화된 데이터 리턴 (해독된 원래의 상태)

    PROCEDURE create_row(p_id   IN VARCHAR2
                        ,p_pw   IN VARCHAR2
                        ,p_name IN VARCHAR2
                        ,p_msg  OUT VARCHAR2);

END pkg_encrypt_decrypt;
/
CREATE OR REPLACE PACKAGE BODY pkg_encrypt_decrypt IS
    v_key_raw RAW(64); --전역변수 (암호화 복호화 FUNCTION에서 모두 사용)
    --암호화  FUNCTION
    FUNCTION encrypt(v_input_string IN VARCHAR2
                    ,v_key          IN VARCHAR2 := '비밀키') RETURN RAW IS
        v_original_raw RAW(64);
        v_encryted_raw RAW(64);
    
    BEGIN
        v_original_raw := utl_i18n.string_to_raw(v_input_string
                                                ,'AL32UTF8');
        --입력된 암호를 RAW타입으로 변경
        v_key_raw := utl_i18n.string_to_raw(v_key
                                           ,'AL32UTF8');
        --오라클에서 제공해주는 패키지 함수 (문자열을 RAW타입으로 바꿔준다.)
        v_encryted_raw := dbms_crypto.encrypt --암호화
                          (src => v_original_raw
                          ,typ => dbms_crypto.des_cbc_pkcs5
                          ,key => v_key_raw
                          ,iv  => NULL);
        RETURN v_encryted_raw; --암호화된 값 리턴
    END encrypt;
    /*
    RAW타입알아보기
    --SYS에서
    SELECT USERNAME, PASSWORD  --암호화된 데이터 보기
    FROM DBA_USERS;
    DESC DBA_USERS;
    --SYS끝
    */
    --복호화 FUNCTION
    FUNCTION decrypt(v_input_string IN VARCHAR2
                    ,v_key          IN VARCHAR2 := '비밀키') RETURN VARCHAR2 IS
        v_decrypted_raw  VARCHAR2(64); --해독되어진 값이므로  VARCHAR2
        v_decrypted_char VARCHAR2(64); --해독된 값 저장 변수
    
    BEGIN
        v_key_raw        := utl_i18n.string_to_raw(v_key
                                                  ,'AL32UTF8');
        v_decrypted_raw  := dbms_crypto.decrypt --복호화 변수에 저장
                            (src => v_input_string
                            ,typ => dbms_crypto.des_cbc_pkcs5
                            ,key => v_key_raw
                            ,iv  => NULL);
        v_decrypted_char := utl_i18n.raw_to_char(v_decrypted_raw
                                                ,'AL32UTF8'); --해독 되어진 값 저장
        RETURN v_decrypted_char; --해독된 값 리턴
    END decrypt;

    PROCEDURE create_row(p_id   IN VARCHAR2
                        ,p_pw   IN VARCHAR2
                        ,p_name IN VARCHAR2
                        ,p_msg  OUT VARCHAR2) IS
        v_encrypt VARCHAR2(30);
        v_msg     VARCHAR2(3) := 'NG';
    BEGIN
        SELECT pkg_encrypt_decrypt.encrypt(v_input_string => p_pw
                                          ,v_key          => 'testsecretkey')
        INTO   v_encrypt
        FROM   dual;
    
        INSERT INTO login_test
        VALUES
            (p_id
            ,p_name
            ,v_encrypt);
        p_msg := 'OK';
    EXCEPTION
        WHEN OTHERS THEN
            p_msg := v_msg;
    END create_row;

END pkg_encrypt_decrypt;
/
