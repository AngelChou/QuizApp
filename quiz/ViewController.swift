//
//  ViewController.swift
//  quiz
//
//  Created by Shun-Ching, Chou on 2017/5/1.
//  Copyright © 2017年 Shun-Ching, Chou. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableview: UITableView!
    var selectedCategoryId:Int?
    var categories:[Categories] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        navigationController?.navigationBar.barTintColor = UIColor.orangeColor()
        navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.whiteColor()]
        navigationController?.navigationBar.tintColor = UIColor.whiteColor()

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
        cell.topLabel.text = category.categoryname
        cell.cellImage.image = UIImage(named: category.imagename!)

        return cell
    }

    func tableView(tableView: UITableView, willSelectRowAtIndexPath indexPath: NSIndexPath) -> NSIndexPath? {
        selectCategoryId = categories[indexPath.row].id as? Int
        return indexPath
    }

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let viewController = segue.destinationViewController as! DetailViewController
        viewController.categoryId = selectCategoryId!
    }
}

