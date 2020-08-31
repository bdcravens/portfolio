This was an interesting use case. I needed to put multiple "sites" in a single codebase, each with their own 
routes and set of controllers, while accessing the same set of models and other classes within the application. Further, 
one of those sites would need themeability while maintaining the same routes, controllers, etc. (ie, customized tenants)

There's a few approaches that may work better, such as having a separate, centralized API, putting most logic in gem(s) 
or engine(s), but given the constraints at the time, maintain a single monorepo was best. 

How I accomplished this:

* dynamic routes based on hostname
* split each site into its own routes file/views for manageability
* dynamically loading views based on tenant (primarily using @site and @theme instance variables set in Application controller)

Note that this isn't a fully functional Rails app - code not relevant to demonstrating this code has been omitted (but 
most of the directory structure of the Rails app is kept for context)
