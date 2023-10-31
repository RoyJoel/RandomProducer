//
//  ViewController.swift
//  RandomProducer
//
//  Created by Jason Zhang on 2023/10/31.
//

import UIKit
import TMComponent

class ViewController: UIViewController {
    
    lazy var luckyTextLabel: TMBasicLabel = {
        let label = TMBasicLabel()
        return label
    }()
    
    lazy var randomTextLabel: TMBasicLabel = {
        let label = TMBasicLabel()
        return label
    }()
    
    lazy var luckyNumLabel: TMBasicLabel = {
        let label = TMBasicLabel()
        return label
    }()
    
    lazy var randomNumLabel: TMBasicLabel = {
        let label = TMBasicLabel()
        return label
    }()
    
    lazy var quantitySelectionView: QuantitySelectionView = {
        let view = QuantitySelectionView()
        return view
    }()
    
    lazy var producerButton: TMBasicButton = {
        let button = TMBasicButton()
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = UIColor(named: "BackgroundGray")
        
        view.addSubview(luckyTextLabel)
        view.addSubview(randomTextLabel)
        view.addSubview(luckyNumLabel)
        view.addSubview(randomNumLabel)
        view.addSubview(quantitySelectionView)
        view.addSubview(producerButton)
        
        luckyTextLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(88)
            make.height.equalTo(68)
            make.width.equalToSuperview().offset(-88)
            make.centerX.equalToSuperview()
        }
        luckyNumLabel.snp.makeConstraints { make in
            make.top.equalTo(luckyTextLabel.snp.bottom).offset(24)
            make.height.equalTo(68)
            make.width.equalToSuperview().offset(-88)
            make.centerX.equalToSuperview()
        }
        randomTextLabel.snp.makeConstraints { make in
            make.top.equalTo(luckyNumLabel.snp.bottom).offset(24)
            make.height.equalTo(68)
            make.width.equalToSuperview().offset(-88)
            make.centerX.equalToSuperview()
        }
        randomNumLabel.snp.makeConstraints { make in
            make.top.equalTo(randomTextLabel.snp.bottom).offset(24)
            make.height.equalTo(68)
            make.width.equalToSuperview().offset(-88)
            make.centerX.equalToSuperview()
        }
        quantitySelectionView.snp.makeConstraints { make in
            make.top.equalTo(randomNumLabel.snp.bottom).offset(24)
            make.height.equalTo(68)
            make.width.equalTo(128)
            make.centerX.equalToSuperview()
        }
        producerButton.snp.makeConstraints { make in
            make.top.equalTo(quantitySelectionView.snp.bottom).offset(24)
            make.height.equalTo(68)
            make.width.equalTo(128)
            make.centerX.equalToSuperview()
        }
        
        let luckyTextConfig = TMLabelConfig(title: "早上好，今日幸运数字是", textAlignment: .center)
        let luckyNumConfig = TMLabelConfig(title: "\((0 ..< 10000).randomElement() ?? 0)", textAlignment: .center)
        let randomTextConfig = TMLabelConfig(title: "你抽中的数字为", textAlignment: .center)
        let randomNumConfig = TMLabelConfig(title: "\((0 ..< 10000).randomElement() ?? 0)", textAlignment: .center)
        let randomButtonConfig = TMButtonConfig(title: "开奖", action: #selector(getPrice), actionTarget: self)
        
        luckyTextLabel.setupEvent(config: luckyTextConfig)
        luckyNumLabel.setupEvent(config: luckyNumConfig)
        randomTextLabel.setupEvent(config: randomTextConfig)
        randomNumLabel.setupEvent(config: randomNumConfig)
        quantitySelectionView.setupUI(maximumQuantity: 1000)
        producerButton.setupEvent(config: randomButtonConfig)
        
        luckyTextLabel.textAlignment = .center
        luckyNumLabel.textAlignment = .center
        randomTextLabel.textAlignment = .center
        randomNumLabel.textAlignment = .center
    }

    @objc func getPrice() {
        var timer: Timer?
        let fireDate = Date.now
        timer = Timer(timeInterval: 0.01, repeats: true) { [weak self] tr in
            guard let self = self else {
                return
            }
            let randomNumConfig = TMLabelConfig(title: "\((0 ..< 10000).randomElement() ?? 0)", textAlignment: .center)
            self.randomNumLabel.setupEvent(config: randomNumConfig)
            
            if Int(tr.fireDate.timeIntervalSince(fireDate)) == 1 {
                timer?.invalidate()
                timer = nil
            }
        }
        RunLoop.main.add(timer!, forMode: .common)
    }

}

