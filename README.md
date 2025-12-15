# 📍 Check-In Logger App

A Flutter mobile application that allows users to log **check-ins** for places they visit or plan to visit, using either their **current GPS location** or a **manually entered address**. The app is built with **Flutter**, uses **Firebase Authentication** for user management, and **Cloud Firestore** for real-time data storage.

This project was developed as part of **Mobile Programming – Lab Assessment 2**.

---

## ✨ Features

* 🔐 **Authentication**

  * Sign up & sign in using email and password (Firebase Auth)
  * User profile stored in Firestore (`users/{uid}`)

* 📌 **Check-In Management**

  * Add a new check-in with:

    * Title
    * Note / description
    * Location
  * View all check-ins in real time
  * View check-in details
  * (Optional) Delete a check-in

* 🗺️ **Location Support**

  * **Automatic location** using GPS
  * **Manual location** by entering an address
  * Reverse geocoding (coordinates → address)
  * Forward geocoding (address → coordinates)

*  **Real-time Updates**

  * Check-in list updates automatically when data changes

*  **Clean Architecture**

  * Cubit (Bloc) for state management
  * Clear separation between UI and business logic

---

##  App Architecture

UI → Cubit (Business Logic) → Firebase → State → UI Reaction

Example (Sign Up Flow):

1. User taps **Sign Up**
2. Form validation
3. `EmailAuthCubit.signUp()` called
4. Firebase Authentication creates user
5. User profile saved in Firestore
6. UI reacts to success or error state

---

## 📱 Screens

1. **Login / Register Screen**

   * Email & password validation
   * Navigation to main screen on success

2. **Check-In List Screen**

   * Displays user’s check-ins from Firestore
   * Real-time updates
   * FAB to add a new check-in

3. **Add Check-In Screen**

   * Enter title & note
   * Choose location:

     * Use current GPS location
     * OR enter address manually
   * Save check-in to Firestore

4. **Check-In Details Screen**

   * Displays full check-in information
   * Optional delete action
  --- 
<img width="347" height="811" alt="Screenshot 2025-12-15 at 5 47 08 PM" src="https://github.com/user-attachments/assets/af3bc140-d92e-458d-bdf5-97f8462a2d01" />
<img width="346" height="787" alt="Screenshot 2025-12-15 at 5 47 24 PM" src="https://github.com/user-attachments/assets/acf49ac7-e052-4e02-a247-4eb07e58fe21" />
<img width="354" height="789" alt="Screenshot 2025-12-15 at 5 47 54 PM" src="https://github.com/user-attachments/assets/5d5c3124-5096-4dd5-bc83-9d0ca5b3f169" />

<img width="348" height="786" alt="Screenshot 2025-12-15 at 5 48 25 PM" src="https://github.com/user-attachments/assets/cf0bc9f6-6b47-4251-bf00-5ddfeac4014b" />
<img width="358" height="786" alt="Screenshot 2025-12-15 at 5 49 30 PM" src="https://github.com/user-attachments/assets/18fae2d8-4fa9-4845-933d-532bf74a8ff3" />
<img width="352" height="786" alt="Screenshot 2025-12-15 at 5 49 58 PM" src="https://github.com/user-attachments/assets/64ecc282-2ac6-4f59-9d65-52eb669c0b94" />

---

## 🛠️ Tech Stack

* **Flutter**
* **Firebase Authentication**
* **Cloud Firestore**
* **Cubit (flutter_bloc)**
* **Geolocator**
* **Geocoding**
* **Permission Handler**

---

## 📦 Required Packages

```yaml
firebase_core
firebase_auth
cloud_firestore
flutter_bloc
geolocator
geocoding
permission_handler
```

---

## 🚀 Getting Started

1. Clone the repository:

   ```bash
   git clone https://github.com/Hagerh/Check-In-Logger-App-.git
   ```

2. Install dependencies:

   ```bash
   flutter pub get
   ```

3. Configure Firebase:

   * Create a Firebase project
   * Add Android/iOS app
   * Download and add configuration files
   * Enable Email/Password Authentication
   * Enable Cloud Firestore

4. Run the app:

   ```bash
   flutter run
   ```

---

##  Learning Objectives

* Implement Firebase authentication
* Store and retrieve user-specific data from Firestore
* Handle location permissions and GPS access
* Use geocoding and reverse geocoding
* Manage state using Cubit
* Build multi-screen Flutter applications

