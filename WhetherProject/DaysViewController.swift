//
//  DaysViewController.swift
//  WhetherProject
//
//  Created by Олег Малышев on 18.06.2021.
//

import UIKit
import Alamofire
import RealmSwift


class WheatherList: Object {
    @objc dynamic var data: String = ""
    @objc dynamic var degrees: Double = 0.0
}

class DaysViewController: UIViewController {
    
    
    @IBOutlet weak var dayTableView: UITableView!
    private let realm = try! Realm()
    private var dayTableDataRealm = [WheatherList]()

    var dayTableData: [Daily] = []

    let loader = DaysWeeatherParsing()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dayTableDataRealm = realm.objects(WheatherList.self).map({ $0 })
        dayTableView.delegate = self
        dayTableView.dataSource = self
        loader.delegate = self
        loader.wheatherParsingDayes()
        // Do any additional setup after loading the view.
    }
    


}


extension DaysViewController: WheatherParsingDelegateDays {


    func wheatherTableUpdateDays(wheatherData: [Daily]) {
        self.dayTableData.append(contentsOf: wheatherData)
        DispatchQueue.main.async {
            self.dayTableView.reloadData()
        }
    }

}


//Table delegate
extension DaysViewController: UITableViewDelegate, UITableViewDataSource, UIScrollViewDelegate {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       dayTableData.count
//        dayTableDataRealm.count

    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(withIdentifier: "cellDay", for: indexPath) as! DaysCell

        let cur = dayTableData[indexPath.row].temp

        let dt = dayTableData[indexPath.row].dt

        let date = Date(timeIntervalSince1970: dt)
            let dateFormatter = DateFormatter()
            dateFormatter.timeStyle = DateFormatter.Style.medium //Set time style
            dateFormatter.dateStyle = DateFormatter.Style.medium //Set date style
            dateFormatter.timeZone = .current
            let localDate = dateFormatter.string(from: date)

//        print("Дата: \(localDate)")
//        print("Погода:  \(cur.day) градусов")
        realm.beginWrite()
        dayTableDataRealm[indexPath.row].data = localDate
        dayTableDataRealm[indexPath.row].degrees = cur.day
        try! realm.commitWrite()
        print("Дата realm: \(dayTableDataRealm[indexPath.row].data)")
        print("Погода realm: \(dayTableDataRealm[indexPath.row].degrees)")
//        print("Дата: \(dayTableDataRealm[indexPath.row].data)")
//        print("Погода:  \(dayTableDataRealm[indexPath.row].degrees) градусов")
        

//        cell.day.text = "Дата: \(localDate)"
//        cell.cwheather.text = "Погода:  \(cur.day) градусов"
        
        cell.day.text = "Дата: \(dayTableDataRealm[indexPath.row].data)"
        cell.cwheather.text = "Погода:  \(dayTableDataRealm[indexPath.row].degrees) градусов"

        return cell

    }
    
    
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        print("строчек \(dayTableData.count)")
//        return dayTableData.count
//    }
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "cellDay", for: indexPath) as! DaysCell
////        let cat = categories[indexPath.row]
////        cell.nameLabel.text = "new name"
////        cell.sortOrederLabel.text = "\(cat.sortOrder)"
//        return cell
//    }






}
