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

TODO
----

Setting up

- [x] Update gems, fix deprecations, make tests pass

Multi-tenant app

- [ ] Add a sample user with collection history
- [ ] Login page with login and password
- [ ] List only user's data for him
- [ ] Integration test for user to log in
- [ ] Integration test for user to see his data
- [ ] Authorize user to update only his data
- [ ] Integration test for user to update his data
- [ ] Test authorization

Additional Table Features

- [ ] Visit `Country` button to perform visiting of selected by checkbox `Countries` on `Countries#Index` page
- [ ] Collect `Currency` button to perform visiting of selected by checkbox `Currencies` on `Currency#Index` page
- [ ] Make sure only visited/collected row is updated
- [ ] Filter `Country` by name, add a search box on index page
- [ ] Filter `Currency` by name, add a search box on index page
- [ ] Ordering on `Countries#Index` and `Countries#Index` pages
- [ ] No page reloads occur when filtering occur
- [ ] When the filter is cleared, all entities are displayed again
- [ ] Check All feature on Country and Currency pages

Additional Charting Features

- [ ] A line graph over Countries table showing number of countries visited by time
- [ ] A line graph over Currencies table showing number of currencies collected by time
- [ ] Chart should be updated instantly when visiting/collecting performed

General

- [ ] All features done
- [ ] All tests pass
- [ ] New functionality covered with tests
