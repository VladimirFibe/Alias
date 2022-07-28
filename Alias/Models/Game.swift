//
//  Game.swift
//  Alias
//
//  Created by mac on 28.07.2022.
//

import Foundation

enum button{
    case yes
    case fail
    case skip
}

struct Game{
    var gameArray = [String]() //массив слов на одну игру
    var pointsOfRounds = [Int:Int]() //подсчет баллов
    var currentRound = 1 //номер текущего раунда
    var currentIndexOfWord = 0 //индекс текущего слова в массиве
    let chance = 30 //шанс что выпадет не слово, а действие
    
    mutating func createGame(topic: String, round: Int){
        gameArray = Words().defineWordsArray(topic: topic).shuffled()
        
        for i in 1...round{ //создаем словарь, номер раунда(ключ) - баллы(значение)
            pointsOfRounds[i] = 0
        }
        print(gameArray)
    }
    
    mutating func getWord(result: button) -> String{
        var word = ""
        switch result {  //в зависимости от правильности ответа прибавляется либо вычитается балл
        case .yes:
            pointsOfRounds[currentRound]! += 1
        case .fail:
            if pointsOfRounds[currentRound]! != 0 { pointsOfRounds[currentRound]! -= 1}
        case .skip:
            print("")
        }
        print(pointsOfRounds)
        
        if Int.random(in: 1...chance) != chance {  //вызов действия с вероятностью 1 к 30
            word = gameArray[currentIndexOfWord]
            currentIndexOfWord+=1
            if currentIndexOfWord == gameArray.count //если номер индекса равен количеству слов в массиве, обнуляем
            {
                currentIndexOfWord = 0
            }
        }
        else{
            
            word = randomAction()
        }
        
        
        return word
    }
    
    func randomAction() -> String {
        //обращение к модельке действия будет и выбор оттуда рандомного действия
        return "а вот и действие"
    }
    
    mutating func changedCurrentRound(){ //когда раунд заканчивается, переключаемся на следующий
        currentRound += 1
        
    }
    
    func getPoints()-> Int{
        return pointsOfRounds[currentRound] ?? 0
        
        
    }
    
    
}
