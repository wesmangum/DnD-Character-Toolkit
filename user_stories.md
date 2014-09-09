User Stories
============

User Types:
* User - Adventurer with multiple characters

##User Creates Account Using Basic Auth, Facebook, or Twitter (3)

As a User
In order to record my characters
I want to Create an Acccount using Facebook, Twitter, or Email & Password

###Acceptance Criteria:
* Users should be able to click "Connect with Facebook", "Log in with Twitter", or "Email & Password"
* Users should be redirected to a log in page if Twitter or Facebook is selected
  * If the user is already logged into the service, it should automatically redirect to dashboard
* If Email & Password is selected, then they should be taken to a new account page
  * Email verification through new user Email

###Usage:
* User visits the homepage, and clicks on 'Create Account'
* A modal pops up with the options "Connect with Facebook", "Log in with Twitter", and "Email & Password"
* If 'Email & Password' is clicked:
  * User is sent to the New Account page, where they put in their desired email and password
  * An email is sent to the user, where they will click the "Activate Your Account button"
  * User is redirected to their dashboard
* If 'Connect with Facebook' is clicked:
  * User is sent to the Facebook login page, where they put in their Facebook Login credentials
  * User is redirected to their dashboard
* If 'Log in with Twitter' is clicked:
  * User is sent to the Twitter login page, where they put in their Twitter Login credentials
  * User is redirected to their dashboard* User is Redirected to Dashboard

##User Logs into Webapp Using Basic Auth, Facebook, or Twitter (3)(Combine with sign in)

As a User
In order to easily use the app
I want to Log in using Facebook, Twitter, or Email & Password

###Acceptance Criteria:
* Users should be able to click "Log in with Facebook", "Log in with Twitter", or use the Email & Password form
* Users should be redirected to a log in page if Twitter or Facebook is selected
  * If the user is already logged into the service, it should automatically redirect to dashboard
* If Email & Password is selectec, they should be able to click "Login"
  * Redirected to Dashboard

###Usage:
* User visits the homepage, and clicks on 'Log In'
* A modal pops up with the options "Log In with Facebook", "Log in with Twitter", and Email & Password form
* If 'Email & Password' is desired:
  * User is fills out the form using their credentials
  * User is redirected to their dashboard
* If 'Log in with Facebook' is clicked:
  * User is redirected to their dashboard
* If 'Log in with Twitter' is clicked:
  * User is redirected to their dashboard

##User Creates a Character

As a User
In order to begin my Adventure
I want to create a new Character

###Acceptance Criteria:
* Once logged in, Users should be able to click the "Create a Character" button on their dashboard
  * If they already have characters, there should be a list below the button
* Users should be redirected to the New Character page
* The steps to create a new character should guide the User without any confusion

###Usage:
* User visits their dashboard, and clicks on "Create a Character"
* The User is taken to the Character Creation screen, where they may begin making a Character with tabs for:
  * Race
  * Class
  * Description
  * Abilities
  * Equipment

##User Selects a Race for a New Character

As a User
In order to continue cerating my Character
I want to select a Race as the basis for my Character

###Acceptance Criteria
* There should be a "Race" tab on the New Character screen
* When a User selects a base Race, a second dropdown should appear with all of that Race's subRaces
* When the Race selection is done, a table with the Character's Base stats should appear on the page
* The User's Race selection should carry over to the other Character Creation sections

###Usage
* A Page appears, where the User can choose their Race from a dropdown
  * If the race has SubRaces, a second dropdown will appear with those choices
  * When a (sub)race is selected, a table with the race's base stats will show
  * All of the selected Race's traits (speed, languages, etc.) will be listed
* User will Confirm their Race selection by clicking on another section to continue their Character Creation


##User Selects a Class for a New Character

As a User
In order to define my Character and their skillset
I wnat to select a Class for my Character

###Acceptance Criteria
* A Page appears, where the User can choose a Class from a dropdown
* When the User selects a Class, the Base Stats for the character will be updated
* The User's Class selection should carry over to the other character Creation Sections

###Usage
* Once they have confirmed their race, They click "Class" to Choose a Class from a dropdown
  * When a Class is selected, the Class' features and proficiency bonus is listed for level 1
  * Likewise, the Hit Die for the character is shown upon selection, along with the Character's Hit Point Maximum
* User will confirm their Class selection by clicking on another section to continue ther Character Creation


##User Fleshes out Description of New Character

As a User
In order to make my character a living being in this fantasy universe
I want to add description to my character

###Acceptance Criteria
* A Page appears, where the User can select the various details of their Character
* The User should have various dropdowns, all affected by their previous choices
* This tab should be blurred out until Race & Class are selected
* Height and Weight should be effected by the race of the Character
* Ideals should not be selectable until Background is selected

###Usage
* Once Class & Race are selected, the User clicks "Description" to fill out the Character's Description:
  * Name (Text)
  * Sex (Male/Female)
  * Height (Slider determined from Race)
  * Weight (Slider determined from Race)
  * Alignment (Dropdown)
  * Background (Dropdown)
  * Personality (Text)
  * Ideals (Dropdown determined from Background)
  * Bonds (Text)
  * Flaws (Text)
  * Physical Appearance (Text)


##User Determines the Abilities for a New Character

As a User
In order to determine my proficiences in the field
I wnat to distribute points to my different Abilities

###Acceptance Criteria
* A Page appears, where the User can choose their method of distributing points
* A User should be able to randomly generate numbers, or select from a predefined list of numbers
* When Ability points are distributed, the Base Stats table will update to reflect these changes
* This tab should be blocked until Race and Class are selected

###Usage
* Once Class & Race are selected, the User will click "Abilities" to select their Character's Ability Scores
  * Six random Ability Scores are generated, or the options of "15, 14, 13, 12, 10, 8" are availiable
  * User then drags the numbers to the Ability that they want the score on
  * The Abilities are then modified to reflect Race choice
  * The Character's Final Hit Points will be calculated once Constitution is calculated
* User will confirm their Abilities selection by clicking on another section to continue their Character Creation


##User Selects Starting Equipment for New Character

As a User
In order to protect my character from the forces of evil
I want to select my Character's starting equipment

###Acceptance Criteria
* A Page appears, where the User can choose their recommended starting equipment
* A User should have the optinos to have Armor, Shield, and Weapons
* These should all be determined from their Class, Background, and Race
* This tab should be blocked until Race, Class, and Description are selected

###Usage
* Once Class, Race, and Description are selected, clicking "Equipment" will let the user determine their starting equipment
  * User can choose Starting Eqpuipment based on their Class and Background, or select their own.
  * After selecting armor, the Character's Armor Class is calculated from their armor and Dexterity Modifier
* User will confirm their Equipment selection by clicking on another section to continue their Character Creation


##User Saves their New Character

As a user
In order to use my character between sessions
I want to save my Character to my account

###Acceptance Criteria
* The User should be able to review their Character before saving it to the Database
* The "Save" button should be blocked until all required fields are filled out

###Usage
* When the User is ready , they can click the "Finalize" button begin the saving process.
* They are taken to a confirmation screen for their Character, where they can review and make changes accordingly
* When Ready, they may click "Confirm Character" to save their character to the DB
* They are then redirected to the Dashboard, where thier character will be listed