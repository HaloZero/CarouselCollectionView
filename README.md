# CarouselCollectionView

Demonstrates how to implement a carousel with a UICollectionView.

- Demonstrates the use of a carousel view that's docked in the scene, arguably more convenient than making your scene 2,000-pixel wide.
  Note that the use of a docked view is for convenience, and otherwise isn't necessarily.
- The page control is placed in the view (allowing Autolayout, etc.) and outlet into the CarouselViewController.
- The data source can be found in the scene dock.
- The data source uses a `populateFromModel` pattern that might be familiar to some.

![image](https://cloud.githubusercontent.com/assets/1186084/17925773/2339c516-69a3-11e6-8c2c-92839277edc3.png)
