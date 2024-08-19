# Firebase Authentication 

This project demonstrates the implementation of full Firebase authentication using GetX state management in Flutter. The authentication system supports both email and phone number authentication, all managed efficiently within the `AuthController`.

## Features

- **Email Authentication**: Users can sign up, log in, and reset their passwords using email.
- **Phone Number Authentication**: Users can authenticate using their phone numbers with OTP verification.
- **GetX State Management**: Efficient state management using GetX for seamless user experience.
- **Firebase Integration**: Secure and scalable authentication backed by Firebase.

## Technologies Used

- **Flutter**: Cross-platform mobile app development.
- **Dart**: Programming language for Flutter.
- **Firebase**: Backend services for authentication.
- **GetX**: State management and dependency injection.

## Getting Started

1. **Clone the repository**:
   ```bash
   git clone https://github.com/your-username/firebase-auth-getx.git
   cd firebase-auth-getx
   ```

2. **Install dependencies**:
   ```bash
   flutter pub get
   ```

3. **Set up Firebase**:
   - Follow the official Firebase setup guide for Flutter.
   - Add your `google-services.json` (for Android) and `GoogleService-Info.plist` (for iOS) files to the respective directories.

4. **Run the app**:
   ```bash
   flutter run
   ```

## Code Structure

- **lib/controllers/auth_controller.dart**: Manages all authentication logic using GetX.
- **lib/screens/**: Contains the UI for authentication (login, signup, phone verification).
- **lib/services/**: Handles Firebase interactions.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Contact

For questions or feedback, feel free to reach out at [arbabhussain414@gmail.com](arbabhussain414@gmail.com)

