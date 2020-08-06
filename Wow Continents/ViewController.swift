//
//  ViewController.swift
//  Wow Continents
//
//  Created by Kyle on 8/5/20.
//  Copyright © 2020 Kyle. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    
    var continents = [Continent]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let jsonData = readLocalFile(forName: "continents") {
            parseJson(json: jsonData)
        }
    }

    private func parseJson(json: Data) {
        let decoder = JSONDecoder()
        if let jsonContinents = try? decoder.decode(Continents.self, from: json) {
            continents = jsonContinents.continents
            tableView.reloadData()
        }
    }
    
    private func readLocalFile(forName name: String) -> Data? {
        do {
            if let bundlePath = Bundle.main.path(forResource: name,
                                                 ofType: "json"),
                let jsonData = try String(contentsOfFile: bundlePath).data(using: .utf8) {
                return jsonData
            }
        } catch {
            print(error)
        }
        
        return nil
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return continents.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "continentCell", for: indexPath)

        let continent = continents[indexPath.row]
        cell.textLabel?.text = continent.name

        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "DetailView") as! DetailTableViewController
        vc.detailItem = continents[indexPath.row]
        navigationController?.pushViewController(vc, animated: true)
    }
    
    
}

