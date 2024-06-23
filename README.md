# MultilingualTestSample
MultilingualTestSample is a Swift-based sample project designed to demonstrate how to implement and test localization in iOS applications. The project includes both unit tests and UI tests to ensure that localized strings are correctly implemented and displayed.

## Features
- **Localization**: Supports multiple languages (Japanese and English).
- **Unit Tests**: Tests to verify localized strings.
- **UI Tests**: Tests to ensure the correct display of localized strings in the user interface.
- **Custom Bundle Extension**: Allows changing the language during tests without affecting the app's default language settings.

## Getting Started
### Installation
1. Clone the repository:
    ```
    git clone https://github.com/yordgenome03/MultilingualTestSample.git
    ```
2. Open the project in Xcode:
    ```
    cd MultilingualTestSample
    open MultilingualTestSample.xcodeproj
    ```

## Usage
### Running the App
1. Build and run the project in Xcode.
2. The app will display a list of localized strings in both Japanese and English.

### Running the Tests
1. Press **Cmd+U** to run all tests.
2. To run specific tests, you can use the test navigator in Xcode and select the desired tests.

### Testing Localization
#### Unit Tests
The unit tests verify that localized strings are correctly retrieved for different languages. They are located in the **MultilingualTestSampleTests** target.

To run unit tests:
```Swift
import XCTest
@testable import MultilingualTestSample

final class LocalizedStringsTests: XCTestCase {

    override func tearDownWithError() throws {
        Bundle.setLanguage(nil)
    }

    func testMyStrings_JA() throws {
        Bundle.setLanguage("ja")
        // Add tests for Japanese localization
    }

    func testMyStrings_EN() throws {
        Bundle.setLanguage("en")
        // Add tests for English localization
    }
}

```
#### UI Tests
The UI tests check the display of localized strings in the app's user interface. They are located in the LocalizedStringsUITests target.

To run UI tests:
```Swift
import XCTest

final class LocalizedStringsUITests: XCTestCase {

    override func setUpWithError() throws {
        continueAfterFailure = false
    }

    func testMyStrings_JA() throws {
        let app = XCUIApplication()
        app.launchArguments += ["-AppleLanguages", "(ja)"]
        app.launch()
        // Add UI tests for Japanese localization
    }

    func testMyStrings_EN() throws {
        let app = XCUIApplication()
        app.launchArguments += ["-AppleLanguages", "(en)"]
        app.launch()
        // Add UI tests for English localization
    }
}
```
### Bundle Extension
A custom **Bundle** extension is used to change the app's language during tests without affecting the app's default settings.
```Swwift
extension Bundle {
    // Method implementations for setting language during tests
}
```
