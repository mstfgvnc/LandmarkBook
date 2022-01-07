//
//  ViewController.swift
//  LandmarkBook
//
//  Created by user209198 on 1/7/22.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegate ,UICollectionViewDataSource	{
  
   
    var landmarkNames = [String]()
    var landmarkImages = [UIImage]()
    var chosenLandmarkName = ""
    var chosenLandmarkImage = UIImage()


    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
     
        collectionView.delegate = self
        collectionView.dataSource = self
        
	
        //Landmark Book Data
        
        landmarkNames.append("Colosseum")
        landmarkNames.append("Great Wall")
        landmarkNames.append("Kremlin")
        landmarkNames.append("Stonehenge")
        landmarkNames.append("Taj Mahal")
        
        landmarkImages.append(UIImage(named: "colosseum.jpg")!)
        landmarkImages.append(UIImage(named: "greatwall.jpg")!)
        landmarkImages.append(UIImage(named: "kremlin.jpg")!)
        landmarkImages.append(UIImage(named: "stonehenge.jpg")!)
        landmarkImages.append(UIImage(named: "tajmahal.jpg")!)
        
       navigationItem.title = "Landmark Book"
        
        
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return landmarkNames.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CollectionViewCell
        
        cell.label.text = landmarkNames[indexPath.row]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        chosenLandmarkName = landmarkNames[indexPath.item]
        chosenLandmarkImage = landmarkImages[indexPath.item]
        
        performSegue(withIdentifier: "toImageViewController", sender: nil)
    }
    
  
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toImageViewController" {
            let destinationVC = segue.destination as! imageViewController
            destinationVC.selectedLandmarkName = chosenLandmarkName
            destinationVC.selectedLandmarkImage = chosenLandmarkImage
        }
    }
    


}
