# Clean Architecture Flutter App

## Project Overview

This Flutter project follows Clean Architecture, implementing a structured separation of concerns into Data, Domain, and Presentation layers. It utilizes Dependency Injection (DI) with GetIt and state management with Cubit. The app fetches a list of users and displays their image, name, and email, with a delete button to remove users.

## Features

- Clean Architecture: Proper separation into Data, Domain, and Presentation layers.
- State Management: Cubit.
- Dependency Injection: Implements DI with GetIt.
- Fetch & Display Users: Retrieves a list of users and displays them.
- Loading State: Shows a loading indicator before displaying users.
- User Deletion: Allows users to be removed from the list.

## Usage

- App starts with a button
- Press the button → Shows a loading indicator
- Users list appears → Displays image, name, and email
- Click delete icon → Removes the user from the list

##  Plugins Used

- `flutter_bloc: ^9.0.0`: ^9.0.0 - State management using BLoC pattern.
- `equatable`: ^2.0.7 - Simplifies value comparison in Dart objects.
- `get_it`: ^8.0.3 - Dependency injection for better app modularity.
- `dio`: ^5.8.0+1 - Powerful HTTP client for making API requests.
- `json_annotation`: ^4.9.0 - Helps in JSON serialization and deserialization.

