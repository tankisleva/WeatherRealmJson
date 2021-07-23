//
//  ViewController.swift
//  WhetherProject
//
//  Created by Олег Малышев on 12.06.2021.
//

import UIKit
import Alamofire


class ViewController: UIViewController {
    
    
    @IBOutlet weak var labelWeather: UILabel!
    

//    var wheatherTableData : [Weathers] = []
    var wheatherTableData : Weathers!
    
    
    
    let loader = CurrentWeatherParsing()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loader.delegate = self
        loader.wheatherParsing()
    }

    
}








extension ViewController: WheatherParsingDelegate {
   

    
    func wheatherTableUpdate(wheatherData: Weathers) {
//        self.wheatherTableData.main. = wheatherData
        
        labelWeather.text =  "Текущая погода в Москве равна \(wheatherData.main.temp) градусов по цельсию"
//        self.wheatherTableData.append(contentsOf: wheatherData)
//         DispatchQueue.main.async {
//            self.wheatherTable.reloadData()
//        }
    }


}




//extension ViewController: UITableViewDelegate, UITableViewDataSource, UIScrollViewDelegate {
//
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//
//        return wheatherTableData?.weather.count ?? 0
//
//    }
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "WheatherCell", for: indexPath) as! WheatherCell
//
////        let weatherRow = wheatherTableData[indexPath.row]
////        let weatherRow = wheatherTableData!
//        print("______________________")
//
//        cell.temp.text = "Temp равен \(wheatherTableData!.main.temp)"
//        cell.feels_like.text = "Feels_like равен \(wheatherTableData!.main.feels_like)"
//        cell.temp_min.text = "Temp_min равен \(wheatherTableData!.main.temp_min)"
//        cell.temp_max.text = "Temp_max равен \(wheatherTableData!.main.temp_max)"
//        cell.pressure.text = "Pressure равен \(wheatherTableData!.main.pressure)"
//        cell.humidity.text = "Humidity равен \(wheatherTableData!.main.humidity)"
//        cell.sea_level.text = "Sea_level равен \(wheatherTableData!.main.sea_level)"
//        cell.grnd_level.text = "Grnd_level равен \(wheatherTableData!.main.grnd_level)"
//        return cell
//
//
//
//}
//
//}


    

    
  
    



