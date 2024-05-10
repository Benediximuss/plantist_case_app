# plantist_case_app

A case study for Codeway Jr. Flutter Developer role

Created by Uğur Öztunç

### Implemented Features

- **Authentication:** Sign up, sign in, and forgot password functionality using Firebase Auth.
- **Data Storage:** Firebase Firestore for storing user information and reminders.
- **Reminder Management:** CRUD operations for reminders:
    - Create reminders with title, note, date, time, and priority.
    - Swipe reminders left to see edit and delete options.
    - Dismiss reminders by swiping them to the left.
    - Mark reminders as completed/uncompleted by pressing on the priority indicator.
- **Reminder Grouping:** Reminders are listed under day groups (tomorrow, today, specific dates), with reminders without date information grouped separately.
- **Sorting:** Within each reminder group, reminders are sorted by completion status and priority.

### Packages Used:


- **firebase_core: ^2.30.1** - Firebase environment.
- **firebase_auth: ^4.19.4** - Firebase authentication.
- **cloud_firestore: ^4.17.2** - Firebase storage and database operations.
- **get: ^4.6.6** - State management, dependency management, and route management.
- **google_fonts: ^6.2.1** - Fonts.
- **intl: ^0.19.0** - Formatting dates and time values.
- **cupertino_icons: ^1.0.8** - Icons.
- **flutter_slidable: ^3.1.0** - Swipeable list cards.
- **grouped_list: ^5.1.2** - Grouping lists.
- **simple_shadow: ^0.3.1** - Shadows.

### Installation
1. **Clone the repository:**
```bash
git clone https://github.com/Benediximuss/plantist_case_app
```

2. **Navigate to the project directory:**
```bash
cd plantist
```

3. **Get dependencies:**
```bash
flutter pub get
```

4. **Run the app:**
```bash
flutter run
```

## Important Notes
- The application was designed and tested using an Android emulator due to the unavailability of a macOS environment. As a result, adaptive UI for both platforms may be lacking.