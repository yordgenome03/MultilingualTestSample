//
//  LocalizedStringsTests.swift
//  MultilingualTestSampleTests
//
//  Created by yotahara on 2024/06/23.
//

import XCTest
@testable import MultilingualTestSample

final class LocalizedStringsTests: XCTestCase {
    
    override func tearDownWithError() throws {
        // 言語設定を初期化
        Bundle.setLanguage(nil)
    }
    
    func testMyStrings_JA() throws {
        Bundle.setLanguage("ja")
        // MARK: - Greeting（挨拶）
        MyStrings.Greeting.allCases.forEach { greeting in
            switch greeting {
            case .hello:
                XCTAssertEqual(greeting.localizedString, "こんにちは")
            case .goodMorning:
                XCTAssertEqual(greeting.localizedString, "おはようございます")
            case .goodNight:
                XCTAssertEqual(greeting.localizedString, "おやすみなさい")
            }
        }
        // MARK: - Command（操作）
        MyStrings.Command.allCases.forEach { command in
            switch command {
            case .decision:
                XCTAssertEqual(command.localizedString, "決定")
            case .back:
                XCTAssertEqual(command.localizedString, "戻る")
            case .cancel:
                XCTAssertEqual(command.localizedString, "キャンセル")
            }
        }
        // MARK: - Others（その他）
        MyStrings.Others.allCases.forEach { command in
            switch command {
            case .helloWorld:
                XCTAssertEqual(command.localizedString, "こんにちは、世界！")
            case .multilingual:
                XCTAssertEqual(command.localizedString, "多言語")
            case .test:
                XCTAssertEqual(command.localizedString, "テスト")
            }
        }
    }
    
    func testMyStrings_EN() throws {
        Bundle.setLanguage("en")
        // MARK: - Greeting（挨拶）
        MyStrings.Greeting.allCases.forEach { greeting in
            switch greeting {
            case .hello:
                XCTAssertEqual(greeting.localizedString, "Hello")
            case .goodMorning:
                XCTAssertEqual(greeting.localizedString, "Good morning")
            case .goodNight:
                XCTAssertEqual(greeting.localizedString, "Good night")
            }
        }
        // MARK: - Command（操作）
        MyStrings.Command.allCases.forEach { command in
            switch command {
            case .decision:
                XCTAssertEqual(command.localizedString, "Decision")
            case .back:
                XCTAssertEqual(command.localizedString, "Back")
            case .cancel:
                XCTAssertEqual(command.localizedString, "Cancel")
            }
        }
        // MARK: - Others（その他）
        MyStrings.Others.allCases.forEach { command in
            switch command {
            case .helloWorld:
                XCTAssertEqual(command.localizedString, "Hello, world!")
            case .multilingual:
                XCTAssertEqual(command.localizedString, "Multilingual")
            case .test:
                XCTAssertEqual(command.localizedString, "Test")
            }
        }
    }
}
