//
//  JokeBrain.swift
//  Alias
//
//  Created by mac on 30.07.2022.
//

import Foundation

protocol JokeDelegate {
    func didgetJoke(jokeQuestin: String, jokeAnswer: String)
    func didFailWithError(error: Error)
}

struct Joke{
    let baseURL = "https://joke.deno.dev"
    var delegate: JokeDelegate?
    func getJoke() {
        if let url = URL(string: baseURL) {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { (data, response, error) in
                if error != nil {
                    print(error!)
                    return
                }
                if let safeData = data {
                    if let joke = self.parseJSON(safeData){
                        self.delegate?.didgetJoke(jokeQuestin: joke.setup, jokeAnswer: joke.punchline)
                    }
                    
                 }
                
            }
            task.resume()
        }
    }
    
    
    
    func parseJSON(_ data: Data)-> JokeData? {
        let decoder = JSONDecoder()
        do {
            let decodedData = try decoder.decode(JokeData.self, from: data)
            print(decodedData)
            return decodedData
        } catch {
            print(error)
            return nil
        }
    }
    
}
