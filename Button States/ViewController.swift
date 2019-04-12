//
//  ViewController.swift
//  Button States
//
//  Created by Alex on 4/12/19.
//  Copyright © 2019 Alex. All rights reserved.
//

import UIKit

struct UIViewExtensionConstants {
    static let CornerRadiusForButton : CGFloat = 25
    static let CornerRadiusForLabel : CGFloat = 20
}

class ViewController: UIViewController {
    
    var normColor: UIColor = UIColor(red: 250/255, green: 251/255, blue: 252/255, alpha: 1.0)
    var clickedColor: UIColor = UIColor(red: 2/255, green: 122/255, blue: 254/255, alpha: 1.0)
    
    @IBOutlet weak var finishedBtn: UIButton! {
        didSet{
            finishedBtn.setGradientBackground(colorOne: .green, colorTwo: .blue)
            finishedBtn.setTitleColor(UIColor(red: 230/255, green: 234/255, blue: 238/255, alpha: 1.0), for: .normal)
            finishedBtn.shadowButton()
            finishedBtn.layer.masksToBounds = true

        }
    }
    @IBOutlet weak var nextBtn: UIButton! {
        didSet{
            nextBtn.setGradientBackground(colorOne: .orange, colorTwo: .red)
            nextBtn.setTitleColor(UIColor(red: 230/255, green: 234/255, blue: 238/255, alpha: 1.0), for: .normal)
            nextBtn.shadowButton()
            nextBtn.layer.masksToBounds = true
        }
    }
    @IBOutlet weak var continueBtn: UIButton!{
        didSet{
            continueBtn.backgroundColor = normColor
            continueBtn.setTitleColor(UIColor.blue, for: .selected)
            continueBtn.setTitleColor(UIColor(red: 230/255, green: 234/255, blue: 238/255, alpha: 1.0), for: .normal)
            continueBtn.shadowButton()

        }
    }
    @IBAction func finishedBtnPressed(_ sender: UIButton) {
        finishedBtn.setGradientBackground(colorOne: .orange, colorTwo: .red)
        finishedBtn.layer.masksToBounds = true
    }
    @IBAction func nextBtnPressed(_ sender: UIButton) {
        nextBtn.setGradientBackground(colorOne: .orange, colorTwo: .red)

    }
    
    @IBAction func continueBtnPressed(_ sender: UIButton) {
        if continueBtn.backgroundColor == normColor {
            continueBtn.backgroundColor = clickedColor
            continueBtn.setTitleColor(clickedColor, for: .normal)
        }
        else if continueBtn.backgroundColor == clickedColor {
            continueBtn.backgroundColor = normColor
            continueBtn.shadowButton()
            continueBtn.setTitleColor(UIColor(red: 230/255, green: 234/255, blue: 238/255, alpha: 1.0), for: .normal)


        }    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.makeCorner(withRadius: 12.0) // rounds view controller view corners -> shows up like Cash App
    }

}

extension UIView{
    func shadowButton(){
        self.layer.cornerRadius = UIViewExtensionConstants.CornerRadiusForButton
        self.layer.masksToBounds = true
        self.layer.shadowRadius = 5.0
        self.layer.shadowColor = UIColor(red:0.37, green:0.37, blue:0.37, alpha:1).cgColor
        self.layer.shadowOpacity = 0.34
        self.layer.shadowOffset = CGSize(width: 2, height: 5)
        self.layer.masksToBounds = false
    }
    
    func noShadowButton(){
        self.layer.shadowRadius = 0.0
        self.layer.shadowColor = UIColor(red:0.37, green:0.37, blue:0.37, alpha:1).cgColor
        self.layer.shadowOpacity = 0.0
        self.layer.shadowOffset = CGSize(width: 2, height: 5)
    }
    
    func setGradientBackground(colorOne: UIColor, colorTwo: UIColor) {
        
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = bounds
        gradientLayer.colors = [colorOne.cgColor, colorTwo.cgColor]
        gradientLayer.locations = [0.0, 1.0]
        gradientLayer.startPoint = CGPoint(x: 1.0, y: 1.0)
        gradientLayer.endPoint = CGPoint(x: 0.0, y: 0.0)
        
        layer.insertSublayer(gradientLayer, at: 0)
    }
    
    // used to round view controller view
    func makeCorner(withRadius radius: CGFloat) {
        self.layer.cornerRadius = radius
        self.layer.masksToBounds = true
        self.layer.isOpaque = false
    }
}

