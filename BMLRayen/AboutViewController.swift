//
//  AboutViewController.swift
//  BMLRayen
//
//  Created by Rayen Kamta on 7/27/17.
//  Copyright © 2017 Rayen Kamta. All rights reserved.
//
import UIKit


struct About {
    
    let image: UIImage
    let title: String
    let text: String
}

let aboutMe: About = About(image: #imageLiteral(resourceName: "profile"), title: "My name is Rayen Kamta", text: "I'm a sofware developer based from the NYC area. Programming for me is second nature, well anything that has to do with math or science. My moto in life is work smarter not harder .")


let hobby: About = About(image: #imageLiteral(resourceName: "yellowPencil"), title: "Hobby⚽️", text: "Besides making apps, I love to play soccer. During the summer you can find me at the beach every weekend.")

let inspiration: About = About(image: #imageLiteral(resourceName: "bulb"), title: "👨🏼‍💻Inspiration", text: "I love to challenge myself. I think of my self as pretty successful since my apps finally pay for my apple developer account. Flappy birds is what got me into iOS developerment more seriously. Knowing that some simple app could make you thousands or even millions excites me.")

let futurePlan: About = About(image: #imageLiteral(resourceName: "building"), title: "Future Plan", text: "My future plan is to run my own mobile development firm. I want to create apps that help people, and not just make make people mindless zombies who walk in to poles while trying to take a selfie .")



class AboutViewController: UIViewController {
    
    let aboutLists:[About] = [aboutMe, hobby, inspiration, futurePlan]
    
    @IBOutlet weak var dismissButton: UIButton!
    
    @IBAction func dismissButtonAsAction(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
}

extension AboutViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "aboutCell", for: indexPath) as! AboutCollectionViewCell

        cell.imageView.image = aboutLists[indexPath.item].image
        cell.titleLabel.text = aboutLists[indexPath.item].title
        cell.contentTextView.text = aboutLists[indexPath.item].text
        
        cell.contentTextView.setContentOffset(CGPoint.zero, animated: false)
        cell.contentTextView.scrollRangeToVisible(NSMakeRange(0, 0))
        
        cell.layer.borderWidth = 1.0
        cell.layer.borderColor = UIColor.white.cgColor
        cell.layer.cornerRadius = 17
        
        return cell
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let width = ((view.frame.width) / 2) + 95
        let height = ((view.frame.height) / 2 + 200)
        
        let cellSize = CGSize(width: width, height: height)
        return cellSize
        
    }
    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
//        
//        let width = ((view.frame.width) - 40) * 3
//        let cellSpacing = 10 * (2)
//        
//        let leftInset = (collectionView.frame.width - CGFloat(width) + CGFloat(cellSpacing)) / 2
//        let rightInset = leftInset
//        
//        return UIEdgeInsetsMake(0, leftInset, 0, rightInset)
//        
//    }
    
}
