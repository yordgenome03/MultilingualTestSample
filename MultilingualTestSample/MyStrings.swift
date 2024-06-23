//
//  MyStrings.swift
//  MultilingualTestSample
//
//  Created by yotahara on 2024/06/23.
//

import Foundation

protocol MyStringsProtocol {
    var localizedString: String { get }
}

extension MyStringsProtocol where Self: RawRepresentable, Self.RawValue == String {
    var localizedString: String {
        return NSLocalizedString(self.rawValue, comment: "")
    }
}

struct MyStrings {
    // MARK: - 挨拶
    enum Greeting: String, MyStringsProtocol, CaseIterable {
        case hello = "hello"
        case goodMorning = "good_morning"
        case goodNight = "good_night"
    }
    // MARK: - 操作
    enum Command: String, MyStringsProtocol, CaseIterable {
        case decision = "decision"
        case back = "back"
        case cancel = "cancel"
    }
    // MARK: - その他
    enum Others: String, MyStringsProtocol, CaseIterable {
        case helloWorld = "Hello, world!"
        case multilingual = "multilingual"
        case test = "test"
    }
}
