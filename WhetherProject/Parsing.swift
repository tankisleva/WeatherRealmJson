import Foundation
import Alamofire


protocol WheatherParsingDelegate {
    
    func wheatherTableUpdate(wheatherData: Weathers)
    
}

protocol WheatherParsingDelegateDays {
    
    func wheatherTableUpdateDays(wheatherData: [Daily])
    
}


class CurrentWeatherParsing {
    
    var delegate: WheatherParsingDelegate?
    
    
    func wheatherParsing() {
        AF.request("https://api.openweathermap.org/data/2.5/weather?q=Moscow&appid=0fe2959bd34e53089609d7b310a40a91&units=metric").validate().responseDecodable(of: Weathers.self, queue: .main) { response in
                guard let data = response.value
                else {return}
            print(data)
            self.delegate?.wheatherTableUpdate(wheatherData: data)
    }
    

}

}


class DaysWeeatherParsing {
    
    
    var delegate: WheatherParsingDelegateDays?
    
    func wheatherParsingDayes() {
            AF.request("https://api.openweathermap.org/data/2.5/onecall?lat=60.99&lon=30.9&exclude=current,minutely,hourly,alerts&appid=0fe2959bd34e53089609d7b310a40a91&units=metric").validate().responseDecodable(of: Days.self, queue: .main) { response in
                    guard let data = response.value
                    else {return}
                self.delegate?.wheatherTableUpdateDays(wheatherData: data.daily)
            }
        
    }
    
}


