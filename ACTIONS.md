Actions
-------

* Since REE 2010 is a bit old Ruby, I have updated it to latest `ruby-1.9.3` in `.rvmrc`
* Getting rid of bundled gems which are 2 years old
* Got some issues and warnings with new gems, decided to update Rails to latest 3.2.14
* Some unexpected issues with Unit tests, fixed them by changing around some methods
* Added a cleanup for test database for cucumber, for continuous integration and `rake test && cucumber`, cause the fixtures loaded with Unit tests, are not cleaned up before cucumber run
* Fixing issues related to updated versions of gems, deprecations etc
* Use assets pipeline
* Now all tests are passing again
* Added rake task to populate currencies and countries using `DataUpdater`
* Added tasks list
* Added devise and set it up initially for user authentication
* Set up user authorization and one testing user in seeds
* Fixing all starting failing controller tests, adding authentication stubs
* Move visited property to per-user basis. Reorganize everything
* Fix broken tests around; introduce rspec testing
* Add cancan for authorization
* Cover authorization with specs
* Cover models with specs
* Add ransack for filtering and searching
* Cover filtering and ordering with cucumber tests
* Modify schema to use integer primary keys, to avoid hacks around with connecting models
* Properly link Currency to Country via country_id field
* Add google chart with history of country visits
* Add google chart with history of currency collections. Note that when country visited it may not have currency
* Starting working on checkbox to visit country
* Added ability to edit, update multiple countries
* Done visit multiple countries with page reload
* Done collect multiple currencies with page reload
* Added CodeClimate badge
* Controller specs on visit multiple and collect multiple
* Working on updating each row without page reload
* Collect currency and Visit country now work without page reload

TODO
----

Setting up

- [x] Update gems, fix deprecations, make tests pass
- [x] Add travis.yml for easier testing

Multi-tenant app

- [x] Add a sample user with collection history
- [x] Login page with login and password
- [x] List only user's data for him
- [x] Integration test for user to log in
- [x] Integration test for user to see his data
- [x] Authorize user to update only his data
- [x] Test authorization
- [x] Add sign up, sign out etc links and profile page

Additional Table Features

- [x] Filter `Country` by name, add a search box on index page
- [x] Filter `Currency` by name, add a search box on index page
- [x] Integration test on filtering
- [x] Ordering on `Countries#Index` and `Countries#Index` pages
- [x] Visit checked `Country` button to perform visiting of selected by checkbox `Countries` on `Countries#Index` page
- [x] Collect checked `Currency` button to perform collecting of selected by checkbox `Currencies` on `Currency#Index` page
- [x] Check All feature on Country and Currency pages
- [ ] No page reloads occur when Visiting or Collecting
- [ ] No page reloads occur when filtering occur
- [ ] When the filter is cleared, all entities are displayed again (i.e. filtering performed)
- [ ] Cover functionality with cucumber tests

Additional Charting Features

- [x] A line graph over Countries table showing number of countries visited by time
- [x] A line graph over Currencies table showing number of currencies collected by time
- [ ] Chart should be updated instantly when visiting/collecting performed
- [ ] Cover functionality with cucumber tests

General

- [ ] All features done
- [ ] All tests pass
- [ ] New functionality covered with tests
