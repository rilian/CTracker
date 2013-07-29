Actions
-------

* Since REE 2010 is a bit old Ruby, I have updated it to latest ruby-1.9.3 in .rvmrc
* Getting rid of bundled gems which are 2 years old
* Got some issues and warnings with new gems, decided to update Rails to latest 3.2.14
* Some unexpected issues with Unit tests, fixed them by changing around some methods
* Added a cleanup for test database for cucumber, for continuous integration and `rake test && cucumber`, cause the fixtures loaded with Unit tests, are not cleaned up before cucumber run
* Fixing issues related to updated versions of gems, deprecations etc
* Use assets pipeline
* Now all tests are passing again
