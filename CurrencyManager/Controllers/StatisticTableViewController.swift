//
//  StatisticTableViewController.swift
//  CurrencyManager
//
//  Created by Надежда Возна on 21.01.2020.
//  Copyright © 2020 Надежда Возна. All rights reserved.
//

import UIKit

class StatisticTableViewController: UITableViewController {
    
    private let settings = UserDefaults.standard
    
    //MARK: - IBOutlets
    
    @IBOutlet weak var limitView: UIView! {
        didSet {
            limitView.layer.cornerRadius = 10
            limitView.layer.shadowOpacity = 0.3
            limitView.layer.shadowRadius = 8
            limitView.layer.shadowColor = UIColor.gray.cgColor
            limitView.layer.shadowOffset = CGSize.zero
        }
    }
    @IBOutlet weak var limitLabel: UILabel!
    @IBOutlet weak var balanceView: UIView! {
        didSet {
            balanceView.layer.cornerRadius = 10
            balanceView.layer.shadowOpacity = 0.3
            balanceView.layer.shadowRadius = 8
            balanceView.layer.shadowColor = UIColor.gray.cgColor
            balanceView.layer.shadowOffset = CGSize.zero
        }
    }
    @IBOutlet weak var balanceLabel: UILabel!
    @IBOutlet weak var chartTypeView: UIView!
    @IBOutlet weak var chartPercentLabel1: UILabel!
    @IBOutlet weak var chartPercentLabel2: UILabel!
    @IBOutlet weak var chartPercentLabel3: UILabel!
    @IBOutlet weak var chartPercentLabel4: UILabel!
    @IBOutlet weak var chartPercentLabel5: UILabel!
    @IBOutlet weak var chartPercentLabel6: UILabel!
    @IBOutlet weak var chartPercentLabel7: UILabel!
    @IBOutlet weak var chartPercentLabel8: UILabel!
    @IBOutlet weak var chartPercentLabel9: UILabel!
    @IBOutlet weak var chartPercentLabel10: UILabel!
    @IBOutlet weak var chartPercentLabel11: UILabel!
    @IBOutlet weak var chartProgressViewConstraint1: NSLayoutConstraint!
    @IBOutlet weak var chartProgressViewConstraint2: NSLayoutConstraint!
    @IBOutlet weak var chartProgressViewConstraint3: NSLayoutConstraint!
    @IBOutlet weak var chartProgressViewConstraint4: NSLayoutConstraint!
    @IBOutlet weak var chartProgressViewConstraint5: NSLayoutConstraint!
    @IBOutlet weak var chartProgressViewConstraint6: NSLayoutConstraint!
    @IBOutlet weak var chartProgressViewConstraint7: NSLayoutConstraint!
    @IBOutlet weak var chartProgressViewConstraint8: NSLayoutConstraint!
    @IBOutlet weak var chartProgressViewConstraint9: NSLayoutConstraint!
    @IBOutlet weak var chartProgressViewConstraint10: NSLayoutConstraint!
    @IBOutlet weak var chartProgressViewConstraint11: NSLayoutConstraint!
    
    private var startValue1 = 0
    private var startValue2 = 0
    private var startValue3 = 0
    private var startValue4 = 0
    private var startValue5 = 0
    private var endValue1 = 100
    private var endValue2 = 79
    private var endValue3 = 60
    private var endValue4 = 40
    private var endValue5 = 20
    
    //MARK: - viewDidLoad
    
    override func viewDidLoad() {
        super.viewDidLoad()
        limitLabel.text = (settings.string(forKey: "currSymbol") ?? "$") + (settings.string(forKey: "amount") ?? "0")
        balanceLabel.text = (settings.string(forKey: "currSymbol") ?? "$") + (settings.string(forKey: "balance") ?? settings.string(forKey: "amount") ?? "0")
        
        self.chartProgressViewConstraint1.constant += 250
        self.chartProgressViewConstraint2.constant += 180
        self.chartProgressViewConstraint3.constant += 160
        self.chartProgressViewConstraint4.constant += 150
        self.chartProgressViewConstraint5.constant += 110
        self.chartProgressViewConstraint6.constant += 90
        self.chartProgressViewConstraint7.constant += 70
        self.chartProgressViewConstraint8.constant += 50
        self.chartProgressViewConstraint9.constant += 30
        self.chartProgressViewConstraint10.constant += 20
        self.chartProgressViewConstraint11.constant += 10
        
//        let displayLink = CADisplayLink(target: self, selector: #selector(self.countPercent))
//        displayLink.add(to: .main, forMode: .common)
        
        setupDisplayLayer()
        
//        Timer.scheduledTimer(withTimeInterval: 1.9, repeats: true) { (timer) in
//            self.chartPercentLabel1.text = String(self.endValue1)
//        }
        UIView.animate(withDuration: 1.9) {
            
            self.view.layoutIfNeeded()
        }
    }
    
    var displayLink: CADisplayLink?
    var startValue: Double = 0
    let endValue: Double = 100
    let animationDuration: Double = 1.9
    let animationStartDate = Date()

    func setupDisplayLayer() {

        // create my CADisplayLink here
        displayLink = CADisplayLink(target: self, selector: #selector(handleUpdate))
        displayLink?.add(to: .main, forMode: .default)
    }

    @objc func handleUpdate() {
        let now = Date()
        let elapsedTime = now.timeIntervalSince(animationStartDate)

        if elapsedTime > animationDuration {
            self.chartPercentLabel1.text = "\(endValue)"
            displayLink?.invalidate()
            displayLink = nil
        } else {
            let percentage = elapsedTime / animationDuration
            let value = startValue + percentage * (endValue - startValue)
            self.chartPercentLabel1.text = "\(value)"
        }
    }
    
    @objc func countPercent() {
        
//        chartPercentLabel1.text = "\(startValue1)" + "%"
//        chartPercentLabel2.text = "\(startValue2)" + "%"
//        chartPercentLabel3.text = "\(startValue3)" + "%"
//        chartPercentLabel4.text = "\(startValue4)" + "%"
//        chartPercentLabel5.text = "\(startValue5)" + "%"
//
//        startValue1 += 1
//        if startValue1 > endValue1 {
//            startValue1 = endValue1
//        }
//        startValue2 += 1
//        if startValue2 > endValue2 {
//            startValue2 = endValue2
//        }
//        startValue3 += 1
//        if startValue3 > endValue3 {
//            startValue3 = endValue3
//        }
//        startValue4 += 1
//        if startValue4 > endValue4 {
//            startValue4 = endValue4
//        }
//        startValue5 += 1
//        if startValue5 > endValue5 {
//            startValue5 = endValue5
//        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        limitLabel.text = (settings.string(forKey: "currSymbol") ?? "$") + (settings.string(forKey: "amount") ?? "0")
        balanceLabel.text = (settings.string(forKey: "currSymbol") ?? "$") + (settings.string(forKey: "balance") ?? settings.string(forKey: "amount") ?? "0")
    }
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

}
