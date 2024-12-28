# ShoppingAppTask
Shopping App interface task using flutter
the main file has the entry point of the application 
the home_screen page has the stateful widget 
the two lists contain the paths of the products and offer images 
we made the body with a ListView widget to make sure that the whole screen is scrollable
the body was divided into 3 sections
first one has a pageview widget to display images that users can swipe through we wrap it with a container to set the appropriate dimensions 
we used the media query to have a resposive UI
second one has a gridview widget to display products cards in a grid
the card widget contains the image, the name of the product and the cart icon
the text and the icon were built in a sizedBox widget
the cart icon displays a text message we tapped by using a SnackBar widget and the scafflodMessenger is used to show the SnackBar
third one has a listview widget to generate a list of hot offers
each list item was built in a container to have a specified width
the container has the row widget wrapped with expanded to make the child widget expand to fill the available space along the x-Axis
