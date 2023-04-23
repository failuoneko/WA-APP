//
//  Bundle-Decodable.swift
//  WA-APP
//
//  Created by L on 2023/4/23.
//

import Foundation

extension Bundle {
    func decode<T: Codable>(_ file: String) -> T {
        
        guard let url = Bundle.main.url(forResource: file, withExtension: "json") else {
            fatalError("Error:\(file)ファイルがプロジェクト内で見つかりませんでした。")
        }
        guard let data = try? Data(contentsOf: url) else {
            fatalError("Error:\(file)ファイルのJSONデコードに失敗しました。")
        }

        let decoder = JSONDecoder()
        guard let datas = try? decoder.decode(T.self, from: data) else {
            fatalError("Error:\(file)ファイルの読み込みに失敗しました。")
        }

        return datas
    }
}

