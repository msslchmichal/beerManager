//
//  IBUViewController.swift
//  beerManager2
//
//  Created by Michał Massloch on 17/10/2021.
//

import UIKit

class IBUViewController: UIViewController {
    
    let hops = ["1","2","3"]

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

//extension IBUViewController {
//    static let hopCell = "hopCell"
//
//    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return 1
//    }

//        override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//            guard let cell = tableView.dequeueReusableCell(withIdentifier: Self.hopCell, for: indexPath) as?  else {
//                fatalError("Unable to dequeue ReminderCell")
//            }
//            let reminder = Reminder.testData[indexPath.row]
    //}
