# Purpose

**Exercises for the isolated** was created for a Coder Academy Hackathon. The goal was to create a ruby terminal application which could be used during the current COVID-19 lockdown. 

Our app aims to provide exercise prompts at user defined intervals which can be done inside with limited space. This will help users to be active while confined indoors.

# Usage

Users are able to personalise their settings by changing the following options:

- Exercise difficulty => Easy, Medium or Hard
- Reminder Time => Time between exercise reminders (minutes)
- Exercise Time => Exercise session length (minutes)
- Space Available => Yes or No, whether or not you have a limited amount of space

Once these settings are set the user can start the main program. An exercise will be displayed to the user based on the criteria the user has specified. The terminal will display the exercise title along with a series of instructions to perform. When the user confirms the exercise countdown timer will start. When the timer reaches 0 the exercise interval ends and the app will countdown until the next exercise should be performed and will display another randomly chosen exercise that meets the users criteria.

# System Requirements

The following gems are required:

```ruby
require 'tty-prompt'

require 'artii'

require 'unicode/emoji'
```







