create or replace type ut_junit_reporter force under ut_output_reporter_base(
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
  /**
   * The XUnit reporter.
   * Provides outcomes in a format conforming with JUnit4 as defined in:
   *  https://gist.github.com/kuzuha/232902acab1344d6b578
   */
  constructor function ut_junit_reporter(self in out nocopy ut_junit_reporter) return self as result,

  overriding member procedure after_calling_run(self in out nocopy ut_junit_reporter, a_run in ut_run),
  member function get_common_suite_attributes(a_item ut_suite_item) return varchar2,
  member function get_common_item_attributes(a_item ut_suite_item) return varchar2,
 
  overriding member function get_description return varchar2
)
not final
/
