//
//  HomeSearchViewController.swift
//  FoodRecipe
//
//  Created by Bingo on 2019/11/4.
//  Copyright © 2019 Bingo. All rights reserved.
//

import UIKit

class HomeSearchViewController: BaseViewController {

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.navigationController?.navigationBar.prefersLargeTitles = false

        
        self.pt_hiddenNav(hide: true, animated: animated)
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.pt_hiddenNav(hide: false, animated: animated)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "222"
        // Do any additional setup after loading the view.
        
        self.view.backgroundColor = .white
//        gl_customInitialize()r
    }
    

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.navigationController?.popViewController()
    }

}
