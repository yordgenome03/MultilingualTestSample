//
//  LocalizedStringsUITests.swift
//  MultilingualTestSampleUITests
//
//  Created by yotahara on 2024/06/23.
//

import XCTest

final class LocalizedStringsUITests: XCTestCase {
    
    override func setUpWithError() throws {
        continueAfterFailure = false
    }
    
    func testDisplayLocalizedStrings_JA() throws {
        let app = XCUIApplication()
        // アプリの言語設定を日本語に指定
        app.launchArguments += ["-AppleLanguages", "(ja)"]
        app.launch()
        
        let collectionViewsQuery = app.collectionViews
        collectionViewsQuery.staticTexts["おはようございます"].tap()
        
        let button = app.navigationBars["_TtGC7SwiftUI32NavigationStackHosting"].buttons["こんにちは、世界！"]
        button.tap()
        collectionViewsQuery.staticTexts["多言語"].tap()
        collectionViewsQuery.buttons["こんにちは"].tap()
        button.tap()
        collectionViewsQuery.buttons["おやすみなさい"].tap()
        button.tap()
        collectionViewsQuery.staticTexts["テスト"].tap()
        collectionViewsQuery.buttons["決定"].tap()
        button.tap()
        collectionViewsQuery.buttons["戻る"].tap()
        button.tap()
        collectionViewsQuery.buttons["キャンセル"].tap()
        button.tap()
    }
    
    func testDisplayLocalizedStrings_EN() throws {
        let app = XCUIApplication()
        // アプリの言語設定を英語に指定
        app.launchArguments += ["-AppleLanguages", "(en)"]
        app.launch()
        
        let collectionViewsQuery = app.collectionViews
        collectionViewsQuery.staticTexts["Good morning"].tap()
        
        let button = app.navigationBars["_TtGC7SwiftUI32NavigationStackHosting"].buttons["Hello, world!"]
        button.tap()
        
        collectionViewsQuery.staticTexts["MULTILINGUAL"].tap()
        collectionViewsQuery.buttons["Hello"].tap()
        button.tap()
        collectionViewsQuery.buttons["Good night"].tap()
        button.tap()
        collectionViewsQuery.staticTexts["TEST"].tap()
        collectionViewsQuery.buttons["Decision"].tap()
        button.tap()
        collectionViewsQuery.buttons["Back"].tap()
        button.tap()
        collectionViewsQuery.buttons["Cancel"].tap()
        button.tap()
    }
}
