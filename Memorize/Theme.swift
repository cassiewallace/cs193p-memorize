//
//  Theme.swift
//  Memorize
//
//  Created by Cassie Wallace on 9/16/22.
//

import Foundation

private struct ThemeConstants {
    static let emojis: [Theme : [String]] = [
        .flags: ["๐ง๐ช", "๐ฌ๐ง", "๐จ๐ฆ", "๐น๐ท", "๐ง๐พ", "๐ง๐ถ", "๐จ๐ท", "๐จ๐ซ", "๐ง๐ฒ", "๐จ๐จ", "๐จ๐ด", "๐จ๐ฌ", "๐จ๐ฉ", "๐จ๐ฐ", "๐จ๐ฎ", "๐ญ๐ท", "๐จ๐บ", "๐จ๐ผ", "๐จ๐พ", "๐จ๐ฟ", "๐ฉ๐ฐ", "๐ฉ๐ฏ", "๐ซ๐ท", "๐ฒ๐ฐ", "๐ฌ๐ท"],
        .food: ["๐ฅ", "๐ฅฆ", "๐ฉ", "๐ฅ", "๐", "๐ฐ", "๐ฎ", "๐ฅ", "๐ฅ", "๐ง", "๐ฟ", "๐ค", "๐", "๐ญ", "๐", "๐ฅฌ", "๐ฅ", "๐ฅ", "๐", "๐ฅจ", "๐ณ", "๐", "๐ฅฏ", "๐ฅ", "๐ถ"],
        .home: ["๐ช", "๐ฝ", "๐", "โ๏ธ", "๐", "๐ก", "๐ชด", "๐จ", "๐", "๐", "๐ผ", "๐งบ", "๐ชฃ", "๐ช ", "๐งฝ", "๐ช", "๐ฟ", "๐จ", "๐", "๐ช", "๐งป", "๐ช", "๐บ", "๐งฏ", "โ๏ธ"],
        .nature:  ["๐", "๐ฒ", "๐ด", "๐ต", "๐ณ", "๐ฟ", "๐", "๐", "๐ชธ", "๐", "๐ชจ", "๐ท", "๐บ", "๐ป", "โ๏ธ", "๐", "๐", "โ๏ธ", "๐พ", "๐ฑ", "๐จ", "๐", "๐ชท", "๐", "๐ฆ"],
        .skiing: ["โ๏ธ", "โท", "๐ฟ", "๐ก", "๐ ", "๐ชต", "๐ฒ", "๐", "๐จ", "โ๏ธ", "๐ป", "โ ๏ธ", "๐งฆ", "๐", "๐งค", "๐งฃ", "๐ฅ"],
        .sports: ["โฝ๏ธ", "๐", "๐พ", "๐๏ธโโ๏ธ", "๐คผโโ๏ธ", "๐ฅ", "๐คพโโ๏ธ", "๐โโ๏ธ", "๐", "๐โโ๏ธ", "๐", "๐งโโ๏ธ", "๐ฃ", "๐ตโโ๏ธ", "โพ๏ธ", "๐", "๐คฝโโ๏ธ", "๐โโ๏ธ", "๐", "๐", "๐ฅ", "๐", "๐๏ธโโ๏ธ", "๐ฅ"]
    ]
    
    static let colors: [Theme : String] = [
        .flags : "red",
        .food: "orange",
        .nature: "green",
        .skiing: "blue",
        .sports: "yellow",
        .home: "brown"
    ]
    
}

enum Theme: String, CaseIterable {
    case flags = "Flags"
    case food = "Food"
    case nature = "Nature"
    case skiing = "Skiing"
    case sports = "Sports"
    case home = "Home"
    
    static func randomTheme() -> Theme {
        guard let themeName = Theme.allCases.randomElement() else {
        // fatalError("Theme enum should have at least 1 case.")
            return .flags
        }
        return themeName
    }
    
    func getThemeEmojis() -> [String] {
        return ThemeConstants.emojis[self] ?? []
    }
    
    func getThemeColor() -> String {
        return ThemeConstants.colors[self] ?? "black"
    }
    
    func maxThemeEmojisCount() -> Int {
        return getThemeEmojis().count
    }
}

struct GameTheme {
    let emojis: [String]
    let color: String
    
    private let themeName: Theme
    
    init() {
        self.init(Theme.randomTheme())
    }
    
    init(_ themeName: Theme) {
        self.themeName = themeName
        let numberOfPairsOfCards = Int.random(in: 4...self.themeName.maxThemeEmojisCount())
        self.emojis = Array(themeName.getThemeEmojis().shuffled()[0..<numberOfPairsOfCards])
        self.color = themeName.getThemeColor()
    }
    
    func displayName() -> String {
        return themeName.rawValue
    }
}
