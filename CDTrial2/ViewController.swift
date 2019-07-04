//
//  ViewController.swift
//  CDTrial2
//
//  Created by Nanda Mochammad on 03/07/19.
//  Copyright © 2019 nandamochammad. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {
    
    @IBOutlet weak var namaTF: UITextField!
    @IBOutlet weak var namaLabel: UILabel!
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    var namaArray = [Nama]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        loadItems()

    }

    @IBAction func Add(_ sender: Any) {
        
        if let nama = namaTF.text{
            let data = Nama(context: self.context)
            data.namaUser = nama
            
            namaArray.append(data)
            saveItems()
            loadItems()
        }
    }
    
    func saveItems(){
        do {
            try context.save()
        } catch  {
            print("error is ", error)
        }
        
        namaTF.text = ""
        
    }
    
    func loadItems() {
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Nama")
        
        request.returnsObjectsAsFaults = false
        
        do {
            namaArray = try context.fetch(request) as! [Nama]
        } catch  {
            print("error, ", error)
        }
        
        print("nama array adalah, ", namaArray)
        
        namaLabel.text = namaArray.last!.namaUser

    }
    
}

