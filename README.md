# Expenses Tracker💸

Flutter application that touches on the basics of working with a Provider and 
an in-depth understanding of State Management, built in compliance with the principles of OOP. 
During the creation process, widgets that are new to me were studied, for example DatePicker and Dismissible.

## Technologies🔧

#### - Flutter
#### - Provider
#### - OOP
#### - Inheritance
#### - Classes
#### - Material Widgets

## Interface💻

The application screen is an AppBar with a title, a chart of expenses by category below it, and below it
a scrollable list of cards, each of which represents an expense you have previously entered 
(title, amount, date and category icon). There is also a button that opens the screen for adding a new expense.

## Functionality🕹

When you click on the floating button, the add expense screen appears which uses the ShowModalBottomSheet 
widget for easy user use.

The add new expense screen includes a text field for title, text field for amount, date picker for choosing the date 
and dropdown list for choosing a category of expense. 

Each of the text fields uses a keyboard according to the type of data being entered. 

The dropdown list uses the leisure category by default. 

DatePicker opens a calendar when you select a date in which it will be used in the future. 
The calendar does not allow you to select a date later than today.

There are also two buttons on the screen - adding expense and a cancel button. Each button performs a corresponding function.

If at least one field is not filled in, a warning window appears asking you to fill in all the data correctly.

After entering all the data and clicking the add button, an expense card is created and added to the very bottom of the 
list on the main screen. The expense chart is also updated in accordance with the selected expense category and the entered amount.

If there are no expenses entered, the text "No added expenses" is displayed on the screen.

To delete an expense card, you need to swipe the expense to the right or left. After this, the expense is removed from the list 
and all data is updated. Also, a SnackBar appears at the bottom of the screen for 5 seconds, allowing you to cancel the deletion.

As a result, we get an application that allows you to keep a chart of your expenses, which can be used in everyday life🤑

## Possible future improvements⬆️

#### - Ability to sort the list
#### - Improved app animation
#### - Ability to move expense cards to other places in the list
#### - Interface improvements
#### - Increasing the number of categories and the ability to create custom categories
#### - Increasing the number of expense parameters
