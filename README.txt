user:lyzhou (Zhou, Liuyu)

2015 Winter CS193P final project — Movie Box

I. Instructions:

1. First when we open the app we can see a UITarBarController with four icons. The default page is a UITableView showing a list of new movies now playing in theaters. 
2. We can click on any one image and then it will segue to a UITableView showing the detailed information of the related movie. This UITableView uses dynamic cells. We can click on the poster image and segue to a page view controller showing 5 images of each movie. We can see each image by swiping. 
3. Back to the detail UITableView, We can see a “find a nearby theatre on map” at the bottom of this page. Clicking on this it will segue to a MKMapView(MapKit). The current location is shown in this map and 10 nearby movie theaters are also shown in this map with the routes to get there. Clicking on each red spot(movie theater), the name of the theater will show up. 
4. And we can click on the “Routes Detail” button on the right top of page to segue to a UITableView showing the searching results. For each theater, we have its phone number, distance from here and expected travel time. 
5. We can click on one cell to segue back to the MKMapView, showing only this specific route you choose.
6. There is also a “Apple Map” button on top of the screen. When clicking on it, the apple map app will be opened and it will show all the search results on map.  
7.  In the detail Table View, there is a “Add to Watchlist” button at the bottom of the page. Clicking on it will add this movie to our watch list, which is shown in another tab bar page which will be introduced later. An alert will appear after clicking this button, showing that we have added this movie to watch list successfully.

8. The second tab bar page is a page view controller showing the upcoming movies in theaters. There are 10 page views showing 10 movies. 

9. The third tab bar page is a UITableView showing the watchlist user have added so far. It also supports delete cells. We can click on each cell to segue to a UITableView. Users can give ratings to this movie and add some reviews. These information is stored in NSUserDefault, which will still be there the next time we open the app. 

10. The final tab bar page is the settings of this app. We can change the repeating times of movies showing in UICollectionView in the first tab bar page. The range is 1 - 3. We can also clear the watchlist by clicking on the “Clear Watchlist” button. An alert will come up after that. And we can change the map searching radius of the MKMapView. The range is 0 - 1, which represents the degree of longitude and latitude from current location. And we can change the map searching keyword. The default words are movie theatre.
And there is a show statistics cell at the bottom. It will segue to a UIView — BezierPathsView, which shows the ratings of each movie by drawing a Histogram. We can click on each bar and segue to the relevant detail table view page to show the detailed information of this movie. 


II. Feature list:

1. Storyboard structured with tab bar and navigation controllers.
2. Custom images in tab bar icons, LaunchScreen page and application icons.
3. UICollectionView with UIImageView to show images.
4. UIPageViewController with UIImageView to show images.
5. NSUserDefaults to store data. 
6. UITableView with deletable cells
7. MKMapView to show maps.
8. locationManager to show user current location on map.
9. MKLocalSearchRequest to search for a keyword on map.
10. MKPointAnnotation to show searching results(annotation) on map. 
11. MKDirectionsRequest to get direction from source to destination and show MKRoute on map. 
12. Add a button to open apple map.
13. Popover segue with TextView, adaptive behavior and preferredContentSize.
14. UITextField with textFieldShouldReturn.
15. UIStepper, UISlider to change settings.
16. UIAlertController and presentViewController to show alert
17. Draw BezierPath(rectangular) on UIView and set its color and add subview.
18. Add UITapGestureRecognizer programmatically to enable clicking on UIView(Histogram). 
19. prepareForSegue and performSegueWithIdentifier.


