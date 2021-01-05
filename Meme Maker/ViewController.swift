//
//  ViewController.swift
//  Meme Maker
//
//  Created by ALEXANDER KOTLUBEEV on 12/11/2020.
//  Copyright © 2020 ALEXANDER KOTLUBEEV. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        configureTopCaption();
        configureBottomCaption();
        initLabels();
    }
    
    var topChoices = [CaptionChoice]();
    var bottomChoices = [CaptionChoice]();
    
    @IBOutlet weak var topCaptionLabel: UILabel!
    @IBOutlet weak var bottomCaptionLabel: UILabel!
    @IBOutlet weak var mainImageView: UIImageView!
    @IBOutlet weak var topCaptionSegmentedControl: UISegmentedControl!
    @IBOutlet weak var bottomCaptionSegmentedControl: UISegmentedControl!
   
    
//    let topChoices = [];
//    let bottomChoices = [];
    func configureTopCaption(){
        topCaptionSegmentedControl.removeAllSegments();
        topCaptionSegmentedControl.selectedSegmentIndex = 0;
        let option1 = CaptionChoice(emoji: "🕶", caption: "You know what's cool?", imageName: "kitty");
        let option2 = CaptionChoice(emoji: "💥", caption: "You know what makes me mad?", imageName: "doge");
        let option3 = CaptionChoice(emoji: "💕", caption: "You know what I love?", imageName: "monkey");
        topChoices = [option1, option2, option3];
        
        for choice in topChoices{
            topCaptionSegmentedControl.insertSegment(withTitle: choice.emoji, at: topChoices.count, animated: false)
        }
      
    }
    
    func configureBottomCaption(){
        bottomCaptionSegmentedControl.removeAllSegments();
        bottomCaptionSegmentedControl.selectedSegmentIndex = 0;
        let option1 = CaptionChoice(emoji: "😼", caption: "Cats wearing hats", imageName: "kitty");
        let option2 = CaptionChoice(emoji: "🐕", caption: "Dogs carrying logs", imageName: "doge");
        let option3 = CaptionChoice(emoji: "🐒", caption: "Monkey being funky", imageName: "monkey");
        bottomChoices = [option1, option2, option3];
        
        for choice in bottomChoices{
            bottomCaptionSegmentedControl.insertSegment(withTitle: choice.emoji, at: bottomChoices.count, animated: false)
        }
      
    }
    
    func initLabels(){
        topCaptionSegmentedControl.selectedSegmentIndex = 0;
        bottomCaptionSegmentedControl.selectedSegmentIndex = 0;
        topCaptionLabel.text = topChoices.first?.caption;
        bottomCaptionLabel.text = bottomChoices.first?.caption;
        mainImageView.image = UIImage(named: topChoices[0].imageName)
    }
    
    @IBAction func topChoiceControls(_ sender: UISegmentedControl) {
        let currentChoice = topChoices[sender.selectedSegmentIndex];
        topCaptionLabel.text = currentChoice.caption;
        mainImageView.image = UIImage(named: currentChoice.imageName);
        
    }
    
    @IBAction func bottomChoiceControls(_ sender: UISegmentedControl) {
        let currentChoice = bottomChoices[sender.selectedSegmentIndex];
        bottomCaptionLabel.text = currentChoice.caption;
        mainImageView.image = UIImage(named: currentChoice.imageName);
    }
    
}

