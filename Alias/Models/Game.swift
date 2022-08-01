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
    let chance = 10 //шанс что выпадет не слово, а действие
    var actionOn = false //индикатор включенного действия
    
    mutating func createGame(topic: String, round: Int){
        gameArray = Words().defineWordsArray(topic: topic).shuffled()
        
        for i in 1...round{ //создаем словарь, номер раунда(ключ) - баллы(значение)
            pointsOfRounds[i] = 0
        }
        //print(gameArray)
    }
    
    //*****
    mutating func getWord(result: button) -> String{
        var word = ""
//        var points = 1
//        if actionOn { points = 3 } //если до этого было действие, то 3 балла
        
        switch result {  //в зависимости от правильности ответа прибавляется либо вычитается балл
        case .yes:
            if actionOn {
            pointsOfRounds[currentRound]! += 3
            } else {
                pointsOfRounds[currentRound]! += 1
            }
        case .fail:
            if actionOn && pointsOfRounds[currentRound]! >= 3 {
                pointsOfRounds[currentRound]! -= 3
            } else if actionOn && pointsOfRounds[currentRound]! < 3 {
                pointsOfRounds[currentRound]! = 0
            } else {
                pointsOfRounds[currentRound]! -= 1
            }
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
            actionOn = false
        }
        else{
            
            word = randomAction()
        }
        
        
        return word
    }
    
    //*****
    
    
    //**********
//    mutating func getWord(result: button) -> String{
//        var word = ""
//        var points = 1
//        if actionOn { points = 3 } //если до этого было действие, то 3 балла
//
//        switch result {  //в зависимости от правильности ответа прибавляется либо вычитается балл
//        case .yes:
//            pointsOfRounds[currentRound]! += points
//        case .fail:
//            if pointsOfRounds[currentRound]! != 0 { pointsOfRounds[currentRound]! -= points}
//        case .skip:
//            print("")
//        }
//        print(pointsOfRounds)
//
//        if Int.random(in: 1...chance) != chance {  //вызов действия с вероятностью 1 к 30
//            word = gameArray[currentIndexOfWord]
//            currentIndexOfWord+=1
//            if currentIndexOfWord == gameArray.count //если номер индекса равен количеству слов в массиве, обнуляем
//            {
//                currentIndexOfWord = 0
//            }
//            actionOn = false
//        }
//        else{
//
//            word = randomAction()
//        }
//
//
//        return word
//    }
    //**************
    
    
    
    
    
    mutating func randomAction() -> String {
        //обращение к модельке действия будет и выбор оттуда рандомного действия
        let quest = Quests().questsArray.shuffled()[0]
        actionOn = true
        return quest
    }
    
    mutating func changedCurrentRound(){ //когда раунд заканчивается, переключаемся на следующий
        currentRound += 1
        
    }
    
    func getCurrentRound()->Int{ //возвращает текущий раунд
        return currentRound
    }
    
    func getPoints()-> Int{ //возращает баллы за раунд
        return pointsOfRounds[currentRound] ?? 0
        
        
    }
    
    func getActionOn()->Bool //возвращает статус, действие сейчас или нет
    {
        
        return actionOn
    }
    
    
}
