 LitLog – Book Review App
LitLog is a beautifully crafted SwiftUI app that lets users log books they’ve read, add reviews, assign star ratings, and view detailed book entries. Built using the latest SwiftData with live updates powered by @Query, it follows modern SwiftUI architecture and includes a splash screen, custom components, and dark mode support.

Features
  Add new books with title, author, genre, review & rating
  Custom reusable RatingView using @Binding
  SwiftData + @Query for live, reactive book list
  Sorting by Title and Author (A–Z)
  One-time animated entry splash screen
  Detailed book view with clean layout
  Swipe to delete from list
  Full dark mode + Dynamic Type support

Technologies Used
  Tool	Usage
  SwiftUI	UI layer and navigation
  SwiftData	Persistent storage model
  @Query	Auto-updating data bindings
  @Model	Custom Book data model
  @Environment	Shared context & dismissal
  MVVM pattern	View + state/data separation
  
Screenshots
<img width="320" height="647" alt="Entry view" src="https://github.com/user-attachments/assets/7c13d360-3e98-44d1-978c-bb694b0f164d" />
<img width="330" height="649" alt="Content View" src="https://github.com/user-attachments/assets/b2d016fb-dc47-46ef-8a3a-2106fa7e889c" />
<img width="330" height="644" alt="ADDbook" src="https://github.com/user-attachments/assets/04989f0d-1c2d-4ee2-86d4-943e64813d54" />
<img width="315" height="642" alt="Content view2" src="https://github.com/user-attachments/assets/5c6ed2eb-2cc3-4615-b4f2-66e34e7459cc" />
<img width="338" height="646" alt="Detailview" src="https://github.com/user-attachments/assets/fe710faf-a313-44c0-8e2f-3e16d2793162" />
<img width="318" height="644" alt="Inside delete option" src="https://github.com/user-attachments/assets/84cfa77f-5d2a-4fea-8464-d22b4cb743e6" />
<img width="317" height="646" alt="delete option" src="https://github.com/user-attachments/assets/13f6a269-0d4d-4c84-9e5b-7572029afbd9" />


Project Structure

LitLog/
│
├── Models/
│   └── Book.swift               # @Model definition
│
├── Views/
│   ├── ContentView.swift       # Home screen
│   ├── AddBookView.swift       # Add form
│   ├── DetailView.swift        # Review details
│   ├── RatingView.swift        # Custom star rating
│   └── EntrySplashView.swift   # Entry animation screen
│
├── Assets.xcassets             # App colors & images
├── BookwormApp.swift           # App entry point
└── README.md                   # You’re here

Ideas for Testing
Unit Tests:
  Input validation for AddBookView
  Rating bounds (0…5)
  Book sorting logic
UI Tests:
  Splash → Home navigation
  Add book → check if visible
  Swipe to delete → item disappears
SwiftData Tests:
  In-memory container insert & fetch
  ModelContext delete confirmation

Future Polish Ideas
  Empty state view when no books are added
  Search books by title or author
  Share book review via ShareSheet
  Undo for delete
  Star filter or "Top Rated" view
  iCloud sync
  JSON import/export

License
  This project is open-source and available under the MIT License.
  
Author

  Shalinth – iOS Developer
  Actively building practical iOS apps with SwiftUI and SwiftData.
  India | 🚀 Looking for iOS Developer Intern roles
