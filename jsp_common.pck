create or replace package jsp_common is

  -- Author  : WINNIE
  -- Created : 2024-06-06 ���� 2:26:15
  -- Purpose : common package
  
  -- Public type declarations
  --type <TypeName> is <Datatype>;
  
  -- Public constant declarations
  --<ConstantName> constant <Datatype> := <Value>;

  -- Public variable declarations
  --<VariableName> <Datatype>;

  -- Public function and procedure declarations
  --function <FunctionName>(<Parameter> <Datatype>) return <Datatype>;
	
	function get_version return varchar2;

end jsp_common;
/
create or replace package body jsp_common is

  -- Private type declarations
  --type <TypeName> is <Datatype>;
  
  -- Private constant declarations
  --<ConstantName> constant <Datatype> := <Value>;

  -- Private variable declarations
  --<VariableName> <Datatype>;

  -- Function and procedure implementations
  --function <FunctionName>(<Parameter> <Datatype>) return <Datatype> is
  --  <LocalVariable> <Datatype>;
  --begin
  --  <Statement>;
  --  return(<Result>);
  --end;

begin
  -- Initialization
  --<Statement>;
	function get_version() varchar2 
		as
		begin
			return 'help v.1.0';
		end get_version;
end jsp_common;
/