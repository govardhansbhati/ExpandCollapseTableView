//
//  ViewController.swift
//  ExpandCollapseTableView
//
//  Created by govardhan singh on 18/09/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet private weak var tableView: UITableView!
    
    var dataList = [DemoDataList]()
    
    //MARK:- ViewLifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        initilise()
    }

    private func initilise(){
        self.title = "Demo TableView"
        view.backgroundColor = .offWhite
        tableView.delegate = self
        tableView.dataSource = self
        
        let resource = DataResource()
        dataList = resource.getDemoList()
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
}

//MARK:- UITableView DataSource & Delegate
extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return dataList.count
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataList[section].isCollapsed ? 0 : dataList[section].list.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "BodyCell", for: indexPath) as? BodyCell else {
            return UITableViewCell()
        }
        cell.bindData = dataList[indexPath.section].list[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return dataList[indexPath.section].isCollapsed ? 0 : 50
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let containerView = UIView.init(frame: CGRect(x: 0, y: 0, width: tableView.frame.width, height: 70))
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "HeaderCell") as? HeaderCell else {
            return UITableViewCell()
        }
        cell.frame = containerView.bounds
        cell.bindData = dataList[section]
        cell.expandCollapseCell = {
            [weak self] in
            guard let self = self else { return }
            self.dataList[section].isCollapsed = !self.dataList[section].isCollapsed
            self.tableView?.beginUpdates()
            self.tableView?.reloadSections([section], with: .fade)
            self.tableView?.endUpdates()
        }
        containerView.addSubview(cell)
        return containerView
    }
    
    
   
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 70
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let containerView = UIView.init(frame: CGRect(x: 0, y: 0, width: tableView.frame.width, height: 15))
        let cell = tableView.dequeueReusableCell(withIdentifier: "FooterView")
        cell?.frame = containerView.bounds
        let view = UIView()
        view.frame = CGRect(x: 15, y: -4, width: ((UIScreen.main.bounds.width) - 30), height: 8)
        view.layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMinXMaxYCorner]
        view.backgroundColor = .offWhite
        DispatchQueue.main.async {
            view.applyNeumorphicEffect(shadowRadiusValue: self.dataList[section].isCollapsed ? 2.0 : -2.0, backgroundColorValue: .offWhite)
        }
        cell?.contentView.addSubview(view)
        cell?.layoutSubviews()
        containerView.addSubview(cell!)
        return containerView
        
    }
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 15
    }
}

