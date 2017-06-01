//
//  HomeVC.swift
//  MyIns
//
//  Created by xcl on 2017/5/19.
//  Copyright © 2017年 xcl. All rights reserved.
//

import UIKit
import AVOSCloud

class HomeVC: UICollectionViewController {
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        self.navigationItem.title = AVUser.current()?.username?.uppercased()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

    // MARK: UICollectionViewDataSource

/*    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 0
    }
*/


    /*override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return 0
    }*/
    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind:String, at indexPath: IndexPath) -> UICollectionReusableView{
        
        let header = self.collectionView?.dequeueReusableSupplementaryView(ofKind: UICollectionElementKindSectionHeader, withReuseIdentifier: "Header", for: indexPath) as! HeaderView
        
        header.fullnameLbl.text = (AVUser.current()?.object(forKey: "fullname") as? String)?.uppercased()
        header.webTxt.text = AVUser.current()?.object(forKey: "web") as? String
        header.webTxt.sizeToFit()
        header.bioLbl.text = AVUser.current()?.object(forKey: "bio") as? String
        header.bioLbl.sizeToFit()
        
        let avaQuery = AVUser.current()?.object(forKey: "ava") as! AVFile
        avaQuery.getDataInBackground{(data:Data?,error:Error?) in
            
            if error == nil {header.avaImg.image = UIImage(data: data!)}
            else{
                let details = error?.localizedDescription
                let alert = UIAlertController(title: "Error", message: ""+details!, preferredStyle: .alert)
                let ok = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                alert.addAction(ok)
                self.present(alert,animated: true,completion: nil)
            }
            
            
            //header.avaImg.image = UIImage(data:data!)
        }
        
        
        return header
    }
    
    
    
    
    
    

/*    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath)
    
        // Configure the cell
    
        return cell
    }
*/
    // MARK: UICollectionViewDelegate

    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
    
    }
    */

}
