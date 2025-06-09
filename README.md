# SRS for "FITNESS TRACKER APP"

_Project Title:_  
Fitness Tracker – Personal Workout and Health Logger

_Objective:_  
To design a simple mobile application that allows users to track their daily fitness activities, log workouts by category, and view a summary of their activity.

_Modules & Features_

    1. Module 1: Workout Logging
        Add a workout entry with:
        - Title (e.g., Push-ups)
        - Category (e.g., Cardio, Strength, Yoga)
        - Duration (in minutes)
        - Date

    2. Module 2: Workout List
        Display all logged workouts in a scrollable list
        Each workout card shows:
        - Title
        - Category icon
        - Duration
        - Date

    3. Module 3: Summary/Report (Optional)
        - Show total workouts per category (e.g., Cardio: 3, Strength: 2)
        - Weekly or daily count (simple bar chart or count display)

    4. Module 4: BMI Calculator (Optional / Bonus)
        - Input: Weight (kg), Height (cm)
        - Output: BMI value with status (Underweight, Normal, Overweight)

_Functional Requirements_  
 **\*\*\*\***\*\***\*\*\*\***\*\***\*\*\*\***\*\***\*\*\*\***\_\_**\*\*\*\***\*\***\*\*\*\***\*\***\*\*\*\***\*\***\*\*\*\***  
 || ID || Requirement Description ||  
 || FR1 || The user can add a new workout entry ||  
 || FR2 || The user can view the list of logged workouts ||  
 || FR3 || The app shows duration and category of each workout ||  
 || FR4 || The user can calculate BMI from weight and height ||  
 || FR5 || (Optional) A summary view shows count of activities by category ||  
 **\*\*\*\***\*\***\*\*\*\***\*\***\*\*\*\***\*\***\*\*\*\***\_\_**\*\*\*\***\*\***\*\*\*\***\*\***\*\*\*\***\*\***\*\*\*\***

_UI Expectations_

1. Pages:
   - Home Page
   - List of all workouts
   - Add Workout Page
   - Form with inputs (Title, Duration, Category, Date)
   - (Optional) BMI Page
   - Input fields with BMI result display
   - (Optional) Summary Page – Stats with basic visualization or count

_Tools & Tech Stack_

- Frontend: Flutter (Recommended) or any UI Framework
- State Management: Basic (setState) or Provider (optional)
- Storage (Optional): Local storage using shared_preferences or JSON (no backend needed)

_Deliverables_

- Source code with proper structure
- Screenshots of working app
- A short README (project description, features)
- (Optional) Video demo (1–2 mins)

_Sample Workflows_

1. User opens the app → Sees the list of workouts.
2. Clicks "Add Workout" → Fills title, category, duration, date → Clicks Save.
3. (Optional) Navigates to BMI Page → Enters weight and height → BMI is shown.
4. (Optional) Clicks “Summary” → Sees workout stats.
