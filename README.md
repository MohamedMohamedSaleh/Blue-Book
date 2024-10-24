# Blue Book

## 🌟 Features
- **🛍️ Login with Username and Password**:
 <img src="https://github.com/user-attachments/assets/4980b02d-4110-48e5-b672-69bbfa357f53" width="200" alt="auth">
  
- **🛍️ Deep Linking Feature**:
  - We have added Deep Linking support to our app! With this feature, you can now open the app from a URL, either from a website or another app. This allows users to launch the app directly 
   and 
  navigate to specific content or screens.
 - Supported Platforms:
    - Android: Supports deep links via intent filters.
   
 - URLs
   https://blue.book.app.com



### Setup and Configuration:
1- Android: The app handles URLs via intent filters defined in **main/AndroidManifest.xml.** Here’s a snippet of the configuration:
```xml
 <!-- Corrected the intent-filter tag here -->
            <intent-filter android:autoVerify="true">
                <action android:name="android.intent.action.VIEW" />
                <category android:name="android.intent.category.DEFAULT" />
                <category android:name="android.intent.category.BROWSABLE" />
                <data android:scheme="http" android:host="blue.book.app.com"/>
                <data android:scheme="https" android:host="blue.book.app.com"/>
            </intent-filter>

            <meta-data android:name="flutter-deeplink" android:value="true" />

```
 - The app listens for deep links
