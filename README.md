**UserDirectory**

A simple User Directory application that fetches user data from https://jsonplaceholder.typicode.com/users, displays it in a list on the Home page, and navigates to a Detail page when a user taps/clicks on a list item.

Features
Fetch users from JSONPlaceholder API
Display users in a scrollable list on the Home page
Navigate to a User Detail page on item selection
Show detailed user information:
Name
Username
Email
Phone
Website
Company
Address
Loading and error handling states
Clean and maintainable architecture
API Used
GET https://jsonplaceholder.typicode.com/users
Application Flow

***Home Page***
    |
    |-- Fetch Users API
    |
    |-- Display List of Users
             |
             |-- Click/Tap User
                        |
                        V
                 Detail Page
                        |
                        |-- Show User Details


***Project Structure***

UserDirectory
│
├── APIManager
│   ├── APIClient.swift
│   ├── APIEndPoints.swift
│   └── MockAPIClientService.swift
│
├── Model
│   └── UserDataModel.swift
│
├── SwiftData
│   ├── UserEntity.swift
│   ├── UserRepository.swift
│   └── UserStorageManager.swift
│
├── UserDirectoryHome
│   ├── UserDirectoryView.swift
│   ├── UserDirectoryViewModel.swift
│   ├── UserDirectoryCell.swift
│   └── InfoCardView.swift
│
├── UserDetail
│   └── UserDetailView.swift
│
├── CustomError.swift
└── UserDirectoryApp.swift

***Home Page***

The UserDirectoryView performs the following actions:

Calls the Users API.
Displays a loading indicator while fetching data.
Renders users in a list view.
Navigates to the Detail page when a user item is selected.

Example list item:

John Doe
john@example.com
Company Name

***Detail Page***

When a user is selected from the Home page, the application navigates to the Detail page and displays:

Name
Username
Email
Phone
Website
Company Name
Address

Example:

Name: Leanne Graham
Username: Bret
Email: Sincere@april.biz
Phone: 1-770-736-8031
Website: hildegard.org
Company: Romaguera-Crona
Address: Kulas Light, Gwenborough
API Service Example
const getUsers = async () => {
  const response = await fetch(
    "https://jsonplaceholder.typicode.com/users"
  );
  return response.json();
};
Navigation Example
onPress={() =>
  navigation.navigate("UserDetail", {
    user: item,
  })
}
