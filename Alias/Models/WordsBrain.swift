//
//  WordsData.swift
//  Alias
//
//  Created by mac on 27.07.2022.
//

import Foundation

enum topics: String {     
    case easy = "Легкий"
    case normal = "Средний"
    case hard = "Тяжелый"
    case newYear = "Новый год"
}

struct Words{
    var wordsArray = [String]()
    
    
    mutating func defineWordsArray(topic: String){ //определение массива слов в зависимости от выбранной темы
        print(topic)
        switch topic {
        case topics.easy.rawValue:
            wordsArray = parseJSON(resourseName: "EasyWords") ?? []
        case topics.normal.rawValue:
            wordsArray = parseJSON(resourseName: "Normal") ?? []
        case topics.hard.rawValue:
            wordsArray = parseJSON(resourseName: "Hardcore") ?? []
        case topics.newYear.rawValue:
            wordsArray = parseJSON(resourseName: "NewYear") ?? []
        default:
            print("Что-то пошло не так")
        }
        
        
    }
    
    func parseJSON(resourseName: String) -> [String]?{ //парсинг файлов json
        guard let path = Bundle.main.path(forResource: resourseName, ofType: "json") else {return nil}
        let url = URL(fileURLWithPath: path)
        
        do {
            let data = try Data(contentsOf: url)
            let json = try JSONDecoder().decode(WordsData.self, from: data)
            
            print(json.words)
            return json.words
        }
        catch{
            print(error)
            return nil
        }
        
    }
}
