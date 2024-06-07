# Credit Score Check

Welcome to the `credit_score_check` Flutter project.

## Getting Started

To get started with this project, follow the instructions below to set up your development environment and run the application.

### Prerequisites

- Flutter SDK: [Install Flutter](https://docs.flutter.dev/get-started/install)
- Dart SDK: Comes bundled with Flutter
- A code editor (VS Code, Android Studio, etc.)

### Installation

1. **Clone the repository:**

    ```sh
    git clone https://github.com/krupikivan/credit_score_check.git
    cd credit_score_check
    ```

2. **Install dependencies:**

    ```sh
    flutter pub get
    ```

3. **Run the application:**

    ```sh
    flutter run
    ```

### Project Structure

- `lib/`: Contains the main codebase for the application
  - `models/`: Data models used in the app
  - `viewmodels/`: State management using Riverpod
  - `views/`: UI components and screens
  - `widgets/`: Reusable widgets
  - `utils/`: Utility functions and constants

## Features

- **Home Screen**: Displays credit score, animated charts, and account details.
- **Employment Information**: Allows users to confirm or edit employment details.
- **Feedback Form**: Collects user feedback.
- **State Management**: Managed using Riverpod with MVVM architecture.
- **Animations**: Smooth animations for UI components.

## Improvements

Improvements that can be made to enhance the application:

1. **Use Constants for Strings**: Refactor the code to use constants for all string literals to avoid duplication and ease maintenance.
2. **Internationalization**: Implement internationalization (i18n) to support multiple languages using packages like `flutter_localizations`.
3. **Error Handling**: Improve error handling mechanisms to provide a better user experience and more informative error messages.
4. **Loading States**: Implement a standardized way to handle loading states across the application to provide a consistent user experience.
5. **Theme Management**: Use a centralized theme to manage colors and text styles throughout the application for consistency.
6. **Navigation**: Enhance navigation by using named routes and a robust navigation management solution like `go_router`.
7. **Code Quality**: Integrate linters (e.g., `flutter_lints`) to enforce coding standards and improve code quality.
8. **Performance Optimization**: Implement lazy loading, optimize state management to improve performance.
9. **Unit and Integration Testing**: Write unit and integration tests to ensure code reliability and prevent regressions.
10. **Responsive Design**: Ensure the application provides a good user experience on different screen sizes and orientations.
11. **Security Enhancements**: Encrypt sensitive data and implement robust authentication and authorization mechanisms.
12. **Logging and Monitoring**: Add logging and crash reporting to capture important events and errors.
13. **Continuous Integration and Deployment (CI/CD)**: Set up CI/CD pipelines to automate build, test, and deployment processes for faster and more reliable releases.

### Note

This project was developed and tested using Flutter version 3.19.6 and was run on iOS.