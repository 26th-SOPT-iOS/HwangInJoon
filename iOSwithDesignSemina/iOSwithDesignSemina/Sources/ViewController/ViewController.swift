//
//  ViewController.swift
//  iOSwithDesignSemina
//
//  Created by IJ . on 2020/05/26.
//  Copyright © 2020 jun. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    
    @IBOutlet weak var notice1Label: UILabel!
    @IBOutlet weak var notice2Label: UILabel!
    @IBOutlet weak var notice3Label: UILabel!
    @IBOutlet weak var campButton: UIButton!
    @IBOutlet weak var pagingCollectionView: UICollectionView!
    
    @IBOutlet weak var madeTabBarView: UIView!
    let itemColors = [UIColor.red, UIColor.yellow, UIColor.blue, UIColor.green]
    
    var notices: [NoticeModel.Data] = []
    var soldiers: [SoldierModel.Data] = []
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        let view = MyHomeView(frame:  CGRect(x: 158, y: 700, width: 54, height: 54))
        self.view.addSubview(view)
        configureShadowTabBarView()
        madeTabBarView.layer.addBorder([.top], color: UIColor.gray, width: 0.2)
        
        //CollectionViewSetting
        //        let cellWidth = view.frame.width - 100
        //        let cellHeight = view.frame.height - 100
        
        let cellWidth = CGFloat(324)
        let cellHeight = CGFloat(554)
        
        // 상하, 좌우 inset value 설정
        let insetX = (pagingCollectionView.bounds.width - cellWidth) / 2.0
        let insetY = (pagingCollectionView.bounds.height - cellHeight) / 2.0
        
        let layout = pagingCollectionView.collectionViewLayout as! UICollectionViewFlowLayout
        layout.itemSize = CGSize(width: cellWidth, height: cellHeight)
        layout.minimumLineSpacing = 15
        layout.scrollDirection = .horizontal
        pagingCollectionView.contentInset = UIEdgeInsets(top: insetY, left: insetX, bottom: insetY, right: insetX)
        
        pagingCollectionView.delegate = self
        pagingCollectionView.dataSource = self
        
        // 스크롤 시 빠르게 감속 되도록 설정
        pagingCollectionView.decelerationRate = UIScrollView.DecelerationRate.fast
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        let session: URLSession = URLSession(configuration: .default)
        let dataTask: URLSessionDataTask = session.dataTask(with: URL(string: APIConstants.noticeURL)!){ (data: Data?, response: URLResponse?, error: Error?) in
            
            if let error = error {
                print(error.localizedDescription)
                return
            }
            guard let data = data else { return }
            
            do {
                let apiResponse: NoticeModel = try JSONDecoder().decode(NoticeModel.self, from: data)
                self.notices = apiResponse.data
                print(self.notices[0].noticeidx)
                print(self.notices[0].noticetitle+"통신 성공")
                
               
                DispatchQueue.main.async {
                    self.notice1Label.text = self.notices[0].noticetitle
                    // 그냥 title값 넣을려고 하면 main 쓰레드 사용하라고 퍼플 에러
                    self.notice2Label.text = self.notices[1].noticetitle
                    self.notice3Label.text = self.notices[2].noticetitle
                }
                
                print(self.notices[1].noticeidx)
                print(self.notices[1].noticetitle+"통신 성공")
                
                
                
            }catch(let err){
                print(err.localizedDescription)
            }
            
        }
        
        dataTask.resume()
        
        let soldierDataTask: URLSessionDataTask = session.dataTask(with: URL(string: APIConstants.soldierURL)!){ (data: Data?, response: URLResponse?, error: Error?) in
            
            if let error = error {
                print(error.localizedDescription)
                return
            }
            guard let data = data else { return }
            
            do {
                let apiResponse: SoldierModel = try JSONDecoder().decode(SoldierModel.self, from: data)
                
                self.soldiers = apiResponse.data
                
                
                
                print(self.soldiers[0].soldieridx)
                print(self.soldiers[0].soldierprofile)
                print(self.soldiers[0].imgList[0])
                
                print(self.soldiers[3].soldieridx)
                print(self.soldiers[3].soldierprofile)
                
                DispatchQueue.main.async {
                    
                    self.pagingCollectionView.reloadData()
                 
                }
                
                
            }catch(let err){
                print(err.localizedDescription)
            }
            
        }
        
        soldierDataTask.resume()
        

    }
    
    func configureShadowTabBarView(){
        madeTabBarView.layer.shadowColor = UIColor.black.cgColor
        self.madeTabBarView.layer.masksToBounds = false
        self.madeTabBarView.layer.shadowOffset = CGSize(width: 0, height: 5)
        //height값 10기준 올라갈수록 옅어짐
        //반경에 대해서 적용되는 값 조절
        self.madeTabBarView.layer.shadowRadius = 8
        self.madeTabBarView.layer.shadowOpacity = 0.3
    }
    
    @IBAction func touchUpCampButton(_ sender: Any) {
        
        guard let nextVC = storyboard?.instantiateViewController(identifier: "secondVC") else { return  }
        
        self.navigationController?.pushViewController(nextVC, animated: false)
        
    }
    
    
    
}



extension ViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.soldiers.count
        
        // collectinView item이 들어가지 않았는데 임의로 return 3 , return 1 등 을 주면 이미지 데이터를 불러올때 indexPath가 맞지 않아서 에러 발생
        // 지금 상태는 통신보다 컬렉션뷰 그리는게 먼저라서 , soldiers.count 값이 return 0이 됨
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = pagingCollectionView.dequeueReusableCell(withReuseIdentifier: "soldierViewCell", for: indexPath) as? CollectionViewCell else{
            return UICollectionViewCell()
        }
        //cell.backgroundColor = itemColors[indexPath.row]
        
        
        print("indexPath.row값 출력 뿌뿌 \(indexPath.row)")
        DispatchQueue.global().async {
            guard let imageURL = URL(string: self.soldiers[indexPath.row].soldierprofile) else {
                return
                //디스패치큐 밖에선 func 따라서 UICollectionViewCell로 리턴
            }
            print("self.soldiers[\(indexPath.row)]")
            guard let imageData: Data = try? Data(contentsOf: imageURL) else {
                return
            }
            
            DispatchQueue.main.async {
                
                
//                if let index: IndexPath = self.pagingCollectionView.indexPath(for: cell){
//                    if index.row == indexPath.row{
                        
                 //       cell.soldierProfileImageView.image = UIImage(data: imageData)
                cell.soldierProfileImageView.kf.indicatorType = .activity
                cell.soldierProfileImageView.kf.setImage(with:imageURL, placeholder: nil , options: [.transition(.fade(0.5))])
//                    }else{
//                       // cell.soldierProfileImageView.image = UIImage(named: "mainBtnMail")
//                        cell.soldierProfileImageView.kf.setImage(with: imageURL)
//                    }
//                }
            }
        }
        
        cell.ddayLabel.text = self.soldiers[indexPath.row].joindate
        cell.nameLabel.text = self.soldiers[indexPath.row].soldiername
        cell.typeLabel.text = self.soldiers[indexPath.row].soldiertype

        return cell
    }
    
    
}


extension ViewController : UIScrollViewDelegate
{
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>)
    {
        // item의 사이즈와 item 간의 간격 사이즈를 구해서 하나의 item 크기로 설정.
        let layout = self.pagingCollectionView.collectionViewLayout as! UICollectionViewFlowLayout
        let cellWidthIncludingSpacing = layout.itemSize.width + layout.minimumLineSpacing
        
        // targetContentOff을 이용하여 x좌표가 얼마나 이동했는지 확인
        // 이동한 x좌표 값과 item의 크기를 비교하여 몇 페이징이 될 것인지 값 설정
        var offset = targetContentOffset.pointee
        let index = (offset.x + scrollView.contentInset.left) / cellWidthIncludingSpacing
        var roundedIndex = round(index)
        
        // scrollView, targetContentOffset의 좌표 값으로 스크롤 방향을 알 수 있다.
        // index를 반올림하여 사용하면 item의 절반 사이즈만큼 스크롤을 해야 페이징이 된다.
        // 스크로로 방향을 체크하여 올림,내림을 사용하면 좀 더 자연스러운 페이징 효과를 낼 수 있다.
        if scrollView.contentOffset.x > targetContentOffset.pointee.x {
            roundedIndex = floor(index)
        } else {
            roundedIndex = ceil(index)
        }
        
        // 위 코드를 통해 페이징 될 좌표값을 targetContentOffset에 대입하면 된다.
        offset = CGPoint(x: roundedIndex * cellWidthIncludingSpacing - scrollView.contentInset.left, y: -scrollView.contentInset.top)
        targetContentOffset.pointee = offset
    }
}
