BMI Tracker App

A simple BMI tracker app that allows users to calculate and track their BMI (Body Mass Index) over time. The app uses Firebase Auth for authentication and Cloud Firestore for storing user data. Users can enter their weight, height, and age to calculate their BMI, view their history of entries, edit and delete entries, and sign out of the app.

Features
 • User Authentication: Sign in with Firebase Auth (anonymous sign-in).
 • BMI Calculation: Enter weight, height, and age to calculate BMI.
 • Data Storage: Save data to Cloud Firestore, including weight, height, age, BMI, and the current time.
 • BMI Status: Display BMI status (underweight, normal, overweight, obese).
 • History: View a list of all entries (weight, height, age, and BMI status), sorted by the most recent date, paginated with 10 entry records per page.
 • Real-time Updates: The app updates in real-time when data changes on Firestore.
 • Edit and Delete: Edit and delete existing entries.
 • Sign Out: Sign out functionality.

Usage
 • Sign In: On the first launch, users can sign in with Firebase Auth (anonymous sign-in).
 • BMI Calculation: Enter weight, height, and age into the form and submit to calculate BMI.
 • Data Storage: The calculated BMI is saved to Cloud Firestore along with the current time.
 • View History: View a list of all entries (weight, height, age, and BMI status), sorted by most recent date. Entries are paginated with 10 records per page.
 • Edit and Delete: Edit and delete existing entries as needed.
 • Sign Out: Sign out using the provided button.

Live Screenshots 
![WhatsApp Image 2024-04-29 at 04 41 46](https://github.com/MahmooudDarwish/bmi_calculator/assets/147933220/45852ee9-149a-4e35-ac37-35765e5563fa)
![WhatsApp Image 2024-04-29 at 04 41 46 (1)](https://github.com/MahmooudDarwish/bmi_calculator/assets/147933220/5d5dcd32-7902-46b1-b5d1-0fc104e268db)
![WhatsApp Image 2024-04-29 at 04 41 46 (2)](https://github.com/MahmooudDarwish/bmi_calculator/assets/147933220/10dc1a47-84c1-487b-9841-e86a3d52876a)
