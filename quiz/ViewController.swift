//
//  ViewController.swift
//  quiz
//
//  Created by Shun-Ching, Chou on 2017/5/1.
//  Copyright © 2017年 Shun-Ching, Chou. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableview: UITableView!
    var selectedCategoryId:Int?
    var categories:[Categories] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        navigationController?.navigationBar.barTintColor = UIColor.orange
        navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.white]
        navigationController?.navigationBar.tintColor = UIColor.white
        
        categories = CoreDataManager.getData(entityName: "Categories") as! [Categories]

        if categories.count == 0 {
            CoreDataManager.loadCategories()
            categories = CoreDataManager.getData(entityName: "Categories") as! [Categories]
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    //MARK: tableview

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categories.count
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! customTableViewCell
        // cell.topLabel?.text = "President"
        // cell.bottomLabel?.text = "3"
        // cell.cellImage?.image = UIImage(named: "president")

        let category = categories[indexPath.row]
        cell.topLabel.text = category.categoriesname
        cell.bottomLabel.text = String(categories.count) //TODO
        cell.cellImage.image = UIImage(named: category.imagename!)

        return cell
    }

    func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        selectedCategoryId = Int(categories[indexPath.row].id)
        return indexPath
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let viewController = segue.destination as! DetailViewController
        viewController.categoryId = selectedCategoryId!

    }
}

