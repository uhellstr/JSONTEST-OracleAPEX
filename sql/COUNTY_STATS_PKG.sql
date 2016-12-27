create or replace package country_stats_pkg as

  procedure country_data
     (
       p_in_country_code in varchar2 default null,
       p_debug in char default 'N'
     );

end country_stats_pkg;
/

create or replace package body country_stats_pkg as

  procedure country_data
     (
       p_in_country_code in varchar2 default null,
       p_debug in char default 'N'
     ) is

   l_cursor sys_refcursor;

  begin

   open l_cursor for
   select
     c.countrycode,
     c.year,
     c.val,
     c.diff
  from v_s_country_stats c
  where c.countrycode = decode(p_in_country_code,null,c.countrycode,p_in_country_code);

  -- use p_debug if testing directly in sqlcl,sqlplus or sqldeveloper
  if p_debug = 'Y' then
    apex_json.initialize_clob_output;
  end if;

  apex_json.open_object;
  apex_json.write('countrydata', l_cursor);
  apex_json.close_object;

  if p_debug = 'Y' then
   dbms_output.put_line(apex_json.get_clob_output);
   apex_json.free_output;
  end if;

  end country_data;

end country_stats_pkg;
/