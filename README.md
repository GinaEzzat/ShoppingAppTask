# ShoppingAppTask
Shopping App interface task using flutter
the main file has the entry point of the application 

# home_screen_page
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


# SignUp_Page
signup page is the start page, it has 4 fields for full_name, email, password, and confirm password
it has a login button to direct the user to the home page but if the data is valid
to make each field has a validator we built it with a form widget and the TextField is a TextFormField to have a controller of the data.
first we have 4 controllers for the 4 fields
the form widget has a widget called key to track the controllers
each TextFormField has a controller equals the controller of the field and a validator widget
the validator widget checks whether the data the user has putted in is valid or not
it checks the validation of the data according to the conditions we made.
for the name, it should start with capital letter,
the email must have the @ character,
the password must be at least 6 characters,
and the confirmed password must match the password.
each validator returns a snackbar if the data is not valid

the login button is made from an ElevatedButton widget, it checks if the current state of the formkey is true which means that the data is valid it prompets an alert dialog if not it returns a snackbar that the data is not valid.
the alert dialog is made from a function we named it myDialog();
this function has a showdialog widget, has a builder widget
it returns the alertDialog widget which has title, content and action.
the action push the home page to the pages stack and directs the user to it. 

for the password we made a button to hide or show the password.
we made a togglepassword function to change the state of the hiddenpassword variable.

# pages_transition_animation
we changed the routepage type from materialroute page to pageroute builder so we can apply a customized transition between pages
then we made a _createRoute() function to make the pageroute builder,
the pagebuilder gets the page we want to go to 
the transitionbuilder gets the type of the transition which is fadetransition,
So, when we clicked the button of the alert dialog to go to the home page the signup page fades out and the home page fades in.

# translating the App to arabic
we used 'easy_localization' package by flutter 
we changed the pubspec.yaml and added the easy_localization dependency
we imported the package on each page we used it in.
to make sure everything to translated perfectly, like the assets we made a new folder called 'lang'
we add it to the assets on the pubspec file, then we add two json file, one for the english and one for the other language
each file has the key and the value of the language
then we take each text we want to translate and put the key in the tr() function.
we made a button on the appBar to switch between languages, by calling a function called changeLang().
this function checks if the current language is english then it switch to the other language, else it switch back to english.
