Harvest
==============

Harvest is an iOS application developed for [Long Island Harvest](http://www.islandharvest.org/) in order to help them better track their deliveries between donors and recipients of donations. It was created in Stony Brook University's Benevolent Computing class.

1. In order to run this project, first clone or download the repo.
3. Open the harvest.xcworkspace file
4. Click "Run" and choose what device to launch it on, or launch it on your physical plugged in device

In order for this application to work, you will also need a database. Currently the app is set up to work with [Parse](http://www.parse.com), but [here's the db schema to adhere to](images/schema.png).

Once you have a schema on Parse, add your Parse client key and application ID to a new plist file called Keys.plist, add them as parseAppID and parseClientKey as Strings, or alternatively paste the keys into the AppDelegate file where the Parse.setApplicationId() function is called. Once that is done you'll start seeing live data from your database in the app. 
