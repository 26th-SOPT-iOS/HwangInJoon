# HwangInJun
🖥 26 Sopt OB iOS 황인준 🖥
***

| 주차  |                      실습 내용 및 주제                       | 구현 |
| :---: | :----------------------------------------------------------: | :--: |
| 1주차 | View 전환 및 데이터 전달 / 네비게이션 컨트로러를 이용한 Login Logout 화면 제작 |  🔵   |
| 2주차 | StackView ScrollView를 이용한 다양한 AutoLayOut 공부 및 View 제작 |  🔵   |
| 3주차 | Delegate & Protocol, UIPickerVIew, UITableView, UICollectionView 전체적으로 톺아보다. |  🔵   |
| 4주차 | AlamoFire를 이용한 Post통신 및 Login LogOut 통신하기 + 회원가입 실습 |  🔵   |
| 5주차 | 디자인 + iOS 합동 세미나 / 국방부앱 리뉴얼 제작 완성 (ScrollView + CollectionView + CustomTabbar) |  🔵   |
| 6주차 | Server + iOS 합동 세미나 / 서버APi를 이용해 Data를 get통신 후 , View에 맞게 대입 |  🔵   |

***

* readMe 수정중,,, 플젝 및 사진 추가 첨부 하여야함 ,, ing ,,,,



* [1차 뷰 전환 과제](https://github.com/26th-SOPT-iOS/HwangInJoon/tree/master/과제/26th_iOS_FirstAssignment) - 완료

* present는 스토리보드로 , push는 코드로

```swift
@IBAction func touchUpRedButton(_ sender: Any) {        
guard let nextVC = self.storyboard?.instantiateViewController(withIdentifier: "RedVC") as? RedViewController else { return  }

self.navigationController?.pushViewController(nextVC, animated: true)
        
}
```



* [1차 로그인 뷰 과제](https://github.com/26th-SOPT-iOS/HwangInJoon/tree/master/과제/LoginAssignment) - 완료

```swift
pwTextField.isSecureTextEntry = true
//textField 암호값으로 변경 + 보안
```



```swift
 self.present(nextVC, animated: true){
            self.navigationController?.popViewController(animated: true)
        }
//회원가입화면뷰 - 다음뷰를 프레젠트하며, 컴플리션을 이용해 네비게이션 컨트롤러의 뷰컨을 팝해준다.
```

***

## Design + Server + iOS 합동 세미나 및 과제 [4,5,6차 세미나 통합]

****

* 국방부 앱 [TheCamp]앱 리뉴얼
* HomeButton이 있는 커스텀 탭바 컨트롤러 -> 뷰와 버튼을 커스텀해서 새로운 탭바형태 기능의 탭바 뷰를 제작(커스텀이 더욱 용이)
* HomeButton은 항상 지정된 위치에 고정 및 고정된 기능이므로, SuperView에 위치를 고정
* 스크롤뷰 안에 컬렉션뷰로 구성된 레이아웃 , 단 컬렉션뷰는 Carousel 효과를 주었음 
* PageViewController를 이용해서 구현했지만, 좌우의 뷰 아이템이 살짝씩 보여야 하는데 PageViewController로는 힘들어서 컬렉션뷰로 수정
* 뷰를 만들며 막혔던 점, 생각했던 점 및 코드 추가 예정,,,,

<center><img src="https://user-images.githubusercontent.com/55793344/84371986-6fe83100-ac15-11ea-9024-9f1f519cc7af.gif" width="375" height="812"></center >

***

* [Server Wiki](https://github.com/bokdoll/thecamp/wiki) Get으로 대부분의 앱의 기능 구현 가능, Post기능도 연습하려 Soldier추가를 만들려 했으나 아직 Server Part에서 Post를 배우지 않아 Get으로 기능 구현!

***

* 통신을 위한 Model 구조체 생성 [데이터 형식에 맞게 + 문자열부분은 CodingKeys로 처리]

```swift
struct NoticeModel: Codable {
    
    struct Data: Codable {
        let noticeidx: Int
        let noticetitle: String
        enum CodingKeys: String, CodingKey {
            case noticeidx = "notice_idx"
            case noticetitle = "notice_title"
        }
    }
    
    var success: Bool
    var message: String
    var data: [Data]
    enum CodingKeys: String, CodingKey {
        
        case success = "success"
        case message = "message"
        case data = "data"
        
    }
}
```

### Notice 공지를 위한 Data Model

```swift
struct SoldierModel: Codable {
    
    struct Data: Codable {
        let soldieridx: Int
        let joindate: String
        let soldiertype: String
        let soldiername: String
        let degree: String
        let soldierprofile: String
        let enddate: String
        let imgList: [String]
        enum CodingKeys: String, CodingKey {
            case soldieridx = "soldier_idx"
            case joindate = "join_date"
            case soldiertype = "soldier_type"
            case soldiername = "soldier_name"
            case degree = "degree"
            case soldierprofile = "soldier_profile"
            case enddate = "end_date"
            case imgList = "imgList"
        }
    }
    var status: Int
    var success: Bool
    var message: String
    var data: [Data]
    enum CodingKeys: String, CodingKey {
        
        case status = "status"
        case success = "success"
        case message = "message"
        case data = "data"
        
    }
}
```

### Soldier별 개인정보 및 사진 [앱의 Main Card View] Data Model

***

* Get통신만을 하기때문에 별도의 라이브러리 사용하지 않고 URLSession 사용
* View가 구성되지 않고 통신되어 데이터를 뷰에 붙이면 에러가 발생할 수 있기에 ViewDidAppear()에 통신
* Post를 사용하려면 URLSession의 UPLoadTask를 사용하면 됨

```swift
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
                DispatchQueue.main.async {
                    self.notice1Label.text = self.notices[0].noticetitle
                    // 그냥 title값 넣을려고 하면 main 쓰레드 사용하라고 퍼플 에러
                    self.notice2Label.text = self.notices[1].noticetitle
                    self.notice3Label.text = self.notices[2].noticetitle
                }
                
            }catch(let err){
                print(err.localizedDescription)
            }
            
        }
        
        dataTask.resume()
```

* Data 통신은 ViewDidAppear()에서 처리 했으나, 컬렉션뷰에 데이터를 넣기 또는 레이블에 데이터 처리는 DispatchQueue를 이용해 메인스레드에서 이루어지도록 처리