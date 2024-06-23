//
//  Bundle+.swift
//  MultilingualTestSampleTests
//
//  Created by yotahara on 2024/06/23.
//

import XCTest

// テスト環境で言語設定を変更するための拡張
extension Bundle {
    // バンドルを保持するためのキー
    private static var associatedBundleKey: UInt8 = 0
    
    /// 言語を設定
    static func setLanguage(_ language: String?) {
        if let language = language,
           let path = Bundle.main.path(forResource: language, ofType: "lproj") {
            // 指定された言語がnilでない場合、指定言語のリソースバンドルのパスを取得
            // 指定言語のリソースバンドルパスから指定言語のバンドルを作成
            let languageBundle = Bundle(path: path)
            // 現在のバンドルに関連付けられたオブジェクトとして、作成した指定言語のバンドルを保存
            objc_setAssociatedObject(Bundle.main, &associatedBundleKey, languageBundle, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        } else {
            // 指定された言語がnilの場合、関連付けられたオブジェクトをクリア
            objc_setAssociatedObject(Bundle.main, &associatedBundleKey, nil, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
        // ローカライズメソッドのスワッピング
        swizzleLocalization()
    }
    
    /// ローカライズされた文字列を返す
    @objc private func myLocalizedString(forKey key: String, value: String?, table: String?) -> String {
        if let associatedBundle = objc_getAssociatedObject(self, &Bundle.associatedBundleKey) as? Bundle {
            return associatedBundle.localizedString(forKey: key, value: value, table: table)
        } else {
            return self.myLocalizedString(forKey: key, value: value, table: table)
        }
    }
    
    /// メソッドのスワッピング（入れ替え）
    private static func swizzleLocalization() {
        // 元のlocalizedString(forKey:value:table:)メソッドのセレクタ（識別子）を取得
        let originalSelector = #selector(localizedString(forKey:value:table:))
        // myLocalizedString(forKey:value:table:)メソッドのセレクタ（識別子）を取得
        let swizzledSelector = #selector(myLocalizedString(forKey:value:table:))
        
        //　それぞれのメソッドオブジェクトを取得
        guard let originalMethod = class_getInstanceMethod(self, originalSelector),
              let swizzledMethod = class_getInstanceMethod(self, swizzledSelector) else {
            return
        }
        // 元のメソッドとスワップするメソッドの実装（処理）を入れ替える
        method_exchangeImplementations(originalMethod, swizzledMethod)
    }
}
