//
//  DetailTableViewController.swift
//  Wow Continents
//
//  Created by Kyle on 8/5/20.
//  Copyright © 2020 Kyle. All rights reserved.
//

import UIKit

class DetailTableViewController: UITableViewController {
    
    var detailItem: Continent?
    
    private enum Sections:String, CaseIterable {
        case name="Name", hordeCities="Horde Cities", allianceCities="Alliance Cities", neutralCities="Neutral Cities", dungeons="Dungeons", battlegrounds="Battlegrounds", arenas="Arenas"
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return DetailTableViewController.Sections.allCases.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
            case 0:
                return 1
            case 1:
                
                guard let hordeCities = detailItem?.capitalCities["horde"] else {
                    return 0
                }
                
                return hordeCities.count
            case 2:
                guard let allianceCities = detailItem?.capitalCities["alliance"] else {
                    return 0
                }
               return allianceCities.count
            case 3:
                guard let neutralCities = detailItem?.capitalCities["neutral"] else {
                    return 0
                }
                return neutralCities.count
            case 4:
                return detailItem?.dungeons.count ?? 0
            case 5:
                return detailItem?.battlegrounds.count ?? 0
            case 6:
                return detailItem?.arenas.count ?? 0
            default:
                return 0
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "detailViewCell", for: indexPath)
        switch indexPath.section {
                   case 0:
                        cell.textLabel?.text = detailItem?.name
                   case 1:
                        if let hordeCities = detailItem?.capitalCities["horde"] {
                            cell.textLabel?.text = hordeCities[indexPath.row]
                            }
                        return cell
                   case 2:
                        if let allianceCities = detailItem?.capitalCities["alliance"] {
                                cell.textLabel?.text = allianceCities[indexPath.row]
                            }
                        return cell
                   case 3:
                        if let neutralCities = detailItem?.capitalCities["neutral"] {
                            cell.textLabel?.text = neutralCities[indexPath.row]
                        }
                        return cell
                   case 4:
                        if let dungeons = detailItem?.dungeons {
                            cell.textLabel?.text = dungeons[indexPath.row]
                        }
                        return cell
                   case 5:
                        if let battlegrounds = detailItem?.battlegrounds {
                            cell.textLabel?.text = battlegrounds[indexPath.row]
                           }
                           return cell
                   case 6:
                        if let arenas = detailItem?.arenas {
                            cell.textLabel?.text = arenas[indexPath.row]
                           }
                           return cell
                   default:
                       return cell
               }

        return cell
    }

    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let mapping = createMapping()
        return "\(mapping[section] ?? "")"
    }
    
    private func createMapping() -> [Int: String] {
        var mapping: [Int: String] = [:]
        for (index,item) in Sections.allCases.enumerated() {
            mapping[index] = item.rawValue
        }
        return mapping
    }
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
