//
//  DetailViewController.swift
//  Custom TableView Cell
//
//  Created by D7703_17 on 2018. 5. 28..
//  Copyright © 2018년 박금상. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {


      @IBOutlet weak var ImgView: UIImageView!
      @IBOutlet weak var detailTableView: UITableView!
      
      var cellImage : String = ""
      var location = ""
      var Tell = ""
      var menu : String = ""
      
      override func viewDidLoad() {
        super.viewDidLoad()
            //delegate connetion
            detailTableView.delegate = self
            detailTableView.dataSource = self
            
            
            ImgView.image = UIImage(named : cellImage)
//            loca.text = location
//            Tel.text = Tell
            
        // Do any additional setup after loading the view.
    }
      
      func numberOfSections(in tableView: UITableView) -> Int {
            return 1
      }
      
      func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return 3
      }
      
      func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "detail cell", for: indexPath)
//            if indexPath.row == 0{
//                  cell.textLabel?.text = location
//                  return cell
//            } else if indexPath.row == 1{
//                  cell.textLabel?.text = Tell
//                  return cell
//            } else {
//                  cell.textLabel?.text = menu
//                  return cell
//            }
      
      
      switch (indexPath.row) {
      case 0 :
      cell.textLabel?.text = location
      return cell
      case 1 :
      cell.textLabel?.text = Tell
      return cell
      default :
      cell.textLabel?.text = menu
      return cell
      }
      
      }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
