//
//  NetworkService.swift
//  SpaceXAstronautsAndCustomView
//
//  Created by Александр Рахимов on 26.01.2023.
//

import Foundation

class NetworkService: NetworkServiceProtocol {
    
    func getData(completionHandler: @escaping ([Astronaut]) -> Void) {
        let urlString = "https://api.spacexdata.com/v4/crew"
        guard let url = URL(string: urlString) else { return }
        
        performRequest(url: url, completionHandler: completionHandler)
    }
    
    fileprivate func performRequest(url: URL, completionHandler: @escaping ([Astronaut]) -> Void) {
        
        let session = URLSession(configuration: .default)
        let task = session.dataTask(with: url) { data, response, error in
            
            if let error = error {
                print(error.localizedDescription)
            }
            
            if let data = data {
                guard let astronauts = self.parseJSON(with: data) else { return }
                completionHandler(astronauts)
            }
        }
        task.resume()
    }
    
    fileprivate func parseJSON(with data: Data) -> [Astronaut]? {
        let decoder = JSONDecoder()
        
        do {
            let elementsOfModelApi = try decoder.decode([ModelAPI].self, from: data)
            var astronauts = [Astronaut]()
            for element in elementsOfModelApi {
                let astronaut = Astronaut(data: element)
                guard let astronaut = astronaut else { return nil }
                astronauts.append(astronaut)
            }
            return astronauts
        } catch (let error as NSError) {
            print(error.localizedDescription)
        }
        return nil

    }
   
    
    func getImageData(urlString: String, completionHandler: @escaping (Data) -> Void) {
       
        guard let url = URL(string: urlString) else { return }
        performRequest(with: url, completionHandler: completionHandler)
    }
    
    fileprivate func performRequest(with url: URL, completionHandler: @escaping (Data) -> Void) {
        
        let session = URLSession(configuration: .default)
        let task = session.dataTask(with: url) { data, response, error in
            print(Thread.current)
            if let error = error {
                print(error.localizedDescription)
            }
            
            guard let data = data else { return }
            completionHandler(data)
        }
        task.resume()
    }
}
