create or replace type body ut_data_value_yminterval as
  /*
  utPLSQL - Version 3
  Copyright 2016 - 2021 utPLSQL Project

  Licensed under the Apache License, Version 2.0 (the "License"):
  you may not use this file except in compliance with the License.
  You may obtain a copy of the License at

      http://www.apache.org/licenses/LICENSE-2.0

  Unless required by applicable law or agreed to in writing, software
  distributed under the License is distributed on an "AS IS" BASIS,
  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
  See the License for the specific language governing permissions and
  limitations under the License.
  */

  constructor function ut_data_value_yminterval(self in out nocopy ut_data_value_yminterval, a_value yminterval_unconstrained) return self as result is
  begin
    self.data_value := a_value;
    self.self_type  := $$plsql_unit;
    self.data_type := 'interval year to month';
    self.data_type_plsql := 'yminterval_unconstrained';
    return;
  end;

  overriding member function is_null return boolean is
  begin
    return (self.data_value is null);
  end;

  overriding member function to_string return varchar2 is
  begin
    return ut_utils.interval_to_text(self.data_value);
  end;

  overriding member function compare_implementation(a_other ut_data_value) return integer is
    l_result integer;
    l_other  ut_data_value_yminterval;
  begin
    if a_other is of (ut_data_value_yminterval) then
      l_other := treat(a_other as ut_data_value_yminterval);
      if self.data_value = l_other.data_value then
        l_result := 0;
      elsif self.data_value > l_other.data_value then
        l_result := 1;
      elsif self.data_value < l_other.data_value then
        l_result := -1;
      end if;
    end if;
    return l_result;
  end;
end;
/
